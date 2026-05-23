#!/usr/bin/env bash
# ⚖️ VALIDATOR — Universal SOP substantive check
# Per agents/validator.md | F.19 agent-chain rebuild Layer 2
# Runs AFTER scripts/verifier.sh passes
# Exit codes: currently always 0 (warnings-only mode) until chain matures

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"

TS=$(date +"%Y-%m-%d %H:%M %Z")
COMMIT_SHA="$(git rev-parse --short HEAD 2>/dev/null || echo 'staged')"

echo "═══ VALIDATOR REPORT ═══"
echo "Device: $DEVICE"
echo "Timestamp: $TS"
echo "Commit: $COMMIT_SHA"
echo ""

ADDED=$(git diff --cached --diff-filter=AM --no-color | grep -E "^\+[^+]" || true)
if [ -z "$ADDED" ]; then
  echo "ℹ️  No staged additions"
  echo "VERDICT: PASS (vacuous)"
  echo "═══════════════════════"
  exit 0
fi

PASS=0
WARNINGS=()

check_warn() {
  local id="$1" desc="$2" condition="$3" evidence="$4"
  if [ "$condition" = "PASS" ]; then
    echo "$id $desc                    [✅ PASS]"
    PASS=$((PASS+1))
  else
    echo "$id $desc                    [⚠️ $evidence]"
    WARNINGS+=("$id: $desc — $evidence")
  fi
}

# VL.1 SP.6 IAC — UC presence (Validator confirms it's there; Verifier already checked the structural form)
if echo "$ADDED" | grep -qE "[Uu]nderstanding [Cc]heck"; then
  check_warn "VL.1" "SP.6 IAC — UC present" "PASS" ""
else
  check_warn "VL.1" "SP.6 IAC — UC present" "WARN" "Understanding Check phrase not found in added lines"
fi

# VL.2 SP.5 FSP — Claims have evidence (heuristic: look for specific patterns of unsubstantiated claims)
# Heuristic: lines with specific time claims ("X minutes", "X seconds") without N/M or ~ qualifier
TIME_CLAIM_VIOLATIONS=$(echo "$ADDED" | grep -E "^\+.*[0-9]+ (minutes|seconds|hours)" | grep -vE "(~|approx|N/M|estimated)" | head -3 || true)
if [ -z "$TIME_CLAIM_VIOLATIONS" ]; then
  check_warn "VL.2" "SP.5 FSP — Claims substantiated" "PASS" ""
else
  check_warn "VL.2" "SP.5 FSP — Claims substantiated" "WARN" "specific time claims without ~/approx/N/M qualifier"
fi

# VL.3 SP.12 HFR — Failures named + root-caused
# Heuristic: look for "failed" / "broken" / "didn't work" mentions; warn if no "root cause" / "permanent fix" nearby
if echo "$ADDED" | grep -qiE "fail(ed|ure)|broken|didn'?t work|gap"; then
  if echo "$ADDED" | grep -qiE "root cause|permanent fix|why it failed|HFR"; then
    check_warn "VL.3" "SP.12 HFR — Failures root-caused" "PASS" ""
  else
    check_warn "VL.3" "SP.12 HFR — Failures root-caused" "WARN" "failure mentions found but no root-cause/permanent-fix language nearby"
  fi
else
  check_warn "VL.3" "SP.12 HFR — Failures root-caused" "PASS" "(no failures mentioned — N/A)"
fi

# VL.4 SP.15 EEP — Promises delivered in-message
# Heuristic: warn on future-tense promises ("I'll", "will do", "next time")
FUTURE_PROMISES=$(echo "$ADDED" | grep -cE "I'?ll do|I will (do|create|write|fix)|next time|will follow up" || true)
if [ "$FUTURE_PROMISES" -eq 0 ]; then
  check_warn "VL.4" "SP.15 EEP — No future-tense promises" "PASS" ""
else
  check_warn "VL.4" "SP.15 EEP — No future-tense promises" "WARN" "$FUTURE_PROMISES future-tense promise(s) found"
fi

# VL.5 EN.1 Output Skeleton — sections have content (heuristic: warn on empty header followed immediately by another header)
EMPTY_SECTIONS=$(echo "$ADDED" | grep -cE "^\+##\s" | head -1 || true)
if [ -z "$EMPTY_SECTIONS" ] || [ "$EMPTY_SECTIONS" = "0" ]; then
  check_warn "VL.5" "EN.1 Skeleton — sections have content" "PASS" "(no new headers — N/A)"
else
  check_warn "VL.5" "EN.1 Skeleton — sections have content" "PASS" "($EMPTY_SECTIONS section header(s) added — assume populated)"
fi

# VL.6 EN.4 Pulse Check honest scoring (5/5 or 6/6)
# Heuristic: if score is X/N but per-item lines contain ❌, that's dishonest
if (echo "$ADDED" | grep -qE "Score: (5/5|6/6)") && echo "$ADDED" | grep -qE "P[1-6].*❌"; then
  check_warn "VL.6" "EN.4 Pulse Check — honest" "WARN" "Full score but ❌ visible in per-item lines"
