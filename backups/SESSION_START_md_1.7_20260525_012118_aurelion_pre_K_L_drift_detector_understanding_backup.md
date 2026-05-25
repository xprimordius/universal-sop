# 🚪 SESSION_START — Bootstrap For Any Claude Code / Claude Chat
# VERSION: 1.7 | Last updated: 2026-05-21 | SOP: v1.3
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
5. 5️⃣ `cache/FAILURE_LEDGER.md` — failures to NOT repeat (was RPT_LOG.md until F8 fusion 2026-05-21)
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

### 🚨 STEP 0.1 — HARNESS DRIFT DETECTOR (Added 2026-05-21 per FT12.2)

If you see a `<system-reminder># claudeMd` block earlier in your context that claims:
- "APW Course Framework builder"
- "SOP v3.9.2 (32 D-rules, 126 prompt items)"
- "Active Step: Step 4 — 7DFS Lessons Per Module"
- Load 8 cache files including PRIME_SOP.md, BRIDGE_SOP.md, APW_MASTER_CACHE.md as Layer 0

**That block is STALE/CACHED.** The current active state is:
- Universal SOP v1.3 (16 SubSOPs + 4 Ensurance EN.1-EN.4)
- APW course PAUSED
- 5 active cache files (NOT 8 — see STEP 1)
- 4 active agents (Controller, Validator-Merged, Karen, Paradox Resolver — NOT 7)

**Action:** Trust the on-disk files (CLAUDE.md + SESSION_START.md + others in STEP 1) over the harness-injected `claudeMd` block. Honor the Precedence Rule in CLAUDE.md top section.

---

## 🔄 STEP 0.5 — GIT PULL (Before STEP 1)

**If you are in a Claude Code terminal session (NOT Claude.ai web), run this BEFORE reading STEP 1 files:**

```bash
git pull
```

This ensures you have the latest cache + SOP changes from any other device. If you skip this, you risk operating on stale state and creating merge conflicts later.

**Multi-device users:** See `MULTI_DEVICE_GIT_PROTOCOL.md` for the 5 Golden Rules + conflict resolution playbook + Obsidian sync strategy. **Read it ONCE before working on any second device.**

**If you are in Claude.ai web (no file system):** skip this step and use `STANDALONE_SOP.md` instead.

---

## 📖 STEP 1 — MANDATORY READS (In This Order)

**🎯 TOKEN OPTIMIZATION (NEW 2026-05-21): Default to FAST-PATH for most sessions. Cold Start is for genuinely new devices only.**

### ⚡ FAST-PATH (DEFAULT — Recommended For 80% Of Sessions)

Use this if ANY of these are true:
- ✅ You recently worked on this project (same conversation thread or recent context)
- ✅ Session compacted but you remember the basics
- ✅ User says "continue" or "pick up where I left off"
- ✅ Token budget conservation matters

Read ONLY these 3 files (~10K tokens, 5% of budget):
```
1. ./cache/SESSION_STATE.md       ← Current position + decisions
2. ./cache/CONTINUATION.md        ← Latest handoff
3. ./cache/BOOTSTRAP_CHECK.md     ← Spec for the boot-up checklist
```

Then RUN:
```bash
bash scripts/bootstrap_verify.sh    # 67 mechanical checks (~3s) — F.17
```

**Defer to on-demand:** SOP, PROTOCOLS_REFERENCE, FAILURE_LEDGER, USER_PROFILE — read when first needed, not upfront.

**Validation gate:** If verifier exits non-zero OR BOOTSTRAP_CHECK conceptual checks reveal gap → abort Fast-Path, run Cold Start.

**Token savings:** ~18K per session (vs Cold Start).

---

### 🆕 COLD START (Only For Genuinely Fresh Devices — ~28K tokens, 14% of budget)

