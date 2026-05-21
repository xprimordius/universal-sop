#!/usr/bin/env bash
# 🛡️ COMPLIANCE CHECK — Mechanical verification of SOP compliance
# F.14 fix 2026-05-21 | Per Alan: "we keep failing what we have already discussed"
# Run BEFORE commit: bash scripts/compliance_check.sh [optional_output_file_to_check]

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_ROOT"

# If file passed as arg, check that file. Otherwise check uncommitted changes.
TARGET_FILE="${1:-}"

if [ -z "$TARGET_FILE" ]; then
  echo "🛡️ COMPLIANCE CHECK — Scanning uncommitted changes"
  CONTENT=$(git diff --cached 2>/dev/null; git diff 2>/dev/null)
else
  echo "🛡️ COMPLIANCE CHECK — Scanning $TARGET_FILE"
  CONTENT=$(cat "$TARGET_FILE")
fi

ISSUES=0

echo ""
echo "================================================"
echo ""

# ─────────────────────────────────────────────────────────
# CHECK 1 — Rule #11: Protocol names must have full name + acronym
# ─────────────────────────────────────────────────────────
echo "🔍 CHECK 1 — Rule #11: Protocol full names + acronyms"

# Define each protocol and its required full name
declare -a PROTOCOLS=(
  "SP.1|MagNet|Magnetic Visual Engagement Protocol"
  "SP.2|Door Scan|Door Scanning Pattern Protocol"
  "SP.3|TTE|Token Threshold Engine"
  "SP.4|SCP|System Change Protocol"
  "SP.5|FSP|Fidelity Substantiation Protocol"
  "SP.6|IAC|Intent Alignment Check"
  "SP.7|Insights|Insights Protocol"
  "SP.8|Protocol Visibility|Protocol Visibility Protocol"
  "SP.9|FE|Foresight Engine"
  "SP.10|SCC|Self-Compliance Check"
  "SP.11|QAC|Quality Assurance Check"
  "SP.12|HFR|Honest Failure Report"
  "SP.13|SHR|System Health Report"
  "SP.14|RPT|Repeated Prompt Tracker"
  "SP.15|EEP|Execution Enforcement Protocol"
  "SP.16|PCG|Prompt Completion Gate"
  "LTM|LTM|Live Token Monitor"
)

# Check for bare acronyms without full names
echo "  Looking for bare acronyms in output that should have full names..."
for entry in "${PROTOCOLS[@]}"; do
  IFS='|' read -r ID ACRONYM FULL_NAME <<< "$entry"
  # Look for "+ ACRONYM" or "ACRONYM +" pattern without nearby full name
  if echo "$CONTENT" | grep -qE "\\b$ACRONYM\\s*\\+" 2>/dev/null; then
    if ! echo "$CONTENT" | grep -q "$FULL_NAME" 2>/dev/null; then
      echo "  ⚠️ POSSIBLE: '$ACRONYM' used in cluster without '$FULL_NAME' nearby"
      ISSUES=$((ISSUES + 1))
    fi
  fi
done
echo ""

# ─────────────────────────────────────────────────────────
# CHECK 2 — Cluster pattern violations (TTE + LTM without full names)
# ─────────────────────────────────────────────────────────
echo "🔍 CHECK 2 — Cluster pattern: TTE + LTM expansion"
if echo "$CONTENT" | grep -qE "TTE\s*\+\s*LTM" 2>/dev/null; then
  if ! echo "$CONTENT" | grep -qE "TTE\s*\(Token Threshold Engine\)\s*\+\s*LTM\s*\(Live Token Monitor\)" 2>/dev/null; then
    echo "  ❌ 'TTE + LTM' used without '(Token Threshold Engine) + (Live Token Monitor)' expansion"
    echo "     CORRECT: 'SP.3 TTE (Token Threshold Engine) + LTM (Live Token Monitor)'"
    ISSUES=$((ISSUES + 1))
  fi
fi
echo ""

