#!/usr/bin/env bash
# 📓 MIRROR OBSIDIAN — Cross-Device Config Sync Hygiene (Sprint 1 Item D)
# Per Aurelius mirror_obsidian.py pattern | LEARNINGS_FROM_AURELIUS_VAULT v2.0 Section 1F + 4E
# Adopted 2026-05-25 on aurelion. Closes F.51 (.obsidian/ raw-committed → cross-device conflicts).
#
# THE PROBLEM (F.51):
#   .obsidian/ contains BOTH shared config (app.json, appearance.json — same across devices)
#   AND per-device state (workspace.json, cache, plugins/*/data.json — different per machine).
#   Committing the raw folder = inevitable merge conflicts on workspace.json between devices.
#
# THE FIX (this script):
#   1. Maintain a SHARED-ONLY mirror at cache/obsidian-config/ (committed, source of truth).
#   2. Use .gitignore to keep per-device noise out of git (already done; see .gitignore F.31 block).
#   3. Three workflows:
#        --mirror    Copy shared parts of live .obsidian/ → cache/obsidian-config/  (canonicalize)
#        --verify    Diff live .obsidian/ vs mirror; report OK or DRIFT (audit)
#        --restore   Copy mirror → live .obsidian/  (fresh-device setup)
#
# SHARED files (mirrored): app.json, appearance.json, core-plugins.json, community-plugins.json,
#   plugins/<plugin>/main.js, plugins/<plugin>/manifest.json, plugins/<plugin>/styles.css
#
# PER-DEVICE files (excluded): workspace*.json, cache, graph.json, hotkeys.json,
#   plugins/<plugin>/data.json, snippets/, .trash/
#
# Usage:
#   bash scripts/mirror_obsidian.sh --mirror     # snapshot live → cache/obsidian-config/
#   bash scripts/mirror_obsidian.sh --verify     # detect drift between live and mirror
#   bash scripts/mirror_obsidian.sh --restore    # populate live from mirror (fresh device)
#   bash scripts/mirror_obsidian.sh              # default: --verify (audit only)
#
# Exit codes: 0 if action succeeded / OK; 1 if drift detected or action failed.

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

LIVE=".obsidian"
MIRROR="cache/obsidian-config"
MODE="${1:---verify}"

# Files that ARE shared (whitelist — anything not on this list is treated as per-device)
SHARED_TOP_FILES=("app.json" "appearance.json" "core-plugins.json" "community-plugins.json")
SHARED_PLUGIN_FILES=("main.js" "manifest.json" "styles.css")  # NEVER data.json (per-device state)

DEVICE="$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"

if [ ! -d "$LIVE" ] && [ "$MODE" != "--restore" ]; then
  echo "❌ $LIVE not present — not an Obsidian vault on this device."
  echo "   To bootstrap one from mirror: bash scripts/mirror_obsidian.sh --restore"
  exit 1
fi

mkdir -p "$MIRROR"

# Helper: list shared files actually present in the live .obsidian/
list_shared_in_live() {
  local f
  for f in "${SHARED_TOP_FILES[@]}"; do
    [ -f "$LIVE/$f" ] && echo "$f"
  done
  if [ -d "$LIVE/plugins" ]; then
    local plugin_dir plugin_name shared_f
    for plugin_dir in "$LIVE"/plugins/*/; do
      [ -d "$plugin_dir" ] || continue
      plugin_name=$(basename "$plugin_dir")
      for shared_f in "${SHARED_PLUGIN_FILES[@]}"; do
        [ -f "$plugin_dir$shared_f" ] && echo "plugins/$plugin_name/$shared_f"
      done
    done
  fi
}

# Helper: list shared files present in the mirror
list_shared_in_mirror() {
  local f
  for f in "${SHARED_TOP_FILES[@]}"; do
    [ -f "$MIRROR/$f" ] && echo "$f"
  done
  if [ -d "$MIRROR/plugins" ]; then
    local plugin_dir plugin_name shared_f
    for plugin_dir in "$MIRROR"/plugins/*/; do
      [ -d "$plugin_dir" ] || continue
      plugin_name=$(basename "$plugin_dir")
      for shared_f in "${SHARED_PLUGIN_FILES[@]}"; do
        [ -f "$plugin_dir$shared_f" ] && echo "plugins/$plugin_name/$shared_f"
      done
    done
  fi
}

# ─────────────────────────────────────────────────────────────────
# --mirror: live → mirror
# ─────────────────────────────────────────────────────────────────
do_mirror() {
  local count=0
  echo "📓 MIRROR — Live $LIVE → $MIRROR"
  echo "================================================"
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    mkdir -p "$MIRROR/$(dirname "$f")"
    cp -p "$LIVE/$f" "$MIRROR/$f"
    echo "  → $f"
    count=$((count+1))
  done < <(list_shared_in_live)
  echo "================================================"
  echo "✅ Mirrored $count shared file(s) on $DEVICE @ $(date +'%Y-%m-%d %H:%M %Z')"
  echo ""
  echo "Next steps:"
  echo "  1. Review git diff $MIRROR/"
  echo "  2. Commit: git add $MIRROR/ && git commit -m \"[$DEVICE | TS] obsidian config snapshot\""
  echo "  3. Push to share across devices."
}

