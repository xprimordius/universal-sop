# 📋 FULL INVENTORY — Every SOP, Cache, Agent, Script
# VERSION: 1.0 | 2026-05-21 | SOP: v1.3 (current) | PRIME SOP: v2.8 (foundational)
# Companion to CONSULTING_BRIEF.md — Full Spectrum Registry

---

## 🎯 PURPOSE OF THIS FILE

Alan asked: "What happened to the Prime SOP and Bridge SOP and everything else? Find these!"

This file is the **complete registry** of every governing document, cache file, agent, and script in the project. It maps WHAT exists, WHERE it lives, WHAT it does, and WHETHER it's active.

---

## 🏛️ THE SOP HIERARCHY (Layered Architecture)

The project has THREE layers of SOPs that evolved over time:

```
┌─────────────────────────────────────────────────────────┐
│  LAYER 0 — FOUNDATION (Original)                        │
│  ┌──────────────────────────────────────────────────┐   │
│  │ PRIME_SOP.md v2.8                                │   │
│  │ 12 stages, 32 D-rules, ~90KB, 6 cache files req  │   │
│  │ The unconditional foundation. APW-project focused.│   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
                          ▼ ▼ ▼ INFLUENCED ▼ ▼ ▼
┌─────────────────────────────────────────────────────────┐
│  LAYER 1 — OPERATIONS (Transitional)                    │
│  ┌──────────────────────────────────────────────────┐   │
│  │ BRIDGE_SOP.md v1.1                               │   │
│  │ Interim operating framework. Visual protocol +   │   │
│  │ floor standards. Used during APW build.          │   │
│  └──────────────────────────────────────────────────┘   │
│  ┌──────────────────────────────────────────────────┐   │
│  │ SOP_FULL_REFERENCE.md                            │   │
│  │ Full reference doc — 119+ prompt items distilled │   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
                          ▼ ▼ ▼ DISTILLED INTO ▼ ▼ ▼
┌─────────────────────────────────────────────────────────┐
│  LAYER 2 — PORTABLE (Current)                           │
│  ┌──────────────────────────────────────────────────┐   │
│  │ UNIVERSAL_SOP_PROMPT.md v1.3                     │   │
│  │ 6 stages, 16 SubSOPs, Ensurance System EN.1-EN.4 │   │
│  │ 940 lines, project-agnostic, portable to any chat│   │
│  │ ← THIS IS THE CURRENT ACTIVE GOVERNANCE          │   │
│  └──────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
```

---

## 📋 ALL SOP DOCUMENTS — FOUND

### Active (Currently Governing Work)

| 📄 File | 📍 Location | 📊 Size | 🎯 Purpose | 📅 Last Updated | ✅ Status |
|---------|------------|:------:|------------|----------------|:---------:|
| **UNIVERSAL_SOP_PROMPT.md** | `/UNIVERSAL_SOP_PROMPT.md` | 51KB / 940 lines | THE current rulebook. 6 stages, 16 SubSOPs, Ensurance System | 2026-04-16 | ✅ **ACTIVE — PRIMARY** |
| **PRIME_SOP.md** | `cache/PRIME_SOP.md` | 90KB | Layer 0 foundation, 12 stages, 32 D-rules (APW-focused) | 2026-03-15 | ✅ ACTIVE (legacy foundation) |
| **BRIDGE_SOP.md** | `cache/BRIDGE_SOP.md` | 13KB | Interim operational SOP — visual protocol + floor standards | 2026-03-13 | ✅ ACTIVE (operations) |
| **SOP_FULL_REFERENCE.md** | `cache/SOP_FULL_REFERENCE.md` | 19KB | Reference doc — 119+ prompt items full text | 2026-03-13 | ✅ ACTIVE (reference) |
| **CLAUDE.md** | `/CLAUDE.md` | 8KB | Claude Code project config — now redirects to SESSION_START | 2026-05-18 | ✅ ACTIVE (bootstrap pointer) |
| **SESSION_START.md** | `/SESSION_START.md` | NEW | Official entry-point bootstrap | 2026-05-18 | ✅ ACTIVE (newest) |

