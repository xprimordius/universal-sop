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

### Active Agents (Production — Click To Expand Each)

**Architecture (post-F4 fusion 2026-05-21):** 4 active agents — Controller + Validator-Merged + Karen + Paradox Resolver

<details>
<summary><b>🎩 CONTROLLER — Orchestration + Cache Integrity (file: agents/controller.md, NEW 2026-05-21, F4 Fusion)</b></summary>

#### Full Name
**Controller — Universal SOP Top-Level Coordinator + Cache Integrity Agent**

#### Born From
**F4 Fusion (2026-05-21)** — Combines former Oversight Executive (orchestration) + former Cache Manager (state integrity) into single CONTROL plane agent.

#### Role
The unified control-plane agent. Does NOT do content work (that's Validator-Merged + Karen). Combines:
1. **Orchestration** (formerly Oversight Executive) — delegate Layer 1/Layer 2/Resolver agents
2. **State Integrity** (formerly Cache Manager) — keep cache files current, detect drift, repair corruption

#### When Invoked
- 🟢 Session start (mandatory) — read 7 STEP 1 files + integrity check + report
- 🟡 Every framework deliverable START — task scope, budget check, agent delegation
- 🟡 Every framework deliverable END — verify delivery, cache update, transparency report
- 🔴 After every locked decision — update SESSION_STATE + relevant caches
- 🔴 On SP.3 TTE (Token Threshold Engine) threshold alert — checkpoint protocol
- ⚠️ On suspected data corruption — restore from backup, log incident

#### Hierarchy
```
CONTROLLER (this — control plane)
    │
    ├── VALIDATOR-MERGED (Layer 1 — content + compliance)
    ├── KAREN (Layer 2 — audits the auditors)
    └── PARADOX RESOLVER (on-demand — SCIO/APW tensions)
```

#### Integrity Checks Performed
- Cross-cache consistency (SESSION_STATE ↔ CONTINUATION ↔ RPT_LOG)
- Staleness detection (footer dates, version drift)
- Completeness (locked decisions in 2+ caches, HFR-class failures in RPT)
- Backup verification

#### Token Cost
- Session start integrity check: ~1,500
- Per-deliverable orchestration: ~1,000
- Cache update after decision: ~500
- Typical session overhead: **~5,000 tokens**
- **Savings vs pre-fusion: ~1,500 tokens per session** (was ~6,500)

#### SOPs Followed
- Universal SOP v1.3 (16 SubSOPs + 4 Ensurance)
- PROTOCOLS_REFERENCE.md (full names + acronyms)
- SESSION_START.md (bootstrap procedure)
- Legacy: PRIME_SOP D25/D28/D32 (historical reference)

#### Status
✅ ACTIVE — replaces Oversight Executive + Cache Manager (both archived to `agents/archive/` 2026-05-21)

</details>

<details>
<summary><b>🎩 OVERSIGHT EXECUTIVE (ARCHIVED — Folded Into Controller 2026-05-21)</b></summary>

#### Full Name
**Oversight Executive — APW Top-Level Controller**

#### Role
The executive controller. Does NOT do work itself — ensures the right agents run in the right order with the right context, within token budget.

#### When Invoked
- START of every framework deliverable sequence
- END of every framework deliverable to verify completion

#### Detailed Process
| 🆔 | 🏷️ Phase | 📝 Action |
|:---:|---------|----------|
| OE.1 | Context Verification | Are all 6 cache files loaded? Versions current? |
| OE.2 | Task Scoping | What's being delivered? What D-rules/protocols apply? |
| OE.3 | Token Budget Check | Current usage + estimated cost — will we hit YELLOW (108K)? |
| OE.4 | Agent Delegation | Assign Validator → Karen → Cache Manager → (Resolver if tension) |
| OE.5 | Delivery Verification | Did Validator + Karen run? All failures fixed? |
| OE.6 | Cache Update Check | Any state changes need recording? |
| OE.7 | Token Budget Update | Log estimated tokens used + update cumulative |
| OE.8 | Transparency Report | Produce report for Alan |

#### Output Format
```
═══ OPERATION COMPLETE ═══
Deliverable: [name]
Validator: [PASS/FAIL] — [X rules, Y passed, Z failed→fixed]
Karen: [APPROVED/REJECTED]
Token Usage: ~[X]K this op / ~[Y]K cumulative / ~[Z]K remaining
Cache Updates: [list or "None needed"]
Next Step: [from BUILD_STATE_CACHE]
═══════════════════════════
```

#### Hierarchy
```
OVERSIGHT EXECUTIVE (this)
    │
    ├── VALIDATOR-MERGED (Layer 1)
    ├── KAREN (Layer 2)
    ├── CACHE MANAGER (state integrity)
    └── PARADOX RESOLVER (on-demand)
```

#### SOP Followed
PRIME_SOP.md + VALIDATION_WORKFLOW.md + Universal SOP v1.3

#### Token Cost
~500 tokens per orchestration (coordination only, no content work)

#### Reports To
Alan directly via transparency report

#### Status
✅ ACTIVE — proposed for fusion with Cache Manager (F4 in FUSION_ANALYSIS.md)

</details>

<details>
<summary><b>🎯 VALIDATOR-MERGED — Layer 1 Single-Pass (file: agents/validator-merged.md, 3.8KB)</b></summary>

#### Full Name
**VALIDATOR — APW Merged Layer 1 Agent (Combines Jenny + Deliverable Validator + Simplicity Filter + SOP Compliance)**

#### Role
Unified Layer 1 validation. Performs ALL content + compliance checks in a single pass. Replaces 4 separate agents to conserve tokens while maintaining full coverage.

#### When Invoked
EVERY framework output per VALIDATION_WORKFLOW.md

#### The Single-Pass Checklist (5 Sections)

##### A. POVP — Word-by-Word Spec Verification
- Identify output type (module list, lesson list, classroom map, SOP update)
- Pull ALL relevant D-rules from cache
- For each: read exact rule text → compare to output → PASS/FAIL with evidence
- Check against locked decisions in MASTER_CACHE + USER_FOUNDATION_CACHE

##### B. COMPLETENESS — Deliverable Verification
- Module List: correct count, sequencing, path/phase assignments, source doc traces (D15)
- Lesson List: format types (WHY/WHAT/HOW), DFY callout (D10), win (D8), checklist (D9), Sarah Turner 5-part (D17)
- Classroom Map: all 8 listed, REQUIRED vs OPTIONAL, Classroom 3 routing (D11)
- SOP Update: both version numbers (D24), changes listed

##### C. SIMPLICITY — D7 Filter
- Would a 5th grader understand?
- Jargon without explanation?
- Cognitive load: LOW/MEDIUM/HIGH (target LOW)
- Path choices clear?

##### D. PROCESS COMPLIANCE
- D1: Single deliverable only?
- D3/D13: Optimization cycle present?
- D20: Real-time checklist displayed?
- D23/D24: Version numbers for SOP updates?

##### E. CROSS-REFERENCE
- Aligns with PROGRAM_DETAILS_CACHE?
- Respects locked decisions in MASTER_CACHE?
- Honors USER_FOUNDATION_CACHE preferences?
- Compatible with SCIO_KNOWLEDGE_CACHE principles?

#### Output Format
```
## VALIDATOR REPORT — [Output Name]
### A. POVP: [PASS/FAIL per rule with evidence]
### B. COMPLETENESS: [present/missing per element]
### C. SIMPLICITY: [CLEAR/NEEDS WORK/CONFUSING]
### D. PROCESS: [D1/D3/D13/D20 PASS/FAIL]
### E. CROSS-REFERENCE: [ALIGNED/CONFLICT per cache]
### VERDICT: [ALL PASS / FAILURES FOUND]
### Required Fixes: [list]
### Token Cost: ~[X] tokens
```

#### SOP Followed
PRIME_SOP D-rules (D1, D3, D7, D8, D9, D10, D11, D12, D14, D15, D17, D20, D23, D24)

#### Token Cost
~5,000 tokens per validation

#### Reports To
Karen (Layer 2) and Oversight Executive

#### Status
✅ ACTIVE — fusion of 4 original agents (Jenny + Deliverable Validator + Simplicity Filter + SOP Compliance Checker). Saved ~12K tokens per validation.

</details>

<details>
<summary><b>🪞 KAREN — Reality Check Layer 2 (file: agents/karen-reality-check.md, 3.2KB)</b></summary>

#### Full Name
**KAREN — APW Reality Check Agent (Layer 2 Validator — Audits The Auditors)**

#### Role
The unflinching reality-check agent. NOT here to check compliance — Layer 1 does that. Karen's job: check WHETHER LAYER 1 ACTUALLY DID ITS JOB, or rubber-stamped.

Exists because ERR-1 through ERR-4 in the Error Log were all rubber-stamp failures. Karen = the anti-rubber-stamp.

#### When Invoked
AFTER Layer 1 passes, on EVERY major framework deliverable. Last gate before Alan sees output.

#### What She Checks

##### 1. Did Layer 1 Actually Verify, Or Just Claim To?
- Read Layer 1's POVP checklist
- For EACH "PASS" claim, independently verify
- If Layer 1 says "D7 Simplicity PASS" → Karen reads output and asks "would a 5th grader actually understand this?"
- If Layer 1 says "D10 DFY callout PASS" → Karen searches output for actual DFY callout
- **Trust nothing. Verify everything.**

##### 2. Did The Builder Miss Things Alan Already Addressed?
- Cross-reference USER_FOUNDATION_CACHE
- Does output contradict Alan's explicit decisions?
- Does output re-propose something Alan rejected?
- Does output fail to incorporate something Alan confirmed?

##### 3. Is This Actually Done?
- Builder says "delivered" — but is it complete?
- Gaps, placeholders, or "TBD" items hiding?
- Does output actually contain everything it claims?

##### 4. Would Alan Be Frustrated?
- Too wordy? (Alan's #1 trigger)
- Missing facts he provided?
- Asking questions he answered?
- Flagging problems without proposed solutions?
- Copy-paste ready if it should be?

#### Output Format
```
## KAREN REALITY CHECK
### Layer 1 Audit: [VERIFIED / RUBBER-STAMPED] per item with evidence
### Alan Alignment: [PASS / FAIL] with violations
### Completeness: [COMPLETE / INCOMPLETE] with gaps
### Alan Frustration Risk: [LOW / MEDIUM / HIGH] with triggers
### VERDICT: [APPROVED / REJECTED — FIX REQUIRED]
```

#### Critical Rules
1. Last gate before Alan. Take seriously.
2. If uncertain, err on REJECTED side.
3. **ALWAYS read cache files independently.** Never trust builder summary.
4. Does NOT make changes — flags what's wrong. Builder fixes.
5. **FULL AUDIT ALWAYS** — no spot-checking. 100% coverage every time.
6. If builder skipped Layer 1, AUTOMATIC REJECTED.

#### Token Cost
~7,500 tokens per audit

#### Status
✅ ACTIVE — **CANNOT be fused with Validator-Merged** (F3 in FUSION_ANALYSIS.md was REJECTED — same brain can't audit itself)

</details>

<details>
<summary><b>💾 CACHE MANAGER (ARCHIVED — Folded Into Controller 2026-05-21)</b></summary>

#### Full Name
**CACHE MANAGER — APW Data Integrity Agent (Handles: Updates, Backups, Break Prevention, Repair, Token Tracking)**

#### Role
Maintains integrity of the entire cache system. One agent replaces 4 originally proposed.

#### Responsibilities
1. **Updates** — Keep cache files current after every decision/deliverable
2. **Backup Verification** — Cache files on disk ARE the backup; verify they're written correctly
3. **Prevention** — Detect stale/conflicting data before errors
4. **Repair** — Fix cache issues when detected
5. **Token Tracking** — Log usage and alert on budget thresholds

#### When Invoked

##### Session Start (Mandatory)
- Verify all cache files exist + readable
- Check timestamps — flag anything older than current session
- Cross-check files against each other for contradictions
- Report integrity to Oversight Executive

##### After Every Locked Decision
- Update relevant cache file(s)
- Increment cache version stamp
- Update BUILD_STATE_CACHE with current position
- Log in TOKEN_BUDGET_LOG

##### After Every Framework Deliverable
- Update BUILD_STATE_CACHE (delivered + next)
- Update TOKEN_BUDGET_LOG with operation cost
- If SOP changed → update APW_MASTER_CACHE
- If SCIO knowledge added → update SCIO_KNOWLEDGE_CACHE

##### On Budget Threshold Alert
- YELLOW (108K): Log alert, abbreviated validation
- RED (130K): Checkpoint NOW, cache all state
- CRITICAL (>141K theoretical): STOP work, emergency dump

##### On Suspected Data Corruption
- Compare cache against source of truth (SOP JS file)
- Identify discrepancy
- Fix by rebuilding from source
- Log incident

#### Integrity Checks

##### Cross-Cache Consistency
- Does MODULE 4.1 in PROGRAM_DETAILS match BUILD_STATE?
- Do locked decisions in MASTER_CACHE match USER_FOUNDATION?
- Do SCIO principles align with paradox resolutions?
- Are version numbers consistent?

##### Staleness Detection
- Cache not updated in 3+ deliverables → flag
- BUILD_STATE says "Step 4" but MASTER_CACHE says "Step 3" → conflict

##### Completeness Check
- Every locked decision in 2+ caches (Master + relevant sub)
- Every paradox resolution in both SCIO_CACHE and MASTER_CACHE
- Every module/lesson in both PROGRAM_DETAILS and BUILD_STATE

#### Output Format
```
## CACHE MANAGER REPORT
### Integrity Status: [HEALTHY / WARNING / CORRUPTED]
### File Status: [table per cache file]
### Cross-Cache Consistency: [CONSISTENT / CONFLICTS]
### Token Budget: estimated used, remaining, status
### Updates Applied: [list]
### Issues Found: [list]
```

#### SOP Followed
D25 (Session Start), D28 (Cache Update), D32 (Backup)

#### Token Cost
~2,000-3,000 tokens per integrity check

#### Status
✅ ACTIVE — **proposed for fusion with Oversight Executive (F4)** to save ~1.5K per orchestration

</details>

<details>
<summary><b>⚖️ PARADOX RESOLVER — Deep Analysis (file: agents/paradox-resolver.md, 2KB)</b></summary>

#### Full Name
**PARADOX RESOLVER — APW Deep Analysis Agent**

#### Role
Specialized agent for resolving tensions between SCIO growth-partner teachings and APW course framework. Doesn't surface-flag — digs into root causes, models both sides, proposes specific resolutions with reasoning.

#### When Invoked
**ON-DEMAND ONLY** — when SCIO/APW tension detected. Rare in practice.

#### Process
| 🆔 | 🏷️ Step | 📝 Detail |
|:---:|---------|----------|
| PR.1 | Define the Tension | State exactly what SCIO says + cite specific principle. State exactly what APW does + cite specific element. Articulate why they appear to conflict. |
| PR.2 | Analyze Both Sides | What is SCIO protecting against? What is APW trying to achieve? Is the conflict real or apparent? |
| PR.3 | Check Prior Resolutions | Read SCIO_KNOWLEDGE_CACHE paradox resolutions. Has this been resolved before? Does prior resolution apply? |
| PR.4 | Propose Resolution | If apparent: explain why not violation. If real: propose with trade-offs stated. ALWAYS propose, never just flag. |
| PR.5 | Classify | RESOLVED / RESOLVED WITH TRADE-OFF / FUNDAMENTAL (Alan decides) |

#### Critical Rules
1. Always cite specific SCIO principle numbers + APW elements
2. Always propose a resolution (Alan: "present proposed solutions when asking questions")
3. Check USER_FOUNDATION_CACHE first — Alan may have already resolved
4. Never re-propose something Alan rejected
5. Consider COURSE CONTENT vs BUSINESS OPERATIONS distinction

#### Token Cost
~5,000 tokens per resolution

#### Status
✅ ACTIVE — but rarely fires (most current work is SOP, not course building)

</details>



### Archived Agents (Folded Into Others)

<details>
<summary><b>Click to expand: 4 Archived Agents + Fusion History</b></summary>

| 📄 File | 🎯 Original Role | 🔀 Merged Into | 📅 Archived |
|---------|----------------|---------------|:-----------:|
| `agents/archive/deliverable-validator.md` | Layer 1 — verifies deliverables are actually complete | → `validator-merged.md` Section B (Completeness) | Mar 14 |
| `agents/archive/simplicity-filter.md` | Layer 1 — D7 5th grader test | → `validator-merged.md` Section C (Simplicity) | Mar 14 |
| `agents/archive/sop-compliance-checker.md` | Layer 1 — checks output against 119 prompt items + 24 D-rules | → `validator-merged.md` Section A (POVP) | Mar 14 |
| `agents/archive/jenny-sop-verifier.md` | Layer 1 — externalized POVP protocol (D19), word-by-word verification | → `validator-merged.md` Section A (POVP) — duplicate role | May 21 (F5) |

#### Fusion Record
- **March 14:** 4 separate Layer 1 agents → 1 Validator-Merged. Saved ~12,000 tokens per validation run.
- **May 21:** Standalone Jenny archived (F5 fusion executed). Validator-Merged's Section A absorbs her role. Active agents: 5.

</details>

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
| Active agents | **4** (post-F4 + F5) | **4** | — | — |
| Archived agents | **6** (3 original + Jenny F5 + Oversight F4 + Cache Manager F4) | — | — | **6** |
| User-uploaded agent ideas | 8 | — | 8 | — |
| Scripts | 7 | — | 7 | — |
| Active documentation | **11** (added PROTOCOLS_REFERENCE + REAL_DEVICE_TEST) | **11** | — | — |
| Historical documentation | 2 | — | 2 | — |
| SOP version backups | 18+ | — | — | 18+ |
| Source files (APW course) | ~30 | — | 30 | — |
| **TOTAL UNIQUE FILES** | **~123** | **~33 active** | **~70 legacy** | **~24 archived** |

### 🏗️ Agent Architecture Evolution
| 📅 Date | 🤖 Active Count | 🔀 Change | 💰 Token Win |
|---------|:---------------:|----------|:-----------:|
| Mar 14 | 7 (proposed) | Original architecture | — |
| Mar 14 | 6 → 5 | Layer 1 quad-fusion → Validator-Merged | ~12K/validation |
| May 21 | 5 → 5 | Jenny standalone archived (F5 — was redundant with Validator-Merged Section A) | ~4K (when invoked) |
| May 21 | 5 → **4** | **F4 fusion: Oversight + Cache Manager → Controller** | ~1.5K/session ongoing |

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
