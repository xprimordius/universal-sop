#!/usr/bin/env bash
# ➕ ADD_PROTOCOL — Atomic propagation of a new SubSOP across canonical locations
# Per Q.F.1 / Q.6 (cross-file consistency) | F.22 quintessence audit 2026-05-21
# v2.0 2026-05-25 aurelion: TIERED AUTOMATION (closes Q.6 from "advisory" toward "full")
#
# Usage:
#   bash scripts/add_protocol.sh SP_ID ACRONYM "FULL NAME" "ONE-LINE PURPOSE" [--commit|--dry-run]
#
# Example:
#   bash scripts/add_protocol.sh SP.25 SCA "SOP Completeness Audit" "Every output completeness-checks the SOP" --dry-run
#   bash scripts/add_protocol.sh SP.25 SCA "SOP Completeness Audit" "Every output completeness-checks the SOP" --commit
#
# Default mode: --dry-run (prints what would change without modifying any file).
#
# TIER A — TRUE AUTOMATION (3 files, edit-on --commit, atomic rollback on failure):
#   1. PROTOCOLS_REFERENCE.md      — insert `<details>` block before ENSURANCE section
#   2. MANDATORY_TIGHT_LOOP.md     — append row to Rule 2 table before RULE 3 section
#   3. cache/BOOTSTRAP_CHECK.md    — append row to SubSOP table
#
# TIER B — SNIPPET EMISSION (3 files, prints snippet + location, no auto-edit):
#   4. scripts/validator.sh        — bash heuristic (structural complexity → manual)
#   5. scripts/bootstrap_verify.sh — count bump + grep check (structural → manual)
#   6. SOP_COMPLETE_REFERENCE.html — HTML structure (parser-fragile → manual)
#
# TIER C — JUDGMENT-REQUIRED (printed reminders, no snippet):
#   7. cache/FAILURE_LEDGER.md     — only IF this addition closes an F-class gap
#   8. cache/BACKUP_LOG.md         — auto-managed by backup_before_rewrite.sh
#   9. agents/validator.md         — VL.X row (optional, document if mandatory)
#
# SAFETY (--commit mode):
#   - Each Tier A file backed up via scripts/backup_before_rewrite.sh BEFORE edit.
#   - If any Tier A edit fails → restore ALL from backups (atomic rollback).
#   - --dry-run is the default; --commit must be explicit.

set +e  # F.32 lesson — explicit error handling, not abort-on-first

# Source paths.sh (Sprint 3 Item F — adoption dogfood #2)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/paths.sh" ]; then
  source "$SCRIPT_DIR/paths.sh" > /dev/null 2>&1
fi
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
cd "$PROJECT_ROOT"

# ─────────────────────────────────────────────────────────────────
# Arg parsing
# ─────────────────────────────────────────────────────────────────
SP_ID=""
ACRONYM=""
FULL_NAME=""
PURPOSE=""
MODE="--dry-run"
POSITIONAL=()
for arg in "$@"; do
  case "$arg" in
    --commit) MODE="--commit" ;;
    --dry-run) MODE="--dry-run" ;;
    -h|--help)
      grep "^#" "$0" | head -45
      exit 0 ;;
    *) POSITIONAL+=("$arg") ;;
  esac
done
SP_ID="${POSITIONAL[0]:-}"
ACRONYM="${POSITIONAL[1]:-}"
FULL_NAME="${POSITIONAL[2]:-}"
PURPOSE="${POSITIONAL[3]:-}"

if [ -z "$SP_ID" ] || [ -z "$ACRONYM" ] || [ -z "$FULL_NAME" ] || [ -z "$PURPOSE" ]; then
  echo "Usage: bash scripts/add_protocol.sh SP_ID ACRONYM \"FULL NAME\" \"PURPOSE\" [--commit|--dry-run]"
  echo "  --dry-run (default)  Print intended changes; no files modified"
  echo "  --commit             Perform Tier A edits with atomic-rollback safety"
  exit 1
fi

DEVICE="${DEVICE_NAME:-$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')}"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +%Y%m%d_%H%M%S)
DATE_HUMAN=$(date +"%Y-%m-%d %H:%M %Z")
REASON_SUFFIX="pre_${SP_ID//./_}_${ACRONYM}_addition"

