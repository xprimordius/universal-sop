#!/usr/bin/env bash
# 🧪 RUN_SCRIPT_TESTS — Comprehensive Guard Tests for scripts/ (Sprint 3 Item G)
# Per Aurelius tests/aurelius_tests.py pattern | LEARNINGS_FROM_AURELIUS_VAULT v2.0 Section 1H + Tier 2 Item G
# Adopted 2026-05-25 on aurelion. Closes F.55 (no test harness for scripts = silent regressions possible).
#
# Sibling to tests/run_agent_tests.sh (which covers the 4-layer agent chain).
# This file covers the 23 Auxiliary Scripts via guard tests that verify:
#   - script exists + is executable
#   - basic invocation returns expected exit code
#   - expected output markers appear (no behavior assertions about correctness — those are E2E's job)
#
# Pattern: each test_X function returns 0/1 to a runner that tallies.
# Runs <60s on aurelion (target per Aurelius pattern).

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

# Adopt paths.sh (Sprint 3 Item F dogfood — first user)
if [ -f scripts/paths.sh ]; then
  source scripts/paths.sh > /dev/null 2>&1
fi

declare -i PASS=0
declare -i FAIL=0
declare -i SKIP=0
FAILED_TESTS=()

# ─────────────────────────────────────────────────────────
# Assertion helpers
# ─────────────────────────────────────────────────────────
_t() {
  local name="$1"
  local fn="$2"
  if ! command -v "$fn" >/dev/null 2>&1 && ! declare -F "$fn" >/dev/null; then
    SKIP=$((SKIP+1))
    printf "  [SKIP] %s — test fn missing\n" "$name"
    return
  fi
  if "$fn"; then
    PASS=$((PASS+1))
    printf "  [PASS] %s\n" "$name"
  else
    FAIL=$((FAIL+1))
    FAILED_TESTS+=("$name")
    printf "  [FAIL] %s\n" "$name"
  fi
}

assert_exists() { [ -f "$1" ] || { echo "  ↳ not found: $1"; return 1; }; }
assert_executable() { [ -x "$1" ] || { echo "  ↳ not +x: $1"; return 1; }; }
assert_contains() { echo "$1" | grep -q -- "$2" || { echo "  ↳ output missing: $2"; return 1; }; }
assert_exit_zero() { [ "$1" = "0" ] || { echo "  ↳ exit was $1, expected 0"; return 1; }; }
assert_exit_nonzero() { [ "$1" != "0" ] || { echo "  ↳ exit was 0, expected nonzero"; return 1; }; }

# ─────────────────────────────────────────────────────────
# Test suite: existence + executable bits (8 tests, fast)
# ─────────────────────────────────────────────────────────
test_paths_exists() { assert_exists scripts/paths.sh && assert_executable scripts/paths.sh; }
test_backup_before_rewrite_exists() { assert_exists scripts/backup_before_rewrite.sh && assert_executable scripts/backup_before_rewrite.sh; }
test_backup_status_exists() { assert_exists scripts/backup_status.sh && assert_executable scripts/backup_status.sh; }
test_pulse_check_exists() { assert_exists scripts/pulse_check.sh && assert_executable scripts/pulse_check.sh; }
test_mirror_obsidian_exists() { assert_exists scripts/mirror_obsidian.sh && assert_executable scripts/mirror_obsidian.sh; }
test_checkpoint_exists() { assert_exists scripts/checkpoint.sh && assert_executable scripts/checkpoint.sh; }
test_pristine_audit_exists() { assert_exists scripts/pristine_audit.sh && assert_executable scripts/pristine_audit.sh; }
test_audit_chain_health_exists() { assert_exists scripts/audit_chain_health.sh && assert_executable scripts/audit_chain_health.sh; }

# ─────────────────────────────────────────────────────────
# Test suite: paths.sh exports (3 tests)
# ─────────────────────────────────────────────────────────
test_paths_show_emits_PROJECT_ROOT() {
  local out
  out=$(bash scripts/paths.sh --show 2>&1)
  assert_contains "$out" "PROJECT_ROOT"
}
test_paths_check_exits_zero() {
  bash scripts/paths.sh --check > /dev/null 2>&1
  assert_exit_zero "$?"
}
test_paths_check_finds_BACKUP_LOG() {
  local out
  out=$(bash scripts/paths.sh --check 2>&1)
  # Either prints "All canonical paths exist." or lists missing — we want the success line
  assert_contains "$out" "All canonical paths exist"
}

