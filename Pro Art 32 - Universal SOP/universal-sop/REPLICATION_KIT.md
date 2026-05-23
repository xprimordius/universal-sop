# 📦 Replication Kit — Same Output Quality Anywhere
# VERSION: 1.0 | 2026-04-01 | SOP: v1.3

This file contains everything needed to get the same fidelity of AI output in:
- A brand new Claude.ai chat (web/mobile)
- A brand new Claude Code session on any machine
- Any 3rd-party user's system

---

## 🎯 Quick Start (30 Seconds)

| 🎯 | 🏷️ Where You're Using AI | 📋 What To Do |
|:---:|--------------------------|---------------|
| 💬 | **Claude.ai (web/mobile)** | Paste Prompt A below into first message |
| 💻 | **Claude Code (new machine)** | Copy the 5 files below + paste Prompt B |
| 👤 | **3rd-party user** | Send them this file + the 5 core files |

---

## 📋 WHAT TO COPY — The 5 Core Files

| # | 🎯 | 📄 File | 📝 Purpose | 📁 Must Go In |
|:-:|:---:|---------|-----------|--------------|
| 1 | 📄 | `UNIVERSAL_SOP_PROMPT.md` | The rulebook — 16 subSOPs, 6 stages, Ensurance System | Project root |
| 2 | 📄 | `NEW_HIRE_GUIDE.md` | Plain-English user reference | Project root |
| 3 | 📄 | `cache/SESSION_STATE.md` | Template for session state | cache/ folder |
| 4 | 📄 | `cache/BACKUP_LOG.md` | Template for backup tracking | cache/ folder |
| 5 | 📄 | `cache/FAILURE_LEDGER.md` | Unified failure tracking (REPEAT + FAILURE entries) — F8 fusion 2026-05-21 | cache/ folder |

**Optional:**
- `cache/CONTINUATION.md` — generated at session end, not needed at start
- `backups/` folder — empty initially, AI fills as it works

---

## 📋 PROMPT A — For Claude.ai (Web/Mobile) New Chat

**Paste this as your first message:**

```
You will follow the Universal Output SOP v1.3 for all outputs in this chat.

The full SOP is below. Read it carefully. Every response you give must follow:
- The 6-stage output process (Understand → Backup → Measure → Execute → Self-Check → Communicate → Confirm)
- The 16 subSOPs (MagNet, Door Scan, TTE, SCP, FSP, IAC, Insights, Protocol Visibility, FE, SCC, QAC, HFR, SHR, RPT, EEP, PCG)
- The Ensurance System (output skeleton + Priority 10 + Compliance Pulse)
- Live Token Monitor after every major section
- Step tracking table with all columns populated
- Acronyms expanded on first use
- Execution debt counter (must be 0 or explicit deferrals)

Confirm you've read the SOP by responding with: "SOP v1.3 loaded. [N] subSOPs active. Ready." Then wait for my first task.

===== BEGIN UNIVERSAL OUTPUT SOP v1.3 =====

[PASTE FULL CONTENTS OF UNIVERSAL_SOP_PROMPT.md HERE]

===== END UNIVERSAL OUTPUT SOP v1.3 =====
```

**What the user does:**
1. Open the file `UNIVERSAL_SOP_PROMPT.md`
2. Copy its entire contents
3. Replace `[PASTE FULL CONTENTS...]` above with what you copied
4. Paste the whole thing into Claude.ai as the first message
5. Claude confirms. Then start your real task.

---

## 💻 PROMPT B — For Claude Code (New Machine)

**Step 1: Set up the file structure**

```bash
mkdir -p my-project/cache my-project/backups
cd my-project
# Copy the 5 core files into their locations per the table above
```

**Step 2: Paste this as your first message in Claude Code:**

```
You are working in a project that uses the Universal Output SOP v1.3.

STEP 1: Read these files using the Read tool:
- ./UNIVERSAL_SOP_PROMPT.md (the rulebook)
- ./cache/SESSION_STATE.md (current state)
- ./cache/BACKUP_LOG.md (backup history)
- ./cache/FAILURE_LEDGER.md (unified failure tracking — REPEAT + FAILURE entries, was RPT_LOG.md until F8 fusion 2026-05-21)
- ./cache/CONTINUATION.md (if it exists — previous session handoff)

STEP 2: After reading all files, confirm:
"SOP v1.3 loaded. [N] subSOPs active. Cache: [list files found]. Session: [number from SESSION_STATE]. Ready."

STEP 3: Wait for my first task.

You will follow every rule in the SOP for every output. No exceptions. No tier downgrade without stating it.
```

**What the user does:**
1. Copy the 5 files from the source machine to their new machine (USB, email, cloud drive)
2. Open terminal, navigate to project folder
3. Start Claude Code
4. Paste Prompt B as first message
5. Claude reads files, confirms, ready to work

---

## 👤 FOR 3RD-PARTY USERS — What To Send Them

**Send a ZIP containing:**

