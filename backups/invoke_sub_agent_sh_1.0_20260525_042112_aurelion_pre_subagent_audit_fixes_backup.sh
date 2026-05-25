#!/usr/bin/env bash
# 🤖 INVOKE_SUB_AGENT — Prepare context for a fresh-context sub-agent verification
# Per Q.3 (external independence) | F.22 quintessence audit 2026-05-21
# Adopted 2026-05-25 on aurelion. Closes Q.3 partially — full closure requires Claude Code
# `Agent` tool invocation (which is Claude Code internal, NOT a bash capability).
#
# THE PROBLEM (Q.3):
#   The current 4-layer agent chain (Verifier → Validator → QC → Meta-Verifier) all runs in
#   the SAME Claude context, hitting the F.19 "same brain audits itself" ceiling. The
#   structural answer is a fresh-context sub-agent reading ONLY the artifact + spec, with
#   no exposure to the primary session's biases.
#
# WHAT THIS SCRIPT DOES:
#   Prepares the artifact files + a self-contained prompt for a sub-agent invocation.
#   Bash cannot itself call Claude Code's Agent tool (that's a tool the Claude session uses
#   from inside its own runtime). So this script does the PREP work, then prints the
#   ready-to-paste invocation that the primary Claude should make.
#
# Usage:
#   bash scripts/invoke_sub_agent.sh ARTIFACT_PATH SPEC_PATH "AGENT_ROLE" [--output-dir DIR]
#   bash scripts/invoke_sub_agent.sh outputs/2026-05-25_q6_v2.md cache/SESSION_STATE.md "code-reviewer"
#
# Output: a prompt file at cache/sub_agent_invocations/<ts>_<role>.md, plus the
# Agent-tool invocation snippet on stdout for primary Claude to execute.

set +e

# Source paths.sh (Sprint 3 Item F — adoption dogfood #3)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/paths.sh" ]; then
  source "$SCRIPT_DIR/paths.sh" > /dev/null 2>&1
fi
PROJECT_ROOT="${PROJECT_ROOT:-$(cd "$SCRIPT_DIR/.." && pwd)}"
cd "$PROJECT_ROOT"

ARTIFACT_PATH=""
SPEC_PATH=""
AGENT_ROLE=""
OUTPUT_DIR="$CACHE_DIR/sub_agent_invocations"
[ -z "$CACHE_DIR" ] && OUTPUT_DIR="cache/sub_agent_invocations"

POSITIONAL=()
while [ $# -gt 0 ]; do
  case "$1" in
    --output-dir) OUTPUT_DIR="$2"; shift 2 ;;
    -h|--help)
      grep "^#" "$0" | head -32
      exit 0 ;;
    *) POSITIONAL+=("$1"); shift ;;
  esac
done
ARTIFACT_PATH="${POSITIONAL[0]:-}"
SPEC_PATH="${POSITIONAL[1]:-}"
AGENT_ROLE="${POSITIONAL[2]:-general-purpose}"

if [ -z "$ARTIFACT_PATH" ] || [ -z "$SPEC_PATH" ]; then
  echo "Usage: bash scripts/invoke_sub_agent.sh ARTIFACT_PATH SPEC_PATH [AGENT_ROLE]"
  echo ""
  echo "  ARTIFACT_PATH  Path to the artifact to be audited (e.g., outputs/X.md)"
  echo "  SPEC_PATH      Path to the spec the artifact should satisfy"
  echo "  AGENT_ROLE     Sub-agent type — code-reviewer, code-explorer, general-purpose, etc."
  echo ""
  echo "Prepares context for a fresh-brain audit. Bash cannot invoke the Agent tool"
  echo "directly — this is structurally a CLAUDE CODE capability. The script's output"
  echo "is the prompt that primary Claude should pass to the Agent tool."
  exit 1
fi

if [ ! -f "$ARTIFACT_PATH" ]; then
  echo "❌ ARTIFACT_PATH not found: $ARTIFACT_PATH"
  exit 2
