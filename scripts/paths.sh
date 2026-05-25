#!/usr/bin/env bash
# 📂 PATHS — Single Source of Truth for Universal-SOP Paths (Sprint 3 Item F)
# Per Aurelius aurelius_paths.py pattern | LEARNINGS_FROM_AURELIUS_VAULT v2.0 Section 1F + Tier 2 Item F
# Adopted 2026-05-25 on aurelion. Closes F.54 (scattered hardcoded paths in scripts).
#
# THE PROBLEM (F.54):
#   20+ scripts repeat `PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"` plus their own
#   ad-hoc references to `cache/BACKUP_LOG.md`, `agents/archive/`, etc. When a path moves
#   (e.g., agents/ → agents/active/ for a future reorg), all 20+ files have to change.
#
# THE FIX (this file):
#   1. Define canonical paths ONCE here.
#   2. Other scripts source this file: `source "$(dirname "$0")/paths.sh"`
#   3. Then reference `$BACKUPS_DIR`, `$CACHE_DIR`, `$BACKUP_LOG_FILE`, etc.
#
# Usage:
#   # In a script:
#   source "$(dirname "$0")/paths.sh"
#   echo "Backing up to $BACKUPS_DIR/..."
#
#   # Or to verify what's exported:
#   bash scripts/paths.sh --show
#
# Design notes:
#   - Bash-only (no Python equivalent yet; Aurelius has both — defer until needed).
#   - All variables are EXPORTED so subshells inherit them too.
#   - Single-source idempotent: re-sourcing doesn't break anything.

# Self-locate: works whether sourced or executed directly
if [ -n "${BASH_SOURCE[0]}" ]; then
  _PATHS_SH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
else
  _PATHS_SH_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
fi

# Project root = parent of the scripts/ directory containing this file
export PROJECT_ROOT="$(cd "$_PATHS_SH_DIR/.." && pwd)"

# ─────────────────────────────────────────────────────────
# Top-level directories
# ─────────────────────────────────────────────────────────
export SCRIPTS_DIR="$PROJECT_ROOT/scripts"
export AGENTS_DIR="$PROJECT_ROOT/agents"
export CACHE_DIR="$PROJECT_ROOT/cache"
export BACKUPS_DIR="$PROJECT_ROOT/backups"
export GITHOOKS_DIR="$PROJECT_ROOT/.githooks"
export CHAT_ARCHIVE_DIR="$PROJECT_ROOT/chat_archive"
export TESTS_DIR="$PROJECT_ROOT/tests"

# ─────────────────────────────────────────────────────────
# Nested directories
# ─────────────────────────────────────────────────────────
export SCRIPTS_SCHEDULER_DIR="$SCRIPTS_DIR/scheduler"
export AGENTS_ARCHIVE_DIR="$AGENTS_DIR/archive"
export CACHE_BACKUPS_DIR="$CACHE_DIR/backups"
export CACHE_CHECKPOINTS_DIR="$CACHE_DIR/checkpoints"
export CACHE_CHIRON_DIR="$CACHE_DIR/chiron"
export CACHE_LEGACY_DIR="$CACHE_DIR/legacy"
export CACHE_REFINE_DIR="$CACHE_DIR/refine"
export CACHE_OBSIDIAN_CONFIG_DIR="$CACHE_DIR/obsidian-config"

# ─────────────────────────────────────────────────────────
# Canonical append-only & state files (cache/)
# ─────────────────────────────────────────────────────────
export BACKUP_LOG_FILE="$CACHE_DIR/BACKUP_LOG.md"
export FAILURE_LEDGER_FILE="$CACHE_DIR/FAILURE_LEDGER.md"
export SIR_LOG_FILE="$CACHE_DIR/SIR_LOG.md"
export META_AUDIT_LOG_FILE="$CACHE_DIR/META_AUDIT_LOG.md"
export SOP_HEALTH_METRICS_FILE="$CACHE_DIR/SOP_HEALTH_METRICS.md"
export SESSION_STATE_FILE="$CACHE_DIR/SESSION_STATE.md"
export CONTINUATION_FILE="$CACHE_DIR/CONTINUATION.md"
export BOOTSTRAP_CHECK_FILE="$CACHE_DIR/BOOTSTRAP_CHECK.md"
export LATEST_CHECKPOINT_FILE="$CACHE_DIR/LATEST.md"

# ─────────────────────────────────────────────────────────
# Canonical top-level docs
# ─────────────────────────────────────────────────────────
export SESSION_START_FILE="$PROJECT_ROOT/SESSION_START.md"
export MTL_FILE="$PROJECT_ROOT/MANDATORY_TIGHT_LOOP.md"
export USOP_FILE="$PROJECT_ROOT/UNIVERSAL_SOP_PROMPT.md"
export PROTOCOLS_REFERENCE_FILE="$PROJECT_ROOT/PROTOCOLS_REFERENCE.md"
export DEVICE_REGISTRY_FILE="$PROJECT_ROOT/DEVICE_REGISTRY.md"
export LEARNINGS_AURELIUS_FILE="$PROJECT_ROOT/LEARNINGS_FROM_AURELIUS_VAULT.md"
export QUINTESSENCE_ROADMAP_FILE="$PROJECT_ROOT/QUINTESSENCE_ROADMAP.md"