### Historical Backups (Older Versions Preserved)

| 📄 File | 📍 Location | 📅 Era |
|---------|------------|---------|
| APW_Master_SOP_v3.1 through v3.8 | `sop_versions/` (8 .docx + 6 .pdf) | Mar 13 (early APW build) |
| UNIVERSAL_SOP_PROMPT_v1.0 | `/UNIVERSAL_SOP_PROMPT_v1.0_20260331_backup.md` | Mar 31 (initial Universal) |
| UNIVERSAL_SOP_PROMPT_v1.1 | `backups/UNIVERSAL_SOP_PROMPT_v1.1_20260331_backup.md` | Mar 31 |
| UNIVERSAL_SOP_PROMPT_v1.2 (postfix) | `backups/UNIVERSAL_SOP_PROMPT_v1.2_20260331_postfix_backup.md` | Mar 31 |
| UNIVERSAL_SOP_PROMPT_v1.2 (pre-Ensurance) | `backups/UNIVERSAL_SOP_PROMPT_v1.2_20260401_pre-ensurance_backup.md` | Apr 1 |
| UNIVERSAL_SOP_PROMPT_v1.3 (pre-fidelity-fix) | `backups/UNIVERSAL_SOP_PROMPT_v1.3_20260401_pre-fidelity-fix_backup.md` | Apr 1 |
| Session checkpoint backups (v3.92, v3.93, v1.1, v2.2, v2.6, v2.7) | `cache/backups/[timestamp]_*` (9 folders) | Mar 13–14 |
| CLAUDE.md pre-bootstrap | `cache/backups/CLAUDE.md.20260518_pre_bootstrap_backup` | May 18 |

---

## 💾 ALL CACHE FILES — FOUND

### Active Cache (Currently Used)

| 📄 File | 📊 Size | 🎯 Purpose | 📅 Last Updated | ✅ Status |
|---------|:------:|-----------|----------------|:---------:|
| **SESSION_STATE.md** | 5KB | Current position, decisions, prompts, GitHub state | 2026-05-21 | ✅ ACTIVE |
| **CONTINUATION.md** | 7KB | Latest session handoff with cumulative log | 2026-05-21 | ✅ ACTIVE |
| **BACKUP_LOG.md** | 3KB | All backups indexed | 2026-05-21 | ✅ ACTIVE |
| **RPT_LOG.md** | 3KB | 9+ repeated prompt failures + permanent fixes | 2026-04-16 | ✅ ACTIVE |

### APW-Era Cache (Legacy — Partial Relevance)

These were the 8 mandatory cache files for the APW project (per PRIME_SOP D25). When Universal SOP took priority, they remained but became less central.

| 📄 File | 📊 Size | 🎯 Purpose | 📅 Last Updated | 🟡 Status |
|---------|:------:|-----------|----------------|:---------:|
| APW_MASTER_CACHE.md | 14KB | All 32 D-rules, POVP/PFV protocols, error log, locked decisions | 2026-03-13 | 🟡 LEGACY — needed if returning to APW course work |
| BUILD_STATE_CACHE.md | 16KB | Build position, deliverables, 11 failure points + solutions | 2026-03-15 | 🟡 LEGACY |
| SCIO_KNOWLEDGE_CACHE.md | 24KB | 22 SCIO principles, paradox resolutions, exact numbers | 2026-03-13 | 🟡 LEGACY — APW course content |
| PROGRAM_DETAILS_CACHE.md | 8KB | 8 classrooms, 12 modules, 6-tier ascension, lesson lists | 2026-03-13 | 🟡 LEGACY |
| USER_FOUNDATION_CACHE.md | 7KB | Alan's explicit decisions, preferences, non-negotiables | 2026-03-13 | 🟡 LEGACY — now superseded by USER_PROFILE.md |
| TOKEN_BUDGET_LOG.md | 11KB | Token tracking (APW-era, before LTM/TTE) | 2026-03-15 | 🟡 LEGACY — superseded by SESSION_STATE token section |
| USER_PROMPTS_VERBATIM.md | 14KB | Exact Alan quotes (APW-era) | 2026-03-14 | 🟡 LEGACY |
| USER_PROMPT_FULFILLMENT_AUDIT.md | 10KB | Audit of prompts vs fulfillment | 2026-03-14 | 🟡 LEGACY |
| USER_PROMPT_INVENTORY.md | 36KB | Full prompt inventory | 2026-03-13 | 🟡 LEGACY |