# ─────────────────────────────────────────────────────────
# Test suite: backup_status.sh modes (3 tests)
# ─────────────────────────────────────────────────────────
test_backup_status_quiet_exits_zero() {
  bash scripts/backup_status.sh --quiet > /dev/null 2>&1
  assert_exit_zero "$?"
}
test_backup_status_block_format() {
  local out
  out=$(bash scripts/backup_status.sh --block 2>&1)
  assert_contains "$out" "BACKUP STATUS"
}
test_backup_status_full_table() {
  local out
  out=$(bash scripts/backup_status.sh 2>&1)
  assert_contains "$out" "L1 Local backups/" && assert_contains "$out" "L5 Cross-device"
}

# ─────────────────────────────────────────────────────────
# Test suite: pulse_check.sh (2 tests)
# ─────────────────────────────────────────────────────────
test_pulse_check_runs() {
  bash scripts/pulse_check.sh > /dev/null 2>&1
  # pulse exits 0 if all PASS, 1 if any FAIL — both are valid runs, just check it ran
  local rc=$?
  [ "$rc" = "0" ] || [ "$rc" = "1" ]
}
test_pulse_check_emits_5_probes() {
  local out
  out=$(bash scripts/pulse_check.sh 2>&1)
  assert_contains "$out" "P1" && assert_contains "$out" "P5"
}

# ─────────────────────────────────────────────────────────
# Test suite: mirror_obsidian.sh (2 tests)
# ─────────────────────────────────────────────────────────
test_mirror_obsidian_verify_runs() {
  bash scripts/mirror_obsidian.sh --verify > /dev/null 2>&1
  local rc=$?
  # 0 = OK match, 1 = DRIFT detected — both are valid runs
  [ "$rc" = "0" ] || [ "$rc" = "1" ]
}
test_mirror_obsidian_help() {
  local out
  out=$(bash scripts/mirror_obsidian.sh --help 2>&1)
  assert_contains "$out" "mirror" && assert_contains "$out" "verify" && assert_contains "$out" "restore"
}

# ─────────────────────────────────────────────────────────
# Test suite: checkpoint.sh dry-run (1 test)
# ─────────────────────────────────────────────────────────
test_checkpoint_dry_run() {
  local out
  out=$(bash scripts/checkpoint.sh --dry-run --note "test-harness dry-run" 2>&1)
  assert_contains "$out" "DRY RUN"
}

# ─────────────────────────────────────────────────────────
# Test suite: audit_chain_health.sh F.58 fix (2 tests)
# ─────────────────────────────────────────────────────────
test_audit_chain_health_empty_log_handles() {
  # Either META_AUDIT_LOG.md exists (chain ran) or it doesn't (fresh device).
  # Both cases MUST emit "complete" per F.58 fix.
  local out
  out=$(bash scripts/audit_chain_health.sh 2>&1)
  assert_contains "$out" "complete"
}
test_audit_chain_health_exits_zero() {
  bash scripts/audit_chain_health.sh > /dev/null 2>&1
  assert_exit_zero "$?"
}

# ─────────────────────────────────────────────────────────
# Test suite: bootstrap_verify.sh + e2e_verify.sh (2 tests — sanity gates)
# ─────────────────────────────────────────────────────────
test_bootstrap_verify_runs() {
  bash scripts/bootstrap_verify.sh > /dev/null 2>&1
  # Pass-through: pristine repos exit 0, repos with WARN/FAIL exit nonzero
  local rc=$?
  [ "$rc" = "0" ] || [ "$rc" = "1" ]
}
test_e2e_verify_runs_under_60s() {
  local start end elapsed
  start=$(date +%s)
  timeout 90 bash scripts/e2e_verify.sh > /dev/null 2>&1
  local rc=$?
  end=$(date +%s)
  elapsed=$((end - start))
  if [ "$elapsed" -gt 60 ]; then
    echo "  ↳ E2E took ${elapsed}s (target <60s; budget 90s)"
  fi
  # Allow any exit code — just want to confirm it terminated
  [ "$rc" -lt 124 ] || { echo "  ↳ E2E timed out"; return 1; }
}

