# SOP UPDATE: v3.8 → v3.9
## Cache System, Validation Architecture, Token Transparency
**Date:** March 13, 2026

---

## SUMMARY OF CHANGES

### New D-Rules (4 added: D25-D28)

**D25 — Session Start Protocol (Cache Load)**
Every new session MUST begin with: (1) Read all 6 core cache files (Master, SCIO, Program Details, User Foundation, Build State, Token Budget). (2) Read SUBCACHE_INDEX.md for topic sub-cache availability. (3) Verify cache integrity: check last-updated timestamps, cross-check for contradictions. (4) Confirm all data loaded before beginning ANY work. No exceptions — if cache files are missing or corrupted, stop and rebuild from source before proceeding.

**D26 — Sub-Cache Activation Protocol**
When building content for a specific topic area, load the relevant topic sub-cache(s) per SUBCACHE_INDEX.md BEFORE starting the deliverable. Do not re-read raw source files when a pre-processed sub-cache exists. Only access raw files for: exact transcript quotes, verifying sub-cache accuracy, or topics not yet cached. Always log which sub-caches were loaded for the deliverable.

**D27 — Token Transparency**
Every framework deliverable response must include a token budget status line: "Token Status: ~[X]K used / ~[Y]K remaining / [GREEN/YELLOW/RED/CRITICAL]". Thresholds: GREEN (<120K), YELLOW (120K-140K: abbreviated validation only), RED (140K-160K: cache all state + alert Alan), CRITICAL (>160K: stop all work, produce continuation guide). Token estimates are estimates — err conservative.

**D28 — Cache Update After Decisions**
After every locked decision or completed deliverable: (1) Update relevant cache file(s) with new information. (2) Update BUILD_STATE_CACHE.md with current position and what was delivered. (3) If SCIO knowledge added, update SCIO_KNOWLEDGE_CACHE.md. (4) If SOP changed, update APW_MASTER_CACHE.md. Never silently overwrite — document what changed and why.

---

### New Section O: CACHE & MEMORY MANAGEMENT PROTOCOL

*(Insert after Section N: Error Log, before Quick Reference Card)*

**Full Section O content:**

```
SECTION O: CACHE & MEMORY MANAGEMENT PROTOCOL (NEW in v3.9)

PURPOSE:
Context compaction is inevitable in long sessions. This protocol ensures 100% accuracy
of data foundations and SOP compliance survives across compaction events and new sessions.

ARCHITECTURE — 2 Layers:
1. DATA LAYER (Context/Memory)
   - 6 Core cache files: always loaded at session start
   - Topic sub-caches: pre-processed, loaded on demand per SUBCACHE_INDEX.md
   - Raw source files: accessed only when sub-cache is insufficient

2. OPERATIONS LAYER (Compliance)
   - Inline checklists: on every output (POVP D19, PFV D21, D20 checklist display)
   - Karen (Layer 2 spot-check): on major framework deliverables only
   - Paradox Resolver: on-demand when SCIO/APW tension detected

CORE CACHE FILES (6):
| File | Purpose | Always Loaded |
| APW_MASTER_CACHE.md | All D-rules, POVP, PFV, Error Log, locked decisions, SOP changes | YES |
| SCIO_KNOWLEDGE_CACHE.md | Principles, paradoxes, lesson summaries, exact numbers | YES |
| PROGRAM_DETAILS_CACHE.md | 8 classrooms, 12 modules, lesson lists, ascension model | YES |
| USER_FOUNDATION_CACHE.md | Alan's decisions, preferences, non-negotiables | YES |
| BUILD_STATE_CACHE.md | Current position, deliverables done, next steps, SOP queue | YES |
| TOKEN_BUDGET_LOG.md | Usage tracking, thresholds, session log | YES |

TOPIC SUB-CACHES (Load On Demand):
Located in /cache/subcache/. See SUBCACHE_INDEX.md for:
- Which sub-cache covers which topic
- When to load each one
- Token cost estimates per sub-cache
- Loading rules (never re-read raw files when sub-cache exists)

TIERED DATA FIDELITY:
- Tier 1 (Exact): Numbers, KPIs, formulas, thresholds, prices — NEVER compress or approximate
- Tier 2 (Structured): Frameworks, processes, sequences — compressed but complete
- Tier 3 (Pointer): Source file paths for on-demand deep dives

VALIDATION MODEL:
- Every output: inline POVP (D19) + PFV (D21) + checklist display (D20)
- Major deliverables: + Karen spot-check (Layer 2)
- SCIO tension detected: + Paradox Resolver (on-demand)
- Token budget YELLOW: abbreviated validation (Karen only)
- Token budget RED: cache all state, prepare handoff

NON-NEGOTIABLE: 100% accuracy on data foundations and SOP compliance.
If accuracy cannot be guaranteed (e.g., cache corrupted, source unavailable), STOP and alert Alan.
```