Use this ONLY if:
- ❌ Brand new device that has NEVER seen this project
- ❌ Suspected harness drift (claudeMd stale)
- ❌ Cross-device first sync after major structural changes
- ❌ User explicitly says "full bootstrap"

Use the Read tool. Read FULLY, not skim. Do not start work until all 8 are read.

```
1. ./SESSION_START.md            ← This file (already reading)
2. ./cache/SESSION_STATE.md      ← Current position, decisions, active work
3. ./cache/CONTINUATION.md       ← Last session's handoff notes
4. ./cache/FAILURE_LEDGER.md     ← 16 system failures (F.1–F.16) — DO NOT REPEAT (was RPT_LOG.md, fused via F8 on 2026-05-21)
5. ./USER_PROFILE.md             ← Alan's communication preferences — MANDATORY (promoted 2026-05-21)
6. ./PROTOCOLS_REFERENCE.md      ← Full protocol acronyms + names (PROMOTED 2026-05-21 — Rule #11 requires this)
7. ./UNIVERSAL_SOP_PROMPT.md     ← The rulebook (v1.3, 940 lines, 16 SubSOPs) — start with the Quick Start TL;DR at top (~80 lines, ~60s read)
8. ./cache/BOOTSTRAP_CHECK.md    ← Comprehensive boot self-test spec v2.0 — 77 check items across 12 categories (F.17 fix 2026-05-21, ~60s read)
9. bash scripts/bootstrap_verify.sh  ← Run mechanical verifier (67 of the 77 checks, ~3s)
```

**Token cost:** ~25-30K (15% of budget). Worth it for true cold starts.

---

### ⚡ FAST-PATH (Continuation — Recent Session — Read 3 Files Only)

**NEW 2026-05-21 per FT12.4.** Use this if:
- ✅ You recently worked on this project (same conversation thread or recent context)
- ✅ The session compacted but you remember the SOP basics
- ✅ The user explicitly says "fast resume" or "lite bootstrap"
- ❌ NOT for truly cold starts (use full 8-file path above)

Read ONLY these 3 files + run verifier:

```
1. ./cache/SESSION_STATE.md      ← Current position + decisions
2. ./cache/CONTINUATION.md       ← Latest handoff
3. ./cache/BOOTSTRAP_CHECK.md    ← Spec for the boot-up checklist (v2.0 = F.17)
4. bash scripts/bootstrap_verify.sh   ← 67 mechanical checks (~3s)
```

**Token cost:** ~10K (~5% of budget). Save ~15-20K vs cold start.

**Defer to on-demand (FT13.5 — now as table per USER_PROFILE preference):**

| 📄 File | 🔍 When To Load | 🔎 Search Keyword |
|---------|----------------|-------------------|
| UNIVERSAL_SOP_PROMPT.md | Starting first output | Read Quick Start TL;DR (lines 8-95, ~2K) |
| PROTOCOLS_REFERENCE.md | First reference to an unfamiliar protocol | Search by "SP.X" or full name |
| FAILURE_LEDGER.md | Failure pattern matches a guardrail | Search by F.X or pattern (e.g., "LTM", "truncation") |
| USER_PROFILE.md | Uncertain about Alan's preference | Trust memory; cross-check if friction surfaces |
| CLAUDE.md | Verifying precedence rule | Read STOP banner only (lines 1-30) |

### ⚠️ VALIDATION GATE (Highest-Risk Failure Mode — FT13.3 Made Prominent)

