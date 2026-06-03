#!/usr/bin/env bash
# checklist_gate.sh — GUARD B of the discipline layer
# v2 (HARDENED 2026-06-03, mac-main) — closes F3 + addresses F4 from the Master Pass audit.
# v1 backed up at cache/backups/checklist_gate.sh_v1_*_pre-hardening_backup.sh
#
# Makes Prime Stage 1 mechanical: no commit may change protected working content unless a
# CONFIRMED checklist (PER) for today BINDS to those exact files.
#
# v1 holes this fixes:
#   F3 — v1 passed if ANY confirmed PER existed today, with no link to the staged files.
#        v2 requires EACH staged protected file to be NAMED in a confirmed PER for today.
#   F4 — v1 treated AI-typed "CONFIRMED" as mechanical user-confirmation. It isn't.
#        v2 requires a non-placeholder `CONFIRMED_BY:` line (human attribution) AND states
#        honestly: a LOCAL pre-commit hook cannot prove a human said 💠 — it enforces a
#        BOUND, RECORDED, ATTRIBUTED checklist. The human-in-the-loop provides the actual
#        confirmation. This is Tier 🥈.5 (bound artifact), not pretend-Tier-🥇.
#
# Exit 0 = pass. Exit 1 = block.

set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "not a git repo"; exit 0; }
cd "$ROOT"
# shellcheck source=/dev/null
source scripts/protected_paths.sh

PROT="$(staged_protected)"
if [ -z "$PROT" ]; then
  echo "✅ Guard B v2 (Checklist Gate): no protected working content staged — gate N/A."
  exit 0
fi

TODAY=$(date +%Y%m%d)
YDAY=$(date -v-1d +%Y%m%d 2>/dev/null || date -d "yesterday" +%Y%m%d 2>/dev/null || echo "$TODAY")

# A PER "qualifies" if: STATUS: CONFIRMED  AND  a non-placeholder CONFIRMED_BY: line.
qualifying_pers() {
  local d p by
  for d in "$TODAY" "$YDAY"; do
    for p in cache/prompt_records/PER_*"$d"*.md; do
      [ -f "$p" ] || continue
      grep -qE "^STATUS: CONFIRMED" "$p" || continue
      by=$(grep -E "^CONFIRMED_BY:" "$p" | head -1 | sed 's/^CONFIRMED_BY:[[:space:]]*//')
      # reject empty or placeholder attribution
      case "$by" in ""|"<"*|"TODO"*|"TBD"*) continue ;; esac
      echo "$p"
    done
  done
}

# Portable array build (avoid bash-4 mapfile — macOS ships bash 3.2)
QPERS=()
while IFS= read -r _line; do [ -n "$_line" ] && QPERS+=("$_line"); done < <(qualifying_pers)
if [ "${#QPERS[@]}" -eq 0 ]; then
  echo "🛑 CHECKLIST GATE (Guard B v2) — BLOCKED: no qualifying CONFIRMED PER (need STATUS: CONFIRMED + CONFIRMED_BY:)"
  echo "Staged protected files:"; echo "$PROT" | sed 's/^/   • /'
  echo "Create/confirm a PER for today with a real CONFIRMED_BY: line, listing these files."
  exit 1
fi

# Each staged protected file must be NAMED in at least one qualifying PER.
UNBOUND=""
while IFS= read -r f; do
  [ -z "$f" ] && continue
  found=0
  for p in "${QPERS[@]}"; do
    if grep -qF -- "$f" "$p"; then found=1; break; fi
  done
  [ "$found" -eq 0 ] && UNBOUND+="   • $f"$'\n'
done <<< "$PROT"

if [ -n "$UNBOUND" ]; then
  echo "🛑 CHECKLIST GATE (Guard B v2) — BLOCKED"
  echo "================================================"
  echo "These staged protected files are NOT bound to any CONFIRMED checklist for today:"
  printf "%s" "$UNBOUND"
  echo ""
  echo "Prime Stage 1 (GROUND ZERO): relay the UNDERSTANDING CHECK, get the user's 💠, then"
  echo "record it in a PER that LISTS these files + has 'STATUS: CONFIRMED' and 'CONFIRMED_BY: <who>'."
  echo "(Qualifying PERs today: ${QPERS[*]})"
  echo ""
  echo "Honest note: a local hook cannot prove a human said 💠 — it enforces a BOUND, RECORDED,"
  echo "ATTRIBUTED checklist. The human in the loop is the real confirmation. Don't self-confirm."
  echo "  Emergency override (untraceable locally — declare HFR in commit msg):  git commit --no-verify"
  echo "================================================"
  exit 1
fi

echo "✅ Guard B v2 (Checklist Gate): all staged protected files bound to a CONFIRMED+ATTRIBUTED PER —"
printf '   %s\n' "${QPERS[@]}"
exit 0