### Sub-Cache Files (APW Course Source Distillations)

Located in `cache/subcache/` — distilled SCIO course knowledge for APW build:

| 📄 File | 🎯 Purpose |
|---------|-----------|
| SUBCACHE_INDEX.md | Index of all subcaches |
| SCIO_OFFER_DESIGN.md | Section 0 distillation |
| SCIO_SCALING_PRODUCTIZATION.md | Section 1 distillation |
| SCIO_FULFILMENT_DELIVERY.md | Section 4 distillation |
| SCIO_PRICING_ASCENSION.md | Pricing principles |
| SCIO_LTGP_CAC.md | LTV / CAC math |
| SCIO_GROWTH_MECHANICS.md | Growth tactics |
| SCIO_PNL_COMPENSATION.md | P&L + comp structure |
| SCIO_BUSINESS_TRACKER.md | Tracker design |
| SCIO_TOC_KPIS.md | Theory of constraints + KPIs |

**Status:** 🟡 LEGACY — APW-specific, only relevant when course building resumes.

---

## 🤖 ALL AGENTS — FOUND (FULL SPECTRUM)

### Active Agents (Production)

#### 🎩 OVERSIGHT EXECUTIVE
| 🏷️ Property | 📝 Value |
|------------|---------|
| 📄 File | `agents/oversight-executive.md` (4.3KB) |
| 🎯 Role | Top-level controller. Doesn't do work — ensures right agents run in right order with right context, within token budget |
| 🚪 When Invoked | START of every framework deliverable + END to verify completion |
| 📋 Reports To | Alan directly (via transparency report) |
| 🔗 Delegates To | Validator (Layer 1), Karen (Layer 2), Cache Manager, Paradox Resolver |
| 📊 SOP Followed | PRIME_SOP.md + VALIDATION_WORKFLOW.md |
| 💰 Token Cost | Coordination only — ~500 tokens per orchestration |
| ✅ Status | ACTIVE |

#### 🎯 VALIDATOR (Merged Layer 1)
| 🏷️ Property | 📝 Value |
|------------|---------|
| 📄 File | `agents/validator-merged.md` (3.8KB) |
| 🎯 Role | Unified Layer 1 — combines 4 original agents (Jenny + Deliverable Validator + Simplicity Filter + SOP Compliance Checker) into one pass |
| 🚪 When Invoked | EVERY framework output (per VALIDATION_WORKFLOW) |
| 📋 Checks | A) POVP word-by-word spec verification, B) Completeness, C) Simplicity (D7), D) Process compliance, E) Cross-reference |
| 📊 SOP Followed | PRIME_SOP D-rules (D1, D3, D7, D8, D9, D10, D11, D12, D14, D15, D17, D20, D23, D24) |
| 💰 Token Cost | ~5,000 tokens per validation |
| 🔗 Reports To | Karen (Layer 2) and Oversight Executive |
| ✅ Status | ACTIVE — **fusion of 4 original agents** |

#### 🪞 KAREN — Reality Check (Layer 2)
| 🏷️ Property | 📝 Value |
|------------|---------|
| 📄 File | `agents/karen-reality-check.md` (3.2KB) |
| 🎯 Role | Audits the auditors. Checks WHETHER Layer 1 actually did its job, or rubber-stamped. |
| 🚪 When Invoked | AFTER Layer 1 passes, on EVERY major framework deliverable |
| 📋 Checks | 1) Did Layer 1 actually verify? 2) Did builder miss things Alan addressed? 3) Is it actually done? 4) Would Alan be frustrated? |
| 📊 SOP Followed | Anti-rubber-stamp — independent verification, reads cache files herself, FULL audit always |
| 💰 Token Cost | ~7,500 tokens per audit |
| 🔗 Reports To | Oversight Executive |
| ✅ Status | ACTIVE — **last gate before Alan sees output** |

