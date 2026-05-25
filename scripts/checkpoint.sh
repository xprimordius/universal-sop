#!/usr/bin/env bash
# 📸 CHECKPOINT — Automated Session Snapshot (Sprint 2 Item E)
# Per Aurelius checkpoint.py pattern | LEARNINGS_FROM_AURELIUS_VAULT v2.0 Section 4F
# Adopted 2026-05-25 on aurelion. Closes F.52 (no LATEST.md pointer = manual handoff search).
#
# Auto-generates cache/checkpoints/<TS>_<device>.md capturing the moment, plus updates
# cache/LATEST.md as the always-current pointer. Use at session checkpoints or before
# ending a session — replaces manual CONTINUATION.md handoff writes.
#
# Captures:
#   1. Latest commit (SHA, subject, body excerpt)
#   2. Git state (clean/dirty, total commits, branch sync distance)
#   3. E2E pass/fail snapshot (last summary line)
#   4. Pulse Check pass/fail snapshot
#   5. Backup status block (5-layer redundancy)
#   6. Recently modified files (last 24h, top 10)
#   7. Resume prompt — paste-ready for the next session
#
# Usage:
#   bash scripts/checkpoint.sh                    # write checkpoint + update LATEST.md
#   bash scripts/checkpoint.sh --note "summary"   # add a one-line note to the checkpoint
#   bash scripts/checkpoint.sh --dry-run          # preview output without writing
#
# Exit: 0 on success; 1 if can't write to cache/.

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

NOTE=""
DRY_RUN=0
while [ $# -gt 0 ]; do
  case "$1" in
    --note) NOTE="$2"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help)
      echo "Usage: bash scripts/checkpoint.sh [--note \"summary\"] [--dry-run]"
      exit 0 ;;
    *) shift ;;
  esac
done

DEVICE="$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
TS_FILE=$(date +"%Y-%m-%d_%H%M%S")
COMMIT_SHA="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"
COMMIT_FULL="$(git rev-parse HEAD 2>/dev/null || echo 'unknown')"
COMMIT_SUBJECT="$(git log -1 --format=%s 2>/dev/null || echo '(no commits)')"
COMMIT_BODY="$(git log -1 --format=%b 2>/dev/null | head -c 600)"
TOTAL_COMMITS=$(git rev-list --count HEAD 2>/dev/null || echo 0)
BRANCH=$(git branch --show-current 2>/dev/null || echo "(detached)")

# Dirty state
DIRTY_RAW=$(git status --porcelain 2>/dev/null)
if [ -z "$DIRTY_RAW" ]; then
  DIRTY="clean"
  DIRTY_DETAIL=""
else
  DIRTY_COUNT=$(echo "$DIRTY_RAW" | wc -l)
  DIRTY="$DIRTY_COUNT uncommitted"
  DIRTY_DETAIL=$(echo "$DIRTY_RAW" | head -5 | sed 's/^/    /')
fi

# Sync distance
DISTANCE=$(git rev-list --left-right --count "HEAD...origin/$BRANCH" 2>/dev/null || echo "?/?")

# E2E summary (run quickly if possible — use last 4 lines)
E2E_FULL=$(timeout 90 bash scripts/e2e_verify.sh 2>&1)
# Grab the FINAL aggregate verdict (last line with "VERDICT:"; per-check VERDICTs come first)
E2E_VERDICT=$(echo "$E2E_FULL" | grep -E "VERDICT:" | tail -1)
E2E_PASSED=$(echo "$E2E_FULL" | grep -oE "Passed: +[0-9]+ / [0-9]+" | tail -1)
[ -z "$E2E_VERDICT" ] && E2E_VERDICT="(not run — script unavailable or timed out)"
[ -n "$E2E_PASSED" ] && E2E_VERDICT="$E2E_VERDICT ($E2E_PASSED)"

# Pulse summary
PULSE_OUTPUT=$(bash scripts/pulse_check.sh --quiet 2>&1; echo "EXIT:$?")
PULSE_EXIT=$(echo "$PULSE_OUTPUT" | grep -oE "EXIT:[0-9]+" | cut -d: -f2)
PULSE_SUMMARY=$(bash scripts/pulse_check.sh 2>&1 | grep -E "^Summary:" | head -1)
[ -z "$PULSE_SUMMARY" ] && PULSE_SUMMARY="(pulse_check.sh unavailable)"

# Backup status block
BACKUP_BLOCK=$(bash scripts/backup_status.sh --block 2>&1)
[ -z "$BACKUP_BLOCK" ] && BACKUP_BLOCK="(backup_status.sh unavailable)"

# Recently modified files (last 24h, excluding backups/ and .git)
RECENT_FILES=$(find . -type f -mtime -1 \
  -not -path './backups/*' \
  -not -path './.git/*' \
  -not -path './cache/checkpoints/*' \
  -not -path './node_modules/*' \
  2>/dev/null | head -15 | sed 's|^\./||' | sed 's/^/  - /')

# Last 5 commits (chronological)
RECENT_COMMITS=$(git log --oneline -5 2>/dev/null | sed 's/^/  /')

# Compose the checkpoint
CHECKPOINT_DIR="cache/checkpoints"
CHECKPOINT_FILE="${CHECKPOINT_DIR}/${TS_FILE}_${DEVICE}.md"