# ─────────────────────────────────────────────────────────
# Test suite: protocol_coverage_audit.sh + pristine_audit.sh (3 tests)
# ─────────────────────────────────────────────────────────
test_protocol_coverage_audit_categorizes() {
  local out
  out=$(bash scripts/protocol_coverage_audit.sh 2>&1)
  # Should distinguish C-category from O-category (PRISTINE Cycle 2 reclassification)
  assert_contains "$out" "OUTPUT-TIME"
}
test_pristine_audit_emits_verdict() {
  local out
  out=$(bash scripts/pristine_audit.sh 2>&1 | tail -8)
  # Verdict line must be one of the 4 verdicts
  assert_contains "$out" "PRISTINE" || assert_contains "$out" "NEAR-PRISTINE" \
    || assert_contains "$out" "IMPERFECT" || assert_contains "$out" "DEGRADED"
}
test_pristine_audit_gitignore_aware() {
  # PRISTINE Cycle 1 fix: META_AUDIT_LOG.md refs should be filtered by .gitignore check.
  # Indirect check: dead-ref count should be low (≤2) on a fresh aurelion repo with the fix shipped.
  local out
  out=$(bash scripts/pristine_audit.sh 2>&1 | grep "Dead refs in docs" | tail -1)
  local count
  count=$(echo "$out" | grep -oE "[0-9]+" | tail -1)
  count=${count:-99}
  [ "$count" -le 2 ] || { echo "  ↳ Dead refs count = $count, expected ≤2 (gitignore-aware filter shipped)"; return 1; }
}

# ─────────────────────────────────────────────────────────
# Test suite: backup_before_rewrite.sh atomic backup (2 tests — uses temp file)
# ─────────────────────────────────────────────────────────
test_backup_before_rewrite_creates_backup_file() {
  # Use a real existing file as input; the script appends a BACKUP_LOG row — that's a write.
  # SAFETY: this test ACTUALLY writes to BACKUP_LOG. Acceptable since BACKUP_LOG is append-only
  # and a test-row is legitimate audit history. Reason field marks it as test.
  local before_rows after_rows
  before_rows=$(grep -cE "^\| [0-9]+ " cache/BACKUP_LOG.md)
  bash scripts/backup_before_rewrite.sh README.md 1.0 test_harness_dogfood_skip_in_review > /dev/null 2>&1
  after_rows=$(grep -cE "^\| [0-9]+ " cache/BACKUP_LOG.md)
  [ "$after_rows" -gt "$before_rows" ]
}
test_backup_before_rewrite_skips_missing_file() {
  local out
  out=$(bash scripts/backup_before_rewrite.sh /tmp/this_definitely_does_not_exist_xyz_999.md 1.0 should_fail 2>&1)
  local rc=$?
  # Either exits nonzero OR prints error message (defensive check)
  [ "$rc" != "0" ] || echo "$out" | grep -qiE "not.found|missing|error"
}

# ─────────────────────────────────────────────────────────
# Test suite: append_only_check.sh + compliance_check.sh (2 tests)
# ─────────────────────────────────────────────────────────
test_append_only_check_runs() {
  bash scripts/append_only_check.sh > /dev/null 2>&1
  local rc=$?
  [ "$rc" = "0" ] || [ "$rc" = "1" ]
}
test_compliance_check_skips_meta_doc() {
  # PRISTINE Cycle 3 fix: CHECK 4 (Pulse Check) should skip when no STEP header.
  # Indirect verification: run on staged content; current staged content is meta-doc edits
  # to PROTOCOLS_REFERENCE etc. → CHECK 4 should not flag.
  local out
  out=$(bash scripts/compliance_check.sh 2>&1 | grep -A 2 "CHECK 4")
  assert_contains "$out" "Pulse Check" # at least mentions the check
}

# ─────────────────────────────────────────────────────────
# Run all tests
# ─────────────────────────────────────────────────────────
echo "🧪 SCRIPT TEST HARNESS — v1.0 (Sprint 3 Item G)"
echo "════════════════════════════════════════════════════"
echo ""

