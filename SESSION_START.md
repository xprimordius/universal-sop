# 🚪 SESSION_START — Bootstrap For Any Claude Code / Claude Chat
# VERSION: 1.2 | Last updated: 2026-05-21 | SOP: v1.3
# THIS IS THE OFFICIAL ENTRY POINT. READ THIS FIRST. EVERY SESSION.
#
# v1.2 changes (2026-05-21): Added Precedence Rule (FT2.2 fix), Auto Mode resolution (FT2.7 fix),
# off-by-one cleanup (FT2.6 fix). v1.1 added USER_PROFILE mandatory + Agent Roster + Tier Guide.

---

## 🚨 IF YOU ARE A CLAUDE INSTANCE READING THIS

You are picking up an in-progress project. **Do not skip this file.** Do not jump straight to other files. Follow the steps below in order.

---

## 🏆 PRECEDENCE RULE (Critical — Read Before Anything Else)

**When ANYTHING in this repo conflicts with `UNIVERSAL_SOP_PROMPT.md` v1.3, the v1.3 SOP WINS.**

Order of authority (highest first):
1. 🥇 **`UNIVERSAL_SOP_PROMPT.md` v1.3** — the active rulebook
2. 🥈 **`SESSION_START.md`** — this file, bootstrap procedure
3. 🥉 **`cache/SESSION_STATE.md`** — current state, decisions
4. 4️⃣ `cache/CONTINUATION.md` — last handoff
5. 5️⃣ `cache/RPT_LOG.md` — failures to NOT repeat
6. 6️⃣ `USER_PROFILE.md` — communication preferences
7. ⛔ `CLAUDE.md` legacy section + APW cache files — historical reference ONLY

**Specifically — if you see these conflicts, the v1.3 SOP wins:**

| 🥊 Conflict Topic | ✅ Use This (v1.3 SOP) | ❌ Not This (CLAUDE.md legacy) |
|------------------|------------------------|-------------------------------|
| Step header format | `STEP: ... / SOP: v1.3 / TIER: ... / SCOPE: ... / EST: ...` | D29 7-line format |
| Confirmation message | This file's STEP 2 format (9 lines) | CLAUDE.md 5-line "Caches loaded" |
| Active rulebook | 16 SubSOPs (SP.1-SP.16) | 32 D-rules (D1-D32) |
| Cache files to load | 4 active (STEP 1 below) | 8 APW-era |
| Active focus | Universal SOP field-testing | "Step 4 — 7DFS Lessons Per Module" |

---

## 🤖 AUTO MODE / SYSTEM REMINDERS — Resolution

If you see a system-reminder saying "Auto Mode Active" or "execute immediately" or "prefer action over planning" — that is the harness telling you to operate continuously. **It does NOT override SESSION_START STEP 3.**

Specifically:
- ✅ Auto Mode means: don't ask permission for routine decisions; make reasonable assumptions on low-risk work
- ❌ Auto Mode does NOT mean: skip the bootstrap, start coding before reading mandatory files, ignore the user's actual prompt
- 🎯 Sequencing: complete bootstrap (STEP 1 → STEP 2 confirm) FIRST, then operate in Auto Mode on what the user actually asks

If the user's prompt is "continue where we left off" or similar — that itself is an instruction to bootstrap + report, not to fabricate work.

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

Use the Read tool. Read FULLY, not skim. Do not start work until all 7 are read.

```
1. ./SESSION_START.md         ← This file (already reading)
2. ./cache/SESSION_STATE.md   ← Current position, decisions, active work
3. ./cache/CONTINUATION.md    ← Last session's handoff notes
4. ./cache/RPT_LOG.md         ← 9 repeated failures — DO NOT REPEAT THESE
5. ./USER_PROFILE.md          ← Alan's communication preferences — MANDATORY (promoted 2026-05-21)
6. ./PROTOCOLS_REFERENCE.md   ← Full protocol acronyms + names (PROMOTED 2026-05-21 — Rule #11 requires this)
7. ./UNIVERSAL_SOP_PROMPT.md  ← The rulebook (v1.3, 940 lines, 16 SubSOPs)
```

