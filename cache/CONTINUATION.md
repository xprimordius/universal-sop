# CONTINUATION — Universal SOP / APW Project
# Last updated: 2026-05-18 | SOP: v1.3 | Session: 3+

## 📊 LATEST SESSION SUMMARY
- SOP Version: **v1.3**
- Repo: **github.com/xprimordius/universal-sop** (PRIVATE)
- Last work date: 2026-05-18
- Status at close: 🌱 GREEN

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
- Created `SESSION_START.md` (bootstrap for any AI/human session)
- Updated `CLAUDE.md` to redirect to SESSION_START.md
- Updated cache files (this file, SESSION_STATE.md, BACKUP_LOG.md)

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
AI: updates this file + SESSION_STATE.md + RPT_LOG.md
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
│   ├── RPT_LOG.md
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

Full log: `cache/RPT_LOG.md`

---

## ⚙️ INSTRUCTIONS FOR NEXT SESSION AI

```
1. Read SESSION_START.md (in repo root) — bootstrap instructions
2. Read this file (cache/CONTINUATION.md) — latest handoff
3. Read cache/SESSION_STATE.md — current position
4. Read cache/RPT_LOG.md — failures to NOT repeat
5. Read UNIVERSAL_SOP_PROMPT.md — the rulebook v1.3
6. Confirm in this exact format:
   ✅ RESUMED
   SOP: v1.3 loaded
   Cache: [files found]
   Current position: [from SESSION_STATE]
   Last decisions: [last 3]
   Pending P0: [field test SOP]
   Token budget: ~XK / 200K | Status: 🌱 GREEN
   Ready.
7. WAIT for Alan's task. Do not start work unprompted.
```

---

*CONTINUATION.md | Session 4 (2026-05-18) | xprimordius/universal-sop (PRIVATE) | SOP v1.3*