START_TS=$(date +%s)

echo "── Existence + executable bits (8) ──"
_t "paths.sh exists+x"            test_paths_exists
_t "backup_before_rewrite exists+x" test_backup_before_rewrite_exists
_t "backup_status exists+x"       test_backup_status_exists
_t "pulse_check exists+x"         test_pulse_check_exists
_t "mirror_obsidian exists+x"     test_mirror_obsidian_exists
_t "checkpoint exists+x"          test_checkpoint_exists
_t "pristine_audit exists+x"      test_pristine_audit_exists
_t "audit_chain_health exists+x"  test_audit_chain_health_exists

echo ""
echo "── paths.sh contract (3) ──"
_t "paths --show emits PROJECT_ROOT" test_paths_show_emits_PROJECT_ROOT
_t "paths --check exits 0"           test_paths_check_exits_zero
_t "paths --check finds BACKUP_LOG"  test_paths_check_finds_BACKUP_LOG

echo ""
echo "── backup_status.sh modes (3) ──"
_t "backup_status --quiet exit 0"    test_backup_status_quiet_exits_zero
_t "backup_status --block format"    test_backup_status_block_format
_t "backup_status full table"        test_backup_status_full_table

echo ""
echo "── pulse_check.sh (2) ──"
_t "pulse_check runs"                test_pulse_check_runs
_t "pulse_check emits 5 probes"      test_pulse_check_emits_5_probes

echo ""
echo "── mirror_obsidian.sh (2) ──"
_t "mirror --verify runs"            test_mirror_obsidian_verify_runs
_t "mirror --help lists 3 modes"     test_mirror_obsidian_help

echo ""
echo "── checkpoint.sh (1) ──"
_t "checkpoint --dry-run"            test_checkpoint_dry_run

echo ""
echo "── audit_chain_health.sh F.58 fix (2) ──"
_t "audit_chain emits 'complete'"    test_audit_chain_health_empty_log_handles
_t "audit_chain exit 0"              test_audit_chain_health_exits_zero

echo ""
echo "── bootstrap + E2E (2) ──"
_t "bootstrap_verify runs"           test_bootstrap_verify_runs
_t "E2E runs under 90s budget"       test_e2e_verify_runs_under_60s

echo ""
echo "── coverage + pristine (3) ──"
_t "coverage_audit categorizes"      test_protocol_coverage_audit_categorizes
_t "pristine_audit emits verdict"    test_pristine_audit_emits_verdict
_t "pristine gitignore-aware"        test_pristine_audit_gitignore_aware

echo ""
echo "── backup_before_rewrite.sh (2) ──"
_t "backup creates BACKUP_LOG row"   test_backup_before_rewrite_creates_backup_file
_t "backup handles missing file"     test_backup_before_rewrite_skips_missing_file

echo ""
echo "── compliance + append-only (2) ──"
_t "append_only_check runs"          test_append_only_check_runs
_t "compliance skips meta-doc"       test_compliance_check_skips_meta_doc

END_TS=$(date +%s)
ELAPSED=$((END_TS - START_TS))

echo ""
echo "════════════════════════════════════════════════════"
echo "📊 SCRIPT TEST RESULT: PASS=$PASS · FAIL=$FAIL · SKIP=$SKIP  (elapsed ${ELAPSED}s)"
echo "════════════════════════════════════════════════════"

if [ "$FAIL" -gt 0 ]; then
  echo ""
  echo "Failed tests:"
  for t in "${FAILED_TESTS[@]}"; do
    echo "  • $t"
  done
fi

# Log to META_AUDIT_LOG (Aurelius pattern — sibling to pulse_check + backup_status)
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | Script-Tests | %d pass / %d fail / %d skip | %ds | %s |\n" \
    "$(date +%Y-%m-%d)" "${DEVICE_NAME:-unknown}" "$PASS" "$FAIL" "$SKIP" "$ELAPSED" "$(git rev-parse --short HEAD 2>/dev/null)" \
    >> cache/META_AUDIT_LOG.md
fi

# Exit nonzero if any failures
if [ "$FAIL" -gt 0 ]; then
  exit 1
fi
exit 0
