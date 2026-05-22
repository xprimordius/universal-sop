#!/usr/bin/env bash
# 🎯 SOP_HEALTH_DASHBOARD — Single-pane overall health metric for the SOP
# Per Q.G.1 (convergence proof) | F.22 quintessence audit 2026-05-21
# Usage: bash scripts/sop_health_dashboard.sh
# Outputs: dashboard + appends row to cache/SOP_HEALTH_METRICS.md

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
DATE=$(date +%Y-%m-%d)

# Collect metrics
BOOTSTRAP=$(bash scripts/bootstrap_verify.sh --quiet 2>/dev/null || echo "BOOTSTRAP: PASS=0 FAIL=0 WARN=0")
BS_PASS=$(echo "$BOOTSTRAP" | grep -oE "PASS=[0-9]+" | head -1 | cut -d= -f2)
BS_FAIL=$(echo "$BOOTSTRAP" | grep -oE "FAIL=[0-9]+" | head -1 | cut -d= -f2)
BS_WARN=$(echo "$BOOTSTRAP" | grep -oE "WARN=[0-9]+" | head -1 | cut -d= -f2)
[ -z "$BS_PASS" ] && BS_PASS=0
[ -z "$BS_FAIL" ] && BS_FAIL=0
[ -z "$BS_WARN" ] && BS_WARN=0

# File counts
ACTIVE_AGENTS=$(ls agents/*.md 2>/dev/null | wc -l | tr -d ' ')
ARCHIVED_AGENTS=$(ls agents/archive/*.md 2>/dev/null | wc -l | tr -d ' ')
SCRIPTS=$(ls scripts/*.sh 2>/dev/null | wc -l | tr -d ' ')
BACKUPS=$(ls backups/ 2>/dev/null | wc -l | tr -d ' ')
COMMITS=$(git rev-list --count HEAD 2>/dev/null || echo 0)
FAILURE_COUNT=$(grep -cE "^<summary><b>F\.[0-9]+" cache/FAILURE_LEDGER.md 2>/dev/null || echo 0)
SP_COUNT=$(grep -cE "^<summary><b>SP\.[0-9]+" PROTOCOLS_REFERENCE.md 2>/dev/null || echo 0)
EN_COUNT=$(grep -cE "^<summary><b>EN\.[0-9]+" PROTOCOLS_REFERENCE.md 2>/dev/null || echo 0)
BACKUP_LOG_ROWS=$(grep -cE "^\| [0-9]+ \|" cache/BACKUP_LOG.md 2>/dev/null || echo 0)
SIR_LOG_ROWS=$(if [ -f cache/SIR_LOG.md ]; then grep -cE "^\| 20[0-9]{2}-" cache/SIR_LOG.md 2>/dev/null; else echo 0; fi)
META_AUDIT_ROWS=$(if [ -f cache/META_AUDIT_LOG.md ]; then grep -cE "^\| 20[0-9]{2}-" cache/META_AUDIT_LOG.md 2>/dev/null; else echo 0; fi)

# Chain warning rate
CHAIN_WARNINGS=$(grep -oE "[0-9]+ warnings" cache/META_AUDIT_LOG.md 2>/dev/null | awk '{s+=$1} END {print s+0}')
CHAIN_RUNS=$(grep -cE "^\| 20[0-9]{2}-.*\| (Verifier|Validator|QC|Meta-Verifier) \|" cache/META_AUDIT_LOG.md 2>/dev/null || echo 0)

# Devices registered
DEVICES_REGISTERED=$(grep -cE "^\| \`[a-z]" DEVICE_REGISTRY.md 2>/dev/null || echo 0)

# Output dashboard
cat <<EOF
═══════════════════════════════════════════════════════════════
🎯 SOP HEALTH DASHBOARD
═══════════════════════════════════════════════════════════════
Generated: $TS  ·  Device: $DEVICE

┌─ BOOTSTRAP VERIFY ────────────────────────────────────────┐
│  Passed:    $BS_PASS                                              │
│  Failed:    $BS_FAIL                                              │
│  Warnings:  $BS_WARN                                              │
└───────────────────────────────────────────────────────────┘

┌─ ARCHITECTURE COUNTS ─────────────────────────────────────┐
│  Active SubSOPs (SP.X):       $SP_COUNT
│  Ensurance components (EN.X): $EN_COUNT
│  Active agents:               $ACTIVE_AGENTS
│  Archived agents:             $ARCHIVED_AGENTS
│  Scripts:                     $SCRIPTS
│  Devices registered:          $DEVICES_REGISTERED
└───────────────────────────────────────────────────────────┘

┌─ HISTORY + AUDIT ─────────────────────────────────────────┐
│  Commits:                     $COMMITS
│  Failure-Ledger entries:      F.1–F.$FAILURE_COUNT
│  BACKUP_LOG rows:             $BACKUP_LOG_ROWS
│  SIR_LOG rows:                $SIR_LOG_ROWS
│  META_AUDIT_LOG rows:         $META_AUDIT_ROWS
│  Backup files in backups/:    $BACKUPS
└───────────────────────────────────────────────────────────┘

┌─ CHAIN HEALTH ────────────────────────────────────────────┐
│  Chain runs (V/VL/QC/MV):     $CHAIN_RUNS
│  Total warnings emitted:      $CHAIN_WARNINGS
EOF

if [ "$CHAIN_RUNS" -gt 0 ]; then
  WPR=$(awk -v w="$CHAIN_WARNINGS" -v r="$CHAIN_RUNS" 'BEGIN { printf "%.2f", w/r }')
  echo "│  Warnings per run:           $WPR"
fi

cat <<EOF
└───────────────────────────────────────────────────────────┘

═══════════════════════════════════════════════════════════════
EOF

# Append a metric row to SOP_HEALTH_METRICS.md (create file if missing)
METRICS_FILE="cache/SOP_HEALTH_METRICS.md"
if [ ! -f "$METRICS_FILE" ]; then
  cat > "$METRICS_FILE" <<EOL
# 📊 SOP HEALTH METRICS — Append-Only Time Series
# Born: $DATE | $DEVICE | F.22 quintessence audit follow-up
# Source: scripts/sop_health_dashboard.sh

| 📅 Date | 🖥️ Device | 🔍 BS pass | ❌ BS fail | ⚠️ BS warn | SP.X | EN.X | Agents | Scripts | F.X | Commits | Chain warn/run |
|---|---|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
EOL
fi

WPR="${WPR:-0.00}"
echo "| $DATE | $DEVICE | $BS_PASS | $BS_FAIL | $BS_WARN | $SP_COUNT | $EN_COUNT | $ACTIVE_AGENTS | $SCRIPTS | $FAILURE_COUNT | $COMMITS | $WPR |" >> "$METRICS_FILE"

echo "✅ Metric row appended to $METRICS_FILE"
echo ""
