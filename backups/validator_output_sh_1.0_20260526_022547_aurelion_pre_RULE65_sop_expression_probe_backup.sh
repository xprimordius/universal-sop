#!/usr/bin/env bash
# ✅ VALIDATOR_OUTPUT — Mechanical SOP-compliance check for Claude's own outputs (per user 2026-05-26)
# Per Sprint MTL RULE 6 | Closes F.19 chat-behavior gap (SOP existed, Claude wasn't following it)
#
# WHAT THIS ADDRESSES (user's #1 objective 2026-05-26 02:00 CDT):
#   "the perfect pristine quintessential SOP that does not forget, does not fabricate,
#    maintains 100% accuracy and fidelity, does what it is supposed to in full, verifies
#    via a checklist, holds itself accountable... just following the SOP itself it has
#    problems with. fix this to perfect it"
#
# USAGE:
#   bash scripts/validator_output.sh <draft.md>                 # full report
#   bash scripts/validator_output.sh <draft.md> --quiet         # exit code only
#   bash scripts/validator_output.sh <draft.md> --json          # JSON output
#
# EXIT: 0 if ≥4/5 mandatory items present; 1 if <4/5 (block ship; fix first).

set +e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/paths.sh" ]; then
  source "$SCRIPT_DIR/paths.sh" > /dev/null 2>&1
fi
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"

DRAFT=""
MODE="full"
for arg in "$@"; do
  case "$arg" in
    --quiet) MODE="quiet" ;;
    --json) MODE="json" ;;
    -h|--help)
      grep "^#" "$0" | head -20
      exit 0 ;;
    *) DRAFT="$arg" ;;
  esac
done

if [ -z "$DRAFT" ] || [ ! -f "$DRAFT" ]; then
  echo "Usage: bash scripts/validator_output.sh <draft.md> [--quiet|--json]"
  echo "Error: draft file required and must exist."
  exit 2
fi

# ─────────────────────────────────────────────────────────────────
# Probes — each returns "PASS|name|detail" or "FAIL|name|detail"
# ─────────────────────────────────────────────────────────────────

probe_mes() {
  # SP.21 MES — 🎯 MODEL line MUST appear as first content (within first 5 non-empty lines)
  local hit
  hit=$(head -10 "$DRAFT" | grep -m1 -E "🎯 *MODEL: *(max|very high|medium|low)" 2>/dev/null)
  if [ -n "$hit" ]; then
    echo "PASS|P4 MES (SP.21)|🎯 MODEL line declared near top"
    return 0
  fi
  echo "FAIL|P4 MES (SP.21)|missing or malformed 🎯 MODEL: <tier> · <variant> line in first 10 lines"
  return 1
}

probe_step_header() {
  # MTL RULE 1 — STEP / 🎯 MACRO / 📌 MICRO three-line header
  local step macro micro
  step=$(grep -cE "^STEP: " "$DRAFT" 2>/dev/null)
  macro=$(grep -cE "^🎯 *MACRO: " "$DRAFT" 2>/dev/null)
  micro=$(grep -cE "^📌 *MICRO: " "$DRAFT" 2>/dev/null)
  step=${step:-0}; macro=${macro:-0}; micro=${micro:-0}
  if [ "$step" -ge 1 ] && [ "$macro" -ge 1 ] && [ "$micro" -ge 1 ]; then
    echo "PASS|STEP header (RULE 1)|STEP + MACRO + MICRO all present"
    return 0
  fi
  echo "FAIL|STEP header (RULE 1)|STEP=$step MACRO=$macro MICRO=$micro (expected ≥1 each)"
  return 1
}

probe_iac() {
  # SP.6 IAC — Understanding Check table with verbatim quote column
  local has_iac has_clause has_verbatim
  has_iac=$(grep -ciE "Understanding Check|IAC" "$DRAFT" 2>/dev/null)
  has_clause=$(grep -ciE "^\| *C\.[0-9]+ *\|" "$DRAFT" 2>/dev/null)
  has_verbatim=$(grep -ciE "verbatim|\"[^\"]{8,}\"" "$DRAFT" 2>/dev/null)
  has_iac=${has_iac:-0}; has_clause=${has_clause:-0}; has_verbatim=${has_verbatim:-0}
  if [ "$has_iac" -ge 1 ] && [ "$has_clause" -ge 1 ]; then
    echo "PASS|P2 IAC (SP.6)|UC table with $has_clause clause row(s)"
    return 0
  fi
  if [ "$has_iac" -ge 1 ] && [ "$has_verbatim" -ge 1 ]; then
    echo "PASS|P2 IAC (SP.6)|UC mention + verbatim quote(s) found (trivial-spec carve-out)"
    return 0
  fi
  echo "FAIL|P2 IAC (SP.6)|no UC table (no | C.X | rows) AND no verbatim quotes — likely missing"
  return 1
}

probe_ssc() {
  # SP.18 SSC — Sync Status table OR BACKUP STATUS block
  local has_sync has_backup
  has_sync=$(grep -ciE "Sync Status \(SP\.18|📡 *Sync" "$DRAFT" 2>/dev/null)
  has_backup=$(grep -ciE "BACKUP STATUS|📦 *BACKUP" "$DRAFT" 2>/dev/null)
  has_sync=${has_sync:-0}; has_backup=${has_backup:-0}
  if [ "$has_sync" -ge 1 ] || [ "$has_backup" -ge 1 ]; then
    echo "PASS|P3 SSC (SP.18)|Sync Status block present (table=$has_sync backup=$has_backup)"
    return 0
  fi
  echo "FAIL|P3 SSC (SP.18)|no Sync Status table AND no BACKUP STATUS block"
  return 1
}