#### 💾 CACHE MANAGER — Data Integrity
| 🏷️ Property | 📝 Value |
|------------|---------|
| 📄 File | `agents/cache-manager.md` (4KB) |
| 🎯 Role | Maintains cache integrity — updates, backups, prevention, repair, token tracking |
| 🚪 When Invoked | Session start (mandatory) + after every locked decision + after every framework deliverable + on budget threshold + on suspected corruption |
| 📋 Checks | Cache existence, timestamps, cross-cache consistency, staleness, completeness |
| 📊 SOP Followed | D25 (Session Start), D28 (Cache Update), D32 (Backup) |
| 💰 Token Cost | ~2,000-3,000 tokens per integrity check |
| 🔗 Reports To | Oversight Executive |
| ✅ Status | ACTIVE — **replaces 4 originally proposed agents** |

#### ⚖️ PARADOX RESOLVER — Deep Analysis
| 🏷️ Property | 📝 Value |
|------------|---------|
| 📄 File | `agents/paradox-resolver.md` (2KB) |
| 🎯 Role | Resolves tensions between SCIO principles and APW framework. Deep analysis, not surface-flagging. |
| 🚪 When Invoked | **ON-DEMAND ONLY** — when SCIO/APW tension detected. Rare. |
| 📋 Process | Define tension → analyze both sides → check prior resolutions → propose resolution → classify (RESOLVED / RESOLVED WITH TRADE-OFF / FUNDAMENTAL) |
| 📊 SOP Followed | Cites SCIO principle numbers + APW elements specifically |
| 💰 Token Cost | ~5,000 tokens per resolution |
| 🔗 Reports To | Oversight Executive + Alan (Alan decides on FUNDAMENTAL conflicts) |
| ✅ Status | ACTIVE — but rarely fires |

#### 🔍 JENNY — SOP Spec Verifier (Standalone)
| 🏷️ Property | 📝 Value |
|------------|---------|
| 📄 File | `agents/jenny-sop-verifier.md` (3.2KB) |
| 🎯 Role | Externalized POVP protocol (D19). Word-by-word verification against SOP v3.8+ |
| 🚪 When Invoked | When Validator-Merged needs decomposing — basically a fallback or specialized invocation |
| ⚠️ Overlap | **Merged into validator-merged.md as section A.** Standalone use is rare. |
| 📊 SOP Followed | All 32 D-rules + APW prompt items |
| 💰 Token Cost | ~4,000 tokens |
| ✅ Status | ACTIVE — but redundant with Validator (Jenny was the original; Validator absorbed her role) |

### Archived Agents (Folded Into Others)

| 📄 File | 🎯 Original Role | 🔀 Merged Into |
|---------|----------------|---------------|
| `agents/archive/deliverable-validator.md` | Layer 1 — verifies deliverables are actually complete | → `validator-merged.md` Section B (Completeness) |
| `agents/archive/simplicity-filter.md` | Layer 1 — D7 5th grader test | → `validator-merged.md` Section C (Simplicity) |
| `agents/archive/sop-compliance-checker.md` | Layer 1 — checks output against 119 prompt items + 24 D-rules | → `validator-merged.md` Section A (POVP) |

**Fusion record:** 4 separate Layer 1 agents → 1 Validator-Merged. Saved ~12,000 tokens per validation run.

### User-Uploaded Agent Concepts (Reference Only)

