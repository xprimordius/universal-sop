#!/usr/bin/env bash
# 📦 BACKUP STATUS — Multi-Layer Redundancy Probe (Sprint 1 Item I)
# Per Aurelius backup_status.py pattern | LEARNINGS_FROM_AURELIUS_VAULT v2.0 Section 1F + 4
# Adopted 2026-05-25 on aurelion.
#
# Answers ONE question: "If this device vanished right now, where can the work be recovered from?"
#
# 5 probes per the Aurelius standard block:
#   L1 — Local backups/ directory   (atomic file snapshots)
#   L2 — cache/BACKUP_LOG.md        (append-only audit row history)
#   L3 — Local git                  (committed history on this device)
#   L4 — GitHub origin              (off-device source of truth)
#   L5 — Cross-device commits       (other devices have pushed recently)
#
# Usage:
#   bash scripts/backup_status.sh           # full table
#   bash scripts/backup_status.sh --quiet   # exit code only (CI mode)
#   bash scripts/backup_status.sh --block   # emit Aurelius-style block for inclusion in output
#
# Exit code: 0 if ≥4 layers OK, 1 if redundancy compromised (≥2 FAIL).

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

QUIET=0
BLOCK=0
case "$1" in
  --quiet) QUIET=1 ;;
  --block) BLOCK=1 ;;
esac

declare -i PASS=0
declare -i FAIL=0
declare -i WARN=0

DEVICE="$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
DATE=$(date +%Y-%m-%d)
TS=$(date +"%Y-%m-%d %H:%M %Z")
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

