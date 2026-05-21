# 🚪 SESSION_START — Bootstrap For Any Claude Code / Claude Chat
# VERSION: 1.0 | Last updated: 2026-05-18 | SOP: v1.3
# THIS IS THE OFFICIAL ENTRY POINT. READ THIS FIRST. EVERY SESSION.

---

## 🚨 IF YOU ARE A CLAUDE INSTANCE READING THIS

You are picking up an in-progress project. **Do not skip this file.** Do not jump straight to other files. Follow the steps below in order.

---

## ⚡ STEP 0 — IDENTIFY YOUR CONTEXT

Answer these BEFORE reading any other file:

| ❓ Question | 🎯 Action |
|------------|----------|
| Am I in Claude Code (terminal) or Claude.ai (web chat)? | Claude Code = follow this file. Claude.ai = read `CONSULTING_BRIEF.md` instead. |
| Did the user already paste a resume prompt? | If yes, follow it. If no, follow STEP 1 below. |
| Is this a fresh session or a continuation? | Continuation = read cache files. Fresh = read everything in STEP 1. |

---

## 📖 STEP 1 — MANDATORY READS (In This Order)

Use the Read tool. Read FULLY, not skim. Do not start work until all 6 are read.

```
1. ./SESSION_START.md         ← This file (already reading)
2. ./cache/SESSION_STATE.md   ← Current position, decisions, active work
3. ./cache/CONTINUATION.md    ← Last session's handoff notes
4. ./cache/RPT_LOG.md         ← 9 repeated failures — DO NOT REPEAT THESE
5. ./USER_PROFILE.md          ← Alan's communication preferences — MANDATORY (was optional, promoted 2026-05-21 after field test)
6. ./UNIVERSAL_SOP_PROMPT.md  ← The rulebook (v1.3, 940 lines, 16 SubSOPs)
```

**Optional (read if depth needed):**
- `./CONSULTING_BRIEF.md` — high-level project overview
- `./PROJECT_HISTORY.md` — 40+ hour evolution
- `./CHALLENGES_LOG.md` — 14 challenges + debug history
- `./INVENTORY.md` — full registry of all SOPs/agents/scripts (NEW 2026-05-21)
- `./FUSION_ANALYSIS.md` — proposed merges for post-validation execution (NEW 2026-05-21)
- `./CLAUDE.md` — Claude Code config (now points to this file)
- `./cache/PRIME_SOP.md` — legacy foundation (APW-era)
- `./cache/BRIDGE_SOP.md` — legacy operations (APW-era)

---

## 🤖 ACTIVE AGENT ROSTER (Added 2026-05-21 After Field Test)

When to invoke an agent (rare in normal flow — most outputs use inline SubSOPs):

| 🆔 | 🤖 Agent | 📍 File | 🚪 When To Use |
|:---:|---------|---------|---------------|
| 1 | **Validator-Merged** (Layer 1) | `agents/validator-merged.md` | Framework deliverables — POVP + Completeness + Simplicity + Cross-ref. ~5K tokens. |
| 2 | **Karen** (Layer 2) | `agents/karen-reality-check.md` | After Validator passes on MAJOR deliverables. Anti-rubber-stamp audit. ~7.5K tokens. |
| 3 | **Cache Manager** | `agents/cache-manager.md` | Session start + after every locked decision. ~2.5K tokens. |
| 4 | **Oversight Executive** | `agents/oversight-executive.md` | Coordinates agents 1-3 + 5. ~500 tokens. |
| 5 | **Paradox Resolver** | `agents/paradox-resolver.md` | ON-DEMAND — SCIO/APW tension only. Rare. ~5K tokens. |

**Skip agents for:** conversational responses, status updates, clarifying questions, file summaries.

**Note:** Jenny (standalone) was ARCHIVED 2026-05-21 — her role is fully absorbed into Validator-Merged Section A.

---

## 🎯 TIER QUICK GUIDE (Added 2026-05-21 After Field Test)

Pick the tier based on the user's request:

| 🎚️ Tier | 🎯 Use For | 📋 Required Components |
|---------|-----------|------------------------|
| 🟢 **QUICK** | Casual question, lookup, single fact, ack | Step header + answer + LTM. Skip Understanding Check + step table. |
| 🟡 **STANDARD** | Single deliverable, focused task, file edit | Full SOP — Understanding Check + step table + all SubSOPs + Wrap-up |
| 🔴 **COMPLEX** | Multi-file, multi-step, system change, long output | Full SOP + extended Foresight + SHR + multiple file backups + extra rigor |

---

## ✅ STEP 2 — CONFIRM IN THIS EXACT FORMAT

After reading STEP 1 files, send this message to the user:

```
✅ RESUMED
SOP: v1.3 loaded | 16 SubSOPs active
Cache files loaded: [list what was found]
Current position: [from SESSION_STATE.md "CURRENT POSITION" section]
Last decisions: [last 3 entries from SESSION_STATE.md "DECISIONS LOG"]
Active D-rules / focus: [from SESSION_STATE.md]
Open items / next steps: [from CONTINUATION.md]
Repeated failures to avoid: [count from RPT_LOG.md]

Token budget: ~XK loaded / 200K | Status: 🌱 GREEN

Ready for your task.
```

Then **WAIT** for the user's next message.

---

## ⛔ STEP 3 — DO NOT

Until the user confirms direction, do NOT:
- ❌ Start "improving" any file
- ❌ Run agents
- ❌ Make assumptions about what to work on
- ❌ Skip the SOP framework
- ❌ Output without the SOP step header
- ❌ Edit any file without backup first

---

## 🎯 CURRENT PROJECT STATE (As Of 2026-05-18)

