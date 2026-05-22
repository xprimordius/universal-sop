#!/usr/bin/env bash
# 🔬 PROTOCOL COVERAGE AUDIT — Two-direction documentation-to-activity drift detection
# Per F.30 ledger entry | User-requested 2026-05-22 | Owner: Chiron (agents/chiron.md)
#
# DIRECTION A: Documented → Active
#   For each MANDATORY protocol, sample last N commits, check invocation pattern hit-rate.
#   Flags <50% as DORMANT (F.23 SP.9 pattern).
#
# DIRECTION B: Implementation → Formalized
#   For each scripts/*.sh + agents/*.md, check PROTOCOLS_REFERENCE.md for entry.
#   Flags missing entries as UNFORMALIZED (F.30 SP.22 pattern).
#
# Suggested cadence: monthly OR before any new SubSOP commit.
# Exit code: 0 always (report-only; flags ≠ failures).

set +e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

echo "═══════════════════════════════════════════════════════════════"
echo "🔬 PROTOCOL COVERAGE AUDIT"
echo "═══════════════════════════════════════════════════════════════"
echo "Device: $DEVICE  ·  Date: $DATE  ·  Commit: $COMMIT"
echo ""

# ============================================================
# DIRECTION A — Documented Mandatory → Active in recent outputs
# ============================================================
echo "── DIRECTION A: Documented MANDATORY protocols → Activity"
echo "   (sampling last 20 commits' messages + diffs)"
echo ""

# Protocol → grep pattern (broad heuristic — pattern that should appear if protocol fired)
declare -a MANDATORY_PROTOCOLS=(
  "SP.5  FSP   Fidelity Substantiation     |verified by|evidence:|fidelity"
  "SP.6  IAC   Intent Alignment Check      |Understanding Check|UC.[0-9]|verbatim"
  "SP.9  FE    Foresight Engine            |🔮 Foresight|FE.[0-9]"
  "SP.12 HFR   Honest Failure Report       |🚨 HFR|Honest Failure Report"
  "SP.15 EEP   Execution Enforcement       |Execute, don't acknowledge|EEP"
  "SP.17 SIR   System Improvement Reflect  |💡 SIR|System Improvement"
  "SP.18 SSC   Sync Status Confirmation    |📡 Sync Status|SSC"
  "SP.21 MES   Model Effort Selector       |🎯 MODEL:"
  "EN.1  Skel  Output Skeleton             |^STEP:|🎯 MACRO|📌 MICRO"
  "EN.4  Pulse Pulse Check                 |Pulse Check|Score:"
)

SAMPLE_WINDOW=20
RECENT_TEXT=$(git log --oneline -"$SAMPLE_WINDOW" --format="%H" 2>/dev/null | while read -r sha; do
  git log -1 --pretty=%B "$sha" 2>/dev/null
  git show "$sha" --no-color --stat 2>/dev/null | head -100
done)

DORMANT_COUNT=0
UNDERFIRED_COUNT=0
ACTIVE_COUNT=0

for entry in "${MANDATORY_PROTOCOLS[@]}"; do
  NAME=$(echo "$entry" | awk -F'|' '{print $1}' | sed 's/[[:space:]]*$//')
  PATTERNS=$(echo "$entry" | awk -F'|' '{for (i=2; i<=NF; i++) printf (i>2?"|%s":"%s"), $i}')
  HIT=$(echo "$RECENT_TEXT" | grep -cE "$PATTERNS" 2>/dev/null)
  HIT=${HIT:-0}
  PCT=$(( HIT * 100 / SAMPLE_WINDOW ))
  if [ "$PCT" -ge 50 ]; then
    printf "  ✅ %-44s  %2d/%d commits (%3d%%)\n" "$NAME" "$HIT" "$SAMPLE_WINDOW" "$PCT"
    ACTIVE_COUNT=$((ACTIVE_COUNT+1))
  elif [ "$PCT" -ge 25 ]; then
    printf "  ⚠️  %-44s  %2d/%d commits (%3d%%)  UNDER-FIRED\n" "$NAME" "$HIT" "$SAMPLE_WINDOW" "$PCT"
    UNDERFIRED_COUNT=$((UNDERFIRED_COUNT+1))
  else
    printf "  ❌ %-44s  %2d/%d commits (%3d%%)  DORMANT (F.23 pattern)\n" "$NAME" "$HIT" "$SAMPLE_WINDOW" "$PCT"
    DORMANT_COUNT=$((DORMANT_COUNT+1))
  fi
