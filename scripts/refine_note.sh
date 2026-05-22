#!/usr/bin/env bash
# 🔁 REFINE Step N — Note (Ledger Scribe)
# Per SP.20 REFINE | F.24 ship 2026-05-22
# Reads: cache/refine/INTERVENE_<date>.md (Intervention proposals — approved subset)
# Writes: append PREEMPTIVE row to FAILURE_LEDGER + cache/refine/INTERVENTION_LOG.md
# v1.0 STUB — surfaces what WOULD be logged; actual logging requires explicit approval

set +e
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

OUT="cache/refine/NOTE_${DATE}.md"
mkdir -p cache/refine

echo "🔁 REFINE Step N — Note (Ledger Scribe)"

{
  echo "# 🔁 REFINE Step N — Note for ${DATE}"
  echo "**Device:** ${DEVICE}  **Generated:** ${TS}"
  echo ""
  echo "## Proposed FAILURE_LEDGER PREEMPTIVE entries"
  echo ""
  echo "_v1.0 STUB — surfaces proposed entries. To commit them, copy below into cache/FAILURE_LEDGER.md via standard backup-then-edit flow._"
  echo ""
  echo '```'
  echo '<details>'
  echo '<summary><b>F.X — <pattern name> [PREEMPTIVE × 1, caught by REFINE before manifest] — ✅ FIXED <date></b></summary>'
  echo ''
  echo '- **Type:** PREEMPTIVE (caught by SP.20 REFINE before user-visible failure)'
  echo '- **Predicted by:** F (Foresight) — cache/refine/FORESEE_<date>.md'
  echo '- **Intervention:** I (Intervene) — <description> — cache/refine/INTERVENTION_LOG.md row N'
  echo '- **Confirmed prevented:** <how we know the predicted failure did not happen>'
  echo '- **Lesson:** <if recurs 3+ times, escalate to E (Evolve) for protocol change>'
  echo '</details>'
  echo '```'
  echo ""
  echo "## Append to INTERVENTION_LOG.md (template row)"
  echo ""
  echo "_Future row template:_"
  echo ""
  echo "| 📅 Date | 🖥️ Device | 🔢 ID | 🎯 Issue | 🛠️ Intervention | ✅ Outcome |"
  echo "|---|---|:-:|---|---|---|"
  echo "| ${DATE} | ${DEVICE} | I.X | <predicted issue> | <intervention> | <pending / applied / verified-prevented> |"
} > "$OUT"

[ -f cache/META_AUDIT_LOG.md ] && printf "| %s | %s | REFINE.N | note generated | %s |\n" "$DATE" "$DEVICE" "$COMMIT" >> cache/META_AUDIT_LOG.md

echo "✅ REFINE Step N complete — $OUT"
exit 0
