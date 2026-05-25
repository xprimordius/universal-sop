#!/usr/bin/env bash
# 🔁 SIR_RECURRENCE — Detect recurring SIR insights + auto-flag for FAILURE_LEDGER promotion
# Per Q.A.1 + Q.A.5 (closed feedback loops) | F.22 quintessence audit 2026-05-21
# v2.0 (2026-05-25 aurelion): added --auto-promote — write F-class stub when recur ≥ 3
#                              Closes Q.8 (failure-to-fix automation).
#
# Usage: bash scripts/sir_recurrence.sh [--threshold N] [--auto-promote]
# Defaults:
#   threshold = 2 (insight appearing 2+ times = displayed candidate)
#   auto-promote threshold = 3 (insight appearing 3+ times AND no existing F-class match
#                               → auto-append stub to cache/FAILURE_LEDGER.md)
#
# Reads: cache/SIR_LOG.md, cache/FAILURE_LEDGER.md
# Writes (when --auto-promote): cache/FAILURE_LEDGER.md (append-only, safe per SOP rule)

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

THRESHOLD=2
AUTO_PROMOTE=0
while [ $# -gt 0 ]; do
  case "$1" in
    --threshold) THRESHOLD="${2:-2}"; shift 2 ;;
    --auto-promote) AUTO_PROMOTE=1; shift ;;
    [0-9]*) THRESHOLD="$1"; shift ;;
    *) shift ;;
  esac
done

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

  # ─────────────────────────────────────────────────────────
  # Q.8 closure 2026-05-25 (aurelion) — --auto-promote: append F-class stub when
  # an insight recurs ≥ 3 times AND no existing F-class entry already covers it.
  # Stub is INTENTIONALLY INCOMPLETE (placeholder fields) so humans see a clear
  # "needs root-cause + fix" todo, not a fake closure. Append-only safe.
  # ─────────────────────────────────────────────────────────
  if [ "$AUTO_PROMOTE" = "1" ]; then
    echo ""
    echo "🤖 AUTO-PROMOTE mode active (threshold ≥3 recurrences)"
    AUTO_PROMOTE_THRESHOLD=3
    PROMOTED=0
    DEVICE="$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
    [ -z "$DEVICE" ] && DEVICE="unknown"
    TS=$(date +"%Y-%m-%d %H:%M %Z")
    DATE_ONLY=$(date +"%Y-%m-%d")
    # Find the next free F-number above the current ceiling
    CURRENT_MAX_F=$(grep -oE "F\.[0-9]+" cache/FAILURE_LEDGER.md 2>/dev/null | sed 's/F\.//' | sort -n | tail -1)
    NEXT_F=$((${CURRENT_MAX_F:-0} + 1))
    while read -r insight; do
      [ -z "$insight" ] && continue
      # Re-count this insight (CANDIDATES already filtered by THRESHOLD, but auto-promote uses higher bar)
      COUNT=$(echo "$INSIGHTS" | grep -Fxc "$insight" 2>/dev/null)
      COUNT=${COUNT:-0}
      [ "$COUNT" -lt "$AUTO_PROMOTE_THRESHOLD" ] && continue
      # Already covered? Look for first 40 chars of insight in FAILURE_LEDGER
      INSIGHT_KEY=$(echo "$insight" | head -c 40)
      if grep -Fq "$INSIGHT_KEY" cache/FAILURE_LEDGER.md 2>/dev/null; then
        echo "  ℹ️  Already covered in FAILURE_LEDGER: $INSIGHT_KEY..."
        continue
      fi
      # Append stub. Use F.NEXT_F, then increment.
      STUB="

<details>
<summary><b>F.$NEXT_F — [AUTO-PROMOTED STUB · needs root-cause + permanent fix] $insight</b></summary>

- **Type:** REPEAT (auto-promoted by sir_recurrence.sh --auto-promote on $DATE_ONLY at $TS by $DEVICE)
- **First Observed:** _to-be-filled — search SIR_LOG.md for the first occurrence_
- **Times:** $COUNT (occurrences in SIR_LOG.md at time of promotion)
- **Root Cause:** _to-be-investigated — recurring pattern detected, root cause not yet analyzed_
- **Permanent Fix:** _to-be-designed — must be structural (script/doctrine), not 'try harder'_
- **Fixed:** _open — promote to fixed when permanent fix ships_
- **Verified:** _open_
- **Auto-promotion context:** sir_recurrence.sh detected this insight crossed the auto-promote threshold ($AUTO_PROMOTE_THRESHOLD recurrences) and no existing F-class entry contained the first-40-chars key. Stub appended for human triage — DO NOT mark closed without genuine root-cause + permanent-fix work.

</details>"
      echo "$STUB" >> cache/FAILURE_LEDGER.md
      echo "  ✅ Auto-promoted to F.$NEXT_F: $insight (recurred $COUNT× — stub appended for triage)"
      NEXT_F=$((NEXT_F + 1))
      PROMOTED=$((PROMOTED + 1))
    done < <(echo "$CANDIDATES")
    if [ "$PROMOTED" -eq 0 ]; then
      echo "  ℹ️  No new auto-promotions (either all candidates already covered, or none crossed ≥$AUTO_PROMOTE_THRESHOLD)"
    else
      echo "  📌 $PROMOTED new F-class stub(s) appended. Human review required before marking closed."
    fi
  fi
fi
echo ""
echo "================================================"
echo "✅ Analysis complete. Run periodically (suggested: every 5 commits)."
echo "   Auto-promote: \`bash scripts/sir_recurrence.sh --auto-promote\` (writes F-class stubs)."