**Optional (read if depth needed):**
- `./CONSULTING_BRIEF.md` — high-level project overview
- `./PROJECT_HISTORY.md` — 40+ hour evolution
- `./CHALLENGES_LOG.md` — 14 challenges + debug history
- `./INVENTORY.md` — full registry of all SOPs/agents/scripts with expandable agent sections
- `./FUSION_ANALYSIS.md` — proposed merges for post-validation execution
- `./REAL_DEVICE_TEST.md` — physical-device test kit (bootstrap prompt + scoring rubric)
- `./CLAUDE.md` — Claude Code config (now points to this file)
- `./cache/legacy/INDEX.md` — historical SOP archive index (PRIME_SOP, BRIDGE_SOP, SOP_FULL_REFERENCE moved here 2026-05-21 via F1 fusion)

---

## 🤖 ACTIVE AGENT ROSTER (Updated 2026-05-21 After F4 Fusion)

When to invoke an agent (rare in normal flow — most outputs use inline SubSOPs):

| 🆔 | 🤖 Agent | 📍 File | 🚪 When To Use |
|:---:|---------|---------|---------------|
| 1 | **Controller** | `agents/controller.md` | Session start + every deliverable + after locked decisions. Orchestrates + maintains cache. ~5K tokens/session. |
| 2 | **Validator-Merged** (Layer 1) | `agents/validator-merged.md` | Framework deliverables — POVP + Completeness + Simplicity + Cross-ref. ~5K tokens. |
| 3 | **Karen** (Layer 2) | `agents/karen-reality-check.md` | After Validator passes on MAJOR deliverables. Anti-rubber-stamp audit. ~7.5K tokens. |
| 4 | **Paradox Resolver** | `agents/paradox-resolver.md` | ON-DEMAND — SCIO/APW tension only. Rare. ~5K tokens. |

**Skip agents for:** conversational responses, status updates, clarifying questions, file summaries.

**Architecture changes (2026-05-21):**
- **F5:** Jenny (standalone) ARCHIVED — role absorbed by Validator-Merged Section A
- **F4:** Oversight Executive + Cache Manager → **fused into Controller** (saves ~1.5K tokens/session)
- Active agents: 7 (Mar 14) → 5 (May 21 morning) → **4** (May 21 evening)

**Hierarchy:**
```
CONTROLLER (control plane: orchestrate + cache)
    │
    ├── VALIDATOR-MERGED (Layer 1)
    ├── KAREN (Layer 2)
    └── PARADOX RESOLVER (on-demand)
```

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
11. ✅ **Protocol references use full name + acronym on first use** (NEW 2026-05-21)

Full reference: `./UNIVERSAL_SOP_PROMPT.md` (rules) + `./PROTOCOLS_REFERENCE.md` (full names + acronyms)

---

## 🏷️ FULL-NAME PROTOCOL CONVENTION (Added 2026-05-21)

**Alan's rule:** Every protocol reference must include BOTH the full name AND the 2-3 letter acronym on first use in any output.

### ✅ Correct Format
- "SP.1 MagNet (Magnetic Visual Engagement Protocol)"
- "EN.4 Pulse Check (Compliance Pulse Check)"
- "SP.15 EEP (Execution Enforcement Protocol)"
- "SP.13 SHR (System Health Report)"

### ⚠️ Acceptable After First Use
- "MagNet" — after SP.1 was already expanded in same output
- "EEP" — after SP.15 was already expanded
- "Pulse Check" — after EN.4 was already expanded

### ❌ Wrong (Bare Acronym Without Prior Expansion)
- "EEP" with no prior "SP.15 EEP (Execution Enforcement Protocol)" in same output
- "SP.10" without "Self-Compliance Check" expansion
- "Door Scan" without "SP.2 Door Scan (Door Scanning Pattern Protocol)"

### Authoritative Reference
**`./PROTOCOLS_REFERENCE.md`** — full registry of all 20 protocols (16 SubSOPs + 4 Ensurance) with:
- Full names
- Acronym origins
- Scopes
- Sub-protocols
- When triggered
- Failure modes
- Token costs
- Related protocols

Every protocol in an expandable `<details>` section for transparency.

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

> You are Claude. You are resuming the Universal Output SOP project. Read the 7 mandatory files in STEP 1 (the 6 cache+profile files + UNIVERSAL_SOP_PROMPT.md), confirm in the exact format in STEP 2, then wait. Follow the SOP v1.3 for every output (when in conflict with anything, v1.3 wins). Use full protocol names + acronyms (see PROTOCOLS_REFERENCE.md). Pull before work, push after work. Be honest. Don't assume. Lead with the answer.

---

*SESSION_START.md v1.2 | Bootstrap file | Required reading | Project: xprimordius/universal-sop (PRIVATE)*