| 📄 File | 🎯 Concept | 📊 Status |
|---------|-----------|---------|
| `agents/user_uploaded/Jenny.md` | Original Jenny spec uploaded by Alan | Reference — informed `jenny-sop-verifier.md` |
| `agents/user_uploaded/karen.md` | Original Karen spec uploaded by Alan | Reference — informed `karen-reality-check.md` |
| `agents/user_uploaded/claude-md-compliance-checker.md` | Agent idea: enforce CLAUDE.md rules | Not yet built — could be a future agent |
| `agents/user_uploaded/code-quality-pragmatist.md` | Agent idea: pragmatic code review | Not relevant to APW/Universal SOP work |
| `agents/user_uploaded/task-completion-validator.md` | Agent idea: validate task completion | Folded into Validator + Karen |
| `agents/user_uploaded/ui-comprehensive-tester.md` | Agent idea: UI testing | Not relevant |
| `agents/user_uploaded/ultrathink-debugger.md` | Agent idea: deep debug analysis | Possibly useful for SOP debugging |
| `agents/user_uploaded/README.md` | Index of user uploads | Reference |

---

## 📜 ALL SCRIPTS — FOUND

Located in `sop_scripts/`:

| 📄 File | 🎯 Purpose | ✅ Status |
|---------|-----------|:---------:|
| `token_tracker.js` | Node.js token usage tracker — logs each operation | 🟡 Used in APW-era; not currently in Universal SOP flow |
| `sop_v38_CURRENT.js` | APW SOP v3.8 as JavaScript object — authoritative source | 🟡 LEGACY |
| `blitz_vs_prime.py` | Python — comparison of Blitz vs Prime protocol | 🟡 Reference |
| `APW_Blitz_vs_Prime_Protocol_Roadmap.xlsx` | Spreadsheet roadmap | 🟡 LEGACY |
| `APW_CONTINUATION_GUIDE.md` | APW-era continuation handoff (precursor to current CONTINUATION.md) | 🟡 LEGACY |
| `PASTE_THIS_FIRST.md` | APW-era paste prompt (precursor to SESSION_START.md) | 🟡 LEGACY |
| `WEB_CLAUDE_INSTRUCTIONS.md` | Instructions for Claude.ai web | 🟡 Reference — partially superseded by CONSULTING_BRIEF.md |

---

## 📚 ALL DOCUMENTATION FILES — FOUND

### Root-Level Documentation (Active)

| 📄 File | 🎯 Audience | 🎯 Purpose | ✅ Status |
|---------|-------------|-----------|:---------:|
| README.md | GitHub visitor / new device | Project overview + quick start | ✅ NEW (May 18) |
| SESSION_START.md | Fresh AI / human session | Bootstrap — required reading | ✅ NEW (May 18) |
| CONSULTING_BRIEF.md | External Claude.ai chat | Consulting handoff package | ✅ Active (Apr 16) |
| PROJECT_HISTORY.md | External consultant | 40+ hour timeline | ✅ Active (Apr 16) |
| CHALLENGES_LOG.md | External consultant | Bottlenecks + debug history | ✅ Active (Apr 16) |
| USER_PROFILE.md | External consultant | Alan's communication preferences | ✅ Active (Apr 16) |
| NEW_HIRE_GUIDE.md | New team member | Plain-English onboarding | ✅ Active (Apr 16) |
| REPLICATION_KIT.md | Setting up on new machine | Paste-ready prompts | ✅ Active (Apr 16) |
| INVENTORY.md | Anyone — full registry | **THIS FILE** | ✅ NEW (May 21) |

### Root-Level Documentation (Historical)

| 📄 File | 📅 Era | 🎯 Status |
|---------|--------|----------|
| CONTEXT_TRANSFER.md | Mar 13 | 🟡 Historical — old context handoff |
| MIGRATION_README.md | Mar 13 | 🟡 Historical — old migration notes |

---

## 📦 ALL SOURCE FILES — FOUND

Located in `source_files/` — APW course raw material:

```
source_files/
├── section_0/           ← SCIO Section 0 (Offer Design, 5 lessons)
├── section_1/           ← SCIO Section 1 (Scaling, 8 lessons)
├── section_4/           ← SCIO Section 4 (Fulfilment, 7 lessons)
├── section_1_sheets/    ← P&L + Business Tracker spreadsheets
└── apw_source_documents/← Wireframes, offer details, Sarah Turner, brain dump
```

