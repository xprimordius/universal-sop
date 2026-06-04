#!/usr/bin/env bash
# door_scan.sh — the Door Scan navigator (DOOR_SCAN.md mechanism)
# NEW 2026-06-03 (mac-main).
#   bash scripts/door_scan.sh            → scan the hallway (door + brief only — cheap)
#   bash scripts/door_scan.sh <door>     → locate one door: brief + deep cache path + when to open
# Scan first, open second (DS.4). Then Read the deep cache before you assert (DS.3).

set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; cd "$ROOT"
INDEX="cache/DOOR_INDEX.md"
[ -f "$INDEX" ] || { echo "❌ hallway missing: $INDEX"; exit 1; }

# table rows look like:  | `door` | brief | deep cache | when |
rows() { grep -E '^\| `[a-zA-Z0-9_]+` \|' "$INDEX"; }
field() { awk -F'|' -v n="$1" '{gsub(/^[ \t]+|[ \t]+$/,"",$n); print $n}'; }
keyof() { field 2 | tr -d '`' | tr -d ' '; }

if [ $# -eq 0 ]; then
  echo "🚪 DOOR SCAN — the hallway ($(rows | wc -l | tr -d ' ') doors). Open one: bash scripts/door_scan.sh <door>"
  echo "================================================"
  rows | while IFS= read -r r; do
    k=$(printf '%s\n' "$r" | keyof)
    b=$(printf '%s\n' "$r" | field 3)
    printf "  🚪 %-12s %s\n" "$k" "$b"
  done
  echo "================================================"
  echo "DS.3: never assert a detail you haven't opened the door for. The hallway points; you must still Read."
  exit 0
fi

want="$1"
match="$(rows | while IFS= read -r r; do k=$(printf '%s\n' "$r" | keyof); [ "$k" = "$want" ] && printf '%s\n' "$r"; done)"
if [ -z "$match" ]; then
  echo "❌ no door named '$want'. Available doors:"
  rows | while IFS= read -r r; do printf '   %s\n' "$(printf '%s\n' "$r" | keyof)"; done
  exit 1
fi

brief=$(printf '%s\n' "$match" | field 3)
cache=$(printf '%s\n' "$match" | field 4)
when=$(printf '%s\n' "$match" | field 5)
# extract a bare path (strip backticks + any "· Lxx" range note for the open hint)
path=$(printf '%s\n' "$cache" | sed 's/`//g' | sed 's/ ·.*//; s/ +.*//' | awk '{print $1}')

echo "🚪 DOOR: $want"
echo "  📋 Brief:      $brief"
echo "  💾 Deep cache: $cache"
echo "  🔓 When:       $when"
echo ""
echo "  → OPEN IT:  Read $path   (then assert only from what you read — DS.3)"
exit 0
