#!/usr/bin/env bash
# 🔍 VERIFY_BEFORE_ASSERT — Architectural fix for F.23 + F.26 + F.27 confidence-without-verification cluster
# Per Alan 2026-05-22 + REFINE Step I (Intervene) | F.27 SIR insight #1
#
# Purpose: pre-flight check that catches the 3 recurring confidence-without-verification patterns:
#   F.23 — Edit without Read first (confidence in file state)
#   F.26 — Invented terminology (confidence in vocabulary)
#   F.27 — UC compression (confidence in interpretation)
#
# Architectural answer: scripts can't read Claude's brain, but they CAN flag suspicious patterns
# in staged content that correlate with the failure mode.
#
# Usage:  bash scripts/verify_before_assert.sh
# Exit: 0 always (warnings-only mode like other chain scripts until matures)

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'staged')"

echo "🔍 VERIFY-BEFORE-ASSERT"
echo "════════════════════════════════════════"
echo "Device: $DEVICE  ·  Time: $TS  ·  Commit: $COMMIT"
echo ""

PASS=0
WARNINGS=()

# === Get staged additions ===
ADDED=$(git diff --cached --diff-filter=AM --no-color | grep -E "^\+[^+]" || true)
if [ -z "$ADDED" ]; then
  echo "ℹ️  No staged additions to verify"
  echo "VERDICT: PASS (vacuous)"
  echo "════════════════════════════════════════"
  exit 0
fi

# === Check 1 — F.23 PATTERN: Edit-class language without Read confirmation ===
# Heuristic: presence of assertions about file content ("the file says X", "line N has Y") in commit
# without corresponding git diff showing those lines existed pre-edit. Hard to mechanize fully;
# flag the assertion-without-citation pattern.
ASSERT_PATTERNS=$(echo "$ADDED" | grep -ciE "the file (says|contains|has)|line [0-9]+ (says|contains|reads)|already (has|contains|says)" || true)
if [ "$ASSERT_PATTERNS" -gt 0 ]; then
  echo "🟡 F.23 PATTERN — $ASSERT_PATTERNS assertion(s) about file content found"
  echo "    Check: were these confirmed by a Read tool call BEFORE the Edit?"
  WARNINGS+=("F.23 pattern: assertion-about-file-state without verifiable Read")
else
  echo "✅ F.23 check — no suspicious file-state assertions"
  PASS=$((PASS+1))
fi

# === Check 2 — F.26 PATTERN: Invented terminology ===
# Heuristic: introduction of acronym-like terms (ALL_CAPS / "X/Y/Z" tier-list patterns) without
# a citation pattern nearby ("per X" / "from X" / "in <file>")
# Specifically check for tier-style invention in OUTPUT-STANDARD content (where MES would appear)
INVENTED_TIER_PATTERN=$(echo "$ADDED" | grep -cE "^\+.*\b(HIGH|MEDIUM|LOW|FAST|MAX) /\b|\b(HIGH|MEDIUM|LOW|FAST|MAX) tier\b" || true)
if [ "$INVENTED_TIER_PATTERN" -gt 0 ]; then
  if echo "$ADDED" | grep -qE "per Alan|per .*\.md|verified|from settings|Claude Code setting"; then
    echo "✅ F.26 check — tier-style language found but citation present"
    PASS=$((PASS+1))
  else
    echo "🟡 F.26 PATTERN — $INVENTED_TIER_PATTERN tier-list pattern(s) without citation"
    echo "    Real Claude Code effort tiers: max / very high / medium / low"
    echo "    Real model variants: Opus 4.7 / Opus 4.7 1M / Opus 4.6 legacy / Sonnet 4.6"
    WARNINGS+=("F.26 pattern: tier-list without citation — confirm against real settings")
  fi
else
  echo "✅ F.26 check — no invented-tier patterns"
  PASS=$((PASS+1))
fi

# === Check 3 — F.27 PATTERN: UC compression ===
# Heuristic: count UC table rows (lines starting with "| C." or "| [0-9]+ |") in staged content;
# count "user said" verbatim quotes. If UC table exists with < 3 rows AND user spec is long,
# possible compression failure.
UC_ROWS=$(echo "$ADDED" | grep -cE "^\+\| C\.[0-9]+|^\+\| [0-9]+ \|" || true)
HAS_UC=$(echo "$ADDED" | grep -cE "Understanding Check|UC table|🎯 Understanding Check" || true)

if [ "$HAS_UC" -gt 0 ] && [ "$UC_ROWS" -lt 2 ]; then
  # UC mentioned but rows are sparse — possible compression
  # Don't fire for trivial-spec case (carve-out exists in SP.6 IAC v1.5.1)
  TRIVIAL_MARKERS=$(echo "$ADDED" | grep -cE "trivial spec|trivial-spec|trivial confirmation|continuation directive|single directive" || true)
  if [ "$TRIVIAL_MARKERS" -gt 0 ]; then
    echo "✅ F.27 check — UC sparse but trivial-spec carve-out invoked"
    PASS=$((PASS+1))
  else
    echo "🟡 F.27 PATTERN — UC mentioned ($HAS_UC times) but only $UC_ROWS table rows"
    echo "    Doctoral UC requires sub-clause granularity. If user spec is >2 normative clauses, expand."
    WARNINGS+=("F.27 pattern: UC may be compressed (< 2 rows, no trivial-spec marker)")
  fi
else
  echo "✅ F.27 check — UC granularity acceptable ($UC_ROWS rows, $HAS_UC references)"
  PASS=$((PASS+1))
fi

# === Log to META_AUDIT_LOG.md ===
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | verify_before_assert | %d pass / %d warnings | %s |\n" \
    "$(date +%Y-%m-%d)" "$DEVICE" "$PASS" "${#WARNINGS[@]}" "$COMMIT" \
    >> cache/META_AUDIT_LOG.md
fi

echo ""
echo "Summary: $PASS PASS · ${#WARNINGS[@]} WARNINGS"
if [ "${#WARNINGS[@]}" -gt 0 ]; then
  echo "(warnings only — non-blocking until matures)"
  echo "VERDICT: PASS-WITH-WARNINGS"
else
  echo "VERDICT: ✅ PASS"
fi
echo "════════════════════════════════════════"

exit 0
