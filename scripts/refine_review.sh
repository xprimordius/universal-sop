#!/usr/bin/env bash
# 🔁 REFINE Step R — Review
# Per SP.20 REFINE | F.24 ship 2026-05-22
# Reads: META_AUDIT_LOG, BACKUP_LOG, SIR_LOG, FAILURE_LEDGER, last 50 commits
# Writes: cache/refine/REVIEW_<date>.md
# v1.0 STUB — full implementation pending; this version surfaces the data without analysis

set +e
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

OUT="cache/refine/REVIEW_${DATE}.md"
mkdir -p cache/refine

echo "🔁 REFINE Step R — Review"
echo "Device: $DEVICE | Timestamp: $TS | Commit: $COMMIT"
echo "Output: $OUT"
echo ""

{
  echo "# 🔁 REFINE Step R — Review for ${DATE}"
  echo "**Device:** ${DEVICE}  **Generated:** ${TS}  **Commit:** ${COMMIT}"
  echo ""
  echo "## Last 7 days — commits"
  git log --since="7 days ago" --pretty=format:"- %h %s" 2>/dev/null | head -30
  echo ""
  echo ""
  echo "## Last 7 days — META_AUDIT_LOG chain rows"
  if [ -f cache/META_AUDIT_LOG.md ]; then
    grep -E "^\| ${DATE:0:7}" cache/META_AUDIT_LOG.md 2>/dev/null | tail -30
  fi
  echo ""
  echo "## Last 7 days — SIR_LOG insight rows"
  if [ -f cache/SIR_LOG.md ]; then
    grep -E "^\| ${DATE:0:7}" cache/SIR_LOG.md 2>/dev/null | tail -20
  fi
  echo ""
  echo "## Recent FAILURE_LEDGER entries (most-recent first)"
  grep -E "^<summary><b>F\.[0-9]+" cache/FAILURE_LEDGER.md 2>/dev/null | head -5
  echo ""
  echo "*v1.0 STUB — surfaces data; analysis layer pending in v2.0*"
} > "$OUT"

# Log
[ -f cache/META_AUDIT_LOG.md ] && printf "| %s | %s | REFINE.R | review generated | %s |\n" "$DATE" "$DEVICE" "$COMMIT" >> cache/META_AUDIT_LOG.md

echo "✅ REFINE Step R complete — $OUT"
exit 0
