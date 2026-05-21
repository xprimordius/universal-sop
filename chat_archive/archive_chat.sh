#!/usr/bin/env bash
# 📦 Chat History Archiver
# Snapshots current Claude Code session JSONL into chat_archive/ folder
# Run from project root: bash chat_archive/archive_chat.sh [optional_session_label]

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SESSION_DIR="$HOME/.claude/projects/-Users-admin-Downloads-APW-EXPORT---Friday-Mar-13th-2026-APW-EXPORT"
ARCHIVE_ROOT="$PROJECT_ROOT/chat_archive"

# Allow optional session label (e.g., "session_6", "session_7_apw_resume")
LABEL="${1:-session_$(date +%Y%m%d_%H%M%S)}"
TARGET="$ARCHIVE_ROOT/$LABEL"

mkdir -p "$TARGET"

# Find most recent JSONL file (current session)
LATEST_JSONL=$(ls -t "$SESSION_DIR"/*.jsonl 2>/dev/null | head -1)

if [ -z "$LATEST_JSONL" ]; then
  echo "❌ No session JSONL found at $SESSION_DIR"
  exit 1
fi

# Copy the JSONL (full transcript with tool calls + AI output + reasoning)
cp "$LATEST_JSONL" "$TARGET/full_transcript.jsonl"

# Generate a human-readable summary (sizes + counts)
SIZE=$(du -h "$TARGET/full_transcript.jsonl" | cut -f1)
LINE_COUNT=$(wc -l < "$TARGET/full_transcript.jsonl" | xargs)
USER_TURNS=$(grep -c '"type":"user"' "$TARGET/full_transcript.jsonl" || echo "0")
ASSISTANT_TURNS=$(grep -c '"type":"assistant"' "$TARGET/full_transcript.jsonl" || echo "0")

cat > "$TARGET/SUMMARY.md" <<EOF
# 📦 Chat Archive — $LABEL

**Archived:** $(date)
**Source:** $LATEST_JSONL
**Project:** Universal Output SOP

## Stats
- **File size:** $SIZE
- **JSONL lines:** $LINE_COUNT
- **User turns:** $USER_TURNS
- **Assistant turns:** $ASSISTANT_TURNS

## Contents
The \`full_transcript.jsonl\` file contains:
- ✅ All user prompts (verbatim)
- ✅ All AI responses (verbatim text + thinking blocks where visible)
- ✅ All tool calls (Read, Edit, Bash, Agent, etc.) + their inputs
- ✅ All tool outputs (file contents, command results, sub-agent reports)
- ✅ System reminders (claudeMd, task reminders, etc.)
- ✅ Sub-agent invocations + their full responses

## How to Read
\`\`\`bash
# Pretty-print one turn
jq -C '.' full_transcript.jsonl | head -100

# Count tool calls by type
jq -r '.message.content[]? | select(.type == "tool_use") | .name' full_transcript.jsonl | sort | uniq -c

# Extract all user messages
jq -r 'select(.type == "user") | .message.content // .message.content[0].text // ""' full_transcript.jsonl
\`\`\`

## Recovery Use
If a Claude Code session is lost, this transcript preserves the entire history. Can be:
- Parsed manually for context
- Imported into a knowledge base
- Used to reconstruct decision trail
- Audit trail for compliance review
EOF

echo "✅ Archived to: $TARGET"
echo "   Size: $SIZE | Lines: $LINE_COUNT | User: $USER_TURNS | Assistant: $ASSISTANT_TURNS"
echo ""
echo "Next: cd $PROJECT_ROOT && git add chat_archive/ && git commit -m 'archive chat: $LABEL' && git push"
