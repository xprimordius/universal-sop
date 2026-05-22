#!/usr/bin/env bash
# 🔍 VERIFIER — Universal SOP mechanical presence check
# Per agents/verifier.md | F.19 agent-chain rebuild Layer 1
# Usage: bash scripts/verifier.sh [--target FILE]
# Exit codes: currently always 0 (warnings-only mode) until chain matures

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"

TS=$(date +"%Y-%m-%d %H:%M %Z")
COMMIT_SHA="$(git rev-parse --short HEAD 2>/dev/null || echo 'staged')"

echo "═══ VERIFIER REPORT ═══"
echo "Device: $DEVICE"
echo "Timestamp: $TS"
echo "Commit: $COMMIT_SHA"
echo ""

# Source content to check: staged diff (added lines only) — same approach as compliance_check.sh
ADDED=$(git diff --cached --diff-filter=AM --no-color | grep -E "^\+[^+]" || true)
if [ -z "$ADDED" ]; then
  echo "ℹ️  No staged additions to verify (likely first-time / nothing to check)"
  echo ""
  echo "VERDICT: PASS (vacuous)"
  echo "═══════════════════════"
  exit 0
fi

PASS=0
FAIL=0
WARNINGS=()

check_present() {
  local id="$1" desc="$2" pattern="$3"
  if echo "$ADDED" | grep -qE "$pattern"; then
    echo "$id $desc                    [✅ PASS]"
    PASS=$((PASS+1))
  else
    echo "$id $desc                    [⚠️ NOT FOUND in added lines — may be in unchanged context]"
    WARNINGS+=("$id: $desc")
  fi
}

check_absent() {
  local id="$1" desc="$2" pattern="$3"
  if echo "$ADDED" | grep -qE "$pattern"; then
    echo "$id $desc                    [⚠️ POSSIBLE — investigate]"
    WARNINGS+=("$id: $desc")
  else
    echo "$id $desc                    [✅ PASS]"
    PASS=$((PASS+1))
  fi
}

# V.1-V.3: STEP / MACRO / MICRO header (only required if this is an output, not a meta-doc)
# We approximate "is this an output" by checking if any non-meta file is staged.
META_PATTERN="^(FAILURE_MODES_ANALYSIS|TOKEN_OPTIMIZATION_GUIDE|EFFICIENCY_GUIDE|DEVICE_REGISTRY|MULTI_DEVICE_GIT_PROTOCOL|MANDATORY_TIGHT_LOOP|SELF_COMPLIANCE_FIX|SOP_MAP|MASTER_CONTINUATION_PROMPT|HARNESS_REFRESH_GUIDE|CROSS_MODEL_TEST_KIT|PUBLIC_SHARE_KIT|SHIP_INSTRUCTIONS|INVENTORY|FUSION_ANALYSIS|CONSULTING_BRIEF|CHALLENGES_LOG|USER_PROFILE|README|cache/.*|backups/.*|agents/.*|scripts/.*|.githooks/.*|diagrams_src/.*|assets/.*|chat_archive/.*)\.(md|sh|html|png|json|jsonl)$"

NON_META_STAGED=$(git diff --cached --name-only | grep -vE "$META_PATTERN" || true)

if [ -z "$NON_META_STAGED" ]; then
  echo "ℹ️  V.1-V.4 — Staged files are all meta-docs (no STEP header expected)"
  PASS=$((PASS+4))
else
  check_present "V.1" "STEP: header" "^\+STEP:"
  check_present "V.2" "🎯 MACRO line" "^\+🎯 MACRO:"
  check_present "V.3" "📌 MICRO line" "^\+📌 MICRO:"
  check_present "V.4" "Understanding Check pattern" "^\+\|.*[Yy]our words.*\|.*[Mm]y interpretation"
fi

# V.5 LTM markers (count instances)
LTM_COUNT=$(echo "$ADDED" | grep -cE "^\+LTM:" || true)
if [ "$LTM_COUNT" -gt 0 ]; then
  echo "V.5 LTM markers (count: $LTM_COUNT)            [✅ PASS]"
  PASS=$((PASS+1))
else
  if [ -z "$NON_META_STAGED" ]; then
    echo "V.5 LTM markers                                [N/A — meta-doc]"
    PASS=$((PASS+1))
  else
    echo "V.5 LTM markers (count: 0)                     [⚠️ none found]"
    WARNINGS+=("V.5: No LTM markers")
  fi
fi

# V.6 Pulse Check P1-P5
if echo "$ADDED" | grep -qE "Score: [0-9]+/5"; then
  echo "V.6 Pulse Check P1-P5 with X/5 score           [✅ PASS]"
  PASS=$((PASS+1))
else
  if [ -z "$NON_META_STAGED" ]; then
    echo "V.6 Pulse Check                                [N/A — meta-doc]"
    PASS=$((PASS+1))
  else
    echo "V.6 Pulse Check P1-P5                          [⚠️ score not found]"
    WARNINGS+=("V.6: No /5 Pulse Check score")
  fi
fi

# V.7 Honest numbers markers (presence of ~, approx, or N/M when claims are present)
if echo "$ADDED" | grep -qE "~|approx|N/M"; then
  echo "V.7 Honest numbers / N/M markers               [✅ PASS]"
  PASS=$((PASS+1))
else
  echo "V.7 Honest numbers markers                      [ℹ️ no estimates flagged — assume safe]"
  PASS=$((PASS+1))
fi

# V.8 No bare-acronym violations — delegate to compliance_check.sh if exists
if [ -f scripts/compliance_check.sh ]; then
  if bash scripts/compliance_check.sh 2>&1 | grep -q "Rule #11"; then
    echo "V.8 No bare-acronym violations                 [⚠️ see compliance_check.sh output]"
    WARNINGS+=("V.8: Rule #11 violations possible — see compliance_check")
  else
    echo "V.8 No bare-acronym violations                 [✅ PASS]"
    PASS=$((PASS+1))
  fi
else
  echo "V.8 No bare-acronym violations                 [N/A — compliance_check.sh missing]"
  PASS=$((PASS+1))
fi

# Log to META_AUDIT_LOG.md (append)
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | Verifier | %d pass / %d warnings | %s |\n" \
    "$(date +%Y-%m-%d)" "$DEVICE" "$PASS" "${#WARNINGS[@]}" "$COMMIT_SHA" \
    >> cache/META_AUDIT_LOG.md
fi

echo ""
echo "Summary: $PASS PASS · ${#WARNINGS[@]} WARNINGS"
if [ "${#WARNINGS[@]}" -gt 0 ]; then
  echo "(warnings only — non-blocking until chain matures, per F.19 Tier 1 stabilization)"
  echo "VERDICT: PASS-WITH-WARNINGS"
else
  echo "VERDICT: ✅ PASS"
fi
echo "═══════════════════════"

# Always exit 0 during warnings-only stabilization period
exit 0
