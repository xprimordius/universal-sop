#!/usr/bin/env bash
# no_reduction_guard.sh — GUARD A of the discipline layer
# v2 (HARDENED 2026-06-03, mac-main) — closes F1 + F2 found by the Master Pass audit.
# v1 backed up at cache/backups/no_reduction_guard.sh_v1_*_pre-hardening_backup.sh
#
# "BUILD, NEVER REDUCE." Blocks a commit that removes meaningful CONTENT from a
# protected working file unless THIS commit also stages a backup whose content
# exactly matches the pre-change (HEAD) version.
#
# v1 holes this fixes:
#   F2 — v1 compared only non-blank LINE COUNTS, so gut-and-refill (replace real
#        content with junk, same count) passed. v2 uses SET DIFFERENCE: how many of
#        HEAD's actual content lines DISAPPEARED — count-preserving swaps are caught.
#   F1 — v1 accepted ANY backup matching the filename anywhere (even a 1999 file).
#        v2 requires a backup STAGED IN THIS COMMIT whose sha256 == sha256(HEAD:file),
#        proving this exact prior state is preserved here, now.
#
# Exit 0 = pass. Exit 1 = block.

set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "not a git repo"; exit 0; }
cd "$ROOT"
# shellcheck source=/dev/null
source scripts/protected_paths.sh

REMOVAL_PCT_THRESHOLD=10   # block if >10% of HEAD's content lines disappear w/o a matched backup

sha256() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum | awk '{print $1}'
  else shasum -a 256 | awk '{print $1}'; fi
}

# normalized content lines (trim trailing ws, drop blank lines), as a sorted unique set
content_set() { sed 's/[[:space:]]*$//' | grep -vE '^[[:space:]]*$' | sort -u; }

# Does THIS commit stage a backup file whose content == HEAD version of $1?
staged_backup_matches() {
  local target="$1" want b bsha
  want=$(git show "HEAD:$target" 2>/dev/null | sha256)
  while IFS= read -r b; do
    [ -z "$b" ] && continue
    case "$b" in backups/*|cache/backups/*) ;; *) continue ;; esac
    bsha=$(git show ":$b" 2>/dev/null | sha256)
    [ "$bsha" = "$want" ] && return 0
  done < <(git diff --cached --name-only --diff-filter=ACMR 2>/dev/null)
  return 1
}

VIOLATIONS=0
REPORT=""

while IFS= read -r f; do
  [ -z "$f" ] && continue
  is_protected "$f" || continue
  git cat-file -e "HEAD:$f" 2>/dev/null || continue   # only existing files can lose content

  oldset=$(git show "HEAD:$f" 2>/dev/null | content_set)
  newset=$(git show ":$f"    2>/dev/null | content_set)
  old_count=$(printf '%s\n' "$oldset" | grep -cve '^$'); old_count=${old_count:-0}
  [ "$old_count" -eq 0 ] && continue

  # lines present in HEAD but GONE from the staged version (true content loss, count-independent)
  removed=$(comm -23 <(printf '%s\n' "$oldset") <(printf '%s\n' "$newset") | grep -cve '^$'); removed=${removed:-0}
  pct=$(( removed * 100 / old_count ))

  if [ "$pct" -gt "$REMOVAL_PCT_THRESHOLD" ]; then
    if staged_backup_matches "$f"; then
      REPORT+="  ⚠️  $f — ${pct}% of content lines removed (${removed}/${old_count}) — matched backup STAGED this commit, ALLOWED\n"
    else
      REPORT+="  ❌ $f — ${pct}% of HEAD content lines REMOVED (${removed}/${old_count}) with NO content-matched backup staged in this commit\n"
      VIOLATIONS=$((VIOLATIONS+1))
    fi
  fi
done < <(git diff --cached --name-only --diff-filter=ACMR 2>/dev/null)

if [ "$VIOLATIONS" -gt 0 ]; then
  echo "🛑 NO-REDUCTION GUARD (Guard A v2) — BLOCKED"
  echo "================================================"
  printf "%b" "$REPORT"
  echo ""
  echo "BUILD, NEVER REDUCE. Meaningful content left a protected file with no proof the"
  echo "prior state is preserved IN THIS COMMIT."
  echo "Fix one of:"
  echo "  • Stage a content-exact backup in THIS commit:"
  echo "      git show HEAD:<file> > backups/<name>_v<n>_$(date +%Y%m%d_%H%M)_<device>_<reason>_backup.<ext>"
  echo "      git add backups/<that file>"
  echo "    (its sha256 must equal HEAD's version of <file> — a stale/old backup will NOT satisfy v2)"
  echo "  • If the removal is wrong (you compacted working content) — restore it."
  echo "  • Emergency override (untraceable locally — declare an HFR in the commit msg):  git commit --no-verify"
  echo "================================================"
  exit 1
fi

[ -n "$REPORT" ] && { echo "🛡️ Guard A v2 (No-Reduction): content removed but content-matched backup staged —"; printf "%b" "$REPORT"; }
echo "✅ Guard A v2 (No-Reduction): no protected content removed without a staged content-matched backup."
exit 0