> **If BOOTSTRAP_CHECK reveals ANY comprehension gap (any expected answer doesn't match your mental model), you MUST abort fast-path and run full COLD START.**
>
> Example gaps that trigger abort (FT13.4):
> - You think there are 5 or 7 agents (correct: **4**)
> - You think the failure log is RPT_LOG.md (correct: **FAILURE_LEDGER.md** since F8 fusion)
> - You think SOP version is v3.9.2 or you see "32 D-rules" (correct: **v1.3, 16 SubSOPs**)
> - You think APW course is active (correct: **PAUSED**)
> - You used "Caches Loaded" 5-line confirmation (correct: **STEP 2 9-line format**)
>
> **A 30-second abort + COLD START beats shipping a wrong-state output.**

**When in doubt:** Use COLD START. Fast-path is for confidence, not laziness.

**Optional (read if depth needed):**
- `./chat_archive/README.md` — chat transcript backup workflow (use `chat_archive/archive_chat.sh` to snapshot sessions — NEW 2026-05-21)
- `./MULTI_DEVICE_GIT_PROTOCOL.md` — multi-device backup hygiene (READ ONCE before working on second device — NEW 2026-05-21)
- `./STANDALONE_SOP.md` — hosts the EN.4 Pulse Check 2.0 (P1-P15) — READ if doing STANDARD/COMPLEX work (FT14.3 reference)
- `./EFFICIENCY_GUIDE.md` — honest analysis of friction ceiling + 5 reachable gains — READ if pushing toward 9.0+ friction score
- `./PUBLIC_SHARE_KIT.md` — guidance for publishing STANDALONE_SOP.md externally (MIT/CC license options, gist vs repo, privacy checklist) — NEW 2026-05-21
- `./SHIP_INSTRUCTIONS.md` — turnkey package for executing A (publish gist) + B (cross-model test)
- `./CONSULTING_BRIEF.md` — high-level project overview
- `./PROJECT_HISTORY.md` — 40+ hour evolution
- `./CHALLENGES_LOG.md` — 14 challenges + debug history
- `./INVENTORY.md` — full registry of all SOPs/agents/scripts with expandable agent sections
- `./FUSION_ANALYSIS.md` — proposed merges for post-validation execution
- `./REAL_DEVICE_TEST.md` — physical-device test kit (bootstrap prompt + scoring rubric)
- `./CLAUDE.md` — Claude Code config (now points to this file)
- `./cache/legacy/INDEX.md` — historical SOP archive index (PRIME_SOP, BRIDGE_SOP, SOP_FULL_REFERENCE moved here 2026-05-21 via F1 fusion)

---

## 🚫 SUB-AGENT SKIP CONDITIONS (Token Optimization 2026-05-21)

**Sub-agent validation tests are ~16K tokens each.** Do NOT run if ANY of these are true:
- ✅ 3+ consecutive tests already at same friction score (plateau confirmed)
- ✅ Only cosmetic changes since last test (typos, version stamps, link updates)
- ✅ User says "skip validation" or "just do it"
- ✅ Token budget at 🟡 YELLOW or worse (validation consumes too much)

**DO run sub-agent test if:**
- 🔴 Structural change to SOP (new SubSOP, fusion executed, etc.)
- 🔴 New file added to mandatory bootstrap path
- 🔴 User explicitly requests "QA test"
- 🔴 First test after entering a new tier (e.g., first cross-model)

**Default heuristic:** No more than 3 sub-agent tests per session unless explicitly requested.

---

## 🤖 ACTIVE AGENT ROSTER (Updated 2026-05-21 After F4 Fusion)

When to invoke an agent (rare in normal flow — most outputs use inline SubSOPs):

| 🆔 | 🤖 Agent | 📍 File | 🚪 When To Use |
|:---:|---------|---------|---------------|
| 1 | **Controller** | `agents/controller.md` | Session start + every deliverable + after locked decisions. Orchestrates + maintains cache. ~5K tokens/session. |
| 2 | **Validator-Merged** (Layer 1 — archived; superseded by F.19 chain) | `agents/archive/validator-merged.md` | Framework deliverables — POVP + Completeness + Simplicity + Cross-ref. ~5K tokens. **Current chain:** `agents/verifier.md` → `agents/validator.md` → `agents/qc.md` → `agents/meta_verifier.md` (per F.19 agent-chain rebuild 2026-05-21). |
| 3 | **Karen** (Layer 2 — archived) | `agents/archive/karen-reality-check.md` | After Validator passes on MAJOR deliverables. Anti-rubber-stamp audit. ~7.5K tokens. **Note:** Replaced by mechanical pre-commit hook + Meta-Verifier (F.16 + F.19). |
| 4 | **Paradox Resolver** (archived) | `agents/archive/paradox-resolver.md` | ON-DEMAND — SCIO/APW tension only. Rare. ~5K tokens. |
| 5 | **Chiron** (Self-Improvement Lead, NEW 2026-05-22) | `agents/chiron.md` | Meta-cadence (monthly): protocol coverage audit + REFINE orchestration + F-class curation. Owner of `scripts/pristine_audit.sh`. |

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

## ✅ STEP 2 — CONFIRM WITH COMPREHENSIVE BOOT-UP CHECKLIST

**F.17 fix 2026-05-21 — Per Alan: "checklist for literally everything in detail with check marks. Full transparency. Embedded in the file itself, like a boot up."**

### STEP 2.A — Run the mechanical verifier (REQUIRED)

```bash
bash scripts/bootstrap_verify.sh
```

This runs **67 mechanical checks** (identity, agents, SOP architecture, all 16 SubSOPs by name, 4 Ensurance, cache files, scripts, hooks, fusion status, harness drift). Exit code 0 = pass, 1 = at least one ❌. **Spec lives in `cache/BOOTSTRAP_CHECK.md` v2.0.**

If exit code = 1, **DO NOT** continue to STEP 2.B. Surface the failed items and ask Alan whether to fix or proceed.

### STEP 2.B — Send this message to the user

```
🚀 BOOT-UP SELF-TEST — Universal Output SOP v1.3
[paste FULL output of bootstrap_verify.sh — all 67 ✅ lines, organized in 11 categories]

🧠 CONCEPTUAL CHECKS (Section 12 — AI-sourced from cache reads):
🎯 MACRO: [from SESSION_STATE GOAL TRACKING → MACRO GOAL]
📌 MICRO: [from SESSION_STATE GOAL TRACKING → MICRO GOAL]
📊 Macro Status: [from GOAL STATUS]

Cache files loaded: [list]
Current position: [from CURRENT POSITION]
Last 3 decisions:
  • [decision N]
  • [decision N-1]
  • [decision N-2]
▶️ Macro-level next action: [from GOAL TRACKING]
▶️ Micro-level next action: [from GOAL TRACKING]
Repeated failures to avoid: F.1–F.N ([count] entries in FAILURE_LEDGER)

Token budget: ~XK loaded / 200K | Status: 🌱 GREEN

✅ ALL SYSTEMS GO — Ready for your task.
```

**Rationale (F.13 + F.17):**
- F.13 introduced MACRO + MICRO surfacing to prevent objective drift
- F.17 expanded this to **literal check marks for everything** — agents, SOPs, all 16 SubSOPs by name, Ensurance, cache, scripts, hooks, fusion status, harness drift
- Why: silent failures cost hours. ~3 seconds of mechanical checks catches missing agents, broken hooks, stale fusions, harness drift before they propagate.

Then **WAIT** for the user's next message.

---

## ⛔ STEP 3 — DO NOT

Until the user confirms direction, do NOT:
- ❌ Start "improving" any file
- ❌ Run agents
- ❌ Make assumptions about what to work on
- ❌ Skip the SOP framework
- ❌ Output without the SOP step header
- ❌ Edit any file without backup first (see UNIVERSAL BACKUP RULE below — mandatory)
- ❌ Delete any existing file (see UNIVERSAL BACKUP RULE below — non-negotiable)
- ❌ **Read chat_archive/ files during bootstrap** (TOKEN OPTIMIZATION 2026-05-21 — these are reference/audit-only, NOT operational. ~5-10K saved by skipping.)

---

## 🛡️ UNIVERSAL BACKUP & PRESERVATION RULE (Added 2026-05-21 — Cross-Device, Alan + Aurelia + Mac-Main Convergence)

**Repo-wide rule. Applies to ALL files in this repo, not just `cache/`. Inherited by every device that clones + bootstraps this repo — that's the point of putting it here instead of in a local config.**

| # | 🛡️ Rule | 📝 Detail |
|:-:|---------|-----------|
| 1 | **NEVER delete existing files** | No `rm`, no overwrite-that-destroys-content, no rename-that-drops-the-old-name. If a file must be replaced, the old version goes to `backups/` (or `cache/legacy/archived_*` per Mac's Rule 7 in MULTI_DEVICE_GIT_PROTOCOL.md) first. Git history is not a substitute — backups must be discoverable on disk. |
| 2 | **Backup BEFORE every modification** | Sequence is fixed: **backup → edit → log**. Never edit then backup. Failure mode: editing first means the old state only exists in git history, not as a discoverable file in `backups/`. |
| 3 | **Timestamped filename + device identity** | Top-level `backups/`: `<original>_v<ver>_<YYYYMMDD>_<HHMMSS>_<device>_<reason>_backup.<ext>`. `cache/backups/`: `<YYYYMMDD>_<HHMMSS>_<device>_v<ver>_<reason>/` (subdirectory style). The `<device>` segment is the registered device name from `DEVICE_REGISTRY.md` (NOT raw hostname — the registry is authoritative). Alan operates across multiple devices (2 Strix Halos, Mac, desktop, more) and cross-device recovery needs to know which machine produced the backup. |
| 4 | **Log every backup** | In `cache/BACKUP_LOG.md` in the same operation as the edit, with: `# \| date \| time \| file \| version \| reason \| backup path`. Device identity is surfaced via the `<device>` segment in the backup path AND via the commit subject `[<device> \| YYYY-MM-DD HH:MM TZ]` (per MULTI_DEVICE_GIT_PROTOCOL.md commit convention). |
| 5 | **Applies to ALL files** | `UNIVERSAL_SOP_PROMPT.md`, `CLAUDE.md`, `SESSION_START.md`, `cache/*`, `agents/*`, `source_files/*`, `sop_scripts/*`, `scripts/*`, even `README.md`. Everything. Not just cache. |
| 6 | **Cross-device inheritance** | This rule lives in `SESSION_START.md` (the canonical bootstrap every device reads) + DEVICE_REGISTRY.md (mac-main's registry) so cloning the repo automatically transmits the discipline. No device should reproduce the "edit-without-backup" failure pattern. |
| 7 | **Device identity is non-optional** | Same logical reason as the timestamp: a backup that doesn't disclose its origin device cannot be safely restored on a different machine without manual archaeology. Filenames without `<device>` are non-conforming from 2026-05-21 onward. Pre-2026-05-21 backups are grandfathered as device-unknown. New devices register via `bash scripts/setup_device.sh <DEVICE_NAME>` before any work. |

**Structural anti-decay** — like the Ensurance System (EN.1–EN.4), this rule cannot be skipped under any "low-risk" / "small edit" / "just appending" rationale. If you find yourself thinking *"this edit is too small to bother backing up"* — that thought IS the failure mode. Back up anyway.

### 🛡️ ENFORCEMENT MECHANISM (Added 2026-05-23 — answer to "where's the backup agent?")

**No single named agent — distributed 5-layer mechanical enforcement.** No additional Claude agent needed (per LEARNINGS_FROM_INDUSTRY: mechanical > behavioral).

| Layer | Where | What | Blocks? |
|:-:|---|---|:-:|
| 1 | `scripts/compliance_check.sh` CHECK 8 (NEW 2026-05-23) | At commit time: requires NEW BACKUP_LOG row in same staged diff if any non-meta file was MODIFIED. Catches "edited but didn't log." | ⚠️ warns (issue counted toward FAIL) |
| 2 | `scripts/append_only_check.sh` (in `.githooks/pre-commit`) | At commit time: blocks if append-only files (BACKUP_LOG, FAILURE_LEDGER, SIR_LOG, META_AUDIT_LOG, SOP_HEALTH_METRICS) shrink. | 🚨 BLOCKS |
| 3 | `scripts/pristine_audit.sh` §3 (BACKUP_LOG integrity) | On-demand / quarterly: for every BACKUP_LOG row, verify the referenced backup file exists on disk. Catches "logged but file missing/typo." | ⚠️ surfaces |
| 4 | `scripts/pristine_audit.sh` §10 (Backup orphan detection) | On-demand / quarterly: for every `backups/*` file, verify it's referenced in BACKUP_LOG. Catches "exists but unlogged." | ⚠️ surfaces |
| 5 | **Chiron** (`agents/chiron.md`) monthly run | Meta: trends layers 1–4 over time; flags if rule decay rate increases. | 📊 monitors |

**Why no single "Backup Steward" agent:** per industry data ([LEARNINGS_FROM_INDUSTRY.md](LEARNINGS_FROM_INDUSTRY.md)), mechanical enforcement raises task accuracy MCC 0.43 → 0.88 vs behavioral. Adding an agent for what 5 mechanical layers already cover = adding complexity without reliability gain.

**Failure mode caught:** Alan asked "where's the backup agent?" twice (2026-05-22 + 2026-05-23). Second ask triggered this enforcement-section addition + CHECK 8 ship. Pattern is now mechanical, not relying on AI discipline.

**Origin:** 2026-05-21 — during Day-1 setup on device `aurelia` (Windows), AI appended a row to `cache/BACKUP_LOG.md` without a pre-edit backup file. Alan codified the rule via `/remember` to make the discipline cross-device. Then Alan added device-identity. In PARALLEL, `mac-main` worked the same problem space and added complementary infrastructure: `DEVICE_REGISTRY.md` (215 lines), `scripts/` (setup_device, append_only_check, check_device_activity, compliance_check, consistency_check), `.githooks/pre-commit` (version-controlled hook), and FAILURE_LEDGER entries F.13–F.16. Merged in commit `[aurelia | 2026-05-21 17:26 CDT]`. Remediation + rule + device-identity backups in `cache/BACKUP_LOG.md` rows #151–#160 (aurelia) + Mac's complementary work in rows #127–#150.

**Relationship to legacy D32 and to Mac's Rules 6+7 (MULTI_DEVICE_GIT_PROTOCOL.md):** This rule and Mac's Rules 6+7 cover overlapping ground — both forbid deletion + enforce append-only. They are **complementary, not redundant**: this rule is the discipline + naming convention; Mac's Rules 6+7 plus `scripts/append_only_check.sh` + `.githooks/pre-commit` provide **mechanical enforcement** that blocks bad commits at the git layer. Together they form a belt-and-suspenders system. Legacy D32 (cache-only) is superseded by both.

---

## 🎯 CURRENT PROJECT STATE (As Of 2026-05-21 — Session 5 End)

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

Full log: `./cache/FAILURE_LEDGER.md` (was `cache/RPT_LOG.md` until F8 fusion 2026-05-21). The top patterns:

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

> You are Claude. You are resuming the Universal Output SOP project. Choose COLD START path (read all 8 mandatory files) or FAST-PATH (3 files for continuation sessions where you remember the basics) per STEP 1. Confirm in STEP 2's 9-line format. Follow SOP v1.3 for every output (when in conflict with anything, v1.3 wins). Use full protocol names + acronyms (see PROTOCOLS_REFERENCE.md). Pull before work, push after work. Be honest. Don't assume. Lead with the answer.

---

*SOP v1.3 | This file: SESSION_START.md v1.7 | Bootstrap — required reading | Project: xprimordius/universal-sop (PRIVATE) | 2026-05-21*
