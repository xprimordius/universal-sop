# 💬 CHAT ARCHIVE — Claude Code Transcript Backup
# VERSION: 1.0 | 2026-05-21 | Per Alan's "back up chat history is very important" directive

---

## 🎯 PURPOSE

Back up the FULL Claude Code session transcripts (JSONL format) into the repo so they're preserved across:
- Device changes
- Claude Code reinstalls
- Session compactions
- Local disk failures

The JSONL contains EVERYTHING:
- User prompts (verbatim)
- AI responses (verbatim text + visible reasoning)
- All tool calls + their outputs
- Sub-agent invocations + responses
- System reminders

---

## 📁 FOLDER STRUCTURE

```
chat_archive/
├── README.md                          ← this file
├── archive_chat.sh                    ← one-command archiver script
├── session_5_20260521/                ← per-session folder
│   ├── full_transcript.jsonl          ← raw JSONL
│   └── SUMMARY.md                     ← human-readable summary + stats
├── session_6_YYYYMMDD/                ← future sessions
│   ├── full_transcript.jsonl
│   └── SUMMARY.md
└── ...
```

---

## 🚀 USAGE

### Archive Current Session (Manual)

From project root:
```bash
bash chat_archive/archive_chat.sh
```

Creates folder `chat_archive/session_YYYYMMDD_HHMMSS/` with the transcript + auto-generated summary.

### Archive With Custom Label

```bash
bash chat_archive/archive_chat.sh session_6_apw_resume
```

Creates `chat_archive/session_6_apw_resume/`.

### After Archiving — Commit + Push

```bash
git add chat_archive/
git commit -m "archive chat: session 6"
git push
```

### Tell Claude To Archive

```
Archive this chat session into chat_archive/ then commit + push.
```

Claude runs the script + commits.

---

## 📊 WHEN TO ARCHIVE

| 🕐 Trigger | 🎯 Action |
|-----------|----------|
| End of major session | Archive with descriptive label (e.g., `session_6_apw_module_4_1`) |
| Before major refactor | Archive baseline for rollback reference |
| After harness drift fix | Archive to compare pre/post state |
| Before switching devices | Archive so other device sees the same history |
| Weekly (if active project) | Cron job or manual checkpoint |

---

## 🔍 PARSING ARCHIVED TRANSCRIPTS

Each `full_transcript.jsonl` is line-delimited JSON. One line = one turn.

### Quick Stats
```bash
SESSION=session_5_20260521

# Total turns
wc -l chat_archive/$SESSION/full_transcript.jsonl

# Tool call distribution
jq -r '.message.content[]? | select(.type == "tool_use") | .name' \
  chat_archive/$SESSION/full_transcript.jsonl | sort | uniq -c | sort -rn
```

### Extract All User Prompts
```bash
jq -r 'select(.type == "user") |
  .message.content // (.message.content[0].text // "")' \
  chat_archive/$SESSION/full_transcript.jsonl > user_prompts.txt
```

### Extract All AI Text Responses
```bash
jq -r 'select(.type == "assistant") |
  (.message.content[]? | select(.type == "text") | .text)' \
  chat_archive/$SESSION/full_transcript.jsonl > ai_responses.txt
```

### Find All Bash Commands Run
```bash
jq -r '.message.content[]? | select(.type == "tool_use" and .name == "Bash") |
  .input.command' \
  chat_archive/$SESSION/full_transcript.jsonl
```

### Find All Sub-Agent Reports
```bash
jq -r '.message.content[]? | select(.type == "tool_result") |
  (.content[]? | .text // "")' \
  chat_archive/$SESSION/full_transcript.jsonl | grep -A 1000 "SIMULATION REPORT"
```

---

## 📈 SIZE EXPECTATIONS

| Session Type | Approx Size |
|--------------|:-----------:|
| Short (1-5 outputs) | 100-500 KB |
| Medium (10-20 outputs) | 1-2 MB |
| Long (50+ outputs, sub-agents) | 4-10 MB |
| Session 5 (this one) | 4.4 MB |

GitHub free tier handles up to 100 MB per file, 5 GB per repo. We're nowhere close.

---

## ⚠️ PRIVACY NOTES

Transcripts contain:
- Personal preferences from USER_PROFILE
- All decisions made during the session
- Tool execution outputs (file paths, contents)
- Sub-agent simulation framings

**Repo is PRIVATE** (`xprimordius/universal-sop`). Safe to commit transcripts there.

**Never** publish a transcript publicly without redaction (use the `redact.sh` script — to be built if needed).

---

## 🔄 RESTORE / IMPORT

To use an archived transcript in a NEW session:

### Option A — Reference As Context
Paste relevant excerpts into a new Claude Code session as context.

### Option B — Replay Decision Trail
Open the SUMMARY.md and the SESSION_STATE.md decisions log together. Cross-reference.

### Option C — Audit
For compliance/review, the JSONL is a complete audit trail of what happened.

---

## 🆚 vs CACHE FILES — WHAT EACH CAPTURES

| 📦 Source | 📝 What It Captures | 🎯 Use For |
|-----------|---------------------|------------|
| `cache/SESSION_STATE.md` | Curated decisions log (key points only) | Quick lookup, persistent across sessions |
| `cache/CONTINUATION.md` | Hand-written session handoff | Bootstrap context for next session |
| `cache/FAILURE_LEDGER.md` | All known failure patterns | Anti-decay guardrails |
| `cache/BACKUP_LOG.md` | All file changes with reason | File history audit |
| `chat_archive/[session]/full_transcript.jsonl` | EVERYTHING that happened (raw) | Complete audit, recovery, deep dive |
| `chat_archive/[session]/SUMMARY.md` | Stats + highlights of that session | Quick orientation per session |

**Layered backup:** Cache files = curated. Chat archive = raw. Both have value.

---

## 🤖 AUTO-ARCHIVE (Future Enhancement)

Could be added later:
1. **Git pre-commit hook** that archives if transcript size changed >10%
2. **Cron job** that archives daily/weekly
3. **Obsidian Git plugin** that includes chat_archive in auto-sync
4. **Claude Code hook** (if Claude Code supports session-end hooks)

Currently: manual archive via the script. Simple, controllable.

---

*chat_archive/ v1.0 | Per "back up chat history is very important" 2026-05-21*
