#!/usr/bin/env bash
# bootstrap_verify.sh — Comprehensive Boot-Up Self-Test
# F.17 fix 2026-05-21 | Per Alan: "checklist for literally everything in detail with check marks"
#
# Runs every check that BOOTSTRAP_CHECK.md specifies and prints a filled-in
# checklist to stdout. AI bootstrap surfaces this output verbatim in STEP 2.
#
# Exit codes:
#   0 = all checks passed
#   1 = one or more required checks failed
#
# Usage:
#   bash scripts/bootstrap_verify.sh           # human-readable checklist
#   bash scripts/bootstrap_verify.sh --quiet   # summary only (pass/fail counts)

set -u

QUIET=0
[[ "${1:-}" == "--quiet" ]] && QUIET=1

PASS=0
FAIL=0
WARN=0
FAILED_ITEMS=()

# --- helpers ---
check_file() {
  local path="$1" label="$2"
  if [[ -f "$path" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ✅ $label"
    PASS=$((PASS+1))
  else
    [[ $QUIET -eq 0 ]] && echo "  ❌ $label  → MISSING: $path"
    FAIL=$((FAIL+1))
    FAILED_ITEMS+=("$label")
  fi
}

check_executable() {
  local path="$1" label="$2"
  if [[ -x "$path" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ✅ $label"
    PASS=$((PASS+1))
  elif [[ -f "$path" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ⚠️  $label  → exists but NOT executable: $path"
    WARN=$((WARN+1))
  else
    [[ $QUIET -eq 0 ]] && echo "  ❌ $label  → MISSING: $path"
    FAIL=$((FAIL+1))
    FAILED_ITEMS+=("$label")
  fi
}

check_dir() {
  local path="$1" label="$2"
  if [[ -d "$path" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ✅ $label"
    PASS=$((PASS+1))
  else
    [[ $QUIET -eq 0 ]] && echo "  ❌ $label  → MISSING: $path"
    FAIL=$((FAIL+1))
    FAILED_ITEMS+=("$label")
  fi
}

check_grep() {
  local pattern="$1" file="$2" label="$3"
  if [[ -f "$file" ]] && grep -qE "$pattern" "$file"; then
    [[ $QUIET -eq 0 ]] && echo "  ✅ $label"
    PASS=$((PASS+1))
  else
    [[ $QUIET -eq 0 ]] && echo "  ❌ $label  → not found in $file"
    FAIL=$((FAIL+1))
    FAILED_ITEMS+=("$label")
  fi
}

count_grep() {
  local pattern="$1" file="$2" expected="$3" label="$4"
  if [[ ! -f "$file" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ❌ $label  → file missing: $file"
    FAIL=$((FAIL+1)); FAILED_ITEMS+=("$label"); return
  fi
  local actual
  actual=$(grep -cE "$pattern" "$file")
  if [[ "$actual" -eq "$expected" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ✅ $label ($actual found)"
    PASS=$((PASS+1))
  else
    [[ $QUIET -eq 0 ]] && echo "  ⚠️  $label (expected $expected, found $actual)"
    WARN=$((WARN+1))
  fi
}

[[ $QUIET -eq 0 ]] && cat <<HEADER
================================================================
🚀 BOOTSTRAP SELF-TEST — Universal Output SOP v1.3
================================================================
Per Alan (F.17): "checklist for literally everything in detail
with check marks. Full transparency. Embedded in the file itself."

Run at session start. AI surfaces this output verbatim in STEP 2.
================================================================

HEADER

# === 1. IDENTITY & GIT STATE ===
[[ $QUIET -eq 0 ]] && echo "🆔 IDENTITY & GIT STATE"
DEVICE_NAME=$(git config --get user.name 2>/dev/null || echo "")
DEVICE_EMAIL=$(git config --get user.email 2>/dev/null || echo "")
HOOKS_PATH=$(git config --get core.hooksPath 2>/dev/null || echo "")
BRANCH=$(git branch --show-current 2>/dev/null || echo "")
SYNC_STATUS=$(git status -uno --porcelain=v2 --branch 2>/dev/null | grep "^# branch.ab" || echo "")

if [[ -n "$DEVICE_NAME" && "$DEVICE_NAME" == *"("*")"* ]]; then
  [[ $QUIET -eq 0 ]] && echo "  ✅ Device name registered: $DEVICE_NAME"
  PASS=$((PASS+1))
else
  [[ $QUIET -eq 0 ]] && echo "  ❌ Device name not in 'Alan (device)' format: '$DEVICE_NAME'"
  FAIL=$((FAIL+1)); FAILED_ITEMS+=("device-name")
fi

if [[ -n "$DEVICE_EMAIL" && "$DEVICE_EMAIL" == *"+"* ]]; then
  [[ $QUIET -eq 0 ]] && echo "  ✅ Device email tagged: $DEVICE_EMAIL"
  PASS=$((PASS+1))
else
  [[ $QUIET -eq 0 ]] && echo "  ❌ Device email not tagged: '$DEVICE_EMAIL'"
  FAIL=$((FAIL+1)); FAILED_ITEMS+=("device-email")
fi

if [[ "$HOOKS_PATH" == ".githooks" ]]; then
  [[ $QUIET -eq 0 ]] && echo "  ✅ Pre-commit hook path active: .githooks"
  PASS=$((PASS+1))
else
  [[ $QUIET -eq 0 ]] && echo "  ⚠️  core.hooksPath not set to .githooks (got: '$HOOKS_PATH')"
  WARN=$((WARN+1))
fi

if [[ "$BRANCH" == "main" ]]; then
  [[ $QUIET -eq 0 ]] && echo "  ✅ Branch: main"
  PASS=$((PASS+1))
else
  [[ $QUIET -eq 0 ]] && echo "  ⚠️  Branch is '$BRANCH' (expected main)"
  WARN=$((WARN+1))
fi

[[ $QUIET -eq 0 ]] && echo ""

# === 2. ACTIVE AGENTS (4) ===
[[ $QUIET -eq 0 ]] && echo "🤖 ACTIVE AGENTS (4 — post-F4+F5 fusion)"
check_file "agents/controller.md"          "Controller — orchestration + cache manager (F4 fusion)"
check_file "agents/validator-merged.md"    "Validator-Merged — Layer 1 (POVP + completeness + simplicity + cross-ref)"
check_file "agents/karen-reality-check.md" "Karen — Layer 2 reality check + script enforcement (F.16)"
check_file "agents/paradox-resolver.md"    "Paradox Resolver — SCIO/APW tension (on-demand)"
[[ $QUIET -eq 0 ]] && echo ""

# === 3. SOP ARCHITECTURE ===
[[ $QUIET -eq 0 ]] && echo "📋 SOP ARCHITECTURE"
check_file "UNIVERSAL_SOP_PROMPT.md" "UNIVERSAL_SOP_PROMPT.md (active rulebook v1.3)"
check_file "PROTOCOLS_REFERENCE.md"  "PROTOCOLS_REFERENCE.md (full names + acronyms)"
check_file "STANDALONE_SOP.md"       "STANDALONE_SOP.md (self-contained external rulebook, MIT)"
check_file "SESSION_START.md"        "SESSION_START.md (bootstrap entry point)"
check_file "CLAUDE.md"               "CLAUDE.md (redirect to SESSION_START)"
check_file "USER_PROFILE.md"         "USER_PROFILE.md (Alan's communication preferences)"
check_file "DEVICE_REGISTRY.md"      "DEVICE_REGISTRY.md (multi-device naming registry)"
check_file "MULTI_DEVICE_GIT_PROTOCOL.md" "MULTI_DEVICE_GIT_PROTOCOL.md (7 Golden Rules)"
[[ $QUIET -eq 0 ]] && echo ""

# === 4. SUBSOPS (16) — Verify Each Named ===
[[ $QUIET -eq 0 ]] && echo "🧩 SUBSOPS — All 16 expected in PROTOCOLS_REFERENCE.md"
count_grep "^<summary><b>SP\.[0-9]+" PROTOCOLS_REFERENCE.md 16 "SP.1–SP.16 entries present"
check_grep "SP\.1 .*MagNet"      PROTOCOLS_REFERENCE.md "SP.1 MagNet (Magnetic Visual Engagement Protocol)"
check_grep "SP\.2 .*Door Scan"   PROTOCOLS_REFERENCE.md "SP.2 Door Scan (Door Scanning Pattern Protocol)"
check_grep "SP\.3 .*TTE"         PROTOCOLS_REFERENCE.md "SP.3 TTE (Token Threshold Engine)"
check_grep "SP\.4 .*SCP"         PROTOCOLS_REFERENCE.md "SP.4 SCP (System Change Protocol)"
check_grep "SP\.5 .*FSP"         PROTOCOLS_REFERENCE.md "SP.5 FSP (Fidelity Substantiation Protocol)"
check_grep "SP\.6 .*IAC"         PROTOCOLS_REFERENCE.md "SP.6 IAC (Intent Alignment Check)"
check_grep "SP\.7 .*Insights"    PROTOCOLS_REFERENCE.md "SP.7 Insights Protocol"
check_grep "SP\.8 .*Protocol Visibility" PROTOCOLS_REFERENCE.md "SP.8 Protocol Visibility Protocol"
check_grep "SP\.9 .*FE"          PROTOCOLS_REFERENCE.md "SP.9 FE (Foresight Engine)"
check_grep "SP\.10 .*SCC"        PROTOCOLS_REFERENCE.md "SP.10 SCC (Self-Compliance Check)"
check_grep "SP\.11 .*QAC"        PROTOCOLS_REFERENCE.md "SP.11 QAC (Quality Assurance Check)"
check_grep "SP\.12 .*HFR"        PROTOCOLS_REFERENCE.md "SP.12 HFR (Honest Failure Report)"
check_grep "SP\.13 .*SHR"        PROTOCOLS_REFERENCE.md "SP.13 SHR (System Health Report)"
check_grep "SP\.14 .*RPT"        PROTOCOLS_REFERENCE.md "SP.14 RPT (Repeated Prompt Tracker)"
check_grep "SP\.15 .*EEP"        PROTOCOLS_REFERENCE.md "SP.15 EEP (Execution Enforcement Protocol)"
check_grep "SP\.16 .*PCG"        PROTOCOLS_REFERENCE.md "SP.16 PCG (Prompt Completion Gate)"
[[ $QUIET -eq 0 ]] && echo ""

# === 5. ENSURANCE SYSTEM (4) ===
[[ $QUIET -eq 0 ]] && echo "🛡️  ENSURANCE SYSTEM — All 4 expected"
count_grep "^<summary><b>EN\.[0-9]+" PROTOCOLS_REFERENCE.md 4 "EN.1–EN.4 entries present"
check_grep "EN\.1 .*Output Skeleton" PROTOCOLS_REFERENCE.md "EN.1 Output Skeleton (Structural Anti-Decay)"
check_grep "EN\.2 .*Priority 10"     PROTOCOLS_REFERENCE.md "EN.2 Priority 10 (Cognitive Load Reduction)"
check_grep "EN\.3 .*Checkpoint"      PROTOCOLS_REFERENCE.md "EN.3 Checkpoint Cycle (Attention Reset)"
check_grep "EN\.4 .*Pulse Check"     PROTOCOLS_REFERENCE.md "EN.4 Pulse Check (Compliance Pulse Check)"
[[ $QUIET -eq 0 ]] && echo ""

# === 6. ACTIVE CACHE (5) ===
[[ $QUIET -eq 0 ]] && echo "🗄️  ACTIVE CACHE FILES (post-F2 fusion — 5 files)"
check_file "cache/SESSION_STATE.md"   "SESSION_STATE.md (current position + decisions + tokens)"
check_file "cache/CONTINUATION.md"    "CONTINUATION.md (latest session handoff)"
check_file "cache/BACKUP_LOG.md"      "BACKUP_LOG.md (all backups indexed)"
check_file "cache/FAILURE_LEDGER.md"  "FAILURE_LEDGER.md (unified REPEAT + FAILURE log, F8 fusion)"
check_file "cache/RPT_LOG.md"         "RPT_LOG.md (deprecated redirect → FAILURE_LEDGER)"
check_file "cache/BOOTSTRAP_CHECK.md" "BOOTSTRAP_CHECK.md (this self-test spec)"
check_dir  "cache/legacy"             "cache/legacy/ (APW-era files archived via F1+F2)"
check_dir  "cache/backups"            "cache/backups/ (historical snapshots)"
[[ $QUIET -eq 0 ]] && echo ""

# === 7. SCRIPTS (6) ===
[[ $QUIET -eq 0 ]] && echo "⚙️  SCRIPTS — Mechanical enforcement layer"
check_executable "scripts/compliance_check.sh"     "compliance_check.sh (Rule #11 full-name enforcement, F.14)"
check_executable "scripts/consistency_check.sh"    "consistency_check.sh (version drift detection)"
check_executable "scripts/setup_device.sh"         "setup_device.sh (one-command device registration, F.15)"
check_executable "scripts/append_only_check.sh"    "append_only_check.sh (history file protection, F.15)"
check_executable "scripts/check_device_activity.sh" "check_device_activity.sh (multi-device audit, F.15)"
check_executable "chat_archive/archive_chat.sh"    "archive_chat.sh (session JSONL snapshot)"
check_executable "scripts/bootstrap_verify.sh"     "bootstrap_verify.sh (THIS script — F.17)"
[[ $QUIET -eq 0 ]] && echo ""

# === 8. GIT HOOKS ===
[[ $QUIET -eq 0 ]] && echo "🪝 GIT HOOKS"
check_executable ".githooks/pre-commit" "pre-commit hook (mechanical enforcement, F.16 — runs compliance + consistency + append-only)"
[[ $QUIET -eq 0 ]] && echo ""

# === 9. FUSION EXECUTION STATUS ===
[[ $QUIET -eq 0 ]] && echo "🔀 FUSION STATUS (Phase A + B — all SAFE fusions)"
check_dir "cache/legacy" "F1 executed — historical SOPs in cache/legacy/"
if [[ -d "cache/legacy" ]] && [[ -f "cache/legacy/APW_MASTER_CACHE.md" ]]; then
  [[ $QUIET -eq 0 ]] && echo "  ✅ F2 executed — APW caches archived"
  PASS=$((PASS+1))
else
  [[ $QUIET -eq 0 ]] && echo "  ❌ F2 not executed — APW_MASTER_CACHE.md not in legacy/"
  FAIL=$((FAIL+1)); FAILED_ITEMS+=("F2")
fi
check_file "agents/controller.md" "F4 executed — Controller exists (Oversight + Cache Manager fused)"
if [[ -d "agents/archive" ]]; then
  [[ $QUIET -eq 0 ]] && echo "  ✅ F5 executed — agents/archive/ exists (Jenny archived)"
  PASS=$((PASS+1))
else
  [[ $QUIET -eq 0 ]] && echo "  ❌ F5 not executed — agents/archive/ missing"
  FAIL=$((FAIL+1)); FAILED_ITEMS+=("F5")
fi
check_grep "F7 .*EXECUTED|F7 FUSION EXECUTED" PROTOCOLS_REFERENCE.md "F7 executed — Wrap-Up cluster formalized"
check_file "cache/FAILURE_LEDGER.md" "F8 executed — FAILURE_LEDGER unified RPT + HFR"
check_grep "Token System|TTE.*LTM"   PROTOCOLS_REFERENCE.md "F10 executed — TTE + LTM Token System documented"
check_grep "Visual System|F11"        PROTOCOLS_REFERENCE.md "F11 executed — MagNet + Door Scan + Protocol Visibility cluster"
[[ $QUIET -eq 0 ]] && echo ""

# === 10. GOAL TRACKING (F.13) ===
[[ $QUIET -eq 0 ]] && echo "🎯 GOAL TRACKING (F.13 — macro/micro in every step header)"
check_grep "MACRO GOAL"   cache/SESSION_STATE.md "MACRO goal section present in SESSION_STATE"
check_grep "MICRO GOAL"   cache/SESSION_STATE.md "MICRO goal section present in SESSION_STATE"
check_grep "GOAL STATUS" cache/SESSION_STATE.md "GOAL STATUS section present"
[[ $QUIET -eq 0 ]] && echo ""

# === 11. FAILURE LEDGER COUNT ===
[[ $QUIET -eq 0 ]] && echo "📊 FAILURE LEDGER"
LEDGER_COUNT=$(grep -cE "^<summary><b>F\.[0-9]+" cache/FAILURE_LEDGER.md 2>/dev/null || echo "0")
[[ $QUIET -eq 0 ]] && echo "  ℹ️  Failure entries logged: F.1–F.$LEDGER_COUNT ($LEDGER_COUNT total)"

# === 12. ON-DISK TRUTH vs HARNESS DRIFT ===
[[ $QUIET -eq 0 ]] && echo ""
[[ $QUIET -eq 0 ]] && echo "🔍 HARNESS DRIFT CHECK"
check_grep "v1\.3"           UNIVERSAL_SOP_PROMPT.md "UNIVERSAL_SOP_PROMPT version is v1.3 (NOT v3.9.2)"
check_grep "16 SubSOPs"      UNIVERSAL_SOP_PROMPT.md "16 SubSOPs claimed (NOT 32 D-rules)"

# === 13. MULTI-DEVICE SYNC STATE (F.18) ===
[[ $QUIET -eq 0 ]] && echo ""
[[ $QUIET -eq 0 ]] && echo "📡 MULTI-DEVICE SYNC STATE (F.18)"

# Check pre-push hook installed
check_executable ".githooks/pre-push" "pre-push hook (F.18 — blocks push if origin ahead)"
check_executable "scripts/safe_push.sh" "safe_push.sh (F.18 — atomic fetch+rebase+push wrapper)"

# Check sync state with remote (best-effort: skip if offline)
CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "")
if [[ -n "$CURRENT_BRANCH" ]] && git fetch --quiet origin "$CURRENT_BRANCH" 2>/dev/null; then
  LOCAL_SHA=$(git rev-parse HEAD 2>/dev/null || echo "")
  REMOTE_SHA=$(git rev-parse "origin/$CURRENT_BRANCH" 2>/dev/null || echo "")
  BASE_SHA=$(git merge-base HEAD "origin/$CURRENT_BRANCH" 2>/dev/null || echo "")

  if [[ -z "$REMOTE_SHA" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ℹ️  No origin/$CURRENT_BRANCH yet (first push)"
  elif [[ "$LOCAL_SHA" == "$REMOTE_SHA" ]]; then
    [[ $QUIET -eq 0 ]] && echo "  ✅ Local in sync with origin/$CURRENT_BRANCH"
    PASS=$((PASS+1))
  elif [[ "$LOCAL_SHA" == "$BASE_SHA" ]]; then
    BEHIND=$(git rev-list --count "$BASE_SHA..origin/$CURRENT_BRANCH")
    [[ $QUIET -eq 0 ]] && echo "  ⚠️  BEHIND origin/$CURRENT_BRANCH by $BEHIND commit(s) — run: git pull --ff-only"
    WARN=$((WARN+1))
  elif [[ "$REMOTE_SHA" == "$BASE_SHA" ]]; then
    AHEAD=$(git rev-list --count "$BASE_SHA..HEAD")
    [[ $QUIET -eq 0 ]] && echo "  ℹ️  AHEAD of origin/$CURRENT_BRANCH by $AHEAD commit(s) (local-only work)"
  else
    BEHIND=$(git rev-list --count "$BASE_SHA..origin/$CURRENT_BRANCH")
    AHEAD=$(git rev-list --count "$BASE_SHA..HEAD")
    [[ $QUIET -eq 0 ]] && echo "  ⚠️  DIVERGED: ahead $AHEAD, behind $BEHIND — run: bash scripts/safe_push.sh"
    WARN=$((WARN+1))
  fi
else
  [[ $QUIET -eq 0 ]] && echo "  ℹ️  Offline or fetch failed — skipping sync check"
fi

# === SUMMARY ===
[[ $QUIET -eq 0 ]] && cat <<SUMMARY

================================================================
📊 BOOT-UP RESULT
================================================================
   ✅ Passed:  $PASS
   ❌ Failed:  $FAIL
   ⚠️  Warning: $WARN
================================================================
SUMMARY

if [[ $QUIET -eq 1 ]]; then
  echo "BOOTSTRAP: PASS=$PASS FAIL=$FAIL WARN=$WARN"
fi

if [[ $FAIL -gt 0 ]]; then
  [[ $QUIET -eq 0 ]] && echo "🚨 FAILED ITEMS:"
  for item in "${FAILED_ITEMS[@]}"; do
    [[ $QUIET -eq 0 ]] && echo "   - $item"
  done
  [[ $QUIET -eq 0 ]] && echo ""
  [[ $QUIET -eq 0 ]] && echo "Action: investigate failures BEFORE confirming bootstrap to user."
  exit 1
fi

[[ $QUIET -eq 0 ]] && echo "✅ ALL SYSTEMS GO. Proceed with bootstrap confirmation."
exit 0