echo "═══════════════════════════════════════════════════════════════"
echo "➕ ADD_PROTOCOL v2.0 — Tiered Atomic Propagation"
echo "═══════════════════════════════════════════════════════════════"
echo "  ID:        $SP_ID"
echo "  Acronym:   $ACRONYM"
echo "  Full Name: $FULL_NAME"
echo "  Purpose:   $PURPOSE"
echo "  Device:    $DEVICE"
echo "  Mode:      $MODE"
echo ""

# ─────────────────────────────────────────────────────────────────
# Pre-check: SP_ID already exists?
# ─────────────────────────────────────────────────────────────────
EXISTING=$(grep -l "\\b${SP_ID}\\b" PROTOCOLS_REFERENCE.md MANDATORY_TIGHT_LOOP.md cache/BOOTSTRAP_CHECK.md 2>/dev/null | head -1)
if [ -n "$EXISTING" ]; then
  echo "⚠️  $SP_ID already mentioned in $EXISTING — ABORT to prevent duplicate entry."
  echo "    Inspect: grep -n '\\b${SP_ID}\\b' PROTOCOLS_REFERENCE.md MANDATORY_TIGHT_LOOP.md cache/BOOTSTRAP_CHECK.md"
  exit 2
fi

# ─────────────────────────────────────────────────────────────────
# Templates — parameterized snippets
# ─────────────────────────────────────────────────────────────────
TIER_A_PROTOCOLS_REF_SNIPPET=$(cat <<EOF

<details>
<summary><b>$SP_ID — ${ACRONYM}: ${FULL_NAME}</b> ⭐ NEW $(date +%Y-%m-%d) (added via add_protocol.sh v2.0)</summary>

### Full Name
${FULL_NAME} — ${ACRONYM}

### Acronym Origin
${ACRONYM} = (fill in once decided)

### Core Purpose
${PURPOSE}

### Scope (Where It Applies)
- (fill in: which output tiers — QUICK / STANDARD / COMPLEX?)
- (fill in: which session phases — bootstrap / mid-output / closing?)

### Sub-Components
- (fill in: numbered clauses C.1, C.2, ... per F.27 doctoral-precision convention)

### When Triggered
- (fill in: per-output? on demand? on specific user phrase?)

### Failure Mode If Skipped
- (fill in: what breaks; reference F-class if known)

### Token Cost
- ~N/M (use N/M if not yet measured — per SP.3 TTE honesty rule)

### Related Protocols
- (fill in: which SubSOPs / Ensurance components interact)

</details>
EOF
)

TIER_A_MTL_ROW="| 12 | **${SP_ID} ${ACRONYM}** ⭐ NEW $(date +%Y-%m-%d) | ${FULL_NAME} | ${PURPOSE} |"
TIER_A_BOOTSTRAP_ROW="| [ ] | ${SP_ID} ⭐ NEW $(date +%Y-%m-%d) | **${ACRONYM}** (${FULL_NAME}) | ${PURPOSE} |"

