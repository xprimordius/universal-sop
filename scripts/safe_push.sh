#!/usr/bin/env bash
# safe_push.sh — Multi-device push wrapper
# F.18 fix 2026-05-21 | Per Alan: "optimized for multi device pull and push live"
#
# Solves the common case: another device pushed while you worked, so plain
# `git push` rejects with "non-fast-forward". This wrapper:
#   1. Fetches origin
#   2. Rebases your local commits on top of origin/main (no merge bubble)
#   3. Pushes the rebased result
#
# If the rebase hits a conflict (overlapping edits to the same line), bails out
# cleanly and tells you what to do manually. No silent damage.
#
# Usage:
#   bash scripts/safe_push.sh
#   bash scripts/safe_push.sh "commit message"     # also stages + commits all changes first
#
# Exit codes:
#   0 = pushed successfully
#   1 = pre-flight or push failure (no state changed)
#   2 = rebase conflict (manual resolution required)

set -u

PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
if [[ -z "$PROJECT_ROOT" ]]; then
  echo "❌ Not inside a git repo."
  exit 1
fi
cd "$PROJECT_ROOT"

COMMIT_MSG="${1:-}"
shift || true
EXPLICIT_PATHS=("$@")   # optional: paths to stage. If empty, falls back to add -A (guarded).
BRANCH=$(git branch --show-current)

# GitHub hard-rejects files >100MB; warn at 50MB. F.61 fix — a 168MB mp4 + unrelated
# research/ work got swept into a brief commit by a blind `git add -A`.
LARGE_FILE_MB=50

echo "================================================"
echo "🚀 SAFE PUSH — Multi-Device Coordination Wrapper"
echo "================================================"
echo "Branch: $BRANCH"
echo "Device: $(git config user.name) <$(git config user.email)>"
echo ""

