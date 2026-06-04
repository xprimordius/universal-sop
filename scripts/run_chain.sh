#!/usr/bin/env bash
# run_chain.sh — AGENT CHAIN orchestrator (mechanical band) + AI-agent dispatch reminder
# NEW 2026-06-03 (mac-main) | Fixes Master Pass F6 (chain had no runner).
#
# WHAT THIS IS (and honestly is NOT):
#  • The MECHANICAL band of AGENT_CHAIN.md — runs the script-backed agents
#    (verifier -> validator -> qc -> meta_verify) in chain order, aggregates a verdict,
#    and APPENDS a tamper-evident row to cache/CHAIN_LOG.md. This part is real Tier 🥇.
#  • It CANNOT spawn the AI-judgment agents (Insight/Karen/Scope/Master Pass/Tom/...) —
#    a bash script can't call Claude sub-agents (Master Pass constraint C1). So it PRINTS
#    the list of judgment agents the orchestrating AI must invoke as real separate-context
#    Agent calls, and records in the ledger that they are PENDING until their reports land.
#
# Usage:
#   bash scripts/run_chain.sh [--target FILE] [--quiet]
# Exit: 0 = mechanical band clean (warnings ok); 1 = a mechanical layer hard-failed.

set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT"
DEVICE="$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"; DEVICE="${DEVICE:-unknown}"
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo nohead)"
QUIET=0; TARGET=""
while [ $# -gt 0 ]; do case "$1" in --quiet) QUIET=1;; --target) shift; TARGET="$1";; esac; shift; done
say() { [ $QUIET -eq 0 ] && echo "$@"; }

say "🔗 AGENT CHAIN — mechanical band ($DEVICE @ $COMMIT)"
say "================================================"

# --- Mechanical band: script-backed agents in chain order ---
declare -a NAMES=("Verifier (presence)" "Validator (substance)" "QC (anti-rubber-stamp)" "Meta-Verifier (audits chain)")
declare -a SCRIPTS=("verifier.sh" "validator.sh" "qc.sh" "meta_verify.sh")
PASS=0; FAILN=0; SKIP=0; SUMMARY=""
i=0
while [ $i -lt ${#SCRIPTS[@]} ]; do
  s="scripts/${SCRIPTS[$i]}"; n="${NAMES[$i]}"
  if [ -x "$s" ]; then
    if [ -n "$TARGET" ]; then out="$(bash "$s" --target "$TARGET" 2>&1)"; rc=$?; else out="$(bash "$s" 2>&1)"; rc=$?; fi
    if [ $rc -eq 0 ]; then say "  ✅ $n"; PASS=$((PASS+1)); SUMMARY+="✅"; else say "  ❌ $n (exit $rc)"; FAILN=$((FAILN+1)); SUMMARY+="❌"; fi
  else
    say "  ⚪ $n — $s missing, skipped"; SKIP=$((SKIP+1)); SUMMARY+="⚪"
  fi
  i=$((i+1))
done

# --- AI-judgment band: the orchestrating AI must invoke these as separate Agent calls ---
say ""
say "🧠 AI-JUDGMENT BAND — invoke as REAL separate-context Agent calls (run_chain cannot spawn these):"
say "   1. 💡 Insight    2. 🐛 Debugger   3. ⚡ Enhancement   4. 🔮 Foresight"
say "   5. ✅ Karen      6. 🔍 Validation 7. 🎯 Scope         8. 🏆 Master Pass   9. 📋 Recommendation"
say "   ⊕ 🔬 Depth-Maximizer (Tom) — periodic"
say "   → See AGENT_CHAIN.md. Their reports are the evidence; commit them. Do NOT self-narrate '✅'."

VERDICT="MECH-CLEAN"; [ $FAILN -gt 0 ] && VERDICT="MECH-FAIL"
say ""
say "📊 Mechanical band: $PASS pass / $FAILN fail / $SKIP skip → $VERDICT"
say "================================================"

# --- Append-only ledger row (tamper-evident: includes commit + timestamp + device) ---
TS="$(date '+%Y-%m-%d %H:%M %Z' 2>/dev/null || echo 'date-unavailable')"
LOG="cache/CHAIN_LOG.md"
if [ -f "$LOG" ]; then
  printf '| %s | %s | %s | %s%s%s | %s | judgment-band: PENDING-INVOCATION |\n' \
    "$TS" "$DEVICE" "$COMMIT" "$PASS" "/$((PASS+FAILN+SKIP))" "" "$VERDICT" >> "$LOG"
  say "🧾 logged → $LOG"
fi

[ $FAILN -gt 0 ] && exit 1
exit 0
