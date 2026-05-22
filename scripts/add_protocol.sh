#!/usr/bin/env bash
# ➕ ADD_PROTOCOL — Atomic propagation of a new SubSOP across all 9+ canonical locations
# Per Q.F.1 (cross-file consistency) | F.22 quintessence audit 2026-05-21
# Usage: bash scripts/add_protocol.sh SP_ID ACRONYM "FULL NAME" "ONE-LINE PURPOSE"
# Example: bash scripts/add_protocol.sh SP.19 SCA "SOP Completeness Audit" "Every output completeness-checks the SOP"

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

SP_ID="${1:-}"
ACRONYM="${2:-}"
FULL_NAME="${3:-}"
PURPOSE="${4:-}"

if [ -z "$SP_ID" ] || [ -z "$ACRONYM" ] || [ -z "$FULL_NAME" ] || [ -z "$PURPOSE" ]; then
  echo "Usage: bash scripts/add_protocol.sh SP_ID ACRONYM \"FULL NAME\" \"PURPOSE\""
  echo "Example: bash scripts/add_protocol.sh SP.19 SCA \"SOP Completeness Audit\" \"Every output completeness-checks the SOP\""
  exit 1
fi

echo "➕ ADD_PROTOCOL — Atomic propagation"
echo "================================================"
echo "  ID:        $SP_ID"
echo "  Acronym:   $ACRONYM"
echo "  Full Name: $FULL_NAME"
echo "  Purpose:   $PURPOSE"
echo ""

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +%Y%m%d_%H%M%S)

echo "📋 Files this script WOULD touch (currently advisory — full automation pending):"
echo ""
cat <<EOF
  1. PROTOCOLS_REFERENCE.md         — add <details> block with full spec
  2. MANDATORY_TIGHT_LOOP.md        — add to Rule 2 table (if mandatory)
  3. agents/validator.md            — add VL.X check row
  4. scripts/validator.sh           — add VL.X grep/heuristic
  5. cache/BOOTSTRAP_CHECK.md       — add row to Section 4 (SubSOPs)
  6. scripts/bootstrap_verify.sh    — add check_grep + bump count
  7. SOP_COMPLETE_REFERENCE.html    — add <details> dropdown
  8. cache/FAILURE_LEDGER.md        — optional F.X entry if this fixes a gap
  9. cache/BACKUP_LOG.md            — log this addition

Backup paths that should be created before each edit:
  backups/<file>_v<ver>_${TS}_${DEVICE}_pre_${SP_ID}_${ACRONYM}_addition_backup.<ext>

EOF

echo ""
echo "⚠️  v1.0 of this script is ADVISORY (prints the plan)."
echo "    Full auto-edit implementation pending — requires careful templating."
echo "    Until then: use this as a checklist when manually adding a protocol."
echo ""
echo "📌 Next steps for FULL automation:"
echo "  - Define template snippets for each of the 9 file types"
echo "  - Parameterize: insert SP_ID + ACRONYM + FULL_NAME + PURPOSE into each template"
echo "  - Atomically backup all 9 files, then run all 9 edits, then commit"
echo "  - Roll back atomically if any edit fails"
echo ""
echo "================================================"
echo "✅ Advisory complete. Proceed with manual edits using the list above as checklist."