done
echo ""

# ============================================================
# DIRECTION B — Scripts/Agents → PROTOCOLS_REFERENCE entry exists
# ============================================================
echo "── DIRECTION B: scripts/ + agents/ → PROTOCOLS_REFERENCE entry"
echo ""

MISSING_SCRIPTS=()
MISSING_AGENTS=()
REF_FILE="PROTOCOLS_REFERENCE.md"

if [ ! -f "$REF_FILE" ]; then
  echo "  ⚠️ $REF_FILE not found — skipping Direction B"
else
  for script in scripts/*.sh; do
    [ -f "$script" ] || continue
    base=$(basename "$script")
    if ! grep -qF "$base" "$REF_FILE" 2>/dev/null; then
      MISSING_SCRIPTS+=("$base")
    fi
  done

  for agent in agents/*.md; do
    [ -f "$agent" ] || continue
    base=$(basename "$agent")
    # Core class-named agents are referenced by class, not filename
    case "$base" in
      validator.md|verifier.md|qc.md|meta_verifier.md|controller.md|karen-reality-check.md|paradox-resolver.md|validator-merged.md|VALIDATION_WORKFLOW.md|jenny-sop-verifier.md|oversight-executive.md|cache-manager.md|chiron.md)
        : # class-referenced, OK
        ;;
      *)
        if ! grep -qF "$base" "$REF_FILE" 2>/dev/null; then
          MISSING_AGENTS+=("$base")
        fi
        ;;
    esac
  done

  if [ ${#MISSING_SCRIPTS[@]} -eq 0 ]; then
    echo "  ✅ All scripts/*.sh have PROTOCOLS_REFERENCE entries"
  else
    echo "  ⚠️ ${#MISSING_SCRIPTS[@]} script(s) missing formal entry:"
    for s in "${MISSING_SCRIPTS[@]}"; do
      echo "       • $s"
    done
  fi
  echo ""

  if [ ${#MISSING_AGENTS[@]} -eq 0 ]; then
    echo "  ✅ All non-core agents/*.md have PROTOCOLS_REFERENCE entries"
  else
    echo "  ⚠️ ${#MISSING_AGENTS[@]} agent(s) missing formal entry:"
    for a in "${MISSING_AGENTS[@]}"; do
      echo "       • $a"
    done
  fi
fi
echo ""

# ============================================================
# SUMMARY
# ============================================================
echo "═══════════════════════════════════════════════════════════════"
echo "📊 COVERAGE AUDIT SUMMARY"
echo "═══════════════════════════════════════════════════════════════"
echo "  Direction A (activity):"
echo "    Active (≥50%):       $ACTIVE_COUNT"
echo "    Under-fired (25–49%): $UNDERFIRED_COUNT"
echo "    Dormant (<25%):       $DORMANT_COUNT"
echo "  Direction B (formalization):"
echo "    Missing scripts:      ${#MISSING_SCRIPTS[@]}"
echo "    Missing agents:       ${#MISSING_AGENTS[@]}"
echo ""
echo "Drift candidates total: $(( DORMANT_COUNT + UNDERFIRED_COUNT + ${#MISSING_SCRIPTS[@]} + ${#MISSING_AGENTS[@]} ))"
echo ""
echo "Suggested cadence: monthly OR before any new SubSOP / new script commit."
echo "Owner: Chiron (agents/chiron.md). File new F-class entry if pattern recurs ≥3 times."
echo "═══════════════════════════════════════════════════════════════"

# Log to META_AUDIT_LOG.md
if [ -f cache/META_AUDIT_LOG.md ]; then
  printf "| %s | %s | Coverage-Audit | A:%dD/%dU/%dA · B:%dS/%dA missing | %s |\n" \
    "$DATE" "$DEVICE" "$DORMANT_COUNT" "$UNDERFIRED_COUNT" "$ACTIVE_COUNT" \
    "${#MISSING_SCRIPTS[@]}" "${#MISSING_AGENTS[@]}" "$COMMIT" \
    >> cache/META_AUDIT_LOG.md
fi

exit 0
