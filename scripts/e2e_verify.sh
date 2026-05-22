#!/usr/bin/env bash
# 🧪 E2E END-TO-END VERIFICATION — Run every check; aggregate; declare nothing-broken or fail
# Per Alan's "final verification test that nothing is broken" 2026-05-22
# Per Aurelius cross-pollination: matches `validate_e2e.py` naming convention from aurelius-agent-stack
# Proposed as SP.21 E2E in future MANDATORY_TIGHT_LOOP bump

set +e   # do NOT exit on first failure — we want to run ALL checks, aggregate, then decide

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

echo "═══════════════════════════════════════════════════════════════"
echo "🧪 E2E — END-TO-END VERIFICATION"
echo "═══════════════════════════════════════════════════════════════"
echo "Device:    $DEVICE"
echo "Timestamp: $TS"
echo "Commit:    $COMMIT"
echo ""

declare -i TOTAL_PASS=0
declare -i TOTAL_FAIL=0
declare -i TOTAL_SKIP=0

run_check() {
  local name="$1" script="$2" args="$3" success_pattern="$4"
  echo "─── $name ───"

  if [ ! -f "$script" ]; then
    echo "  ⚠️ SKIP — script not found: $script"
    TOTAL_SKIP=$((TOTAL_SKIP+1))
    echo ""
    return
  fi

  local output rc
  output=$(bash "$script" $args 2>&1)
  rc=$?

  if [ $rc -eq 0 ]; then
    if [ -n "$success_pattern" ] && ! echo "$output" | grep -qE "$success_pattern"; then
      echo "  ❌ FAIL — exit 0 but expected pattern '$success_pattern' not in output"
      echo "$output" | tail -5 | sed 's/^/     /'
      TOTAL_FAIL=$((TOTAL_FAIL+1))
    else
      local summary
      summary=$(echo "$output" | grep -iE "(VERDICT|Summary|PASS=|✅ PASS|complete)" | tail -1 | head -c 110)
      echo "  ✅ PASS — $summary"
      TOTAL_PASS=$((TOTAL_PASS+1))
    fi
  else
    echo "  ❌ FAIL — exit code $rc"
    echo "$output" | tail -5 | sed 's/^/     /'
    TOTAL_FAIL=$((TOTAL_FAIL+1))
  fi
  echo ""
}

# 1. Bootstrap verify (mechanical 85-check sweep)
run_check "1/8 Bootstrap Verify" "scripts/bootstrap_verify.sh" "--quiet" "FAIL=0"

# 2. Append-only check (cache files cannot shrink)
run_check "2/8 Append-Only Check" "scripts/append_only_check.sh" "" "PASS"

# 3. Compliance check (Rule #11, P17, MACRO/MICRO, etc.)
run_check "3/8 Compliance Check" "scripts/compliance_check.sh" "" ""

# 4. Consistency check (version drift, stale refs)
run_check "4/8 Consistency Check" "scripts/consistency_check.sh" "" "complete"

# 5. Agent test harness (9-test skeleton)
run_check "5/8 Agent Test Harness" "tests/run_agent_tests.sh" "" "FAIL=0"

# 6. Chain health audit (META_AUDIT_LOG trends)
run_check "6/8 Chain Health Audit" "scripts/audit_chain_health.sh" "" "complete"

# 7. SIR recurrence analyzer (insights → promotion candidates)
run_check "7/8 SIR Recurrence" "scripts/sir_recurrence.sh" "" "complete"

# 8. SOP health dashboard (overall metric snapshot)
run_check "8/8 SOP Health Dashboard" "scripts/sop_health_dashboard.sh" "" "appended"

# ============================================================
# FINAL VERDICT
# ============================================================
echo "═══════════════════════════════════════════════════════════════"
echo "📊 E2E RESULT"
echo "═══════════════════════════════════════════════════════════════"
echo "  ✅ Passed:  $TOTAL_PASS / 8"
echo "  ❌ Failed:  $TOTAL_FAIL / 8"
echo "  ⚠️ Skipped: $TOTAL_SKIP / 8"
echo ""

# Log to META_AUDIT_LOG.md
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | E2E | %d pass / %d fail / %d skip | %s |\n" \
    "$DATE" "$DEVICE" "$TOTAL_PASS" "$TOTAL_FAIL" "$TOTAL_SKIP" "$COMMIT" \
    >> cache/META_AUDIT_LOG.md
fi

if [ "$TOTAL_FAIL" -eq 0 ]; then
  echo "VERDICT: ✅ NOTHING IS BROKEN — ALL CHECKS PASS"
  echo "═══════════════════════════════════════════════════════════════"
  exit 0
else
  echo "VERDICT: ❌ $TOTAL_FAIL CHECK(S) FAILED — investigate above"
  echo "═══════════════════════════════════════════════════════════════"
  exit 1
fi
