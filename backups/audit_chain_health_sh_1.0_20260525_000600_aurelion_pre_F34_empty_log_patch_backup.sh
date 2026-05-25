#!/usr/bin/env bash
# 📊 AUDIT_CHAIN_HEALTH — Analyze META_AUDIT_LOG trends + detect chain degradation
# Per Q.A.2 (chain trend analysis) | F.22 quintessence audit 2026-05-21
# Usage: bash scripts/audit_chain_health.sh [--window N]
# Default window: 10 most recent chain runs

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

WINDOW="${1:-10}"
[ "$1" = "--window" ] && WINDOW="${2:-10}"

if [ ! -f cache/META_AUDIT_LOG.md ]; then
  echo "⚠️ META_AUDIT_LOG.md not found"
  exit 0
fi

echo "📊 CHAIN HEALTH AUDIT"
echo "================================================"
echo "Window: last $WINDOW chain-run rows"
echo ""

# Extract recent rows (filter to those with date pattern)
RECENT=$(grep -E "^\| 20[0-9]{2}-" cache/META_AUDIT_LOG.md | tail -"$WINDOW")

if [ -z "$RECENT" ]; then
  echo "ℹ️  No chain-run rows yet"
  exit 0
fi

echo "📋 Per-agent recent activity:"
for agent in Verifier Validator QC Meta-Verifier; do
  COUNT=$(echo "$RECENT" | grep -c "| $agent |" || true)
  WARN_COUNT=$(echo "$RECENT" | grep "| $agent |" | grep -oE "[0-9]+ warnings" | awk '{s+=$1} END {print s+0}')
  PASS_TOTAL=$(echo "$RECENT" | grep "| $agent |" | grep -oE "[0-9]+ pass" | awk '{s+=$1} END {print s+0}')
  echo "  $agent: $COUNT runs · $PASS_TOTAL total passes · $WARN_COUNT total warnings"
done
echo ""

# Detect chain completeness — did each commit get all 4 agents?
echo "🔍 Chain completeness check (last $WINDOW rows):"
COMMITS=$(echo "$RECENT" | awk -F'|' '{ gsub(/^ +| +$/, "", $6); print $6 }' | sort -u | grep -v "^$" | head -10)
INCOMPLETE=0
for c in $COMMITS; do
  AGENTS_FOR_COMMIT=$(echo "$RECENT" | grep "$c" | awk -F'|' '{ gsub(/^ +| +$/, "", $4); print $4 }' | sort -u | wc -l)
  if [ "$AGENTS_FOR_COMMIT" -lt 4 ]; then
    echo "  ⚠️ commit $c: only $AGENTS_FOR_COMMIT/4 agents fired"
    INCOMPLETE=$((INCOMPLETE+1))
  fi
done
if [ "$INCOMPLETE" -eq 0 ]; then
  echo "  ✅ All recent commits have full 4-layer chain coverage"
fi
echo ""

# Trend signal
TOTAL_WARNINGS=$(echo "$RECENT" | grep -oE "[0-9]+ warnings" | awk '{s+=$1} END {print s+0}')
TOTAL_RUNS=$(echo "$RECENT" | wc -l)
if [ "$TOTAL_RUNS" -gt 0 ]; then
  WARN_PER_RUN=$(awk -v w="$TOTAL_WARNINGS" -v r="$TOTAL_RUNS" 'BEGIN { printf "%.1f", w/r }')
  echo "📈 Warning rate: $TOTAL_WARNINGS warnings / $TOTAL_RUNS runs = $WARN_PER_RUN warnings/run"
  if awk -v wpr="$WARN_PER_RUN" 'BEGIN { exit !(wpr > 2.0) }'; then
    echo "  ⚠️ Warning rate ELEVATED (>2.0/run) — review chain calibration"
  else
    echo "  ✅ Warning rate within expected band (<2.0/run)"
  fi
fi
echo ""
echo "================================================"
echo "✅ Chain health audit complete. Run periodically (suggested: every 10 commits)."
