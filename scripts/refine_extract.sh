#!/usr/bin/env bash
# 🔁 REFINE Step E — Extract
# Per SP.20 REFINE | F.24 ship 2026-05-22
# Reads: Review output + SIR_LOG + FAILURE_LEDGER + META_AUDIT_LOG
# Writes: cache/refine/EXTRACT_<date>.md — list of recurring patterns ranked by frequency
# v1.0 STUB — wraps sir_recurrence.sh + adds basic FAILURE_LEDGER pattern detection

set +e
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

OUT="cache/refine/EXTRACT_${DATE}.md"
mkdir -p cache/refine

echo "🔁 REFINE Step E — Extract"
echo "Device: $DEVICE | Timestamp: $TS"
echo "Output: $OUT"
echo ""

{
  echo "# 🔁 REFINE Step E — Extract for ${DATE}"
  echo "**Device:** ${DEVICE}  **Generated:** ${TS}"
  echo ""
  echo "## SIR insight recurrences"
  if [ -x scripts/sir_recurrence.sh ]; then
    bash scripts/sir_recurrence.sh 2>&1 | tail -20
  else
    echo "_(sir_recurrence.sh unavailable)_"
  fi
  echo ""
  echo "## Chain warning frequency (last 20 META_AUDIT rows)"
  if [ -f cache/META_AUDIT_LOG.md ]; then
    grep -oE "[0-9]+ warnings" cache/META_AUDIT_LOG.md | tail -20 | sort | uniq -c | sort -rn | head -5
  fi
  echo ""
  echo "## Repeated FAILURE_LEDGER categories (heuristic — REPEAT type)"
  grep -oE "REPEAT × [0-9]+" cache/FAILURE_LEDGER.md 2>/dev/null | sort | uniq -c | sort -rn | head -5
  echo ""
  echo "*v1.0 STUB — heuristic extracts; semantic clustering pending in v2.0*"
} > "$OUT"

[ -f cache/META_AUDIT_LOG.md ] && printf "| %s | %s | REFINE.E | extract generated | %s |\n" "$DATE" "$DEVICE" "$COMMIT" >> cache/META_AUDIT_LOG.md

echo "✅ REFINE Step E complete — $OUT"
exit 0
