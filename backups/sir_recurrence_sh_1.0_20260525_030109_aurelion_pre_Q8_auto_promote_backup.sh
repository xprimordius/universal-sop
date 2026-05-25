#!/usr/bin/env bash
# 🔁 SIR_RECURRENCE — Detect recurring SIR insights + auto-flag for FAILURE_LEDGER promotion
# Per Q.A.1 + Q.A.5 (closed feedback loops) | F.22 quintessence audit 2026-05-21
# Usage: bash scripts/sir_recurrence.sh [--threshold N]
# Default threshold: 2 (insight appearing 2+ times = candidate for promotion)
#
# Reads: cache/SIR_LOG.md
# Outputs: report of recurring insights + suggested FAILURE_LEDGER entry IDs

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

THRESHOLD="${1:-2}"
[ "$1" = "--threshold" ] && THRESHOLD="${2:-2}"

if [ ! -f cache/SIR_LOG.md ]; then
  echo "⚠️ cache/SIR_LOG.md not found — no insights to analyze"
  exit 0
fi

echo "🔁 SIR RECURRENCE ANALYZER"
echo "================================================"
echo "Threshold: $THRESHOLD recurrences = candidate for FAILURE_LEDGER promotion"
echo ""

# Extract insight text (column 5 of pipe-table)
# Skip header rows + schema rows
INSIGHTS=$(grep -E "^\| 20[0-9]{2}-" cache/SIR_LOG.md 2>/dev/null | awk -F'|' '{ gsub(/^ +| +$/, "", $6); print $6 }')

if [ -z "$INSIGHTS" ]; then
  echo "ℹ️  No SIR insight rows found"
  exit 0
fi

echo "📊 Per-insight frequency analysis (top 10):"
echo "$INSIGHTS" | sort | uniq -c | sort -rn | head -10
echo ""

echo "🚨 Candidates for FAILURE_LEDGER promotion (≥ $THRESHOLD occurrences):"
CANDIDATES=$(echo "$INSIGHTS" | sort | uniq -c | sort -rn | awk -v t="$THRESHOLD" '$1 >= t { $1=""; print substr($0, 2) }')

if [ -z "$CANDIDATES" ]; then
  echo "  ✅ None — chain has not produced enough repetition yet."
else
  echo "$CANDIDATES" | head -5 | while read -r insight; do
    echo "  ⚠️ $insight"
  done
  echo ""
  echo "📝 Recommended action: review above. For each, consider adding a FAILURE_LEDGER entry F.X documenting the pattern + proposed permanent fix."
fi
echo ""
echo "================================================"
echo "✅ Analysis complete. Run periodically (suggested: every 5 commits)."
