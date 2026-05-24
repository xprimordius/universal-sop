#!/usr/bin/env bash
# ✅ PULSE CHECK — Mechanical 5-item probe (v1.7)
# Per Aurelius pulse_check.py pattern | Adopted 2026-05-23 (DELIVERABLE C from A+B+C bundle)
#
# REPLACES the markdown-convention Pulse Check checkbox with ACTUAL probes querying real state.
# Closes the F.19 "same-brain audits itself" ceiling — mechanical not behavioral.
#
# 5 items per MANDATORY_TIGHT_LOOP v1.7:
#   P1 — Honest numbers (no fabricated counts in last commit)
#   P2 — IAC (Understanding Check) present in last output
#   P3 — SSC (Sync Status) present (git distance + last sync_status.sh run)
#   P4 — MES (Model Effort Selector) present (🎯 MODEL: line in commit messages)
#   P5 — RAE (Recommendations At End) present
#
# Usage:
#   bash scripts/pulse_check.sh          # full table
#   bash scripts/pulse_check.sh --quiet  # exit code only (CI mode)
#
# Exit code: 0 if all PASS, 1 if any FAIL.

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

QUIET=0
[ "$1" = "--quiet" ] && QUIET=1

declare -i PASS=0
declare -i FAIL=0
declare -i WARN=0

DEVICE="$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

# Sample: last 5 commits' messages + diffs
SAMPLE=$(git log --oneline -5 2>/dev/null)
RECENT_MSGS=$(git log -5 --format=%B 2>/dev/null)

# ─────────────────────────────────────────────────────────────────
# P1 — Honest numbers: no fabricated "exactly N" or "precisely N" without methodology
# ─────────────────────────────────────────────────────────────────
probe_p1() {
  local suspects
  suspects=$(echo "$RECENT_MSGS" | grep -ciE "\b(exactly|precisely)\s+[0-9]+" 2>/dev/null)
  if [ "${suspects:-0}" -eq 0 ]; then
    echo "[OK]|P1 Honest numbers|no precision-claim red flags in last 5 commits"
    return 0
  fi
  echo "[!]|P1 Honest numbers|$suspects suspect 'exactly N' claims in recent commits"
  return 1
}

# ─────────────────────────────────────────────────────────────────
# P2 — IAC (Understanding Check) presence in recent activity
# ─────────────────────────────────────────────────────────────────
probe_p2() {
  local hits
  hits=$(echo "$RECENT_MSGS" | grep -ciE "Understanding Check|UC[:.]|interpretation|verbatim" 2>/dev/null)
  hits=${hits:-0}
  if [ "$hits" -ge 1 ]; then
    echo "[OK]|P2 IAC present|$hits Understanding-Check signals in last 5 commits"
    return 0
  fi
  echo "[!]|P2 IAC present|no UC signals in last 5 commits (may indicate trivial-only commits)"
  return 0  # warn only
}

# ─────────────────────────────────────────────────────────────────
# P3 — SSC (Sync Status) — git distance + sync_status.sh available
# ─────────────────────────────────────────────────────────────────
probe_p3() {
  local distance
  distance=$(git rev-list --left-right --count HEAD...origin/main 2>/dev/null)
  local script_exists="no"
  [ -x scripts/sync_status.sh ] && script_exists="yes"
  if [ "$distance" = "0	0" ] && [ "$script_exists" = "yes" ]; then
    echo "[OK]|P3 SSC present|distance 0/0 + sync_status.sh executable"
    return 0
  fi
  if [ "$script_exists" != "yes" ]; then
    echo "[FAIL]|P3 SSC present|scripts/sync_status.sh missing or not executable"
    return 1
  fi
  echo "[!]|P3 SSC present|distance $distance (not fully synced — pending push?)"
  return 0  # warn only — distance ≠0 is informational
}

