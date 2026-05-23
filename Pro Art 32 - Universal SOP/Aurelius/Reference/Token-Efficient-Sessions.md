---
date: 2026-05-21
type: reference
tags: [sessions, tokens, cost, durable-memory, aurelius]
related: ["[[index]]", "[[Aurelius-Master-SOP]]"]
---

# Token-Efficient Session Pattern

Linked: [[index]] · [[Aurelius-Master-SOP]]

How to keep Claude Code costs low WITHOUT losing project fidelity.

## The principle

**Chat is working memory. Disk is long-term memory.** Periodically promote
high-value chat content to disk, then `/clear` with confidence.

```
┌──────────────────────────────────────────────────────────────────┐
│  THIS chat (working memory)                                      │
│    - Costs tokens per turn                                        │
│    - Lost on /clear unless promoted                              │
│    - Grows with every turn (re-bills the full history)           │
├──────────────────────────────────────────────────────────────────┤
│  Vault + git (long-term memory) ← THE DURABLE LAYER              │
│    - Code in two private GitHub repos                            │
│    - Operations-Log captures what shipped                        │
│    - Master-Intent ledger captures user intent                   │
│    - Sessions/ captures chat reasoning (NEW)                     │
│    - Costs $0 to re-access                                       │
│    - Never lost                                                   │
└──────────────────────────────────────────────────────────────────┘
```

## The capture script (Op 15)

`agent-stack/session_capture.py` reads the Claude Code session JSONL transcript
and writes a structured markdown summary to `Vault/Sessions/{date}-{id}.md`.

```bat
cd "C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack"
python session_capture.py                  REM capture latest session
python session_capture.py --list           REM list available sessions
python session_capture.py --session <id>   REM capture specific session
```

The capture extracts:
- Decisions made (via marker heuristics)
- User preferences expressed
- Rationale / reasoning chains
- Code + commit references mentioned
- First 5 + last 5 user turns verbatim

This is the missing piece — the bridge between chat-truth and disk-truth.

## The bootstrap pattern (next session)

After running `session_capture.py` + `/clear`, a fresh Claude session loads
the project state from disk with ~5-10K tokens of bootstrap instead of
carrying 500K+ of conversation history forward.

Paste this into the new session:

```
Read C:/Users/light/Documents/The Beginning/Aurelius/Sessions/{latest}.md
then C:/Users/light/Documents/The Beginning/Aurelius/Reference/Operations-Log.md
then C:/Users/light/Documents/The Beginning/Aurelius/Goals/Status.md
then C:/Users/light/Documents/The Beginning/Aurelius/Reference/Audits/{latest}.md
Now you have full project state. Continue from where we left off.
```

Plus `MEMORY.md` auto-loads cross-session.

## Cost math

| Approach | Tokens per turn | Cost per turn (Opus 4.7 [1m]) |
|---|---|---|
| Carry full conversation forward | ~500K input | ~$5-9 |
| `/compact` then continue | ~30K input | ~$0.45 |
| Capture + `/clear` + fresh | ~10K input | ~$0.15 |
| Capture + `/clear` + Sonnet 4.6 | ~10K input | ~$0.03 |

**Capture before `/clear`** is the move. Loses ~0% fidelity (key reasoning
on disk), cuts cost 30-100x.

## When to capture

- Before any `/clear`
- Before any `/compact`
- After a significant op completes (e.g., post Op 14 close-out)
- Manually any time, or wire into a Stop hook for auto-capture

## What you DON'T need to put in chat

- Code: it's in git, just `git log` or `git diff` for history
- Vault content: it's on disk, ask Claude to `Read` specific notes
- Test results: `python tests/aurelius_tests.py` shows current state
- Operations history: `Operations-Log.md` has the full record
- User intent: `Intent/Master-Intent.md` has the auto-captured ledger
- Bottleneck/insight findings: in their dated vault folders

## What you DO need in chat (working memory)

- The current task you're focused on
- Specific decisions still being made
- Anything you want Claude to act on RIGHT NOW

Everything else: let it live on disk. Claude can fetch what's relevant.

## Future enhancement (Op 16)

Wire `session_capture.py` into a Stop hook so it fires automatically when
Claude Code's session ends. Then every session leaves a durable footprint
without manual invocation. Until then: invoke manually before `/clear`.

#sessions #tokens #cost #durable-memory
