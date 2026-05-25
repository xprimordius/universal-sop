#!/usr/bin/env bash
# 🌟 PRISTINE — Comprehensive Repository Investigation, Audit & Enhancement Sweep
# SP.23 PRISTINE | NEW 2026-05-22 | per user: "full thorough investigation, audit, enhancement overhaul to ensure pristine"
# Owner: Chiron (agents/chiron.md) — orchestrate quarterly OR on-demand before major release
#
# 10 sub-audits beyond E2E's 9 checks:
#   1. E2E foundational sweep (delegates to scripts/e2e_verify.sh)
#   2. Protocol coverage drift (delegates to scripts/protocol_coverage_audit.sh)
#   3. BACKUP_LOG integrity — every row's path actually exists on disk
#   4. Dead reference detection — file paths in .md docs that don't exist
#   5. Script permission audit — all .sh files are +x
#   6. Cross-file version consistency — header/footer/rule stamps agree
#   7. Git remote integrity — origin URL + distance 0/0
#   8. Hook integrity — core.hooksPath = .githooks
#   9. Chiron freshness — last Chiron run within 35 days
#  10. Backup file orphan detection — backups/ files not in BACKUP_LOG (mild — informational)
#
# Aggregates to one verdict:
#   ✅ PRISTINE — 0 issues
#   ⚠️ NEAR-PRISTINE — 1–4 minor
#   🟡 IMPERFECT — 5–19 issues
#   🔴 DEGRADED — 20+ issues
#
# Exit: 0 always (report-only). Logs to META_AUDIT_LOG.

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
DATE=$(date +%Y-%m-%d)
TS=$(date +%H:%M)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

REPORT_DIR="cache/chiron"
mkdir -p "$REPORT_DIR"
REPORT="$REPORT_DIR/PRISTINE_REPORT_${DATE}_$(date +%H%M).md"
TMP=$(mktemp -d)

echo "═══════════════════════════════════════════════════════════════"
echo "🌟 PRISTINE AUDIT (SP.23) — Investigation · Audit · Enhancement"
echo "═══════════════════════════════════════════════════════════════"
echo "Device: $DEVICE  ·  Date: $DATE $TS  ·  Commit: $COMMIT"
echo "Report: $REPORT"
echo ""

# Counters
ISSUES_E2E=0
ISSUES_COV=0
ISSUES_BACKUP_INT=0
ISSUES_DEAD_REFS=0
ISSUES_PERMS=0
ISSUES_VERSION=0
ISSUES_REMOTE=0
ISSUES_HOOKS=0
ISSUES_CHIRON=0
INFO_ORPHANS=0

# ===========================================================
# 1/10 — E2E FOUNDATIONAL SWEEP
# ===========================================================
echo "── 1/10 E2E Foundational Sweep ────────────────────────"
if [ -x scripts/e2e_verify.sh ]; then
  bash scripts/e2e_verify.sh > "$TMP/e2e.log" 2>&1
  ISSUES_E2E=$(grep -oE "Failed:[[:space:]]+[0-9]+" "$TMP/e2e.log" | grep -oE "[0-9]+" | head -1)
  ISSUES_E2E=${ISSUES_E2E:-0}
  PASS=$(grep -oE "Passed:[[:space:]]+[0-9]+" "$TMP/e2e.log" | grep -oE "[0-9]+" | head -1)
  echo "  E2E result: $PASS pass / $ISSUES_E2E fail"
else
  echo "  ⚠️ scripts/e2e_verify.sh not found"
  ISSUES_E2E=1
fi
echo ""

# ===========================================================
# 2/10 — PROTOCOL COVERAGE DRIFT
# ===========================================================
echo "── 2/10 Protocol Coverage Drift (Direction A + B) ─────"
if [ -x scripts/protocol_coverage_audit.sh ]; then
  bash scripts/protocol_coverage_audit.sh > "$TMP/cov.log" 2>&1
  ISSUES_COV=$(grep -oE "Drift candidates total: [0-9]+" "$TMP/cov.log" | grep -oE "[0-9]+$" | head -1)
  ISSUES_COV=${ISSUES_COV:-0}
  echo "  Drift candidates: $ISSUES_COV"
else
  echo "  ⚠️ scripts/protocol_coverage_audit.sh not found"
fi
echo ""