### Active Work
**Universal Output SOP v1.3** — system is mechanically complete and pushed to GitHub. Next priority is **field testing** in a fresh session to validate Ensurance System (EN.1-EN.4) prevents compliance decay over 10+ outputs.

### Background Context (Not Current Focus)
**APW (Ascend Prime Wealth) course** — the original Skool course project. PAUSED until Universal SOP is field-tested. The APW project is what BIRTHED the need for the SOP; once SOP is bulletproof, work returns to APW course building.

### Current Tier 1 Priorities
1. 🧪 **Field test SOP in fresh session** — does it actually self-enforce without prompting?
2. 🤖 **Decide on validation sub-agent** — build (v1.3.1) or defer (v1.4)
3. 📦 **Build distribution ZIP** — once SOP validates, package for 3rd parties
4. 🎓 **Return to APW course** — Step 4 (7DFS Lessons Per Module), Module 4.1

### Not Yet Started / Open Questions
- Does Ensurance System actually prevent regression over 10+ outputs? (UNTESTED)
- Will Priority 10 reduction interact correctly with full 16 SubSOP demands?
- Hybrid sub-agent approach (~15-25K tokens for ~25-30% catch increase) — worth it?

---

## 🔄 GIT / GITHUB WORKFLOW

**This repo is on GitHub:** `github.com/xprimordius/universal-sop` (PRIVATE)

### Critical Daily Rules

| 🕐 When | 🎯 Action | 💻 Command |
|---------|----------|-----------|
| ▶️ Session start | Pull latest | `git pull` |
| ⏸️ Mid-session (every ~30 min) | Commit + push | "checkpoint and push" → I run: `git add . && git commit -m "..." && git push` |
| ⏹️ Session end | Update CONTINUATION + final push | "End session" → I update cache + push |

### Why This Matters
- **Skipping pull** → merge conflicts when another device has new work
- **Skipping push** → other devices can't see what you did
- **Cache files (`./cache/*`) MUST be pushed** — they are the memory across devices

### Multi-Device Setup
On a new device:
```bash
gh repo clone xprimordius/universal-sop
cd universal-sop
claude  # or your launcher
# Then paste this file's STEP 1 instructions to the AI
```

---

## 👤 USER PROFILE QUICK REFERENCE

Full file: `./USER_PROFILE.md`

| 🎯 | 🏷️ Trait | 📝 Rule For You |
|:---:|---------|----------------|
| 🎯 | Lead with answer | Headlines first. Never bury the point. |
| ✂️ | Concise | No filler. No hedging. |
| 📊 | Tables > paragraphs | Always tables for comparisons. |
| 🔍 | Verify, don't assume | Mark inference vs fact. |
| ⚡ | Promise = deliver | Same message. No "next time." |
| 🚫 | Hates: theater, wordy, fake numbers | Be honest. Mark unknowns as N/M. |
| 🔁 | Catches repeated failures | If user has asked 2+ times → HFR mode immediately. |

---

## 🛡️ SOP COMPLIANCE — NON-NEGOTIABLES

For EVERY output (even simple ones), you MUST:

1. ✅ Step header (STEP / SOP / TIER / EST) on line 1
2. ✅ Understanding Check (your words → my interpretation table) if STANDARD or COMPLEX
3. ✅ Token estimate BEFORE writing
4. ✅ LTM (Live Token Monitor) after every section
5. ✅ Step tracking table with all columns (Est / Actual / Cumul / Fidelity / Verified)
6. ✅ Conclusion mapping every prompt item to a deliverable
7. ✅ Foresight + Analysis + SHR (System Health Report) at end
8. ✅ Execution Debt Counter (honest numbers)
9. ✅ Pulse Check (10/10) before sending
10. ✅ Backup before any file edit

Full reference: `./UNIVERSAL_SOP_PROMPT.md`

---

## 🚨 REPEATED FAILURES — DO NOT REPEAT

Full log: `./cache/RPT_LOG.md`. The top patterns:

| # | 🏷️ Pattern | 🛡️ Prevention |
|:-:|-----------|---------------|
| 1 | LTM dropped from wrap-up sections | EN.1 skeleton — LTM after EVERY section, no exceptions |
| 2 | Acknowledge without execute | Show proof of execution. No future tense. |
| 3 | Edit without backup | Backup FIRST. Then edit. Sequence is fixed. |
| 4 | Fabricated time numbers | Mark as N/M (Not Measurable). Honesty over theater. |
| 5 | Theater compliance | Honest scorecards. Real failures named. |
| 6 | Acronyms without expansion | First use: "SOP (Standard Operating Procedure)" |
| 7 | Custom table format instead of SOP-defined | Use the EXACT format. No improvisation. |
| 8 | Wrap-up components skipped under "overhead" rationale | Skeleton forces all components every output |
| 9 | Regression after correction (works once, breaks next) | Ensurance System EN.1-EN.4 enforces structure |

---

## 📞 IF YOU'RE STUCK / UNSURE

Default behavior: **ASK ALAN.** Do not assume.

- Confused about priority? → Ask which file/task is most important right now
- Conflict between rules? → Ask which rule wins
- File seems out of date? → Ask if it should be updated or marked historical
- Token budget tight? → Ask if checkpoint + new session is preferred

**"Do not assume. Verify." is Alan's explicit rule (D6).**

---

## 🎯 ONE-LINE SUMMARY

> You are Claude. You are resuming the Universal Output SOP project. Read the 5 files in STEP 1, confirm in the exact format in STEP 2, then wait. Follow the SOP v1.3 for every output. Pull before work, push after work. Be honest. Don't assume. Lead with the answer.

---

*SESSION_START.md v1.0 | Bootstrap file | Required reading | Project: xprimordius/universal-sop (PRIVATE)*