probe_rae() {
  # SP.24 RAE — 🎯 RECOMMENDATIONS block (Autonomous mode preferred)
  local has_rae has_autonomous
  has_rae=$(grep -ciE "🎯 *RECOMMENDATIONS|SP\.24 RAE" "$DRAFT" 2>/dev/null)
  has_autonomous=$(grep -ciE "Autonomous Mode|NEXT ACTION|auto-execut" "$DRAFT" 2>/dev/null)
  has_rae=${has_rae:-0}; has_autonomous=${has_autonomous:-0}
  if [ "$has_rae" -ge 1 ] && [ "$has_autonomous" -ge 1 ]; then
    echo "PASS|P5 RAE (SP.24)|Recommendations block present with autonomous-mode marker"
    return 0
  fi
  if [ "$has_rae" -ge 1 ]; then
    echo "PASS|P5 RAE (SP.24)|Recommendations block present (autonomous marker absent — verify mode)"
    return 0
  fi
  echo "FAIL|P5 RAE (SP.24)|no 🎯 RECOMMENDATIONS block detected"
  return 1
}

probe_pulse() {
  # MTL RULE 3 — visible 5-item Pulse Check at end
  local has_pulse has_score
  has_pulse=$(grep -ciE "Pulse Check|✅ *Pulse" "$DRAFT" 2>/dev/null)
  has_score=$(grep -ciE "Score: [0-9]+/5|[0-9]+/5 *—|5 PASS" "$DRAFT" 2>/dev/null)
  has_pulse=${has_pulse:-0}; has_score=${has_score:-0}
  if [ "$has_pulse" -ge 1 ]; then
    echo "PASS|Pulse Check (RULE 3)|Pulse Check block detected (score-line=$has_score)"
    return 0
  fi
  echo "FAIL|Pulse Check (RULE 3)|no visible Pulse Check block"
  return 1
}

probe_fabrication() {
  # SP.5 FSP — heuristic check for fabrication red flags
  local fab_count
  fab_count=$(grep -ciE "\b(exactly|precisely)\s+[0-9]+" "$DRAFT" 2>/dev/null)
  fab_count=${fab_count:-0}
  if [ "$fab_count" -eq 0 ]; then
    echo "PASS|P1 Honest numbers (SP.5)|no precision-claim red flags"
    return 0
  fi
  echo "WARN|P1 Honest numbers (SP.5)|$fab_count 'exactly/precisely N' claim(s) — verify each is grounded"
  return 0
}

# ─────────────────────────────────────────────────────────────────
# Run all probes
# ─────────────────────────────────────────────────────────────────
RESULTS=()
RESULTS+=("$(probe_mes)")
RESULTS+=("$(probe_step_header)")
RESULTS+=("$(probe_iac)")
RESULTS+=("$(probe_ssc)")
RESULTS+=("$(probe_rae)")
RESULTS+=("$(probe_pulse)")
RESULTS+=("$(probe_fabrication)")

declare -i PASS=0
declare -i FAIL=0
declare -i WARN=0
for r in "${RESULTS[@]}"; do
  status=$(echo "$r" | cut -d'|' -f1)
  case "$status" in
    PASS) PASS=$((PASS+1)) ;;
    FAIL) FAIL=$((FAIL+1)) ;;
    WARN) WARN=$((WARN+1)) ;;
  esac
done

# Mandatory items = 5 (P1 honest, P2 IAC, P3 SSC, P4 MES, P5 RAE) + 2 supporting (STEP header, Pulse)
# Block ship threshold: < 4 mandatory PASS

# ─────────────────────────────────────────────────────────────────
# Output
# ─────────────────────────────────────────────────────────────────
case "$MODE" in
  quiet)
    [ "$FAIL" -eq 0 ] && exit 0 || exit 1
    ;;
  json)
    echo "{"
    echo "  \"draft\": \"$DRAFT\","
    echo "  \"pass\": $PASS,"
    echo "  \"fail\": $FAIL,"
    echo "  \"warn\": $WARN,"
    echo "  \"verdict\": \"$([ "$FAIL" -le 1 ] && echo "ALLOW" || echo "BLOCK")\""
    echo "}"
    ;;
  full|*)
    echo "═══════════════════════════════════════════════════════════════"
    echo "✅ OUTPUT VALIDATOR — SOP compliance probe on $(basename "$DRAFT")"
    echo "═══════════════════════════════════════════════════════════════"
    printf "%-8s %-30s %s\n" "Status" "Probe" "Detail"
    printf "%-8s %-30s %s\n" "------" "------------------------------" "----------------------"
    for r in "${RESULTS[@]}"; do
      status=$(echo "$r" | cut -d'|' -f1)
      name=$(echo "$r" | cut -d'|' -f2)
      detail=$(echo "$r" | cut -d'|' -f3)
      printf "[%-4s]  %-30s  %s\n" "$status" "$name" "$detail"
    done
    echo ""
    echo "Summary: $PASS PASS · $WARN WARN · $FAIL FAIL"
    if [ "$FAIL" -ge 2 ]; then
      echo "🚨 VERDICT: BLOCK ship — $FAIL mandatory checks failed. Fix before sending to user."
    elif [ "$FAIL" -eq 1 ]; then
      echo "⚠️  VERDICT: WARN — 1 check failed. Consider fixing OR justifying."
    else
      echo "✅ VERDICT: ALLOW ship — all mandatory checks passed."
    fi
    echo "═══════════════════════════════════════════════════════════════"
    ;;
esac

if [ "$FAIL" -ge 2 ]; then
  exit 1
fi
exit 0
