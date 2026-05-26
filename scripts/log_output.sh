#!/usr/bin/env bash
# 📜 LOG_OUTPUT — Append-only persistent log of (user prompt, claude response, validator score)
# Per user 2026-05-26 02:00 CDT: "shows exactly what it is doing, what the user prompts are"
# Closes the "no prompt history" transparency gap. Sibling to BACKUP_LOG / FAILURE_LEDGER / SIR_LOG.
#
# USAGE:
#   bash scripts/log_output.sh "<user prompt verbatim>" <response_file.md> [validator_score]
#
# Writes to cache/OUTPUT_LOG.md, append-only, one row per output.
# Schema: | row | date | time | device | commit | prompt_chars | response_chars | validator_score | response_file |

set +e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/paths.sh" ]; then
  source "$SCRIPT_DIR/paths.sh" > /dev/null 2>&1
fi
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
cd "$PROJECT_ROOT"

USER_PROMPT="${1:-}"
RESPONSE_FILE="${2:-}"
VALIDATOR_SCORE="${3:-N/A}"

if [ -z "$USER_PROMPT" ] || [ -z "$RESPONSE_FILE" ]; then
  echo "Usage: bash scripts/log_output.sh \"<user prompt>\" <response_file.md> [score]"
  exit 1
fi

if [ ! -f "$RESPONSE_FILE" ]; then
  echo "❌ Response file not found: $RESPONSE_FILE"
  exit 2
fi

LOG_FILE="${OUTPUT_LOG_FILE:-cache/OUTPUT_LOG.md}"

# Initialize log file if missing
if [ ! -f "$LOG_FILE" ]; then
  mkdir -p "$(dirname "$LOG_FILE")"
  cat > "$LOG_FILE" <<'INIT_EOF'
# 📜 OUTPUT LOG — Per-Output Transparency Record
# Created 2026-05-26 aurelion · Per user "shows exactly what it is doing, what the user prompts are"
# Append-only. Each row = one Claude output. Sibling to BACKUP_LOG / FAILURE_LEDGER / SIR_LOG.
#
# Per F.59 lesson: keep this file's rows small (one line each). Detailed prompts/responses
# live in cache/prompt_archive/<ts>_<device>.md and are linked from the row.
#
# Schema:
# | row | date | time | device | commit | prompt_chars | response_chars | validator_score | response_file |

INIT_EOF
fi

# Compute next row number
NEXT_ROW=$(grep -cE "^\| #?[0-9]+ " "$LOG_FILE" 2>/dev/null)
NEXT_ROW=$((${NEXT_ROW:-0} + 1))

DEVICE="${DEVICE_NAME:-$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')}"
[ -z "$DEVICE" ] && DEVICE="unknown"
DATE=$(date +%Y-%m-%d)
TIME=$(date +"%H:%M %Z")
TS=$(date +%Y%m%d_%H%M%S)
COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")

PROMPT_CHARS=$(echo -n "$USER_PROMPT" | wc -c)
RESPONSE_CHARS=$(wc -c < "$RESPONSE_FILE")

# Archive full prompt + reference to response file
ARCHIVE_DIR="${PROMPT_ARCHIVE_DIR:-cache/prompt_archive}"
mkdir -p "$ARCHIVE_DIR"
ARCHIVE_FILE="$ARCHIVE_DIR/${TS}_${DEVICE}.md"
cat > "$ARCHIVE_FILE" <<EOF
# Output Archive — $DATE $TIME · $DEVICE · commit $COMMIT
# Validator score: $VALIDATOR_SCORE

## User prompt (verbatim)

$USER_PROMPT

## Response file

$RESPONSE_FILE ($RESPONSE_CHARS chars)

## Validator score

$VALIDATOR_SCORE
EOF

# Append row to OUTPUT_LOG
printf "| %d | %s | %s | %s | %s | %d | %d | %s | %s |\n" \
  "$NEXT_ROW" "$DATE" "$TIME" "$DEVICE" "$COMMIT" \
  "$PROMPT_CHARS" "$RESPONSE_CHARS" "$VALIDATOR_SCORE" "$ARCHIVE_FILE" \
  >> "$LOG_FILE"

echo "✅ Logged row #$NEXT_ROW to $LOG_FILE"
echo "   Archive: $ARCHIVE_FILE ($PROMPT_CHARS prompt chars, $RESPONSE_CHARS response chars)"
echo "   Validator: $VALIDATOR_SCORE"
exit 0
