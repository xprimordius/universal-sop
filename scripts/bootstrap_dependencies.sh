#!/usr/bin/env bash
# 🔧 BOOTSTRAP_DEPENDENCIES — Verify required CLI tools are installed
# Per F.60 (filed 2026-05-26 02:30 CDT — jq missing on aurelion silently degrades RULE 6 Stop hook)
# Closes the "tool dependency not verified at bootstrap" gap.
#
# WHAT THIS DOES:
#   Probes each required tool with `command -v` and reports MISSING.
#   Used by bootstrap_verify.sh (Section 0 — Foundational) and standalone.
#
# Required tools (REQUIRED — exit 1 if missing):
#   - bash 4+
#   - git
#   - grep, sed, awk (POSIX core)
#
# Strongly-recommended tools (WARN only — exit 0 with warning if missing):
#   - jq (output_stop_hook.sh jq path; falls back to grep with escaped-quote limitation)
#   - realpath OR readlink -f (invoke_sub_agent.sh absolute-path resolution; falls back to literal)
#   - timeout (e2e_verify.sh, pre-push hook; falls back to no-timeout)
#
# Usage:
#   bash scripts/bootstrap_dependencies.sh            # full report
#   bash scripts/bootstrap_dependencies.sh --quiet    # exit-code-only
#   bash scripts/bootstrap_dependencies.sh --strict   # treat WARN as FAIL too

set +e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/paths.sh" ]; then
  source "$SCRIPT_DIR/paths.sh" > /dev/null 2>&1
fi
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
cd "$PROJECT_ROOT" || exit 1

QUIET=0
STRICT=0
for arg in "$@"; do
  case "$arg" in
    --quiet) QUIET=1 ;;
    --strict) STRICT=1 ;;
    -h|--help)
      grep "^#" "$0" | head -25
      exit 0 ;;
  esac
done

declare -i MISSING_REQUIRED=0
declare -i MISSING_RECOMMENDED=0
declare -a STATUS_LINES=()

check_tool() {
  local tool="$1"
  local tier="$2"   # required | recommended
  local fallback="$3"
  local path
  path=$(command -v "$tool" 2>/dev/null)
  if [ -n "$path" ]; then
    local ver
    ver=$("$tool" --version 2>&1 | head -1 | head -c 80)
    [ -z "$ver" ] && ver="(no --version)"
    STATUS_LINES+=("[OK]|$tier|$tool|$path — $ver")
    return 0
  fi
  if [ "$tier" = "required" ]; then
    STATUS_LINES+=("[FAIL]|required|$tool|MISSING — install before any work proceeds")
    MISSING_REQUIRED=$((MISSING_REQUIRED+1))
  else
    STATUS_LINES+=("[WARN]|recommended|$tool|missing — fallback: $fallback")
    MISSING_RECOMMENDED=$((MISSING_RECOMMENDED+1))
  fi
  return 1
}

# Required tools
check_tool bash    required ""
check_tool git     required ""
check_tool grep    required ""
check_tool sed     required ""
check_tool awk     required ""

# Recommended tools — each has a documented fallback path
check_tool jq          recommended "grep with escaped-quote limitation (output_stop_hook.sh:78)"
check_tool realpath    recommended "literal path string (invoke_sub_agent.sh; non-portable across CWDs)"
check_tool timeout     recommended "no timeout wrapper (e2e_verify.sh / pre-push hook can hang on stuck subprocesses)"
check_tool curl        recommended "no GitHub-status check (curl https://www.githubstatus.com — F.59 diagnostics)"

# Output
if [ "$QUIET" -eq 0 ]; then
  echo "═══════════════════════════════════════════════════════════════"
  echo "🔧 BOOTSTRAP DEPENDENCIES — required + recommended CLI tools"
  echo "═══════════════════════════════════════════════════════════════"
  printf "%-8s %-12s %-12s %s\n" "Status" "Tier" "Tool" "Detail"
  printf "%-8s %-12s %-12s %s\n" "------" "------------" "------------" "----------------------"
  for line in "${STATUS_LINES[@]}"; do
    status=$(echo "$line" | cut -d'|' -f1)
    tier=$(echo "$line" | cut -d'|' -f2)
    tool=$(echo "$line" | cut -d'|' -f3)
    detail=$(echo "$line" | cut -d'|' -f4)
    printf "%-8s %-12s %-12s %s\n" "$status" "$tier" "$tool" "$detail"
  done
  echo ""
  echo "Summary: $MISSING_REQUIRED REQUIRED missing · $MISSING_RECOMMENDED RECOMMENDED missing"
  if [ "$MISSING_REQUIRED" -gt 0 ]; then
    echo "🚨 ABORT — install missing required tools before further work."
  elif [ "$MISSING_RECOMMENDED" -gt 0 ]; then
    if [ "$STRICT" -eq 1 ]; then
      echo "🚨 STRICT mode — recommended tools missing; treating as FAIL."
    else
      echo "⚠️  Recommended tools missing — fallbacks active; functionality degraded but not blocked."
    fi
  else
    echo "✅ All dependencies present."
  fi
  echo "═══════════════════════════════════════════════════════════════"
fi

if [ "$MISSING_REQUIRED" -gt 0 ]; then
  exit 1
fi
if [ "$STRICT" -eq 1 ] && [ "$MISSING_RECOMMENDED" -gt 0 ]; then
  exit 1
fi
exit 0
