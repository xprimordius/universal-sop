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
BRANCH=$(git branch --show-current)

echo "================================================"
echo "🚀 SAFE PUSH — Multi-Device Coordination Wrapper"
echo "================================================"
echo "Branch: $BRANCH"
echo "Device: $(git config user.name) <$(git config user.email)>"
echo ""

# --- Optional: stage + commit if message provided ---
if [[ -n "$COMMIT_MSG" ]]; then
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "📝 Staging + committing local changes..."
    git add -A
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
