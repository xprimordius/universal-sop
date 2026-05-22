#!/usr/bin/env bash
# 🔬 CHIRON RUN — Single-command Self-Improvement Lead invocation
# Per F.30 + agents/chiron.md | NEW 2026-05-22 | Owner: Chiron
#
# Runs monthly to:
#   1. Execute protocol coverage audit (Direction A + B)
#   2. Read recent SIR_LOG entries for recurrence trend
#   3. Read recent chain health trend
#   4. Write Chiron Report to cache/chiron/CHIRON_REPORT_<date>.md
#   5. Log run to cache/META_AUDIT_LOG.md
#
# Usage:
#   manual:  bash scripts/chiron_run.sh
#   monthly: see agents/chiron.md § "Automatic invocation" for Task Scheduler / cron setup
#
# Exit: 0 always (report-only; flags ≠ failures).

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
DATE=$(date +%Y-%m-%d)
TS=$(date +%H:%M)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

REPORT_DIR="cache/chiron"
mkdir -p "$REPORT_DIR"
REPORT_FILE="$REPORT_DIR/CHIRON_REPORT_${DATE}.md"

echo "═══════════════════════════════════════════════════════════════"
echo "🔬 CHIRON — Self-Improvement Lead Run"
echo "═══════════════════════════════════════════════════════════════"
echo "Device: $DEVICE  ·  Date: $DATE $TS  ·  Commit: $COMMIT"
echo "Report: $REPORT_FILE"
echo ""

# ===========================================================
# 1. PROTOCOL COVERAGE AUDIT
# ===========================================================
echo "──── 1/3 Protocol Coverage Audit ─────────────────────"
AUDIT_OUTPUT=""
if [ -x scripts/protocol_coverage_audit.sh ]; then
  AUDIT_OUTPUT=$(bash scripts/protocol_coverage_audit.sh 2>&1)
  echo "$AUDIT_OUTPUT" | tail -18
else
  echo "  ⚠️ scripts/protocol_coverage_audit.sh not found or not executable"
fi
echo ""

# Extract totals (best-effort parsing)
DRIFT_TOTAL=$(echo "$AUDIT_OUTPUT" | grep -oE "Drift candidates total: [0-9]+" | grep -oE "[0-9]+$" | head -1)
DORMANT_COUNT=$(echo "$AUDIT_OUTPUT" | grep "Dormant" | grep -oE "[0-9]+" | tail -1)

# ===========================================================
# 2. SIR RECURRENCE TREND
# ===========================================================
echo "──── 2/3 SIR Recurrence Trend ────────────────────────"
SIR_TOTAL=0
SIR_THIS_MONTH=0
if [ -f cache/SIR_LOG.md ]; then
  SIR_TOTAL=$(grep -cE "^\| 20[0-9]{2}-" cache/SIR_LOG.md 2>/dev/null)
  SIR_THIS_MONTH=$(grep -cE "^\| ${DATE:0:7}-" cache/SIR_LOG.md 2>/dev/null)
  echo "  Total SIR rows ever: $SIR_TOTAL"
  echo "  This month: $SIR_THIS_MONTH"
  if [ -x scripts/sir_recurrence.sh ]; then
    SIR_OUT=$(bash scripts/sir_recurrence.sh 2>&1)
    echo "$SIR_OUT" | tail -5
  fi
else
  echo "  ⚠️ cache/SIR_LOG.md not found"
fi
echo ""

# ===========================================================
# 3. CHAIN HEALTH TREND
# ===========================================================
echo "──── 3/3 Chain Health Trend ──────────────────────────"
CHAIN_OUT=""
if [ -x scripts/audit_chain_health.sh ]; then
  CHAIN_OUT=$(bash scripts/audit_chain_health.sh 2>&1)
  echo "$CHAIN_OUT" | tail -8
else
  echo "  ⚠️ scripts/audit_chain_health.sh not found"
fi
echo ""

# ===========================================================
# WRITE REPORT FILE
# ===========================================================
cat > "$REPORT_FILE" <<MDEOF
# 🔬 Chiron Report — ${DATE}

**Device:** ${DEVICE}
**Commit:** ${COMMIT}
**Generated:** ${DATE} ${TS}

---

## Summary

| Metric | Value |
|---|---|
| Drift candidates total | ${DRIFT_TOTAL:-N/A} |
| Dormant protocols | ${DORMANT_COUNT:-N/A} |
| SIR rows (lifetime) | ${SIR_TOTAL} |
| SIR rows (this month) | ${SIR_THIS_MONTH} |

---

## Coverage Audit Output

\`\`\`
${AUDIT_OUTPUT}
\`\`\`

---

## Chain Health Output

\`\`\`
${CHAIN_OUT}
\`\`\`

---

## Chiron Recommendations (auto-generated)

1. If **Dormant > 0**: review each dormant protocol; either promote enforcement (add Pulse Check item + Validator check) OR deprecate from MANDATORY_TIGHT_LOOP
2. If **unformalized scripts > 5**: schedule batch formalization commit (add PROTOCOLS_REFERENCE entries)
3. If **SIR recurrence ≥ 3** for any insight: promote to FAILURE_LEDGER F-class entry
4. **Weekly REFINE cycle:** run \`bash scripts/refine_review.sh && refine_extract.sh && refine_foresee.sh\` (separate cadence from this monthly Chiron run)

---

## Owner
[\`agents/chiron.md\`](../../agents/chiron.md)

## Next Chiron run
1st of next month, ~08:00 (per scheduler entry — see \`agents/chiron.md\` § Automatic invocation)
MDEOF

echo "═══════════════════════════════════════════════════════════════"
echo "📊 CHIRON SUMMARY"
echo "═══════════════════════════════════════════════════════════════"
echo "  Drift candidates: ${DRIFT_TOTAL:-N/A}"
echo "  Dormant protocols: ${DORMANT_COUNT:-N/A}"
echo "  SIR rows this month: ${SIR_THIS_MONTH}"
echo "  Report saved: $REPORT_FILE"
echo ""
echo "Cadence: monthly via Task Scheduler (Windows) or cron (Mac/Linux)."
echo "Setup commands: see agents/chiron.md § 'Automatic invocation'"
echo "═══════════════════════════════════════════════════════════════"

# Log to META_AUDIT_LOG
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | Chiron | drift:%s dormant:%s SIR-month:%s | %s |\n" \
    "$DATE" "$DEVICE" "${DRIFT_TOTAL:-?}" "${DORMANT_COUNT:-?}" "${SIR_THIS_MONTH}" "$COMMIT" \
    >> cache/META_AUDIT_LOG.md
fi

exit 0