# ─────────────────────────────────────────────────────────────────
# DRY-RUN mode: just print the plan
# ─────────────────────────────────────────────────────────────────
if [ "$MODE" = "--dry-run" ]; then
  echo "📋 DRY-RUN — files that WOULD change on --commit:"
  echo ""
  echo "── TIER A (3 files, atomic backup + edit + rollback) ──"
  echo ""
  echo "  ① PROTOCOLS_REFERENCE.md"
  echo "     Insert BEFORE line:  '## 🛡️ THE 4 ENSURANCE COMPONENTS — FULL EXPANDABLE DETAILS'"
  echo "     Snippet preview (first 2 lines):"
  echo "       <details>"
  echo "       <summary><b>$SP_ID — ${ACRONYM}: ${FULL_NAME}</b> ⭐ NEW ...</summary>"
  echo ""
  echo "  ② MANDATORY_TIGHT_LOOP.md"
  echo "     Insert BEFORE line:  '## 📋 RULE 3 — THE 5-ITEM PULSE CHECK'"
  echo "     New row: $TIER_A_MTL_ROW"
  echo ""
  echo "  ③ cache/BOOTSTRAP_CHECK.md"
  echo "     Insert AFTER last SP.X row in SubSOP table"
  echo "     New row: $TIER_A_BOOTSTRAP_ROW"
  echo ""
  echo "── TIER B (3 files — SNIPPETS TO MANUALLY ADD) ──"
  echo ""
  echo "  ④ scripts/validator.sh — add a VL.X check for the ${ACRONYM} requirement"
  echo "  ⑤ scripts/bootstrap_verify.sh — add a check_grep line + bump hardcoded SP count if any"
  echo "  ⑥ SOP_COMPLETE_REFERENCE.html — add <details> mirror of PROTOCOLS_REFERENCE entry"
  echo ""
  echo "── TIER C (judgment-required) ──"
  echo ""
  echo "  ⑦ cache/FAILURE_LEDGER.md  — Only if this addition closes an F-class gap."
  echo "  ⑧ cache/BACKUP_LOG.md      — Auto-managed by backup_before_rewrite.sh."
  echo "  ⑨ agents/validator.md      — Add VL.X row IF this protocol becomes mandatory."
  echo ""
  echo "═══════════════════════════════════════════════════════════════"
  echo "DRY-RUN complete. To execute Tier A: re-run with --commit"
  echo "═══════════════════════════════════════════════════════════════"
  exit 0
fi

# ─────────────────────────────────────────────────────────────────
# COMMIT mode: backup → edit → verify → rollback-on-failure
# ─────────────────────────────────────────────────────────────────
echo "🚀 COMMIT MODE — Tier A atomic propagation"
echo ""

TIER_A_FILES=("PROTOCOLS_REFERENCE.md" "MANDATORY_TIGHT_LOOP.md" "cache/BOOTSTRAP_CHECK.md")
declare -a BACKUP_PATHS=()

for f in "${TIER_A_FILES[@]}"; do
  if [ ! -f "$f" ]; then
    echo "❌ ABORT — target file missing: $f"
    exit 3
  fi
  echo "📦 Backing up: $f"
  BACKUP_OUT=$(bash scripts/backup_before_rewrite.sh "$f" 1.0 "$REASON_SUFFIX" 2>&1)
  BACKUP_RC=$?
  if [ "$BACKUP_RC" -ne 0 ]; then
    echo "❌ ABORT — backup failed for $f:"
    echo "$BACKUP_OUT"
    exit 4
  fi
  BK_PATH=$(echo "$BACKUP_OUT" | grep -oE 'backups/[^"]+_backup\.[a-z]+' | head -1)
  BACKUP_PATHS+=("$BK_PATH")
  echo "    Backup: $BK_PATH"
done
echo ""

# Rollback function — restore all from BACKUP_PATHS if anything fails after this point
rollback() {
  echo ""
  echo "🔁 ROLLBACK initiated — restoring all Tier A files from backups"
  for i in "${!TIER_A_FILES[@]}"; do
    f="${TIER_A_FILES[$i]}"
    bk="${BACKUP_PATHS[$i]}"
    if [ -f "$bk" ]; then
      cp -p "$bk" "$f"
      echo "  ✅ Restored: $f ← $bk"
    else
      echo "  ⚠️  Backup not found for $f: $bk"
    fi
  done
  echo "🔁 Rollback complete. Working tree returned to pre-edit state."
  exit 5
}

# ── TIER A ① PROTOCOLS_REFERENCE.md ─────────────────────────────
echo "✏️  Editing ① PROTOCOLS_REFERENCE.md"
ANCHOR_PR='## 🛡️ THE 4 ENSURANCE COMPONENTS — FULL EXPANDABLE DETAILS'
if ! grep -qF "$ANCHOR_PR" PROTOCOLS_REFERENCE.md; then
  echo "❌ Anchor not found in PROTOCOLS_REFERENCE.md: '$ANCHOR_PR'"
  rollback
fi
awk -v anchor="$ANCHOR_PR" -v snippet="$TIER_A_PROTOCOLS_REF_SNIPPET" '
  index($0, anchor) == 1 { print snippet; print ""; print $0; next }
  { print }