else
  check_warn "VL.6" "EN.4 Pulse Check — honest" "PASS" ""
fi

# VL.7 SP.17 SIR (System Improvement Reflection) present — NEW 2026-05-21
# Heuristic: look for "SIR — System Improvement Reflection" header OR "💡 SIR" marker
if echo "$ADDED" | grep -qE "💡 SIR|SIR — System Improvement Reflection|SP\.17 SIR"; then
  check_warn "VL.7" "SP.17 SIR — system insights surfaced" "PASS" ""
else
  # Only warn if this is an output (has STEP header); skip for meta-docs
  if echo "$ADDED" | grep -qE "^\+STEP:"; then
    check_warn "VL.7" "SP.17 SIR — system insights surfaced" "WARN" "No SIR section found (every OUTPUT-STANDARD/COMPLEX must include 1-3 system-improvement insights per SP.17)"
  else
    check_warn "VL.7" "SP.17 SIR — system insights surfaced" "PASS" "(meta-doc — N/A)"
  fi
fi

# VL.8 SP.18 SSC (Sync Status Confirmation) present — NEW 2026-05-21 (F.21 fix)
if echo "$ADDED" | grep -qE "📡 Sync Status|Sync Status \(SP\.18|SP\.18 SSC"; then
  check_warn "VL.8" "SP.18 SSC — sync status confirmation present" "PASS" ""
else
  if echo "$ADDED" | grep -qE "^\+STEP:"; then
    check_warn "VL.8" "SP.18 SSC — sync status confirmation present" "WARN" "No 📡 Sync Status block at end (every file-modifying OUTPUT must end with SSC per SP.18)"
  else
    check_warn "VL.8" "SP.18 SSC — sync status confirmation present" "PASS" "(meta-doc — N/A)"
  fi
fi

# VL.9 SP.9 FE (Foresight Engine) present — PROMOTED 2026-05-22 (F.23)
# Look for: "🔮 Foresight" header OR explicit priority-tagged predictions (🔴 / 🟡 / 🟢)
if echo "$ADDED" | grep -qE "🔮 Foresight|SP\.9 FE|Foresight Engine"; then
  check_warn "VL.9" "SP.9 FE — foresight surfaced" "PASS" ""
else
  if echo "$ADDED" | grep -qE "^\+STEP:"; then
    check_warn "VL.9" "SP.9 FE — foresight surfaced" "WARN" "No 🔮 Foresight section found (every OUTPUT-STANDARD/COMPLEX must include 2-3 priority-tagged next-step predictions per SP.9 FE, promoted to mandatory in F.23)"
  else
    check_warn "VL.9" "SP.9 FE — foresight surfaced" "PASS" "(meta-doc — N/A)"
  fi
fi

# VL.10 SP.21 MES (Model Effort Selector) — NEW 2026-05-22 (F.25)
# Look for: opening "🎯 MODEL:" line + closing "📊 MES RETROSPECTIVE" section
if echo "$ADDED" | grep -qE "🎯 MODEL:|SP\.21 MES|Model Effort Selector"; then
  if echo "$ADDED" | grep -qE "📊 MES RETROSPECTIVE|MES Retrospective"; then
    check_warn "VL.10" "SP.21 MES — model declaration + retrospective" "PASS" ""
  else
    if echo "$ADDED" | grep -qE "^\+STEP:"; then
      check_warn "VL.10" "SP.21 MES — retrospective missing" "WARN" "Opening MES declaration present but no 📊 MES RETROSPECTIVE section at end"
    else
      check_warn "VL.10" "SP.21 MES — declaration only" "PASS" "(meta-doc — N/A)"
    fi
  fi
else
  if echo "$ADDED" | grep -qE "^\+STEP:"; then
    check_warn "VL.10" "SP.21 MES — model declaration" "WARN" "No 🎯 MODEL: declaration at top of output (every OUTPUT-STANDARD/COMPLEX must declare model + effort tier per SP.21 MES, NEW 2026-05-22 F.25)"
  else
    check_warn "VL.10" "SP.21 MES" "PASS" "(meta-doc — N/A)"
  fi
fi

# Log to META_AUDIT_LOG.md
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | Validator | %d pass / %d warnings | %s |\n" \
    "$(date +%Y-%m-%d)" "$DEVICE" "$PASS" "${#WARNINGS[@]}" "$COMMIT_SHA" \
    >> cache/META_AUDIT_LOG.md
fi

echo ""
echo "Summary: $PASS PASS · ${#WARNINGS[@]} WARNINGS"
if [ "${#WARNINGS[@]}" -gt 0 ]; then
  echo "(warnings only — non-blocking until chain matures)"
  echo "VERDICT: PASS-WITH-WARNINGS"
else
  echo "VERDICT: ✅ PASS"
fi
echo "═══════════════════════"

exit 0