# ===========================================================
# 3/10 — BACKUP_LOG INTEGRITY (every row path exists)
# ===========================================================
echo "── 3/10 BACKUP_LOG Integrity ──────────────────────────"
if [ -f cache/BACKUP_LOG.md ]; then
  MISSING_PATHS=""
  while IFS= read -r line; do
    # Extract last pipe-delimited field (backup path)
    path=$(echo "$line" | awk -F'|' '{gsub(/^ +| +$/, "", $(NF-1)); print $(NF-1)}')
    [ -z "$path" ] && continue
    [[ "$path" == "N/A"* ]] && continue
    [[ "$path" == "📁 backup path"* ]] && continue
    [[ "$path" != backups/* ]] && continue
    if [ ! -f "$path" ]; then
      ISSUES_BACKUP_INT=$((ISSUES_BACKUP_INT+1))
      MISSING_PATHS+="    • $path\n"
    fi
  done < <(grep -E "^\|[[:space:]]*[0-9]+[[:space:]]*\|" cache/BACKUP_LOG.md)
  echo "  Missing backup files: $ISSUES_BACKUP_INT"
  [ "$ISSUES_BACKUP_INT" -gt 0 ] && [ "$ISSUES_BACKUP_INT" -lt 10 ] && printf "$MISSING_PATHS"
else
  echo "  ⚠️ cache/BACKUP_LOG.md not found"
  ISSUES_BACKUP_INT=1
fi
echo ""

# ===========================================================
# 4/10 — DEAD REFERENCES IN DOCS (v1.0: top-level + key cache only)
# ===========================================================
echo "── 4/10 Dead References in Docs ───────────────────────"
# Scope: only top-level .md + 4 key cache/ docs (fast on Windows FS)
# v2.0 TODO: recursive scan of agents/ + cache/refine/ + cache/chiron/ once paths-list-format is well-defined
DEAD_LIST=""
DOC_LIST=(
  README.md SESSION_START.md MANDATORY_TIGHT_LOOP.md UNIVERSAL_SOP_PROMPT.md
  PROTOCOLS_REFERENCE.md
  USER_PROFILE.md SOP_GUIDE.md DEVICE_REGISTRY.md
  cache/SESSION_STATE.md cache/FAILURE_LEDGER.md cache/SIR_LOG.md
)
# Excluded from dead-ref check (intentional historical/legacy/proposed references):
#   - CLAUDE.md (LEGACY ZONE — preserves APW-era references on purpose)
#   - cache/CONTINUATION.md (cumulative session log — references files from multiple sessions, some renamed)
#   - CONTINUATION_POINTER.md (handoff doc — may reference proposed-but-not-yet-shipped items)
#   - QUINTESSENCE_ROADMAP.md (by-design: lists 32+ proposed/deferred files like scripts/cross_model_audit.sh, cache/DECISIONS_INDEX.md)
for md in "${DOC_LIST[@]}"; do
  [ -f "$md" ] || continue
  while IFS= read -r ref; do
    ref=$(echo "$ref" | tr -d '`')
    [ -z "$ref" ] && continue
    [[ "$ref" == /* ]] && continue
    [[ "$ref" == http* ]] && continue
    [[ "$ref" == *@* ]] && continue
    # Smarter exclusions (NEW 2026-05-23 — autonomous PRISTINE drive):
    # External cross-pollination refs (other repos in xprimordius/ org)
    [[ "$ref" == xprimordius/* ]] && continue
    # Local config (.claude/settings.json — may or may not be tracked)
    [[ "$ref" == .claude/* ]] && continue
    # Template placeholders (YYYY-MM-DD patterns, etc.)
    [[ "$ref" == *YYYY-MM-DD* ]] && continue
    [[ "$ref" == *"<"* ]] && continue
    # Smarter path resolution: try common locations
    if [ -e "$ref" ] || [ -e "$(dirname "$md")/$ref" ] || \
       [ -e "scripts/$ref" ] || [ -e "cache/$ref" ] || \
       [ -e "cache/refine/$ref" ] || [ -e "cache/chiron/$ref" ] || \
       [ -e "agents/$ref" ] || [ -e ".githooks/$ref" ] || \
       [ -e "chat_archive/$ref" ] || [ -e "scripts/scheduler/$ref" ]; then
      : # found — skip
    else
      ISSUES_DEAD_REFS=$((ISSUES_DEAD_REFS+1))
      DEAD_LIST+="    • $ref  (in $md)\n"
    fi
  done < <(grep -oE '`[a-zA-Z0-9_/.-]+\.(md|sh|py|html|bat|json|yml|yaml)`' "$md" 2>/dev/null | sort -u | head -50)
done
echo "  Dead references in ${#DOC_LIST[@]} top-tier docs: $ISSUES_DEAD_REFS"
[ "$ISSUES_DEAD_REFS" -gt 0 ] && [ "$ISSUES_DEAD_REFS" -lt 8 ] && printf "$DEAD_LIST"
echo ""

# ===========================================================
# 5/10 — SCRIPT PERMISSION AUDIT
# ===========================================================
echo "── 5/10 Script Permission Audit ────────────────────────"
NOT_EXEC_LIST=""
for script in scripts/*.sh; do
  [ -f "$script" ] || continue
  if [ ! -x "$script" ]; then
    ISSUES_PERMS=$((ISSUES_PERMS+1))
    NOT_EXEC_LIST+="    • $script\n"
  fi
done
echo "  Non-executable .sh files: $ISSUES_PERMS"
[ "$ISSUES_PERMS" -gt 0 ] && printf "$NOT_EXEC_LIST"
echo ""

# ===========================================================
# 6/10 — CROSS-FILE VERSION CONSISTENCY (spot-checks)
# ===========================================================
echo "── 6/10 Cross-File Version Consistency ────────────────"
# MANDATORY_TIGHT_LOOP self-drift (header vs rule vs footer)
if [ -f MANDATORY_TIGHT_LOOP.md ]; then
  HEADER_VER=$(grep -oE "VERSION: [0-9.]+" MANDATORY_TIGHT_LOOP.md | head -1 | grep -oE "[0-9.]+")
  RULE2_VER=$(grep -oE "Tight Loop — v[0-9.]+" MANDATORY_TIGHT_LOOP.md | head -1 | grep -oE "[0-9.]+")
  RULE3_VER=$(grep -oE "PULSE CHECK \(v[0-9.]+" MANDATORY_TIGHT_LOOP.md | head -1 | grep -oE "[0-9.]+")
  FOOTER_VER=$(grep -oE "MANDATORY_TIGHT_LOOP\.md v[0-9.]+" MANDATORY_TIGHT_LOOP.md | tail -1 | grep -oE "[0-9.]+$")
  echo "  MANDATORY_TIGHT_LOOP versions:"
  echo "    Header:   ${HEADER_VER:-?}"
  echo "    Rule 2:   ${RULE2_VER:-?}"
  echo "    Rule 3:   ${RULE3_VER:-?}"
  echo "    Footer:   ${FOOTER_VER:-?}"
  # All four should agree
  if [ -n "$HEADER_VER" ] && [ -n "$RULE2_VER" ] && [ -n "$FOOTER_VER" ]; then
    if [ "$HEADER_VER" != "$RULE2_VER" ] || [ "$HEADER_VER" != "$FOOTER_VER" ] || [ "$RULE2_VER" != "$RULE3_VER" ]; then
      ISSUES_VERSION=$((ISSUES_VERSION+1))
      echo "    ⚠️ VERSION DRIFT detected"
    else
      echo "    ✅ Versions agree"
    fi
  fi
fi
echo ""

# ===========================================================
# 7/10 — GIT REMOTE INTEGRITY
# ===========================================================
echo "── 7/10 Git Remote Integrity ──────────────────────────"
REMOTE_URL=$(git remote get-url origin 2>/dev/null)
EXPECTED_REMOTE="https://github.com/xprimordius/universal-sop.git"
if [ "$REMOTE_URL" = "$EXPECTED_REMOTE" ]; then
  echo "  Origin URL: ✅ $REMOTE_URL"
else
  echo "  Origin URL: ⚠️ $REMOTE_URL"
  echo "                 expected: $EXPECTED_REMOTE"
  ISSUES_REMOTE=$((ISSUES_REMOTE+1))
fi
git fetch --quiet origin main 2>/dev/null
DISTANCE=$(git rev-list --left-right --count HEAD...origin/main 2>/dev/null)
LOCAL_AHEAD=$(echo "$DISTANCE" | awk '{print $1}')
REMOTE_AHEAD=$(echo "$DISTANCE" | awk '{print $2}')
echo "  Distance (local ↔ origin): $LOCAL_AHEAD ↔ $REMOTE_AHEAD"
if [ "$REMOTE_AHEAD" -gt 0 ]; then
  echo "  ⚠️ Remote has unpulled commits"
  ISSUES_REMOTE=$((ISSUES_REMOTE+1))
fi
echo ""

# ===========================================================
# 8/10 — HOOK INTEGRITY
# ===========================================================
echo "── 8/10 Git Hook Integrity ────────────────────────────"
HOOKS_PATH=$(git config --get core.hooksPath 2>/dev/null)
if [ "$HOOKS_PATH" = ".githooks" ]; then
  echo "  core.hooksPath: ✅ .githooks"
else
  echo "  core.hooksPath: ⚠️ '$HOOKS_PATH' (expected .githooks)"
  ISSUES_HOOKS=$((ISSUES_HOOKS+1))
fi
# Verify both hook files exist + executable
for hook in pre-commit pre-push; do
  if [ ! -f ".githooks/$hook" ]; then
    echo "  ⚠️ .githooks/$hook missing"
    ISSUES_HOOKS=$((ISSUES_HOOKS+1))
  elif [ ! -x ".githooks/$hook" ]; then
    echo "  ⚠️ .githooks/$hook not executable"
    ISSUES_HOOKS=$((ISSUES_HOOKS+1))
  fi
done
echo "  Hook issues: $ISSUES_HOOKS"
echo ""

# ===========================================================
# 9/10 — CHIRON FRESHNESS
# ===========================================================
echo "── 9/10 Chiron Freshness ──────────────────────────────"
if ls cache/chiron/CHIRON_REPORT_*.md >/dev/null 2>&1; then
  LAST_REPORT=$(ls -1 cache/chiron/CHIRON_REPORT_*.md | sort | tail -1)
  LAST_DATE=$(basename "$LAST_REPORT" | grep -oE "20[0-9]{2}-[0-9]{2}-[0-9]{2}" | head -1)
  echo "  Last Chiron report: $LAST_REPORT"
  if [ -n "$LAST_DATE" ]; then
    DAYS_AGO=$(( ($(date +%s) - $(date -d "$LAST_DATE" +%s 2>/dev/null || echo 0)) / 86400 ))
    echo "  Age: ${DAYS_AGO} days"
    if [ "$DAYS_AGO" -gt 35 ]; then
      echo "  ⚠️ Chiron run stale (>35 days)"
      ISSUES_CHIRON=$((ISSUES_CHIRON+1))
    fi
  fi
else
  echo "  ⚠️ No Chiron report found"
  ISSUES_CHIRON=$((ISSUES_CHIRON+1))
fi
echo ""

# ===========================================================
# 10/10 — BACKUP FILE ORPHAN DETECTION (informational)
# ===========================================================
echo "── 10/10 Backup File Orphan Detection (informational) ─"
ORPHAN_LIST=""
for bkfile in backups/*; do
  [ -f "$bkfile" ] || continue
  base=$(basename "$bkfile")
  if ! grep -qF "$base" cache/BACKUP_LOG.md 2>/dev/null; then
    INFO_ORPHANS=$((INFO_ORPHANS+1))
    ORPHAN_LIST+="    • $base\n"
  fi
done
echo "  Orphan backup files (not in BACKUP_LOG): $INFO_ORPHANS"
[ "$INFO_ORPHANS" -gt 0 ] && [ "$INFO_ORPHANS" -lt 10 ] && printf "$ORPHAN_LIST"
echo ""

# ===========================================================
# AGGREGATE VERDICT
# ===========================================================
TOTAL_ISSUES=$((ISSUES_E2E + ISSUES_COV + ISSUES_BACKUP_INT + ISSUES_DEAD_REFS + ISSUES_PERMS + ISSUES_VERSION + ISSUES_REMOTE + ISSUES_HOOKS + ISSUES_CHIRON))

if [ "$TOTAL_ISSUES" -eq 0 ]; then
  VERDICT="✅ PRISTINE — 0 issues across 9 audit dimensions"
elif [ "$TOTAL_ISSUES" -lt 5 ]; then
  VERDICT="⚠️  NEAR-PRISTINE — $TOTAL_ISSUES minor issue(s)"
elif [ "$TOTAL_ISSUES" -lt 20 ]; then
  VERDICT="🟡 IMPERFECT — $TOTAL_ISSUES issues"
else
  VERDICT="🔴 DEGRADED — $TOTAL_ISSUES issues"
fi

echo "═══════════════════════════════════════════════════════════════"
echo "📊 PRISTINE AUDIT — VERDICT"
echo "═══════════════════════════════════════════════════════════════"
printf "  %-30s %d\n" "1/10 E2E failures"            "$ISSUES_E2E"
printf "  %-30s %d\n" "2/10 Coverage drift"           "$ISSUES_COV"
printf "  %-30s %d\n" "3/10 Missing backup files"     "$ISSUES_BACKUP_INT"
printf "  %-30s %d\n" "4/10 Dead refs in docs"        "$ISSUES_DEAD_REFS"
printf "  %-30s %d\n" "5/10 Non-executable scripts"   "$ISSUES_PERMS"
printf "  %-30s %d\n" "6/10 Version drift"            "$ISSUES_VERSION"
printf "  %-30s %d\n" "7/10 Remote integrity issues"  "$ISSUES_REMOTE"
printf "  %-30s %d\n" "8/10 Hook integrity issues"    "$ISSUES_HOOKS"
printf "  %-30s %d\n" "9/10 Chiron freshness issues"  "$ISSUES_CHIRON"
printf "  %-30s %d (informational)\n" "10/10 Orphan backups" "$INFO_ORPHANS"
echo ""
echo "  $VERDICT"
echo ""
echo "  Report: $REPORT"
echo "═══════════════════════════════════════════════════════════════"

# ===========================================================
# WRITE REPORT FILE
# ===========================================================
{
  echo "# 🌟 PRISTINE Audit Report"
  echo ""
  echo "**Device:** $DEVICE"
  echo "**Date:** $DATE $TS"
  echo "**Commit:** $COMMIT"
  echo "**Verdict:** $VERDICT"
  echo ""
  echo "## Sub-audit results"
  echo ""
  echo "| # | Audit | Issues |"
  echo "|:-:|---|:-:|"
  echo "| 1/10 | E2E foundational sweep | $ISSUES_E2E |"
  echo "| 2/10 | Protocol coverage drift | $ISSUES_COV |"
  echo "| 3/10 | BACKUP_LOG integrity | $ISSUES_BACKUP_INT |"
  echo "| 4/10 | Dead refs in docs | $ISSUES_DEAD_REFS |"
  echo "| 5/10 | Script permissions | $ISSUES_PERMS |"
  echo "| 6/10 | Version consistency | $ISSUES_VERSION |"
  echo "| 7/10 | Git remote integrity | $ISSUES_REMOTE |"
  echo "| 8/10 | Hook integrity | $ISSUES_HOOKS |"
  echo "| 9/10 | Chiron freshness | $ISSUES_CHIRON |"
  echo "| 10/10 | Backup orphans (info) | $INFO_ORPHANS |"
  echo ""
  echo "**Total issues:** $TOTAL_ISSUES"
  echo ""
  echo "## E2E output"
  echo '```'
  cat "$TMP/e2e.log" 2>/dev/null | tail -20
  echo '```'
  echo ""
  echo "## Coverage audit output"
  echo '```'
  cat "$TMP/cov.log" 2>/dev/null | tail -30
  echo '```'
  echo ""
  echo "## Enhancement proposals (auto)"
  [ "$ISSUES_BACKUP_INT" -gt 0 ] && echo "- 🔴 Restore missing backup files OR remove dead BACKUP_LOG rows (data-integrity priority)"
  [ "$ISSUES_DEAD_REFS" -gt 0 ] && echo "- 🟡 Fix dead refs in docs (run grep + Edit for each)"
  [ "$ISSUES_PERMS" -gt 0 ] && echo "- 🟢 chmod +x missing scripts"
  [ "$ISSUES_VERSION" -gt 0 ] && echo "- 🟡 Reconcile MANDATORY_TIGHT_LOOP version stamps"
  [ "$ISSUES_HOOKS" -gt 0 ] && echo "- 🔴 Run 'git config core.hooksPath .githooks' OR re-run setup_device.sh"
  [ "$ISSUES_CHIRON" -gt 0 ] && echo "- 🟡 Run 'bash scripts/chiron_run.sh' (or wait for monthly schtasks fire)"
  [ "$INFO_ORPHANS" -gt 0 ] && echo "- 🟢 Either log orphan backups in BACKUP_LOG OR delete them"
  [ "$TOTAL_ISSUES" -eq 0 ] && echo "- ✅ Nothing to enhance — repo is pristine"
  echo ""
  echo "## Owner"
  echo "[\`agents/chiron.md\`](../../agents/chiron.md)"
  echo ""
  echo "## Next PRISTINE run"
  echo "Suggested: quarterly OR before any major release / quintessence milestone."
} > "$REPORT"

# Log to META_AUDIT_LOG
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | PRISTINE | issues:%d (%d/%d/%d/%d/%d/%d/%d/%d/%d) | %s |\n" \
    "$DATE" "$DEVICE" "$TOTAL_ISSUES" \
    "$ISSUES_E2E" "$ISSUES_COV" "$ISSUES_BACKUP_INT" "$ISSUES_DEAD_REFS" \
    "$ISSUES_PERMS" "$ISSUES_VERSION" "$ISSUES_REMOTE" "$ISSUES_HOOKS" "$ISSUES_CHIRON" \
    "$COMMIT" \
    >> cache/META_AUDIT_LOG.md
fi

rm -rf "$TMP"
exit 0
