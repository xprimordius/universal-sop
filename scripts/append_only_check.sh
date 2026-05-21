#!/usr/bin/env bash
# 🛡️ APPEND-ONLY CHECK — Verify history files only grew, didn't shrink
# Per DEVICE_REGISTRY.md never-delete list | F.15 fix 2026-05-21
# Run before commit OR as pre-commit hook

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

# Files that must only grow (no shrinking allowed without explicit override)
APPEND_ONLY_FILES=(
  "cache/SESSION_STATE.md"
  "cache/BACKUP_LOG.md"
  "cache/FAILURE_LEDGER.md"
  "cache/RPT_LOG.md"
  "cache/CONTINUATION.md"
)

ISSUES=0

echo "🛡️ APPEND-ONLY CHECK — Verifying history files preserved"
echo "================================================"

for file in "${APPEND_ONLY_FILES[@]}"; do
  if [ -f "$file" ]; then
    # Compare staged version with previous committed version
    if git diff --cached --quiet "$file" 2>/dev/null; then
      # No changes staged for this file — skip
      continue
    fi

    CURRENT_LINES=$(wc -l < "$file" | xargs)
    PREVIOUS_LINES=$(git show HEAD:"$file" 2>/dev/null | wc -l | xargs)

    if [ "$CURRENT_LINES" -lt "$PREVIOUS_LINES" ]; then
      DIFF=$((PREVIOUS_LINES - CURRENT_LINES))
      echo "❌ $file SHRUNK by $DIFF lines ($PREVIOUS_LINES → $CURRENT_LINES)"
      echo "   This file is APPEND-ONLY per DEVICE_REGISTRY.md"
      echo "   If intentional (e.g., section reorganization that preserves history):"
      echo "     git commit -m \"...\" --no-verify"
      echo "   But verify NO content was actually deleted first."
      ISSUES=$((ISSUES + 1))
    elif [ "$CURRENT_LINES" -eq "$PREVIOUS_LINES" ]; then
      echo "ℹ️  $file unchanged line count (probably edits within sections)"
    else
      GROWTH=$((CURRENT_LINES - PREVIOUS_LINES))
      echo "✅ $file grew by $GROWTH lines (expected for append-only)"
    fi
  fi
done

echo "================================================"
if [ $ISSUES -eq 0 ]; then
  echo "✅ PASS — All append-only files preserved"
  exit 0
else
  echo "❌ FAIL — $ISSUES append-only violation(s) detected"
  echo "Aborting commit. Review changes or use --no-verify if intentional."
  exit 1
fi
