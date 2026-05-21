# CONTINUATION — Universal SOP / APW Project
# Last updated: 2026-05-21 | SOP: v1.3 | Session: 5

## 📊 LATEST SESSION SUMMARY
- SOP Version: **v1.3**
- Repo: **github.com/xprimordius/universal-sop** (PRIVATE) — commit `c34fa82`
- Last work date: 2026-05-21
- Status at close: 🌱 GREEN

---

## ▶️ NEXT ACTION (Canonical — Read This First)

**🔴 P0 — Run REAL device test of Universal SOP v1.3.**

The sub-agent simulation passed (Session 5: 8/10 friction, fixes from 7/10 baseline confirmed working). The remaining unknown is whether this holds on a TRULY fresh device.

Use `REAL_DEVICE_TEST.md` for the protocol. Phone, other laptop, or new clone of repo. ~30-45 min.

If you (Alan) say "do something else" — that overrides this. Otherwise this is the canonical next step.

---

## ✅ COMPLETED ACROSS ALL SESSIONS (Cumulative)

### Session 1 (Mar 31) — SOP Birth
- Built Universal SOP v1.0 → v1.2 across 9 iteration rounds (R1-R9)
- 16 SubSOPs established (SP.1-SP.16)
- TTE (Token Threshold Engine), MagNet, Door Scan, EEP, PCG protocols created

### Session 2 (Apr 1) — Compliance Crisis + Ensurance
- Full compliance audit: 43 requirements from R1–R9 → 44% → 79% → 93% compliance
- Identified decay mechanisms (DC.1-DC.5) + solution failure causes (SF.1-SF.3)
- Built Ensurance System (EN.1-EN.4) — SOP bumped to v1.3
- Created cache files: BACKUP_LOG, SESSION_STATE, RPT_LOG, CONTINUATION
- Built NEW_HIRE_GUIDE.md + REPLICATION_KIT.md
- Time-per-step honestly marked N/M (not measurable)

### Session 3 (Apr 16) — External Consulting Export
- Built 4 consulting docs: CONSULTING_BRIEF, PROJECT_HISTORY, CHALLENGES_LOG, USER_PROFILE
- Modular structure (4 files) chosen over mega-doc to preserve external chat context budget

### Session 4 (May 18) — Cross-Device Infrastructure
- Installed `gh` CLI v2.92.0 via Homebrew
- Authenticated as `xprimordius`
- Initialized git repo + comprehensive `.gitignore` (excluded `.claude/settings.local.json`)
- Pushed 260 files (4.9MB) to PRIVATE GitHub repo `xprimordius/universal-sop`
- **Honest gap audit:** found repo had raw material but NO entry point for fresh AI
- Created `README.md` (GitHub-facing project description)
- Created `SESSION_START.md` v1.0 (bootstrap for any AI/human session)
- Updated `CLAUDE.md` to redirect to SESSION_START.md

### Session 5 (May 21) — Full Spectrum Audit + Validation Loop
- Built `INVENTORY.md` (full registry: 6 SOPs, 4 active + 9 legacy + 10 sub-cache files, 5 active agents + Jenny + 3 archived + 8 user-uploaded, scripts, docs — ~120 files cataloged)
- Built `FUSION_ANALYSIS.md` (12 fusion proposals F1-F12: 7 SAFE, 4 CONDITIONAL, 1 REJECTED — Phase A/B/C/D execution plan, ~25-30% token overhead reduction potential)
- **F5 EXECUTED** — Jenny standalone archived to `agents/archive/`. Active agents now: 5. Validator-Merged Section A handles her role.
- **CLAUDE.md modernized** — D25 protocol references 4 active cache files (was 8 legacy), legacy zone explicitly marked with "do not follow" warnings
- **SESSION_START v1.0 → v1.1** — promoted USER_PROFILE to mandatory STEP 1, added Active Agent Roster, added Tier Quick Guide
- **First sub-agent validation test** (7/10 friction, 9 gaps surfaced — FT2.1-FT2.9)
- **7/9 gap fixes applied:** Precedence Rule (CLAUDE.md + SESSION_START), Auto Mode resolution, off-by-one (5→6 files), SESSION_STATE POSITION refresh, version bumps
- **SESSION_START v1.1 → v1.2** with Precedence Rule + Auto Mode Resolution
- Built `REAL_DEVICE_TEST.md` (full physical-device test kit: setup × 3 options, bootstrap prompt, 10-output battery, EN.4 scoring rubric, decay watch D1-D7, pass/fail thresholds)
- **Second sub-agent validation test** (8/10 friction — improvement confirmed, 8 new gaps surfaced)
- **Critical Session 5-end fixes:** refreshed this CONTINUATION.md with Session 5 block, deduped SESSION_STATE Open Decisions, added canonical NEXT ACTION line, fixed SESSION_START footer version

### Sub-Agent Test Results Comparison (Session 5)
| Test | Friction | Gaps Found | Status |
|------|:--------:|:----------:|--------|
| First (start of Session 5) | 7/10 | 9 | Baseline |
| Second (after 7 fixes) | 8/10 | 8 (mostly new/smaller) | +1 improvement; fixes confirmed working |

---

## 🔄 PENDING (Pick Up Here — Priority Order)

### 🔴 P0 — Validation
1. **Field test SOP v1.3 in a truly fresh Claude Code session** (other device or new clone)
   - Test: does the SOP self-enforce when AI hasn't been talking to Alan all day?
   - Validation: does EN.1-EN.4 prevent regression over 10+ outputs?

### 🟡 P1 — Architecture Decisions
2. **Validation sub-agent build decision** — build (v1.3.1) or defer (v1.4)?
   - Cost: ~15-25K tokens per call
   - Benefit: ~25-30% catch rate increase on compliance failures