' PROTOCOLS_REFERENCE.md > PROTOCOLS_REFERENCE.md.tmp
mv PROTOCOLS_REFERENCE.md.tmp PROTOCOLS_REFERENCE.md
if ! grep -qF "$SP_ID — ${ACRONYM}: ${FULL_NAME}" PROTOCOLS_REFERENCE.md; then
  echo "❌ Insertion verification failed for PROTOCOLS_REFERENCE.md"
  rollback
fi
echo "   ✅ Inserted $SP_ID details block"

# ── TIER A ② MANDATORY_TIGHT_LOOP.md ────────────────────────────
echo "✏️  Editing ② MANDATORY_TIGHT_LOOP.md"
ANCHOR_MTL='## 📋 RULE 3 — THE 5-ITEM PULSE CHECK'
if ! grep -qF "$ANCHOR_MTL" MANDATORY_TIGHT_LOOP.md; then
  echo "❌ Anchor not found in MANDATORY_TIGHT_LOOP.md: '$ANCHOR_MTL'"
  rollback
fi
awk -v anchor="$ANCHOR_MTL" -v row="$TIER_A_MTL_ROW" '
  index($0, anchor) == 1 { print row; print ""; print $0; next }
  { print }
' MANDATORY_TIGHT_LOOP.md > MANDATORY_TIGHT_LOOP.md.tmp
mv MANDATORY_TIGHT_LOOP.md.tmp MANDATORY_TIGHT_LOOP.md
if ! grep -qF "$SP_ID $ACRONYM" MANDATORY_TIGHT_LOOP.md; then
  echo "❌ Insertion verification failed for MANDATORY_TIGHT_LOOP.md"
  rollback
fi
echo "   ✅ Inserted $SP_ID row in Rule 2 table"

# ── TIER A ③ cache/BOOTSTRAP_CHECK.md ──────────────────────────
echo "✏️  Editing ③ cache/BOOTSTRAP_CHECK.md"
LAST_SP_LINE=$(grep -n '^| \[ \] | SP\.' cache/BOOTSTRAP_CHECK.md | tail -1 | cut -d: -f1)
if [ -z "$LAST_SP_LINE" ]; then
  echo "❌ No existing SP row found in BOOTSTRAP_CHECK.md — anchor uncertain"
  rollback
fi
awk -v line="$LAST_SP_LINE" -v row="$TIER_A_BOOTSTRAP_ROW" '
  NR == line { print; print row; next }
  { print }
' cache/BOOTSTRAP_CHECK.md > cache/BOOTSTRAP_CHECK.md.tmp
mv cache/BOOTSTRAP_CHECK.md.tmp cache/BOOTSTRAP_CHECK.md
if ! grep -qF "$SP_ID" cache/BOOTSTRAP_CHECK.md; then
  echo "❌ Insertion verification failed for BOOTSTRAP_CHECK.md"
  rollback
fi
echo "   ✅ Inserted $SP_ID row in SubSOP table"

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "✅ TIER A — all 3 files edited successfully (atomic backup-edit verified)"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📋 TIER B (3 files — your move):"
echo "  ④ scripts/validator.sh — add VL.X check for ${ACRONYM} marker"
echo "  ⑤ scripts/bootstrap_verify.sh — add check_grep '$SP_ID' + bump hardcoded count"
echo "  ⑥ SOP_COMPLETE_REFERENCE.html — add <details> mirror of PROTOCOLS_REFERENCE entry"
echo ""
echo "📋 TIER C (judgment-required):"
echo "  ⑦ cache/FAILURE_LEDGER.md — only if this protocol closes an F-class gap"
echo "  ⑧ cache/BACKUP_LOG.md — already auto-managed (rows just added by this run)"
echo "  ⑨ agents/validator.md — add VL.X row if this becomes mandatory-per-output"
echo ""
echo "Suggested commit subject:"
echo "  [${DEVICE} | ${DATE_HUMAN}] add ${SP_ID} ${ACRONYM} — ${FULL_NAME} (via add_protocol.sh v2.0)"
echo "═══════════════════════════════════════════════════════════════"
exit 0