# --- Large-file guard (runs regardless of staging mode) ---
guard_large_files() {
  local scope_desc="$1"; shift
  local big
  # List candidate files (respect explicit paths if given, else all changes incl. untracked)
  if [[ ${#EXPLICIT_PATHS[@]} -gt 0 ]]; then
    big=$(find "${EXPLICIT_PATHS[@]}" -type f -size +${LARGE_FILE_MB}M 2>/dev/null)
  else
    # all tracked-modified + untracked, excluding ignored
    big=$(git status --porcelain --untracked-files=all | sed 's/^...//' | while read -r f; do
      [[ -f "$f" ]] && [[ $(find "$f" -size +${LARGE_FILE_MB}M 2>/dev/null) ]] && echo "$f"
    done)
  fi
  if [[ -n "$big" ]]; then
    echo "🚨 LARGE FILE GUARD — files over ${LARGE_FILE_MB}MB detected ($scope_desc):"
    echo "$big" | while read -r f; do
      [[ -n "$f" ]] && echo "   - $f ($(du -h "$f" 2>/dev/null | cut -f1))"
    done
    echo ""
    echo "   GitHub rejects files >100MB. These would wedge the push."
    echo "   Fix one of:"
    echo "     • Add to .gitignore if they shouldn't be tracked"
    echo "     • Stage ONLY intended files: bash scripts/safe_push.sh \"msg\" file1 file2"
    echo "     • Use git-lfs for large media"
    echo "   Aborting — nothing staged."
    exit 1
  fi
}

# --- Optional: stage + commit if message provided ---
if [[ -n "$COMMIT_MSG" ]]; then
  if [[ -n "$(git status --porcelain)" ]]; then
    guard_large_files "pre-stage scan"
    if [[ ${#EXPLICIT_PATHS[@]} -gt 0 ]]; then
      echo "📝 Staging ONLY specified paths:"
      printf '   + %s\n' "${EXPLICIT_PATHS[@]}"
      git add -- "${EXPLICIT_PATHS[@]}"
    else
      echo "📝 No paths given — staging ALL changes (git add -A)."
      echo "   Files that will be committed:"
      git add -A
      git diff --cached --name-only | sed 's/^/   + /'
      # Safety: warn if a suspiciously large number of files are staged
      STAGED_COUNT=$(git diff --cached --name-only | wc -l | tr -d ' ')
      if [[ "$STAGED_COUNT" -gt 30 ]]; then
        echo ""
        echo "   ⚠️  $STAGED_COUNT files staged — that's a lot. If unintended, Ctrl-C now."
        echo "      (To scope: git reset, then bash scripts/safe_push.sh \"msg\" <paths>)"
      fi
    fi
    echo ""
    if ! git commit -m "$COMMIT_MSG"; then
      echo "❌ Commit failed (likely pre-commit hook). Fix and re-run."
      exit 1
    fi
    echo ""
  else
    echo "ℹ️  No local changes to commit. Proceeding to sync + push."
    echo ""
  fi
fi

# --- Step 1: Fetch ---
echo "📡 Fetching origin..."
if ! git fetch origin "$BRANCH"; then
  echo "❌ Fetch failed. Network or auth issue."
  exit 1
fi
echo ""

# --- Step 2: Check divergence ---
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse "origin/$BRANCH")
BASE=$(git merge-base HEAD "origin/$BRANCH")

if [[ "$LOCAL" == "$REMOTE" ]]; then
  echo "✅ Already up to date with origin/$BRANCH. Nothing to push."
  exit 0
fi

if [[ "$LOCAL" == "$BASE" ]]; then
  echo "ℹ️  Local is BEHIND origin/$BRANCH only — fast-forward pull, no push needed."
  git pull --ff-only origin "$BRANCH"
  exit 0
fi

if [[ "$REMOTE" == "$BASE" ]]; then
  echo "✅ Remote unchanged. Local is ahead — straight push."
  if git push origin "$BRANCH"; then
    echo ""
    echo "✅ Pushed cleanly. No rebase needed."
    exit 0
  else
    echo "❌ Push failed despite remote being unchanged. Check network/auth."
    exit 1
  fi
fi

# --- Step 3: DIVERGED — rebase ---
echo "🔀 DIVERGED: local has commits + remote has new commits."
echo "    Local commits since fork: $(git rev-list --count "$BASE..HEAD")"
echo "    Remote commits since fork: $(git rev-list --count "$BASE..origin/$BRANCH")"
echo ""
echo "    Action: rebasing local commits on top of origin/$BRANCH..."
echo ""

# Make sure working tree is clean before rebase
if [[ -n "$(git status --porcelain)" ]]; then
  echo "❌ Working tree has uncommitted changes. Commit or stash first."
  echo "   Run again with a message: bash scripts/safe_push.sh \"your message\""
  exit 1
fi

if git rebase "origin/$BRANCH"; then
  echo ""
  echo "✅ Rebase clean. Pushing..."
  if git push origin "$BRANCH"; then
    echo ""
    echo "✅ Pushed successfully after rebase."
    echo "   Tip: history is linear (no merge bubble)."
    exit 0
  else
    echo "❌ Push failed AFTER successful rebase — race condition (another device pushed in the last few seconds)."
    echo "   Re-run: bash scripts/safe_push.sh"
    exit 1
  fi
fi

# --- Rebase conflict ---
echo ""
echo "🚨 REBASE CONFLICT — manual resolution required."
echo ""
echo "Files with conflicts:"
git diff --name-only --diff-filter=U | sed 's/^/   - /'
echo ""
echo "Resolve with one of these:"
echo ""
echo "  Option A (resolve manually):"
echo "    1. Edit the conflicted files (look for <<<<<<< markers)"
echo "    2. git add <files>"
echo "    3. git rebase --continue"
echo "    4. git push"
echo ""
echo "  Option B (abort the rebase):"
echo "    git rebase --abort"
echo "    # then manually pull and merge instead"
echo ""
echo "  Option C (give up your local commits — DESTRUCTIVE):"
echo "    git rebase --abort"
echo "    git reset --hard origin/$BRANCH"
echo "    # only if you don't care about your work"
echo ""
exit 2
