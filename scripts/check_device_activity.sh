#!/usr/bin/env bash
# 📊 DEVICE ACTIVITY CHECK — See what each device has been doing
# Per DEVICE_REGISTRY.md | F.15 fix 2026-05-21
# Usage: bash scripts/check_device_activity.sh [days_back]

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DAYS="${1:-7}"

echo "📊 DEVICE ACTIVITY — Last $DAYS days"
echo "================================================"
echo ""

# Fetch latest from remote
git fetch origin --quiet 2>&1 || echo "⚠️  Could not fetch (offline?)"
echo ""

# Sync status
echo "🔄 SYNC STATUS:"
git status -sb | head -3
echo ""

# Recent commits with device + timestamp
echo "📅 RECENT COMMITS (chronological):"
git log --since="$DAYS days ago" --pretty=format:"%h | %ad | %an | %s" --date=iso-local
echo ""
echo ""

# Per-device commit count
echo "📊 COMMIT COUNT BY DEVICE (last $DAYS days):"
git log --since="$DAYS days ago" --pretty=format:"%an" | sort | uniq -c | sort -rn
echo ""

# Files most modified
echo "📝 MOST-MODIFIED FILES (last $DAYS days):"
git log --since="$DAYS days ago" --pretty=format: --name-only 2>/dev/null | grep -v "^$" | sort | uniq -c | sort -rn | head -10
echo ""

# Check if other devices have unpulled commits
echo "🔍 UNPULLED COMMITS FROM REMOTE:"
UNPULLED=$(git log HEAD..origin/main --oneline 2>/dev/null | wc -l | xargs)
if [ "$UNPULLED" -gt 0 ]; then
  echo "⚠️  $UNPULLED unpulled commits — other devices have pushed!"
  echo ""
  git log HEAD..origin/main --pretty=format:"%h | %ad | %an | %s" --date=iso-local
  echo ""
  echo ""
  echo "👉 Run 'git pull' to get these changes before continuing work"
else
  echo "✅ No unpulled commits — you're up to date"
fi

echo ""
echo "================================================"
echo "💡 To see what THIS device did: git log --author=\"$(git config user.name)\" --oneline"
