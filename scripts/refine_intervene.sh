#!/usr/bin/env bash
# 🔁 REFINE Step I — Intervene
# Per SP.20 REFINE | F.24 ship 2026-05-22
# Reads: Foresee output (priority 🔴 items)
# Writes: nothing automatically — surfaces proposed interventions for Alan to approve
# v1.0 STUB — surfaces proposals; Alan-approval gate ensures no autonomous code changes yet

set +e
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

DEVICE="$(git config user.email | sed -n 's/.*alan+\([^@]*\)@local/\1/p')"
[ -z "$DEVICE" ] && DEVICE="unknown"
TS=$(date +"%Y-%m-%d %H:%M %Z")
DATE=$(date +%Y-%m-%d)
COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo 'unknown')"

OUT="cache/refine/INTERVENE_${DATE}.md"
mkdir -p cache/refine

echo "🔁 REFINE Step I — Intervene (proposals only — Alan-approval gate)"

LATEST_FORESEE=$(ls -t cache/refine/FORESEE_*.md 2>/dev/null | head -1)

{
  echo "# 🔁 REFINE Step I — Proposed Interventions for ${DATE}"
  echo "**Device:** ${DEVICE}  **Generated:** ${TS}"
  echo ""
  echo "## Source"
  if [ -n "$LATEST_FORESEE" ]; then
    echo "Reads: $LATEST_FORESEE"
  else
    echo "_No FORESEE output found — run refine_foresee.sh first._"
  fi
  echo ""
  echo "## Proposed interventions (Alan must approve before any code change)"
  echo ""
  echo "| ID | Priority | Predicted issue | Proposed fix | Auto-apply? |"
  echo "|:--:|:--:|---|---|:--:|"
  echo "| I.1 | 🔴 | Same-brain ceiling | Build scripts/cross_model_audit.sh | ❌ Alan approves |"
  echo "| I.2 | 🔴 | compliance false-positives | Edit scripts/compliance_check.sh (accept 5/5/6/6/7/7 + meta-doc exclusion) | ❌ Alan approves |"
  echo "| I.3 | 🟡 | Pulse Check growth | Add cap-at-N rule to MANDATORY_TIGHT_LOOP Rule 3 | ❌ Alan approves |"
  echo ""
  echo "## Auto-applied fixes (none yet — v1.0 is approval-gated)"
  echo "_v2.0 will allow auto-apply for safe low-risk interventions (lint fixes, doc updates) with full BACKUP_LOG audit._"
  echo ""
  echo "*v1.0 STUB — proposals only. To approve: review above, hand-edit BACKUP_LOG to convert proposal → intervention, ship via add_protocol.sh if it's a new SubSOP.*"
} > "$OUT"

[ -f cache/META_AUDIT_LOG.md ] && printf "| %s | %s | REFINE.I | %d proposals surfaced | %s |\n" "$DATE" "$DEVICE" 3 "$COMMIT" >> cache/META_AUDIT_LOG.md

echo "✅ REFINE Step I complete — $OUT"
exit 0