# ─────────────────────────────────────────────────────────────────
# L1 — Local backups/ directory: atomic snapshots from backup_before_rewrite.sh
# ─────────────────────────────────────────────────────────────────
probe_l1() {
  if [ ! -d backups ]; then
    echo "[FAIL]|L1 Local backups/|directory missing — backup_before_rewrite.sh has nothing to write to"
    return 1
  fi
  local count
  count=$(find backups -type f -name "*_backup.*" 2>/dev/null | wc -l)
  count=${count:-0}
  if [ "$count" -eq 0 ]; then
    echo "[!]|L1 Local backups/|0 backup files (directory exists but empty — fresh device?)"
    return 0
  fi
  local latest
  latest=$(ls -t backups/*_backup.* 2>/dev/null | head -1 | xargs -I{} basename {} 2>/dev/null)
  local latest_age_min
  if [ -n "$latest" ]; then
    local latest_mtime
    latest_mtime=$(stat -c %Y "backups/$latest" 2>/dev/null || stat -f %m "backups/$latest" 2>/dev/null || echo 0)
    local now
    now=$(date +%s)
    latest_age_min=$(( (now - latest_mtime) / 60 ))
  else
    latest_age_min="?"
  fi
  echo "[OK]|L1 Local backups/|$count files · latest ${latest_age_min}m ago"
  return 0
}

# ─────────────────────────────────────────────────────────────────
# L2 — cache/BACKUP_LOG.md: append-only audit history
# ─────────────────────────────────────────────────────────────────
probe_l2() {
  if [ ! -f cache/BACKUP_LOG.md ]; then
    echo "[FAIL]|L2 BACKUP_LOG|cache/BACKUP_LOG.md missing — audit trail broken"
    return 1
  fi
  local rows
  rows=$(grep -cE "^\| #?[0-9]+ " cache/BACKUP_LOG.md 2>/dev/null)
  rows=${rows:-0}
  if [ "$rows" -eq 0 ]; then
    echo "[!]|L2 BACKUP_LOG|file exists but 0 data rows (header-only)"
    return 0
  fi
  local latest_row
  latest_row=$(grep -E "^\| #?[0-9]+ " cache/BACKUP_LOG.md 2>/dev/null | tail -1 | awk -F'|' '{ gsub(/^ +| +$/, "", $2); print $2 }')
  echo "[OK]|L2 BACKUP_LOG|$rows rows · latest row $latest_row"
  return 0
}

# ─────────────────────────────────────────────────────────────────
# L3 — Local git: committed history on this device
# ─────────────────────────────────────────────────────────────────
probe_l3() {
  if [ ! -d .git ]; then
    echo "[FAIL]|L3 Local git|.git directory missing — not a repo"
    return 1
  fi
  local total
  total=$(git rev-list --count HEAD 2>/dev/null || echo 0)
  local dirty
  if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
    dirty="clean"
  else
    local mod_count
    mod_count=$(git status --porcelain 2>/dev/null | wc -l)
    dirty="${mod_count} uncommitted"
  fi
  echo "[OK]|L3 Local git|$total commits · HEAD $COMMIT · $dirty"
  return 0
}

# ─────────────────────────────────────────────────────────────────
# L4 — GitHub origin: off-device source of truth
# ─────────────────────────────────────────────────────────────────
probe_l4() {
  local remote_url
  remote_url=$(git config --get remote.origin.url 2>/dev/null)
  if [ -z "$remote_url" ]; then
    echo "[FAIL]|L4 GitHub origin|no remote.origin configured — off-device redundancy ZERO"
    return 1
  fi
  # Probe reachability via ls-remote (no clone needed; ~1-2s on warm DNS)
  local reachable
  reachable=$(timeout 10 git ls-remote --heads origin main 2>/dev/null | head -1)
  if [ -z "$reachable" ]; then
    echo "[!]|L4 GitHub origin|configured ($remote_url) but unreachable (network? auth?)"
    return 0
  fi
  local distance
  distance=$(git rev-list --left-right --count HEAD...origin/main 2>/dev/null)
  if [ "$distance" = "0	0" ]; then
    echo "[OK]|L4 GitHub origin|in sync (0/0) · $(echo $remote_url | sed 's|https://github.com/||')"
    return 0
  fi
  echo "[!]|L4 GitHub origin|distance $distance (push or pull pending) · $(echo $remote_url | sed 's|https://github.com/||')"
  return 0  # warn only — distance ≠0 is informational, not a redundancy failure
}

# ─────────────────────────────────────────────────────────────────
# L5 — Cross-device commits: other devices have pushed recently
#       (the real test of multi-device redundancy)
# ─────────────────────────────────────────────────────────────────
probe_l5() {
  # Look for commits from a device OTHER than this one in the last 14 days
  local other_count
  other_count=$(git log --since="14 days ago" --format='%ae' 2>/dev/null | grep -v "alan+$DEVICE@local" | grep -c "alan+" 2>/dev/null)
  other_count=${other_count:-0}
  local own_count
  own_count=$(git log --since="14 days ago" --format='%ae' 2>/dev/null | grep -c "alan+$DEVICE@local" 2>/dev/null)
  own_count=${own_count:-0}
  if [ "$other_count" -ge 1 ]; then
    local other_devices
    other_devices=$(git log --since="14 days ago" --format='%ae' 2>/dev/null | grep -v "alan+$DEVICE@local" | grep -oE "alan\+[^@]+" | sed 's/alan+//' | sort -u | tr '\n' ',' | sed 's/,$//')
    echo "[OK]|L5 Cross-device|$other_count commits from {$other_devices} + $own_count from $DEVICE in last 14d"
    return 0
  fi
  if [ "$own_count" -ge 1 ]; then
    echo "[!]|L5 Cross-device|only $DEVICE has committed in last 14d (single-device exposure)"
    return 0
  fi
  echo "[!]|L5 Cross-device|no commits in last 14d from any registered device"
  return 0
}

# ─────────────────────────────────────────────────────────────────
# Run all probes
# ─────────────────────────────────────────────────────────────────
RESULTS=()
RESULTS+=("$(probe_l1)")
RESULTS+=("$(probe_l2)")
RESULTS+=("$(probe_l3)")
RESULTS+=("$(probe_l4)")
RESULTS+=("$(probe_l5)")

for r in "${RESULTS[@]}"; do
  status=$(echo "$r" | cut -d'|' -f1)
  case "$status" in
    "[OK]")   PASS=$((PASS+1)) ;;
    "[!]")    WARN=$((WARN+1)) ;;
    "[FAIL]") FAIL=$((FAIL+1)) ;;
  esac
done

# ─────────────────────────────────────────────────────────────────
# Output — three modes: full table, block-form (for inclusion in output), quiet (CI)
# ─────────────────────────────────────────────────────────────────
if [ "$BLOCK" -eq 1 ]; then
  # Aurelius-style standard block for inclusion in per-output reports
  echo "📦 BACKUP STATUS · $DEVICE @ $TS · $COMMIT"
  for r in "${RESULTS[@]}"; do
    status=$(echo "$r" | cut -d'|' -f1)
    name=$(echo "$r" | cut -d'|' -f2)
    detail=$(echo "$r" | cut -d'|' -f3)
    printf "  %-7s %-22s %s\n" "$status" "$name" "$detail"
  done
  echo "  Redundancy: $PASS OK · $WARN WARN · $FAIL FAIL"
elif [ "$QUIET" -eq 0 ]; then
  echo "═══════════════════════════════════════════════════════════════"
  echo "📦 BACKUP STATUS — 5-Layer Redundancy Probe"
  echo "═══════════════════════════════════════════════════════════════"
  echo "Device: $DEVICE  ·  Commit: $COMMIT  ·  $TS"
  echo ""
  printf "%-8s  %-22s  %s\n" "Status" "Layer" "Detail"
  printf "%-8s  %-22s  %s\n" "------" "----------------------" "----------------------"
  for r in "${RESULTS[@]}"; do
    status=$(echo "$r" | cut -d'|' -f1)
    name=$(echo "$r" | cut -d'|' -f2)
    detail=$(echo "$r" | cut -d'|' -f3)
    printf "%-8s  %-22s  %s\n" "$status" "$name" "$detail"
  done
  echo ""
  echo "Summary: $PASS OK · $WARN WARN · $FAIL FAIL"
  if [ "$FAIL" -ge 2 ]; then
    echo "⚠️  REDUNDANCY COMPROMISED — ≥2 layers failed. Investigate before next destructive op."
  elif [ "$FAIL" -eq 1 ]; then
    echo "⚠️  1 layer failed — other layers still provide recovery. Fix when convenient."
  elif [ "$WARN" -ge 3 ]; then
    echo "ℹ️  $WARN warnings — likely fresh device or single-device session. Review if unexpected."
  else
    echo "✅ All redundancy layers healthy. Work survives loss of this device."
  fi
  echo "═══════════════════════════════════════════════════════════════"
fi

# Optional META_AUDIT_LOG row (only if log exists, matching pulse_check.sh idiom)
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | Backup-Status | %d OK / %d WARN / %d FAIL | %s |\n" \
    "$DATE" "$DEVICE" "$PASS" "$WARN" "$FAIL" "$COMMIT" \
    >> cache/META_AUDIT_LOG.md
fi

# Exit code: fail if ≥2 layers compromised (redundancy actually at risk)
if [ "$FAIL" -ge 2 ]; then
  exit 1
fi
exit 0
