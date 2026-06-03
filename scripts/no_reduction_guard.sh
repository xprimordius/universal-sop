#!/usr/bin/env bash
# no_reduction_guard.sh — GUARD A of the discipline layer (2026-06-03, mac-main)
# "BUILD, NEVER REDUCE." Blocks a commit that SHRINKS a protected working file
# unless a versioned backup of that file exists. Mechanically prevents the
# compaction-of-working-content failure ("you destroyed the SOP").
#
# Rule: for each staged protected file that already exists in HEAD, if the staged
# version has fewer non-blank lines than HEAD (net reduction beyond 5% noise),
# a backup matching the file's basename MUST exist in backups/ or cache/backups/.
# No backup + reduction => BLOCK.
#
# Exit 0 = pass. Exit 1 = block.

set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "not a git repo"; exit 0; }
cd "$ROOT"
# shellcheck source=/dev/null
source scripts/protected_paths.sh

VIOLATIONS=0
REPORT=""

nonblank() { grep -cve '^[[:space:]]*$' 2>/dev/null; }

has_backup() {
  # $1 = basename without extension; search backups/ + cache/backups/ for a matching *backup*
  local stem="$1"
  { ls backups/ 2>/dev/null; ls cache/backups/ 2>/dev/null; } \
    | grep -iqE "${stem}.*backup|${stem}_v[0-9]"
}

while IFS= read -r f; do
  [ -z "$f" ] && continue
  is_protected "$f" || continue
  # Only files that already exist in HEAD can be "reduced"
  git cat-file -e "HEAD:$f" 2>/dev/null || continue

  old=$(git show "HEAD:$f" 2>/dev/null | nonblank); old=${old:-0}
  # staged content:
  new=$(git show ":$f" 2>/dev/null | nonblank); new=${new:-0}

  # net reduction beyond 5% noise threshold
  threshold=$(( old * 95 / 100 ))
  if [ "$new" -lt "$threshold" ] && [ "$old" -gt 0 ]; then
    base=$(basename "$f"); stem="${base%.*}"
    if has_backup "$stem"; then
      REPORT+="  ⚠️  $f shrank ${old}->${new} non-blank lines — backup found, ALLOWED (build-not-reduce: backup exists)\n"
    else
      REPORT+="  ❌ $f shrank ${old}->${new} non-blank lines with NO versioned backup\n"
      VIOLATIONS=$((VIOLATIONS+1))
    fi
  fi
done < <(git diff --cached --name-only --diff-filter=ACMR 2>/dev/null)

if [ "$VIOLATIONS" -gt 0 ]; then
  echo "🛑 NO-REDUCTION GUARD (Guard A) — BLOCKED"
  echo "================================================"
  printf "%b" "$REPORT"
  echo ""
  echo "BUILD, NEVER REDUCE. A protected working file lost content with no backup."
  echo "Fix one of:"
  echo "  • Back it up first:  cp <file> backups/<name>_v<n>_$(date +%Y%m%d_%H%M)_<device>_<reason>_backup.<ext>"
  echo "  • If the reduction is wrong (you compacted working content) — restore it."
  echo "  • Intentional + backed up — re-run; the guard allows it once a backup exists."
  echo "  • Emergency override (discouraged, audited):  git commit --no-verify"
  echo "================================================"
  exit 1
fi

[ -n "$REPORT" ] && { echo "🛡️ Guard A (No-Reduction): reductions present but backed up —"; printf "%b" "$REPORT"; }
echo "✅ Guard A (No-Reduction): no naked reductions of protected files."
exit 0
