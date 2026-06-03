#!/usr/bin/env bash
# checklist_gate.sh — GUARD B of the discipline layer (2026-06-03, mac-main)
# Makes the Prime Stage 1 protocol MECHANICAL: no commit may change protected
# working content unless a CONFIRMED checklist (PER) exists for TODAY.
# Restores "relay back -> 💠 confirm -> THEN execute" as an unskippable gate
# at the point changes become real (commit), instead of a behavioral promise.
#
# Exit 0 = pass. Exit 1 = block.

set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "not a git repo"; exit 0; }
cd "$ROOT"
# shellcheck source=/dev/null
source scripts/protected_paths.sh

# Which protected files are staged?
PROT="$(staged_protected)"
if [ -z "$PROT" ]; then
  echo "✅ Guard B (Checklist Gate): no protected working content staged — gate N/A."
  exit 0
fi

# Require a CONFIRMED PER dated today (or, as a fallback, the most recent PER CONFIRMED
# within the last 2 days — covers a task that spans past midnight).
TODAY=$(date +%Y%m%d)
YDAY=$(date -v-1d +%Y%m%d 2>/dev/null || date -d "yesterday" +%Y%m%d 2>/dev/null || echo "$TODAY")

confirmed_per() {
  local d
  for d in "$TODAY" "$YDAY"; do
    grep -lR "^STATUS: CONFIRMED" cache/prompt_records/PER_*"$d"*.md 2>/dev/null && return 0
  done
  return 1
}

if HIT="$(confirmed_per)"; then
  echo "✅ Guard B (Checklist Gate): CONFIRMED checklist on record —"
  echo "$HIT" | sed 's/^/     /'
  exit 0
fi

echo "🛑 CHECKLIST GATE (Guard B) — BLOCKED"
echo "================================================"
echo "Protected working content is staged, but there is NO CONFIRMED checklist (PER) for today:"
echo "$PROT" | sed 's/^/   • /'
echo ""
echo "Prime Stage 1 — GROUND ZERO. Before changing working content you MUST:"
echo "  1. Relay your understanding back as a numbered UNDERSTANDING CHECK"
echo "  2. Get the user's 💠 confirmation (same page)"
echo "  3. Record it: cache/prompt_records/PER_<NNN>_$(date +%Y%m%d)_<HHMM>.md"
echo "     with a 'STATUS: CONFIRMED' line + add a row to PER_INDEX.md"
echo "  Then re-commit."
echo ""
echo "  Emergency override (discouraged, audited by QC/Karen):  git commit --no-verify"
echo "================================================"
exit 1