---

### New Error Log Entry

**ERR-4:**
- Error: Section 1 analysis delivered without POVP/PFV/D20 compliance — all Section 1 lesson summaries and synthesis delivered without SOP verification protocols
- Root Cause: Context compaction from previous session wiped SOP from working memory. No session-start protocol existed to reload SOP context. Builder proceeded without the SOP, violating D18, D19, D20, D21.
- Protocol Created: Session Start Protocol (D25, Section O): 6 core cache files MUST be loaded at start of every session. Cache system ensures SOP rules (in APW_MASTER_CACHE.md) survive compaction.
- SOP Version: v3.9

---

### Version History Entry

**v3.9:** Added Section O (Cache & Memory Management Protocol). Added D25 (Session Start Protocol), D26 (Sub-Cache Activation), D27 (Token Transparency), D28 (Cache Update After Decisions). ERR-4 added (compaction data loss). 6 core cache files + 8 topic sub-caches established. 2-layer architecture (Data + Operations) formalized. A61-A63 (cache loading rules, sub-cache index reference, 100% accuracy non-negotiable). Message 17 (3 items). Total: 122 prompt items across 17 messages.

---

### New Prompt Items (A61-A63)

**A61 — Cache Loading Rules:**
At session start, load all 6 core cache files before any work. For topic-specific work, load relevant sub-cache(s) per SUBCACHE_INDEX.md. Never re-read raw source files when pre-processed sub-cache exists. If cache is stale or corrupted, rebuild from source before proceeding.

**A62 — Sub-Cache Index Reference:**
SUBCACHE_INDEX.md maps every topic area to its pre-processed sub-cache file. When building any content, consult the index first. Sub-caches contain: all exact numbers, all worked examples, all frameworks/processes, all scripts/templates, APW application notes, and relevant locked/suspended decisions. More detail than main cache lesson summaries, less than raw transcripts.

**A63 — 100% Accuracy Non-Negotiable:**
100% accuracy on data foundations and SOP compliance is non-negotiable. If accuracy cannot be guaranteed for any reason (corrupted cache, unavailable source, compaction data loss), STOP all work and alert Alan. Do not guess, approximate, or proceed with incomplete data on anything that affects course content, locked decisions, or compliance. This rule overrides all other process rules.

---

### Quick Reference Card Additions

**Add after "Current Position" section:**

```
Session Start (D25 — EVERY New Session):
1. Read all 6 core cache files
2. Read SUBCACHE_INDEX.md
3. Verify cache integrity (timestamps, cross-check)
4. Confirm all data loaded
5. ONLY THEN begin work

Token Status (D27 — EVERY Deliverable Response):
Include: "Token Status: ~[X]K / ~[Y]K remaining / [STATUS]"
GREEN (<120K) | YELLOW (120-140K) | RED (140-160K) | CRITICAL (>160K)
```

---

## WHERE TO INSERT IN JS FILE

| Change | Insert Location | Line Reference |
|--------|----------------|---------------|
| D25-D28 | After D24 in Section D table array | After line 337, before line 338 closing bracket |
| ERR-4 | After ERR-3 in Section N table array | After line 864, before line 865 closing bracket |
| Section O | After Section N page break, before Quick Reference Card | After line 871, before line 873 |
| Version History v3.9 | After v3.8 entry in version array | After line 781, before line 782 |
| A61-A63 | In Section A prompt table (specific message group) | New Message 17 block |
| QRC additions | After "Current Position" heading | After line 905, before line 907 |

---

## FILES AFFECTED

### Cache Files (Updated)
- APW_MASTER_CACHE.md — add D25-D28, ERR-4, v3.9 changes
- BUILD_STATE_CACHE.md — update current position, v3.9 queue items

### New Files Created
- /cache/subcache/SUBCACHE_INDEX.md
- /cache/subcache/SCIO_OFFER_DESIGN.md
- /cache/subcache/SCIO_PRICING_ASCENSION.md
- /cache/subcache/SCIO_GROWTH_MECHANICS.md
- /cache/subcache/SCIO_SCALING_PRODUCTIZATION.md
- /cache/subcache/SCIO_TOC_KPIS.md
- /cache/subcache/SCIO_PNL_COMPENSATION.md
- /cache/subcache/SCIO_LTGP_CAC.md
- /cache/subcache/SCIO_BUSINESS_TRACKER.md
