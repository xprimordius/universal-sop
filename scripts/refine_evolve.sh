#!/usr/bin/env bash
# 🔁 REFINE Step E — Evolve
# Per SP.20 REFINE | F.24 ship 2026-05-22
# Reads: INTERVENTION_LOG (looking for patterns that recurred 3+ times after intervention)
# Writes: cache/refine/PROPOSALS/<date>_<name>.md — protocol/architecture proposals
# v1.0 STUB — scans for pattern recurrence; full proposal generation pending v2.0

set +e
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

mkdir -p cache/refine/PROPOSALS

OUT="cache/refine/EVOLVE_${DATE}.md"

echo "🔁 REFINE Step E — Evolve (pattern → protocol proposal)"

{
  echo "# 🔁 REFINE Step E — Evolve for ${DATE}"
  echo "**Device:** ${DEVICE}  **Generated:** ${TS}"
  echo ""
  echo "## Quarterly evolution review"
  echo ""
  echo "## Pattern recurrence threshold"
  echo "Trigger: a pattern in INTERVENTION_LOG that recurs 3+ times after intervention → propose protocol-level change."
  echo ""
  echo "## Patterns observed (this cadence)"
  if [ -f cache/refine/INTERVENTION_LOG.md ]; then
    RECURRING=$(grep -c "applied" cache/refine/INTERVENTION_LOG.md 2>/dev/null || echo 0)
    echo "- INTERVENTION_LOG rows with 'applied' status: $RECURRING"
    if [ "$RECURRING" -lt 3 ]; then
      echo "- Below threshold (need 3+ recurrences); no Evolve proposal generated this cycle."
    fi
  else
    echo "- INTERVENTION_LOG not yet populated."
  fi
  echo ""
  echo "## Future proposals (when threshold met)"
  echo "Each proposal lands at cache/refine/PROPOSALS/<date>_<name>.md with:"
  echo "- The pattern observed (N recurrences)"
  echo "- Why incremental interventions didn't suffice"
  echo "- Proposed protocol/architecture change"
  echo "- Estimated quintessence-score impact"
  echo ""
  echo "*v1.0 STUB — recurrence counter. v2.0 generates protocol proposals with full diff.*"
} > "$OUT"

[ -f cache/META_AUDIT_LOG.md ] && printf "| %s | %s | REFINE.Evolve | evolve generated | %s |\n" "$DATE" "$DEVICE" "$COMMIT" >> cache/META_AUDIT_LOG.md

echo "✅ REFINE Step Evolve complete — $OUT"
exit 0
