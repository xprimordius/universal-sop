#!/usr/bin/env bash
# 🔍 Consistency Check — Detect version drift across files
# Per FAILURE_MODES_ANALYSIS.md C2 gap fix
# Run from project root: bash scripts/consistency_check.sh

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "🔍 CONSISTENCY CHECK — Version drift detection"
echo "================================================"
echo ""

# Check SESSION_START version
echo "📄 SESSION_START.md version mentions:"
grep -E "VERSION:|v[0-9]\." SESSION_START.md | head -3
echo ""

# Check STANDALONE_SOP version
echo "📄 STANDALONE_SOP.md version mentions:"
grep -E "VERSION:|v[0-9]\." STANDALONE_SOP.md | head -3
echo ""

# Check for stale RPT_LOG references (should be FAILURE_LEDGER post-F8)
echo "🔍 Stale RPT_LOG references in active files (excluding legacy + backup):"
grep -rln "RPT_LOG" --include="*.md" 2>/dev/null | grep -v "cache/legacy\|cache/backups\|BACKUP_LOG\|FAILURE_LEDGER\|cache/RPT_LOG.md" | head -5
echo "  (Note: RPT_LOG mentions in narrative/historical context are OK — only pointers matter)"
echo ""

# Check for stale cache/APW_MASTER_CACHE refs (should be cache/legacy/APW_MASTER_CACHE)
echo "🔍 Stale cache path references (should point at cache/legacy/):"
grep -rn -E "cache/(APW_MASTER|BUILD_STATE|SCIO_KNOWLEDGE|PROGRAM_DETAILS|USER_FOUNDATION|TOKEN_BUDGET|USER_PROMPT)" --include="*.md" 2>/dev/null | grep -v "cache/legacy\|cache/backups\|BACKUP_LOG\|INDEX.md\|RPT_LOG\|FAILURE_LEDGER\|CONTEXT_TRANSFER" | head -5
echo ""

# Check for duplicate ---
echo "🔍 Double `---` separators (cosmetic — likely error):"
grep -rEn "^---$" --include="*.md" 2>/dev/null | awk -F: '{print $1}' | sort | uniq -c | awk '$1 > 20 {print "  " $2 " has " $1 " separators (normal: <30 for long docs)"}'
echo ""

# Check for footer vs header version drift
echo "🔍 Files where footer version may differ from header:"
for f in STANDALONE_SOP.md SESSION_START.md PROTOCOLS_REFERENCE.md; do
  if [ -f "$f" ]; then
    HEADER=$(grep -E "^# VERSION:" "$f" | head -1 | grep -oE "[0-9]+\.[0-9]+" | head -1)
    FOOTER=$(tail -3 "$f" | grep -oE "v[0-9]+\.[0-9]+" | head -1)
    if [ -n "$HEADER" ] && [ -n "$FOOTER" ] && [ "$HEADER" != "${FOOTER#v}" ]; then
      echo "  ⚠️ $f: header=$HEADER footer=$FOOTER"
    fi
  fi
done
echo ""

# Check for SUBSOP count consistency
echo "🔍 SubSOP count consistency (should be 16):"
grep -rEn "[0-9]+ SubSOPs" --include="*.md" 2>/dev/null | grep -v "cache/legacy\|cache/backups\|chat_archive\|FAILURE_MODES" | grep -oE "[0-9]+ SubSOPs" | sort | uniq -c
echo ""

# Check active cache file count
echo "📊 Active cache files (should be 5):"
ls cache/*.md 2>/dev/null | wc -l | xargs echo "  Count:"
ls cache/*.md
echo ""

# Check active agents count
echo "📊 Active agents (should be 4):"
ls agents/*.md 2>/dev/null | grep -v VALIDATION_WORKFLOW | wc -l | xargs echo "  Count:"
ls agents/*.md 2>/dev/null | grep -v VALIDATION_WORKFLOW
echo ""

echo "================================================"
echo "✅ Consistency check complete"
echo ""
echo "If any ⚠️ shown above, sweep references to update."