3. **Backups folder** — exclude from git as repo grows? Currently included.
4. **APW course return** — when? Currently blocked on SOP validation.

### 🟢 P2 — Polish
5. Time-per-step columns — keep as N/M or remove from SOP entirely?
6. Folder rename — `APW_EXPORT - Friday Mar 13th 2026` → cleaner name?

---

## 🐙 GITHUB WORKFLOW (Multi-Device)

### Each session start
```bash
cd path/to/universal-sop
git pull
claude  # or your launcher
# Then paste SESSION_START.md STEP 1 instructions to AI
```

### Each session end
```
User says: "End session. Update CONTINUATION and push."
AI: updates this file + SESSION_STATE.md + FAILURE_LEDGER.md (was RPT_LOG.md until F8 fusion 2026-05-21)
AI: git add . && git commit -m "..." && git push
```

### Mid-session checkpoint (every ~30 min or after major step)
```
User says: "checkpoint and push"
AI: git add . && git commit -m "..." && git push
```

---

## 📁 ALL FILES IN REPO (For Orientation)

```
universal-sop/
├── 🚪 SESSION_START.md          ← BOOTSTRAP (read first)
├── 📖 README.md                  ← GitHub-facing
├── 📋 UNIVERSAL_SOP_PROMPT.md    ← Rulebook v1.3 (940 lines)
├── 📋 CLAUDE.md                  ← Now points to SESSION_START
├── 🤝 CONSULTING_BRIEF.md
├── 📅 PROJECT_HISTORY.md
├── 🚧 CHALLENGES_LOG.md
├── 👤 USER_PROFILE.md
├── 👋 NEW_HIRE_GUIDE.md
├── 📦 REPLICATION_KIT.md
├── 📜 CONTEXT_TRANSFER.md        ← Historical (Mar 13)
├── 📜 MIGRATION_README.md        ← Historical (Mar 13)
├── 📁 cache/                     ← ACTIVE STATE (must be read)
│   ├── SESSION_STATE.md
│   ├── CONTINUATION.md           ← This file
│   ├── BACKUP_LOG.md
│   ├── FAILURE_LEDGER.md  ← active (was RPT_LOG.md until F8 fusion 2026-05-21)
│   ├── RPT_LOG.md         ← deprecated redirect pointer
│   └── ... (legacy APW cache, partial relevance)
├── 📁 agents/                    ← Validation sub-agent defs
├── 📁 sop_scripts/               ← Token tracker (Node.js)
├── 📁 source_files/              ← APW course source
└── 📁 backups/                   ← Historical SOP versions
```

---

## 🔮 WATCH OUT FOR (Foresight)

| 🎯 | ⚠️ Risk | 🛡️ Mitigation |
|:---:|---------|--------------|
| 🧪 | SOP not yet tested in truly fresh session | Plan field test soon — biggest unknown |
| 📦 | Context compaction in long sessions | Cache files are persistent insurance; CONTINUATION.md is the save game |
| 🐙 | Forget to push before switching devices | Build habit: end every session with "checkpoint and push" |
| 🔀 | Forget to pull before starting work | Build habit: `git pull` is first command every session |
| 🤖 | Fresh AI may not read SESSION_START.md unprompted | Always paste the bootstrap prompt explicitly |
| 📊 | Time-per-step columns ambiguity | Marked N/M for honesty; revisit if Alan wants different approach |

---

## 📋 KEY DECISIONS MADE (Cumulative)

- 16 SubSOPs (PCG added Round 9 = SP.16)
- Consolidated 5 cache files → 3 active (SESSION_STATE absorbs USER_PROMPTS + TOKEN_LOG)
- Time columns marked N/M rather than fabricated
- Cache files created immediately, not "later" (anti-debt P1)
- SOP v1.2 → v1.3 added Ensurance System (EN.1-EN.4)
- Modular consulting docs (4 files) chosen over mega-doc
- GitHub repo PRIVATE, not public
- SESSION_START.md is the canonical entry point (not CLAUDE.md)

---

## 🔁 TOP REPEATED PROMPTS — Do Not Repeat These Failures

| # | 🏷️ Pattern | 🔢 Times | 🛡️ Fix |
|:-:|-----------|:--------:|--------|
| 1 | LTM dropped from wrap-up | 6+ | EN.1 skeleton — LTM after every section |
| 2 | Token + time per step in wrong format | 5+ | Use SOP L161-163 exactly. No improvisation. |
| 3 | Execute don't acknowledge | 3+ | EEP + PCG. Show proof. No future tense. |
| 4 | Acronyms unexpanded | 3+ | First use: "SOP (Standard Operating Procedure)" |
| 5 | Edit without backup | 2+ | Backup FIRST. Sequence is fixed. |

Full log: `cache/FAILURE_LEDGER.md` (RPT_LOG.md was deprecated by F8 fusion 2026-05-21)

---

## ⚙️ INSTRUCTIONS FOR NEXT SESSION AI

**Defer to `SESSION_START.md` STEP 1 (7 mandatory reads) and STEP 2 (9-line confirmation format).**

Do NOT use any confirmation template that competes with SESSION_START.md STEP 2. If you see an older 7-line template in this file's git history, it has been superseded as of 2026-05-21 (FT7.2 fix).

**Bootstrap procedure lives in SESSION_START.md as the single source of truth.** This file (CONTINUATION.md) provides the LATEST handoff content, not the procedure for handoff.

---

*CONTINUATION.md v3.0 | Session 5 (2026-05-21) | xprimordius/universal-sop (PRIVATE) | SOP v1.3*
