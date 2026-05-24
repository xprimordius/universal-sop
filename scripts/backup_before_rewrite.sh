#!/usr/bin/env bash
# 🛡️ BACKUP-BEFORE-REWRITE — Codified "name-the-backup-before-edit" pattern
# Per Aurelius backup_before_rewrite.py | Adopted 2026-05-23 (DELIVERABLE B from A+B+C bundle)
#
# Eliminates the typo-in-BACKUP_LOG class of bugs (F.30, F.31, F.32 root cause = manual cp + manual log append).
# Script writes the backup file AND the BACKUP_LOG row atomically.
#
# Usage:
#   bash scripts/backup_before_rewrite.sh <file> <version> <reason>
#
# Example:
#   bash scripts/backup_before_rewrite.sh cache/CONTINUATION.md v3.6 pre_session_handoff
#   → creates backups/CONTINUATION_md_v3.6_20260523_HHMMSS_aurelia_pre_session_handoff_backup.md
#   → appends next BACKUP_LOG row referencing exact path
#
# Convention preserved from existing SOP:
#   <original_basename>_<ver>_<YYYYMMDD>_<HHMMSS>_<device>_<reason>_backup.<ext>
#
# Returns:
#   - exit 0: backup created + logged
#   - exit 1: file not found / dir mismatch / log append failed

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

# Args
FILE="$1"
VERSION="$2"
REASON="$3"

if [ -z "$FILE" ] || [ -z "$VERSION" ] || [ -z "$REASON" ]; then
  echo "Usage: bash scripts/backup_before_rewrite.sh <file> <version> <reason>"
  echo "Example: bash scripts/backup_before_rewrite.sh cache/CONTINUATION.md v3.6 pre_handoff"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "❌ File not found: $FILE"
  exit 1
fi

# Device identity
DEVICE="$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"

# Timestamps
TS=$(date +%Y%m%d_%H%M%S)
DATE=$(date +%Y-%m-%d)
TIME=$(date +"%H:%M %Z")

# Basename + extension parsing
BASENAME=$(basename "$FILE")
EXT="${BASENAME##*.}"
NAME="${BASENAME%.*}"
# Convert .ext to _ext_ for sortable filename (e.g. compliance_check.sh → compliance_check_sh)
SAFE_NAME="${NAME}_${EXT}"

# Construct backup path (top-level backups/)
BACKUP_PATH="backups/${SAFE_NAME}_${VERSION}_${TS}_${DEVICE}_${REASON}_backup.${EXT}"

# Copy
cp "$FILE" "$BACKUP_PATH" 2>&1
if [ $? -ne 0 ]; then
  echo "❌ cp failed: $FILE → $BACKUP_PATH"
  exit 1
fi

# Next row number
LAST_ROW=$(grep -oE "^\| [0-9]+ \|" cache/BACKUP_LOG.md 2>/dev/null | grep -oE "[0-9]+" | sort -n | tail -1)
NEXT_ROW=$((${LAST_ROW:-0} + 1))

# Append row
printf "| %d | %s | %s | %s | %s | %s | %s |\n" \
  "$NEXT_ROW" "$DATE" "$TIME" "$FILE" "$VERSION" \
  "**(${DEVICE}) ${REASON//_/ } via backup_before_rewrite.sh**" \
  "$BACKUP_PATH" \
  >> cache/BACKUP_LOG.md

echo "✅ Backup created: $BACKUP_PATH"
echo "✅ BACKUP_LOG row #$NEXT_ROW appended"
echo ""
echo "Restore: cp \"$BACKUP_PATH\" \"$FILE\""

exit 0
