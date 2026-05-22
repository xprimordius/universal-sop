#!/usr/bin/env bash
# 📡 SYNC_STATUS — Backing script for SP.18 SSC (Sync Status Confirmation)
# Per agents/validator.md VL.8 + MANDATORY_TIGHT_LOOP.md v1.2
# Mechanically reports git state, Obsidian state, cross-device propagation
# Usage: bash scripts/sync_status.sh
# Output: formatted Sync Status block (AI surfaces verbatim at end of output)

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"

TS=$(date +"%Y-%m-%d %H:%M %Z")
COMMIT_SHA="$(git rev-parse --short HEAD 2>/dev/null || echo 'no-commits')"
COMMIT_MSG="$(git log -1 --format=%s 2>/dev/null || echo 'no-commits')"
BRANCH="$(git branch --show-current 2>/dev/null || echo 'unknown')"

# Fetch quietly to know remote state (best-effort; offline is OK)
git fetch --quiet origin "$BRANCH" 2>/dev/null || true
LOCAL_SHA=$(git rev-parse HEAD 2>/dev/null || echo "")
REMOTE_SHA=$(git rev-parse "origin/$BRANCH" 2>/dev/null || echo "")

if [ "$LOCAL_SHA" = "$REMOTE_SHA" ] && [ -n "$REMOTE_SHA" ]; then
  PUSH_STATUS="✅"
  PUSH_DETAIL="origin/$BRANCH = $COMMIT_SHA (in sync)"
  DISTANCE_STATUS="✅ 0/0"
  DISTANCE_DETAIL="in sync"
  MAC_SYNC="⏳ pending pull"
  MAC_DETAIL="other devices need \`git pull\` to receive $COMMIT_SHA"
elif [ -z "$REMOTE_SHA" ]; then
  PUSH_STATUS="⚠️"
  PUSH_DETAIL="no remote ref (first push? offline?)"
  DISTANCE_STATUS="⚪ N/A"
  DISTANCE_DETAIL="cannot compute"
  MAC_SYNC="⚪ N/A"
  MAC_DETAIL="remote unreachable"
else
  AHEAD=$(git rev-list --count "$REMOTE_SHA..$LOCAL_SHA" 2>/dev/null || echo "?")
  BEHIND=$(git rev-list --count "$LOCAL_SHA..$REMOTE_SHA" 2>/dev/null || echo "?")
  if [ "$AHEAD" -gt 0 ] 2>/dev/null && [ "$BEHIND" = "0" ]; then
    PUSH_STATUS="⚠️ pending"
    PUSH_DETAIL="$AHEAD commit(s) local, NOT pushed yet"
    DISTANCE_STATUS="⚠️ $AHEAD ahead"
    DISTANCE_DETAIL="run: git push origin $BRANCH"
    MAC_SYNC="⚪ blocked"
    MAC_DETAIL="cannot propagate until push lands"
  elif [ "$BEHIND" -gt 0 ] 2>/dev/null; then
    PUSH_STATUS="⚠️ behind"
    PUSH_DETAIL="$BEHIND commit(s) on remote not pulled — diverged"
    DISTANCE_STATUS="⚠️ $AHEAD/$BEHIND"
    DISTANCE_DETAIL="run: bash scripts/safe_push.sh"
    MAC_SYNC="⚠️ diverged"
    MAC_DETAIL="multi-device collision — resolve before pushing"
  else
    PUSH_STATUS="✅"
    PUSH_DETAIL="$COMMIT_SHA on origin/$BRANCH"
    DISTANCE_STATUS="✅ 0/0"
    DISTANCE_DETAIL="in sync"
    MAC_SYNC="⏳ pending pull"
    MAC_DETAIL="other devices need git pull to receive"
  fi
fi

# Obsidian state
OBSIDIAN_CONFLICTS=$(find . -name ".obsidian-conflict-*.md" 2>/dev/null | head -1)
if [ -d ".obsidian" ]; then
  if [ -n "$OBSIDIAN_CONFLICTS" ]; then
    OBSIDIAN_STATUS="⚠️ conflicts"
    OBSIDIAN_DETAIL="$(echo "$OBSIDIAN_CONFLICTS" | wc -l) conflict file(s) — resolve manually"
  else
    OBSIDIAN_STATUS="✅"
    OBSIDIAN_DETAIL="vault present at .obsidian/; no conflict files; opening Obsidian shows committed files"
  fi
else
  OBSIDIAN_STATUS="⚪ N/A"
  OBSIDIAN_DETAIL="no .obsidian/ directory"
fi

# Backup count this output (best-effort: backups in last 5 min)
BACKUPS_RECENT=$(find backups/ -type f -mmin -5 2>/dev/null | wc -l)

# BACKUP_LOG row count delta — approximate
BACKUP_LOG_TOTAL=$(grep -cE "^\| [0-9]+ \|" cache/BACKUP_LOG.md 2>/dev/null || echo "?")

# SIR_LOG row count
SIR_LOG_TOTAL=0
if [ -f cache/SIR_LOG.md ]; then
  SIR_LOG_TOTAL=$(grep -cE "^\| 20[0-9]{2}-" cache/SIR_LOG.md 2>/dev/null || echo "0")
fi

# Output the formatted block
cat <<EOF

📡 Sync Status (SP.18 SSC)
| 🎯 Channel | Status | 📝 Detail |
|------------|:------:|-----------|
| Git branch | ✅ | $BRANCH |
| Last commit | ✅ | $COMMIT_SHA — $COMMIT_MSG |
| Git push to origin/$BRANCH | $PUSH_STATUS | $PUSH_DETAIL |
| Distance local ↔ origin | $DISTANCE_STATUS | $DISTANCE_DETAIL |
| Obsidian vault | $OBSIDIAN_STATUS | $OBSIDIAN_DETAIL |
| Cross-device (mac-main + others) | $MAC_SYNC | $MAC_DETAIL |
| Backups created (last 5 min) | ✅ | $BACKUPS_RECENT new file(s) in backups/ |
| BACKUP_LOG total rows | ✅ | $BACKUP_LOG_TOTAL rows (append-only) |
| SIR_LOG total rows | ✅ | $SIR_LOG_TOTAL rows (append-only) |
| Device | ✅ | $DEVICE (per DEVICE_REGISTRY.md) |
| Timestamp | ✅ | $TS |

EOF