# ─────────────────────────────────────────────────────────
# CHECK 3 — Step header completeness
# ─────────────────────────────────────────────────────────
echo "🔍 CHECK 3 — Step header completeness (STEP/SOP/MACRO/MICRO/SCOPE/EST)"
if echo "$CONTENT" | grep -q "^STEP:" 2>/dev/null; then
  REQUIRED=("STEP:" "SOP:" "MACRO:" "MICRO:" "SCOPE:" "EST:")
  MISSING=0
  for field in "${REQUIRED[@]}"; do
    if ! echo "$CONTENT" | grep -q "$field" 2>/dev/null; then
      echo "  ❌ Missing required field: $field"
      MISSING=$((MISSING + 1))
    fi
  done
  if [ $MISSING -eq 0 ]; then
    echo "  ✅ All required fields present"
  else
    ISSUES=$((ISSUES + MISSING))
  fi
else
  echo "  ℹ️  No step header detected (might be a meta-doc, not an output)"
fi
echo ""

# ─────────────────────────────────────────────────────────
# CHECK 4 — Pulse Check presence + score
# ─────────────────────────────────────────────────────────
echo "🔍 CHECK 4 — Pulse Check presence"
if echo "$CONTENT" | grep -qiE "PULSE CHECK" 2>/dev/null; then
  if echo "$CONTENT" | grep -qE "Score:\s*1[56]/(15|16)" 2>/dev/null; then
    echo "  ✅ Pulse Check present with full score (15/15 or 16/16)"
  else
    echo "  ⚠️ Pulse Check present but score not 15/15 or 16/16 — verify"
    ISSUES=$((ISSUES + 1))
  fi
else
  echo "  ℹ️  No Pulse Check detected"
fi
echo ""

# ─────────────────────────────────────────────────────────
# CHECK 5 — LTM presence
# ─────────────────────────────────────────────────────────
echo "🔍 CHECK 5 — LTM lines (should be multiple)"
LTM_COUNT=$(echo "$CONTENT" | grep -cE "📊 LTM:" 2>/dev/null || echo "0")
if [ "$LTM_COUNT" -lt 3 ]; then
  echo "  ⚠️ Only $LTM_COUNT LTM lines detected — should be 3+ for STANDARD, 5+ for COMPLEX"
else
  echo "  ✅ $LTM_COUNT LTM lines"
fi
echo ""

# ─────────────────────────────────────────────────────────
# CHECK 6 — Understanding Check format consistency
# ─────────────────────────────────────────────────────────
echo "🔍 CHECK 6 — Understanding Check table format"
if echo "$CONTENT" | grep -q "UNDERSTANDING CHECK" 2>/dev/null; then
  # Look for the standard column headers
  if echo "$CONTENT" | grep -qE "📣 Your Words" && echo "$CONTENT" | grep -qE "🤖 My Interpretation"; then
    echo "  ✅ Standard column headers present (📣 Your Words + 🤖 My Interpretation)"
  else
    echo "  ⚠️ Understanding Check format may deviate from standard"
    echo "     STANDARD: | # | 🎯 | 📣 Your Words | 🤖 My Interpretation |"
    ISSUES=$((ISSUES + 1))
  fi
fi
echo ""

# ─────────────────────────────────────────────────────────
# CHECK 7 — Macro/Micro goal visibility (F.13)
# ─────────────────────────────────────────────────────────
echo "🔍 CHECK 7 — Macro + Micro goal in step header (F.13)"
if echo "$CONTENT" | grep -q "🎯 MACRO:" && echo "$CONTENT" | grep -q "📌 MICRO:"; then
  echo "  ✅ Both 🎯 MACRO + 📌 MICRO present"
else
  if echo "$CONTENT" | grep -q "^STEP:" 2>/dev/null; then
    echo "  ❌ Step header missing 🎯 MACRO or 📌 MICRO (F.13 violation)"
    ISSUES=$((ISSUES + 1))
  fi
fi
echo ""

# ─────────────────────────────────────────────────────────
# SUMMARY
# ─────────────────────────────────────────────────────────
echo "================================================"
if [ $ISSUES -eq 0 ]; then
  echo "✅ PASS — All compliance checks passed"
  exit 0
else
  echo "❌ FAIL — $ISSUES compliance issue(s) detected"
  echo ""
  echo "Fix before commit OR explicitly acknowledge via HFR (Honest Failure Report)"
  echo "in your output if shipping known-imperfect."
  exit 1
fi