# ─────────────────────────────────────────────────────────────────
# --verify: diff live vs mirror, report OK or DRIFT
# ─────────────────────────────────────────────────────────────────
do_verify() {
  echo "📓 VERIFY — $LIVE  vs  $MIRROR"
  echo "================================================"
  local drift=0
  local checked=0
  local only_in_live=0
  local only_in_mirror=0

  # Files in live but not mirror, or differing
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    checked=$((checked+1))
    if [ ! -f "$MIRROR/$f" ]; then
      echo "  [+ live]  $f  (in live, not yet mirrored)"
      only_in_live=$((only_in_live+1))
      drift=$((drift+1))
    elif ! cmp -s "$LIVE/$f" "$MIRROR/$f"; then
      echo "  [DIFF]    $f"
      drift=$((drift+1))
    fi
  done < <(list_shared_in_live)

  # Files in mirror but not live (fresh-device case — would be restored)
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    if [ ! -f "$LIVE/$f" ]; then
      echo "  [+ mirror] $f  (in mirror, not yet restored to live)"
      only_in_mirror=$((only_in_mirror+1))
      drift=$((drift+1))
    fi
  done < <(list_shared_in_mirror)

  echo "================================================"
  if [ "$drift" -eq 0 ]; then
    echo "✅ OK — $checked shared file(s) match between $LIVE/ and $MIRROR/."
    echo "   $DEVICE config is consistent with the shared mirror."
    return 0
  fi
  echo "⚠️ DRIFT detected: $drift difference(s) ($only_in_live live-only, $only_in_mirror mirror-only, $((drift - only_in_live - only_in_mirror)) content-differ)"
  echo ""
  echo "Resolution:"
  echo "  • If live is canonical → bash scripts/mirror_obsidian.sh --mirror, then commit"
  echo "  • If mirror is canonical → bash scripts/mirror_obsidian.sh --restore, then verify clean"
  echo "  • Inspect: diff -u $MIRROR/<file> $LIVE/<file>"
  return 1
}

# ─────────────────────────────────────────────────────────────────
# --restore: mirror → live (fresh-device setup)
# ─────────────────────────────────────────────────────────────────
do_restore() {
  if [ ! -d "$MIRROR" ] || [ -z "$(ls -A "$MIRROR" 2>/dev/null)" ]; then
    echo "❌ $MIRROR is missing or empty — nothing to restore."
    echo "   Run --mirror on a device that has shared config first, then push."
    return 1
  fi
  echo "📓 RESTORE — $MIRROR → $LIVE"
  echo "================================================"
  mkdir -p "$LIVE"
  local count=0
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    mkdir -p "$LIVE/$(dirname "$f")"
    if [ -f "$LIVE/$f" ] && ! cmp -s "$MIRROR/$f" "$LIVE/$f"; then
      # Live exists and differs — back it up before clobbering
      mkdir -p "$LIVE/.pre-restore-backup"
      cp -p "$LIVE/$f" "$LIVE/.pre-restore-backup/$(echo "$f" | tr '/' '_').$(date +%s)"
      echo "  (backed up existing $LIVE/$f → .pre-restore-backup/)"
    fi
    cp -p "$MIRROR/$f" "$LIVE/$f"
    echo "  → $f"
    count=$((count+1))
  done < <(list_shared_in_mirror)
  echo "================================================"
  echo "✅ Restored $count shared file(s) to $LIVE/ on $DEVICE."
  echo ""
  echo "Note: per-device files (workspace.json, plugins/*/data.json, etc.) are NOT restored —"
  echo "      Obsidian will generate fresh ones on first launch."
}

# ─────────────────────────────────────────────────────────────────
# Dispatch
# ─────────────────────────────────────────────────────────────────
case "$MODE" in
  --mirror)  do_mirror; exit 0 ;;
  --verify)  do_verify; exit $? ;;
  --restore) do_restore; exit $? ;;
  -h|--help)
    echo "Usage: bash scripts/mirror_obsidian.sh [--mirror|--verify|--restore]"
    echo ""
    echo "  --mirror   Snapshot shared parts of live .obsidian/ → $MIRROR/"
    echo "  --verify   Detect drift between live and mirror (default; safe audit)"
    echo "  --restore  Populate live .obsidian/ from $MIRROR/ (fresh-device setup)"
    exit 0 ;;
  *)
    echo "❌ Unknown mode: $MODE"
    echo "Usage: bash scripts/mirror_obsidian.sh [--mirror|--verify|--restore]"
    exit 2 ;;
esac