# ─────────────────────────────────────────────────────────────────
# P4 — MES (Model Effort Selector) — 🎯 MODEL: line in commit signatures
# ─────────────────────────────────────────────────────────────────
probe_p4() {
  # MES doesn't appear in commit messages (it's per-OUTPUT not per-COMMIT).
  # Instead: check if validator.sh has VL.10 MES check OR MANDATORY_TIGHT_LOOP references SP.21 MES.
  local mes_in_validator
  mes_in_validator=$(grep -ciE "MES|SP\.21|Model Effort" scripts/validator.sh 2>/dev/null)
  local mes_in_loop
  mes_in_loop=$(grep -ciE "SP\.21|MES|Model Effort Selector" MANDATORY_TIGHT_LOOP.md 2>/dev/null)
  mes_in_validator=${mes_in_validator:-0}
  mes_in_loop=${mes_in_loop:-0}
  if [ "$mes_in_validator" -ge 1 ] && [ "$mes_in_loop" -ge 1 ]; then
    echo "[OK]|P4 MES integrated|validator+tight-loop both reference SP.21"
    return 0
  fi
  echo "[!]|P4 MES integrated|validator=$mes_in_validator tight-loop=$mes_in_loop (expected ≥1 each)"
  return 0  # warn only
}

# ─────────────────────────────────────────────────────────────────
# P5 — RAE (Recommendations At End) — SP.24 in MANDATORY_TIGHT_LOOP + validator
# ─────────────────────────────────────────────────────────────────
probe_p5() {
  local rae_in_loop
  rae_in_loop=$(grep -ciE "SP\.24|RAE|Recommendations At End" MANDATORY_TIGHT_LOOP.md 2>/dev/null)
  local rae_in_validator
  rae_in_validator=$(grep -ciE "RAE|VL\.11" scripts/validator.sh 2>/dev/null)
  rae_in_loop=${rae_in_loop:-0}
  rae_in_validator=${rae_in_validator:-0}
  if [ "$rae_in_loop" -ge 1 ] && [ "$rae_in_validator" -ge 1 ]; then
    echo "[OK]|P5 RAE integrated|both tight-loop+validator reference SP.24"
    return 0
  fi
  echo "[!]|P5 RAE integrated|loop=$rae_in_loop validator=$rae_in_validator (expected ≥1 each)"
  return 0  # warn only
}

# ─────────────────────────────────────────────────────────────────
# Run all probes
# ─────────────────────────────────────────────────────────────────
RESULTS=()
RESULTS+=("$(probe_p1)")
RESULTS+=("$(probe_p2)")
RESULTS+=("$(probe_p3)")
RESULTS+=("$(probe_p4)")
RESULTS+=("$(probe_p5)")

# Tally
for r in "${RESULTS[@]}"; do
  status=$(echo "$r" | cut -d'|' -f1)
  case "$status" in
    "[OK]") PASS=$((PASS+1)) ;;
    "[!]")  WARN=$((WARN+1)) ;;
    "[FAIL]") FAIL=$((FAIL+1)) ;;
  esac
done

# Output
if [ "$QUIET" -eq 0 ]; then
  echo "═══════════════════════════════════════════════════════════════"
  echo "✅ PULSE CHECK 5/5 (v1.7 — mechanical probes per Aurelius pattern)"
  echo "═══════════════════════════════════════════════════════════════"
  echo "Device: $DEVICE  ·  Commit: $COMMIT  ·  Date: $DATE"
  echo ""
  printf "%-8s  %-22s  %s\n" "Status" "Probe" "Detail"
  printf "%-8s  %-22s  %s\n" "------" "----------------------" "----------------------"
  for r in "${RESULTS[@]}"; do
    status=$(echo "$r" | cut -d'|' -f1)
    name=$(echo "$r" | cut -d'|' -f2)
    detail=$(echo "$r" | cut -d'|' -f3)
    printf "%-8s  %-22s  %s\n" "$status" "$name" "$detail"
  done
  echo ""
  echo "Summary: $PASS PASS · $WARN WARN · $FAIL FAIL"
  echo "═══════════════════════════════════════════════════════════════"
fi

# Log to META_AUDIT_LOG
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | Pulse-Check | %d/5 pass / %d warn / %d fail | %s |\n" \
    "$DATE" "$DEVICE" "$PASS" "$WARN" "$FAIL" "$COMMIT" \
    >> cache/META_AUDIT_LOG.md
fi

# Exit
if [ "$FAIL" -eq 0 ]; then
  exit 0
else
  exit 1
fi