```
universal-sop-kit/
├── UNIVERSAL_SOP_PROMPT.md
├── NEW_HIRE_GUIDE.md
├── REPLICATION_KIT.md (this file)
├── cache/
│   ├── SESSION_STATE_TEMPLATE.md  (renamed so they know it's a template)
│   ├── BACKUP_LOG_TEMPLATE.md
│   └── RPT_LOG_TEMPLATE.md
└── backups/
    └── .gitkeep  (empty folder)
```

**Include a 1-page setup note:**

> 1. Unzip to any folder on your machine
> 2. Rename the 3 `_TEMPLATE` files to drop the `_TEMPLATE` suffix
> 3. Read `NEW_HIRE_GUIDE.md` first (7 minutes)
> 4. Then read `REPLICATION_KIT.md` (this file) for how to start a session
> 5. Pick your tool: Claude.ai (Prompt A) or Claude Code (Prompt B)

---

## 📝 USER NOTES (What To Remember)

### 🔑 Most Common Mistakes

| # | 🎯 | ❌ Mistake | ✅ Fix |
|:-:|:---:|----------|--------|
| 1 | 🔄 | Starting a new chat without pasting the SOP first | Always paste SOP (or Prompt A/B) as first message of every new session |
| 2 | 💾 | Not pasting the CONTINUATION.md when starting a new session | Copy CONTINUATION.md contents, paste after SOP, THEN start new work |
| 3 | 📊 | Ignoring the LTM (token counter) until it's too late | Watch LTM. At YELLOW, plan to checkpoint. Don't push into RED. |
| 4 | 📋 | Accepting AI output without checking the SubSOP report | Scroll to end of every response. Verify all 16 subSOPs ran. Look for ❌s. |
| 5 | 🔁 | Asking for the same thing twice silently | If AI missed something before, say "you missed this before — RPT trigger." Forces root cause + permanent fix. |

### 💡 Power User Tips

- **Override tier:** Say "use QUICK tier" for simple questions to skip the full process
- **Force checkpoint:** Say "checkpoint now" at any time to save state before session ends
- **Audit mode:** Say "run full fidelity check" for AI to audit its own recent work
- **Reset attention:** Say "re-read Quick Start" to force AI to re-orient mid-session
- **Honest numbers:** If AI's scorecard looks too positive, say "be honest — what are you failing at?" Triggers HFR (Honest Failure Report)

### 🧠 Keywords That Trigger Protocols

| 🎯 | 🗝️ Say This | 🔧 Triggers |
|:---:|------------|-------------|
| 📋 | "use [tier] tier" | Overrides AI's tier choice |
| 🪞 | "run fidelity check" | Full SCC + QAC on recent work |
| 💾 | "checkpoint" | Save state immediately |
| 🔁 | "this is a repeat" | Triggers RPT + immediate fix |
| 🛡️ | "run pulse check" | Forces Compliance Pulse (10-item pre-send) |
| 🪞 | "be honest" | Triggers HFR mode |
| 🔮 | "what's next?" | Forces Foresight Engine |
| 💠 | "wait for confirmation" | Forces AI to pause before proceeding |

---

## 🧪 HOW TO TEST IT WORKS

After starting a new session with Prompt A or B, give this test prompt:

> "Create a 5-item grocery list for a family of 4 for a pasta night."

**Expected AI behavior:**
- Starts with STEP header showing tier (should choose QUICK or STANDARD)
- Provides the list in a table with emoji column
- Ends with a Live Token Monitor line
- If STANDARD: includes Understanding Check, Conclusion, SubSOP Report, Foresight

**If AI skips any of these:** The SOP wasn't loaded properly. Restart session and re-paste the SOP prompt.

---

## 🔧 TROUBLESHOOTING

| 🎯 | ❌ Problem | 🔧 Solution |
|:---:|----------|-------------|
| 📄 | "Claude says it can't access files" (Claude Code) | Use absolute paths, not relative. Alternatively: paste file contents inline. |
| 💬 | "Claude forgot the SOP halfway through" (Claude.ai) | Long sessions lose context. Say "re-read the SOP" to reload. |
| 🔁 | "Claude keeps missing the same thing" | Trigger RPT: "you've missed this 3+ times. Root cause + permanent fix required." |
| 📊 | "LTM numbers seem wrong" | Token estimates are approximate (~20% variance). Trend matters more than individual numbers. |
| 💾 | "Cache files got out of sync" | Tell Claude: "Re-read all cache files and state any inconsistencies before continuing." |

---

## 📞 Support Matrix

| 🎯 | 🏷️ Issue | 👤 Who To Ask |
|:---:|---------|--------------|
| 🐛 | SOP bug or missing rule | Alan (system owner) |
| 📖 | Usage / training question | Your manager / AI lead |
| 💻 | Claude Code setup on new machine | IT / technical lead |
| 🔒 | File permissions / security | IT / security team |

---

## ✅ Replication Checklist

Before declaring a new system "ready":

- [ ] All 5 core files copied to correct locations
- [ ] Prompt A or B pasted, AI confirmed "SOP v1.3 loaded"
- [ ] Test prompt (grocery list) returned expected structure
- [ ] LTM appeared in test response
- [ ] Cache files are readable (or templates in place for first session)
- [ ] User has read NEW_HIRE_GUIDE.md

If all 6 are checked: you have mirror-fidelity replication.