CONTENT=$(cat <<MARKDOWN
# 📸 Checkpoint — ${TS_FILE} · ${DEVICE}

**Captured:** ${TS}
**Commit:** ${COMMIT_SHA} on \`${BRANCH}\` · ${TOTAL_COMMITS} total · ${DIRTY}
**Distance from origin:** ${DISTANCE}
${NOTE:+**Note:** ${NOTE}}

---

## 🎯 Latest commit

\`\`\`
${COMMIT_SHA} — ${COMMIT_SUBJECT}
\`\`\`

${COMMIT_BODY:+\`\`\`
${COMMIT_BODY}
\`\`\`}

## 📋 Last 5 commits (chronological)

\`\`\`
${RECENT_COMMITS}
\`\`\`

## 🧪 Verification snapshot

**E2E (\`scripts/e2e_verify.sh\`):**
\`\`\`
${E2E_VERDICT}
\`\`\`

**Pulse Check:** ${PULSE_SUMMARY} (exit ${PULSE_EXIT})

## 📦 Backup-redundancy probe

\`\`\`
${BACKUP_BLOCK}
\`\`\`

## 📂 Recently modified (last 24h, max 15)

${RECENT_FILES:-_(none in last 24h)_}

${DIRTY_DETAIL:+## 🔧 Uncommitted state

\`\`\`
${DIRTY_DETAIL}
\`\`\`}

---

## 🚀 Resume prompt (paste verbatim into a fresh chat)

\`\`\`
I'm picking up the Universal SOP project on ${DEVICE} (or another registered device).
The last checkpoint is at cache/checkpoints/${TS_FILE}_${DEVICE}.md (or read cache/LATEST.md for the pointer).

Bootstrap procedure:
  1. cd \$PROJECT_ROOT && git pull
  2. Run STEP 0.1.1 drift-detector probe table from SESSION_START.md (catch any cached drift)
  3. Read cache/SESSION_STATE.md + cache/CONTINUATION.md + this checkpoint file
  4. Run STEP 2.C "My Understanding" self-restatement in your own words
  5. Run \`bash scripts/e2e_verify.sh\` — should land 9/9 (per F.58 fix)
  6. Run \`bash scripts/backup_status.sh --block\` — confirm 5/5 redundancy

Then await direction. Per SP.24 RAE autonomous-by-default: the queued top-1
action will auto-execute on next \`go\` / \`resolve\` unless redirected.

Last known queue position:
  - Sprint 1 ✅ COMPLETE (Items I + D shipped this session)
  - Sprint 2 ✅ COMPLETE (Items K + L + O + E all shipped 2026-05-25)
  - Next: Sprint 3 (Items F paths.sh + G test harness) OR Sprint 4 (Item H MCP + M PROVE-IT)
  - Or APW course resume (macro goal — paused since session 3, Apr 16)
\`\`\`

---

*Auto-generated by \`scripts/checkpoint.sh\` per Sprint 2 Item E. Closes F.52 (no LATEST.md pointer).*
MARKDOWN
)

if [ "$DRY_RUN" -eq 1 ]; then
  echo "=== DRY RUN — would write to $CHECKPOINT_FILE ==="
  echo "$CONTENT"
  exit 0
fi

mkdir -p "$CHECKPOINT_DIR"
echo "$CONTENT" > "$CHECKPOINT_FILE"

# Update LATEST.md pointer
LATEST_FILE="cache/LATEST.md"
cat > "$LATEST_FILE" <<LATEST
# 🎯 LATEST — Most-Recent Checkpoint Pointer
# Updated automatically by scripts/checkpoint.sh on every run.
# Per Sprint 2 Item E (LEARNINGS Section 4F) — closes F.52 (no LATEST.md pointer).

**Latest checkpoint:** [\`${TS_FILE}_${DEVICE}.md\`](checkpoints/${TS_FILE}_${DEVICE}.md)

**Captured:** ${TS}
**Device:** ${DEVICE}
**Commit:** \`${COMMIT_SHA}\` — ${COMMIT_SUBJECT}
**Dirty:** ${DIRTY}
**Distance from origin:** ${DISTANCE}
${NOTE:+**Note:** ${NOTE}}

---

## 📚 Recent checkpoints (this device)

$(for f in $(ls -t "$CHECKPOINT_DIR"/*"_${DEVICE}.md" 2>/dev/null | head -10); do
    fn=$(basename "$f")
    echo "  - [\`$fn\`](checkpoints/$fn)"
  done)

## 🤖 How to use

\`\`\`
# View latest checkpoint
cat $(echo "checkpoints/${TS_FILE}_${DEVICE}.md")

# Or use this pointer file
cat cache/LATEST.md

# Take a new checkpoint (any device, anytime)
bash scripts/checkpoint.sh --note "session N end — summary"
\`\`\`

---

*This file is the always-current pointer. The checkpoint files themselves are append-only history.*
LATEST

echo "📸 Checkpoint written: $CHECKPOINT_FILE"
echo "🎯 LATEST.md updated: $LATEST_FILE"
echo ""
echo "Summary:"
echo "  Commit: $COMMIT_SHA ($DIRTY)"
echo "  E2E: $E2E_VERDICT"
echo "  Pulse: $PULSE_SUMMARY"
echo ""
echo "To stage and commit:"
echo "  git add cache/checkpoints/$(basename "$CHECKPOINT_FILE") cache/LATEST.md"
echo "  git commit -m \"[$DEVICE | $(date +'%Y-%m-%d %H:%M %Z')] checkpoint — ${NOTE:-session snapshot}\""