**Status:** 🟡 LEGACY — needed when APW course building resumes. Not currently active.

---

## 🎯 MASTER SUMMARY TABLE

| 🏷️ Category | 📊 Count | ✅ Active | 🟡 Legacy | 🗄️ Archived |
|------------|:--------:|:--------:|:--------:|:-----------:|
| Governing SOPs | 6 | 4 | 2 | — |
| Active cache files | 4 | 4 | — | — |
| Legacy APW cache files | 9 | — | 9 | — |
| Sub-cache files (SCIO) | 10 | — | 10 | — |
| Active agents | 5 | 5 | — | — |
| Standalone agents (overlap) | 1 (Jenny) | 1 | — | — |
| Archived agents | 3 | — | — | 3 |
| User-uploaded agent ideas | 8 | — | 8 | — |
| Scripts | 7 | — | 7 | — |
| Active documentation | 9 | 9 | — | — |
| Historical documentation | 2 | — | 2 | — |
| SOP version backups | 18+ | — | — | 18+ |
| Source files (APW course) | ~30 | — | 30 | — |
| **TOTAL UNIQUE FILES** | **~120** | **~32 active** | **~70 legacy** | **~21 archived** |

---

## 🔮 WHAT'S CURRENTLY GOVERNING WORK (Quick Answer)

For day-to-day work in this session:

| 🎯 | 🏷️ Document | 📝 Role |
|:---:|------------|---------|
| 1️⃣ | **UNIVERSAL_SOP_PROMPT.md v1.3** | The active rulebook (6 stages, 16 SubSOPs, Ensurance) |
| 2️⃣ | **SESSION_START.md** | Bootstrap pointer |
| 3️⃣ | **cache/SESSION_STATE.md** | Current position |
| 4️⃣ | **cache/CONTINUATION.md** | Last handoff |
| 5️⃣ | **cache/RPT_LOG.md** | Failures to NOT repeat |
| 6️⃣ | **PRIME_SOP.md** | Foundation reference (if depth needed) |
| 7️⃣ | **BRIDGE_SOP.md** | Operations reference (if depth needed) |

**Agents:** Available but rarely invoked in Universal SOP mode. They were heavily used in APW-era. See FUSION_ANALYSIS.md for proposed consolidation.

---

## 🧬 WHY DOES THIS COMPLEXITY EXIST?

Honest narrative:

| 📅 Phase | 🏗️ What Was Built | 🎯 Why |
|---------|---------------------|--------|
| Phase 1 (Mar 13-14) | PRIME_SOP, BRIDGE_SOP, APW cache files (8), agents (originally 4 separate Layer 1) | Building APW course required structure. Each problem birthed a SOP/cache/agent. |
| Phase 1.5 (Mar 14) | Agent fusion: 4 Layer 1 agents → 1 Validator-Merged | Token efficiency. Same coverage, ~12K fewer tokens per validation. |
| Phase 2 (Mar 31) | UNIVERSAL_SOP_PROMPT.md v1.0 created | Distill APW-specific governance into portable form |
| Phase 3 (Mar 31-Apr 1) | v1.0 → v1.3 with 16 SubSOPs + Ensurance | Iterative refinement |
| Phase 4 (Apr 16) | Consulting docs created | Enable external consultation |
| Phase 5 (May 18-21) | GitHub setup + bootstrap files + this inventory | Cross-device continuation + full visibility |

**Result:** Rich history. Significant accumulated artifacts. **Most of them legacy.** The active surface is much smaller than the file count suggests.

---

## 🎯 NEXT FILE TO READ

For fusion proposals: see `FUSION_ANALYSIS.md`

---

*INVENTORY.md v1.0 | Companion to: CONSULTING_BRIEF.md, FUSION_ANALYSIS.md | Generated 2026-05-21*