# ─────────────────────────────────────────────────────────
# Device + Git identity (computed once, cached for the session)
# ─────────────────────────────────────────────────────────
if [ -z "$DEVICE_NAME" ]; then
  _DEVICE_RAW=$(cd "$PROJECT_ROOT" && git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')
  export DEVICE_NAME="${_DEVICE_RAW:-unknown}"
fi

# ─────────────────────────────────────────────────────────
# --show mode: print all exports (when run directly)
# ─────────────────────────────────────────────────────────
# Only run this block when the script is EXECUTED (not sourced).
# Detection: if $0 endswith paths.sh AND BASH_SOURCE[0] = $0, we're being executed.
if [ "${BASH_SOURCE[0]:-$0}" = "$0" ]; then
  case "$1" in
    --show|-s|"")
      echo "📂 UNIVERSAL-SOP PATHS — Sprint 3 Item F (Sprint 3 starts here)"
      echo "════════════════════════════════════════════════════════════════"
      echo "Device:        $DEVICE_NAME"
      echo "PROJECT_ROOT:  $PROJECT_ROOT"
      echo ""
      echo "── Directories ──"
      printf "%-30s %s\n" "SCRIPTS_DIR" "$SCRIPTS_DIR"
      printf "%-30s %s\n" "AGENTS_DIR" "$AGENTS_DIR"
      printf "%-30s %s\n" "CACHE_DIR" "$CACHE_DIR"
      printf "%-30s %s\n" "BACKUPS_DIR" "$BACKUPS_DIR"
      printf "%-30s %s\n" "GITHOOKS_DIR" "$GITHOOKS_DIR"
      printf "%-30s %s\n" "TESTS_DIR" "$TESTS_DIR"
      printf "%-30s %s\n" "CACHE_BACKUPS_DIR" "$CACHE_BACKUPS_DIR"
      printf "%-30s %s\n" "CACHE_CHECKPOINTS_DIR" "$CACHE_CHECKPOINTS_DIR"
      printf "%-30s %s\n" "CACHE_CHIRON_DIR" "$CACHE_CHIRON_DIR"
      printf "%-30s %s\n" "CACHE_OBSIDIAN_CONFIG_DIR" "$CACHE_OBSIDIAN_CONFIG_DIR"
      echo ""
      echo "── Append-only & state files ──"
      printf "%-30s %s\n" "BACKUP_LOG_FILE" "$BACKUP_LOG_FILE"
      printf "%-30s %s\n" "FAILURE_LEDGER_FILE" "$FAILURE_LEDGER_FILE"
      printf "%-30s %s\n" "SIR_LOG_FILE" "$SIR_LOG_FILE"
      printf "%-30s %s\n" "META_AUDIT_LOG_FILE" "$META_AUDIT_LOG_FILE"
      printf "%-30s %s\n" "SOP_HEALTH_METRICS_FILE" "$SOP_HEALTH_METRICS_FILE"
      printf "%-30s %s\n" "SESSION_STATE_FILE" "$SESSION_STATE_FILE"
      printf "%-30s %s\n" "CONTINUATION_FILE" "$CONTINUATION_FILE"
      printf "%-30s %s\n" "LATEST_CHECKPOINT_FILE" "$LATEST_CHECKPOINT_FILE"
      echo ""
      echo "── Canonical top-level docs ──"
      printf "%-30s %s\n" "SESSION_START_FILE" "$SESSION_START_FILE"
      printf "%-30s %s\n" "MTL_FILE" "$MTL_FILE"
      printf "%-30s %s\n" "PROTOCOLS_REFERENCE_FILE" "$PROTOCOLS_REFERENCE_FILE"
      printf "%-30s %s\n" "DEVICE_REGISTRY_FILE" "$DEVICE_REGISTRY_FILE"
      echo "════════════════════════════════════════════════════════════════"
      echo "Source this file in other scripts: source \"\$(dirname \"\$0\")/paths.sh\""
      ;;
    --check)
      # Verify every exported path is reachable (file exists OR dir exists OR is the directory pattern)
      MISSING=0
      for var in PROJECT_ROOT SCRIPTS_DIR AGENTS_DIR CACHE_DIR BACKUPS_DIR \
                 BACKUP_LOG_FILE FAILURE_LEDGER_FILE SESSION_STATE_FILE \
                 SESSION_START_FILE MTL_FILE PROTOCOLS_REFERENCE_FILE; do
        val="${!var}"
        if [ ! -e "$val" ]; then
          echo "  ❌ MISSING: $var=$val"
          MISSING=$((MISSING+1))
        fi
      done
      if [ "$MISSING" -eq 0 ]; then
        echo "✅ All canonical paths exist."
      else
        echo "❌ $MISSING path(s) missing — repo state may be incomplete."
        exit 1
      fi
      ;;
    -h|--help)
      echo "Usage: bash scripts/paths.sh [--show|--check]"
      echo "  --show  (default)  Print all exported paths"
      echo "  --check            Verify each canonical path exists; exit 1 if any missing"
      ;;
    *)
      echo "❌ Unknown option: $1"
      echo "Try: bash scripts/paths.sh --show  OR  --check  OR  --help"
      exit 2 ;;
  esac
fi