fi
if [ ! -f "$SPEC_PATH" ]; then
  echo "❌ SPEC_PATH not found: $SPEC_PATH"
  exit 3
fi

mkdir -p "$OUTPUT_DIR"
TS=$(date +%Y%m%d_%H%M%S)
DATE_HUMAN=$(date +"%Y-%m-%d %H:%M %Z")
DEVICE="${DEVICE_NAME:-$(git config user.email 2>/dev/null | sed -n 's/.*alan+\([^@]*\)@local/\1/p')}"
[ -z "$DEVICE" ] && DEVICE="unknown"

PROMPT_FILE="$OUTPUT_DIR/${TS}_${AGENT_ROLE}.md"

cat > "$PROMPT_FILE" <<EOF
# Sub-Agent Invocation Prompt
# Prepared by scripts/invoke_sub_agent.sh on $DATE_HUMAN
# Device: $DEVICE
# Role:   $AGENT_ROLE

## Your context (fresh brain — no prior session bias)

You are reviewing the artifact at \`$ARTIFACT_PATH\` against the spec at \`$SPEC_PATH\`.

You have NO context from the primary Claude session that produced this artifact. That is
INTENTIONAL — your job is independent verification, breaking the F.19 "same-brain audits
itself" ceiling per Q.3 of the Universal SOP quintessence properties.

## Your task

1. Read \`$SPEC_PATH\` end-to-end. Extract the literal requirements.
2. Read \`$ARTIFACT_PATH\` end-to-end. Note every claim it makes.
3. For each spec requirement, mark in a table: MET / NOT-MET / UNCLEAR.
4. For each artifact claim, mark in a table: SUPPORTED / FABRICATED / UNCERTAIN.
5. Return ONE of:
   - **APPROVE** — every spec requirement MET, no FABRICATED claims, no unresolved UNCLEAR/UNCERTAIN
   - **REVISE** — some MET-but-others-NOT, fabrication detected, or significant unclarity
   - **REJECT** — major spec violations OR clear fabrication

Be terse. Tables only. No preamble. Your output goes into the primary session as
\`cache/sub_agent_invocations/${TS}_${AGENT_ROLE}_result.md\`.

## What you must NOT do

- Do not trust the artifact's own claims about itself ("I verified X" — make YOU verify X)
- Do not soften assessments to be polite — same-brain audits already do that, your value is bluntness
- Do not bring outside knowledge if the spec doesn't include it
- Do not refactor or rewrite the artifact — only assess it
EOF

echo "═══════════════════════════════════════════════════════════════"
echo "🤖 SUB-AGENT INVOCATION PREPARED"
echo "═══════════════════════════════════════════════════════════════"
echo "  Artifact:    $ARTIFACT_PATH"
echo "  Spec:        $SPEC_PATH"
echo "  Role:        $AGENT_ROLE"
echo "  Prompt file: $PROMPT_FILE"
echo ""
echo "📋 Next step (CLAUDE CODE side — bash cannot do this):"
echo ""
echo "    The PRIMARY Claude session should now invoke the Agent tool with:"
echo "      subagent_type: \"$AGENT_ROLE\""
echo "      description:   \"Independent verification of $(basename "$ARTIFACT_PATH")\""
echo "      prompt:        (contents of $PROMPT_FILE — self-contained)"
echo ""
echo "    The Agent tool spawns a FRESH-CONTEXT sub-agent that reads ONLY the files"
echo "    named in the prompt. It does NOT inherit the primary session's history."
echo ""
echo "📝 Doctrine note:"
echo "  - Run this script before any HIGH-STAKES ship (new SubSOP, structural fix, major doc)"
echo "  - Sub-agent verdict becomes part of the commit's PROVE-IT 9-point block (item 1: QA)"
echo "  - F.19 ceiling is broken when sub-agent's APPROVE/REVISE/REJECT differs from primary's self-audit"
echo "═══════════════════════════════════════════════════════════════"
exit 0
