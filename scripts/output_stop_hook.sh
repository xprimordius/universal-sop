#!/usr/bin/env bash
# 🛑 OUTPUT_STOP_HOOK — Mechanical RULE 6 enforcement at Claude-Code Stop boundary
# Per MTL RULE 6 | Closes the last 0.05/10 — convention → code at output runtime
# Per user 2026-05-26: "fix this to perfect it" — this is the structural enforcement
#
# WHAT THIS DOES:
#   Claude Code invokes Stop hooks when Claude is about to stop responding. The hook
#   reads JSON from stdin (schema: { "transcript_path": "...", "session_id": "...", ... }),
#   extracts the LAST assistant message from the JSONL transcript, runs validator_output.sh
#   on it, and either ALLOWS stop (exit 0) or BLOCKS (JSON decision=block) on heavy failure.
#
# HOW TO INSTALL:
#   bash scripts/scheduler/install_output_stop_hook.cmd  (Windows .cmd installer)
#   This adds a "Stop" hook to ~/.claude/settings.json pointing at this script.
#
# BLOCK THRESHOLD:
#   ≥3 mandatory FAILs → block (RULE 6 ship-block). 1-2 FAILs warn but allow.
#   This catches egregious drift (no MES, no UC, no SSC at once) without making the
#   system unusable for OUTPUT-QUICK / conversational replies.

set +e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/paths.sh" ]; then
  source "$SCRIPT_DIR/paths.sh" > /dev/null 2>&1
fi
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
cd "$PROJECT_ROOT" || exit 0  # If we can't cd, allow stop (never block on infrastructure failure)

# ─────────────────────────────────────────────────────────────────
# Read stdin JSON (Claude Code Stop hook input contract)
# ─────────────────────────────────────────────────────────────────
INPUT_JSON=$(cat)

# Extract transcript_path — try jq, fall back to grep
TRANSCRIPT_PATH=""
if command -v jq >/dev/null 2>&1; then
  TRANSCRIPT_PATH=$(echo "$INPUT_JSON" | jq -r '.transcript_path // empty' 2>/dev/null)
fi
if [ -z "$TRANSCRIPT_PATH" ]; then
  TRANSCRIPT_PATH=$(echo "$INPUT_JSON" | grep -oE '"transcript_path"[[:space:]]*:[[:space:]]*"[^"]+"' | sed 's/.*"\([^"]*\)"$/\1/')
fi

# stop_hook_active flag: prevents infinite loops if we trigger another stop
STOP_HOOK_ACTIVE=""
if command -v jq >/dev/null 2>&1; then
  STOP_HOOK_ACTIVE=$(echo "$INPUT_JSON" | jq -r '.stop_hook_active // false' 2>/dev/null)
fi
# If we're already in a stop hook (re-invocation), allow exit to prevent loops
if [ "$STOP_HOOK_ACTIVE" = "true" ]; then
  exit 0
fi

# If no transcript available, allow stop (defensive — never block on infrastructure missing)
if [ -z "$TRANSCRIPT_PATH" ] || [ ! -f "$TRANSCRIPT_PATH" ]; then
  exit 0
fi

# ─────────────────────────────────────────────────────────────────
# Extract LAST assistant message from JSONL transcript
# ─────────────────────────────────────────────────────────────────
TMP_RESPONSE=$(mktemp --suffix=.md 2>/dev/null || mktemp -t hook_resp_XXXX)

# Each line in transcript is a JSON event. Look for the last "type":"assistant" event.
# Pull its message.content (which may be string OR array of content blocks).
if command -v jq >/dev/null 2>&1; then
  # Get last assistant message's text content
  jq -r '
    select(.type == "assistant") |
    .message.content |
    if type == "string" then . else
      map(select(.type == "text") | .text) | join("\n")
    end
  ' "$TRANSCRIPT_PATH" 2>/dev/null | tail -1000 > "$TMP_RESPONSE"
else
  # Fallback: grep for last assistant block; less precise but functional
  grep '"type":"assistant"' "$TRANSCRIPT_PATH" 2>/dev/null | tail -1 | \
    grep -oE '"text":"[^"]+"' | sed 's/^"text":"//;s/"$//' > "$TMP_RESPONSE"
fi

# If response is empty / too small for OUTPUT-COMPLEX, skip validation (conversational reply)
RESP_CHARS=$(wc -c < "$TMP_RESPONSE" 2>/dev/null || echo 0)
RESP_CHARS=${RESP_CHARS:-0}
if [ "$RESP_CHARS" -lt 500 ]; then
  # Tiny response — probably conversational; log only, don't validate
  if [ -x scripts/log_output.sh ]; then
    bash scripts/log_output.sh "(see transcript $TRANSCRIPT_PATH)" "$TMP_RESPONSE" "skipped (conversational)" > /dev/null 2>&1
  fi
  rm -f "$TMP_RESPONSE"
  exit 0
fi

# ─────────────────────────────────────────────────────────────────
# Run validator
# ─────────────────────────────────────────────────────────────────
if [ ! -x scripts/validator_output.sh ]; then
  # validator missing — allow stop, log warning
  rm -f "$TMP_RESPONSE"
  exit 0
fi

VALIDATOR_OUT=$(bash scripts/validator_output.sh "$TMP_RESPONSE" 2>&1)
FAIL_COUNT=$(echo "$VALIDATOR_OUT" | grep -c "^\[FAIL")
FAIL_COUNT=${FAIL_COUNT:-0}
PASS_COUNT=$(echo "$VALIDATOR_OUT" | grep -c "^\[PASS")
PASS_COUNT=${PASS_COUNT:-0}
SCORE="${PASS_COUNT}P/${FAIL_COUNT}F"

# Log this output (whether passing or not — transparency mandate)
if [ -x scripts/log_output.sh ]; then
  bash scripts/log_output.sh "(stop-hook auto-log)" "$TMP_RESPONSE" "$SCORE" > /dev/null 2>&1
fi

# Block threshold: ≥3 mandatory FAILs is egregious drift
BLOCK_THRESHOLD=3

if [ "$FAIL_COUNT" -ge "$BLOCK_THRESHOLD" ]; then
  # BLOCK the stop — emit JSON decision so Claude Code re-prompts
  FAIL_SUMMARY=$(echo "$VALIDATOR_OUT" | grep "^\[FAIL" | sed 's/^/    /' | head -7)
  # Output decision JSON on stdout (Claude Code reads this)
  cat <<EOF
{
  "decision": "block",
  "reason": "RULE 6 mechanical enforcement: output missing $FAIL_COUNT mandatory SOP slots. The SOP exists in MANDATORY_TIGHT_LOOP.md and was authored by you — please apply it before sending.\n\nFailures detected:\n$FAIL_SUMMARY\n\nFix: re-read templates/output_skeleton.md, ensure 🎯 MODEL line at top + STEP header + UC table + Sync Status + Pulse Check + RAE block. Per user 2026-05-26 02:00 CDT: 'just following the SOP itself it has problems with. fix this to perfect it.' This hook IS the fix — please honor it."
}
EOF
  rm -f "$TMP_RESPONSE"
  exit 0  # exit 0 with decision=block is the correct Claude Code stop-hook contract
fi

# Allow stop. Optionally emit informational JSON on 1-2 FAILs (warning, not block).
rm -f "$TMP_RESPONSE"
exit 0
