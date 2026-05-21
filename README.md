# 🎯 Universal Output SOP + APW Course Project

**Private repository** containing two interlocked projects:

1. **Universal Output SOP v1.3** — a portable prompt + supporting files that force any Claude session (chat or Code) to produce traceable, accurate, auditable output every time
2. **APW (Ascend Prime Wealth) Course Project** — a Skool-hosted course teaching $100K-$500K business funding in 90 days, which originally birthed the need for the SOP

---

## 🚪 ENTRY POINTS — Read These First

| 👤 If you are… | 📖 Start here |
|---------------|--------------|
| 🤖 **A Claude Code session resuming work** | [`SESSION_START.md`](./SESSION_START.md) ← MUST READ FIRST |
| 👨‍💼 **Alan (returning to the project)** | [`SESSION_START.md`](./SESSION_START.md) for current state, then your priority work |
| 🧑‍💻 **An external Claude.ai chat consulting on this project** | [`CONSULTING_BRIEF.md`](./CONSULTING_BRIEF.md) |
| 👋 **A new team member** | [`NEW_HIRE_GUIDE.md`](./NEW_HIRE_GUIDE.md) |
| 📦 **Setting up the SOP in a new environment** | [`REPLICATION_KIT.md`](./REPLICATION_KIT.md) |

---

## 📁 REPOSITORY MAP

```
universal-sop/
│
├── 🚪 SESSION_START.md          ← BOOTSTRAP: AI/human entry point (read FIRST)
├── 📖 README.md                  ← You are here
│
├── 📋 UNIVERSAL_SOP_PROMPT.md    ← THE RULEBOOK (v1.3, 940 lines, 16 SubSOPs)
├── 📋 CLAUDE.md                  ← Claude Code project config (APW-specific legacy)
│
├── 🤝 CONSULTING_BRIEF.md        ← For external Claude chats consulting on project
├── 📅 PROJECT_HISTORY.md         ← 40+ hour timeline + evolution
├── 🚧 CHALLENGES_LOG.md          ← Bottlenecks, debug history, regressions
├── 👤 USER_PROFILE.md            ← Alan's communication preferences
├── 👋 NEW_HIRE_GUIDE.md          ← Plain-English onboarding
├── 📦 REPLICATION_KIT.md         ← Paste-ready setup prompts
│
├── 📜 cache/                     ← Active state (MUST be read at session start)
│   ├── SESSION_STATE.md          ← Current position, decisions, prompts, tokens
│   ├── CONTINUATION.md           ← Latest session handoff
│   ├── BACKUP_LOG.md             ← All file backups indexed
│   ├── RPT_LOG.md                ← Repeated prompt failures + permanent fixes
│   └── … (other APW-era cache files, mostly historical)
│
├── 🤖 agents/                    ← Validation sub-agent definitions
├── 📜 sop_scripts/               ← Token tracker scripts (Node.js)
├── 📚 source_files/              ← APW course source material (SCIO sections, wireframes)
└── 💾 backups/                   ← Historical SOP versions
```

---

## ⚡ QUICK START

### From this laptop (existing setup)

```bash
cd "path/to/universal-sop"
git pull
claude  # or your Claude Code launcher
```

Then in Claude Code, paste the bootstrap prompt (see `SESSION_START.md`).

### From a new device

```bash
# Install gh CLI (if not present)
brew install gh
gh auth login

# Clone
gh repo clone xprimordius/universal-sop
cd universal-sop

# Open Claude Code
claude
```

Then paste the bootstrap prompt from `SESSION_START.md`.

---

## 🔄 DAILY WORKFLOW

| 🕐 When | 🎯 | 🏷️ Action |
|---------|:---:|----------|
| Session start | 📥 | `git pull` before opening Claude Code |
| Session start | 🤖 | Paste bootstrap prompt from `SESSION_START.md` |
| Mid-session | 💾 | Periodically: "checkpoint and push" (commits + pushes to GitHub) |
| Session end | 📝 | "End session. Update CONTINUATION.md and push." |

**Critical rule:** Always pull before work, push after work. Skipping creates merge conflicts.

---

## 🎓 WHAT THIS PROJECT IS (For Outsiders)

If you're reading this with no context: **this is a 40+ hour effort to make AI output reliable.**

AI is brilliant but inconsistent — it forgets, fabricates, skips steps, regresses. For business-critical work, that's unacceptable. The Universal SOP is a system of:
- 6 mandatory stages every output passes through
- 16 sub-protocols (visual, token tracking, fidelity, etc.)
- Cache architecture so context survives session compaction
- Ensurance System (v1.3) to prevent compliance decay across outputs

**Status:** Mechanically functional. Compliance varies. **Untested in a truly fresh session — that's the biggest open risk.**

Full honest writeup: [`CONSULTING_BRIEF.md`](./CONSULTING_BRIEF.md)

---

## 🔒 PRIVACY

This repo is **PRIVATE**. It contains:
- Personal communication preferences (`USER_PROFILE.md`)
- Business strategy (APW funding course)
- Decision history with names + dates

**Do not make public.** If sharing with a collaborator, use GitHub's Collaborator invite (Settings → Collaborators).

---

## 📊 PROJECT STATS

| 🎯 | 🏷️ Metric | 📊 Value |
|:---:|----------|----------|
| ⏱️ | Total project hours | 40+ |
| 📄 | SOP version | v1.3 |
| 🏗️ | SubSOPs | 16 |
| 📋 | D-rules / requirements | 43+ |
| 🚧 | Named challenges | 14 (7 solved, 7 partial) |
| 🔁 | Repeated prompts logged | 9 |
| 📦 | Files in repo | 260+ |

---

*Universal Output SOP v1.3 | Repo: xprimordius/universal-sop (PRIVATE) | Last updated: 2026-05-18*
