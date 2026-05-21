# TOKEN BUDGET LOG
## Tracks token usage, capacity, and optimization decisions
**Last Updated:** March 15, 2026 — Session 10

---

## CONTEXT WINDOW CAPACITY

| Parameter | Value |
|-----------|-------|
| Total context window | ~200K tokens |
| System prompt + instructions | ~15K tokens (estimated) |
| Available for conversation | ~185K tokens |
| Safety buffer (avoid compaction) | ~25K tokens |
| **Effective working budget** | **~160K tokens** |

---

## FIXED COSTS (Re-read Every Session)

| File | Bytes | Est. Tokens | Purpose |
|------|-------|-------------|---------|
| APW_MASTER_CACHE.md | 8,130 | ~2,700 | D-rules, POVP, PFV, decisions |
| SCIO_KNOWLEDGE_CACHE.md | 11,006 | ~3,700 | Principles, paradoxes, summaries |
| PROGRAM_DETAILS_CACHE.md | 7,025 | ~2,300 | Classrooms, modules, tiers |
| USER_FOUNDATION_CACHE.md | 6,349 | ~2,100 | Alan's decisions, preferences |
| BUILD_STATE_CACHE.md | 3,476 | ~1,200 | Current position, next steps |
| TOKEN_BUDGET_LOG.md | ~3,000 | ~1,000 | This file |
| **TOTAL FIXED COST** | **~39K bytes** | **~13,000 tokens** | Per session startup |

---

## VARIABLE COSTS (Per Operation)

### Sub-Agent Calls
Each sub-agent launch costs tokens in TWO places:
1. The agent's own context (reads files + processes + returns result)
2. The result returned to main conversation

| Agent | Est. Input Tokens | Est. Output Tokens | Total Est. |
|-------|-------------------|-------------------|------------|
| Validator (merged) | ~8,000 | ~2,000 | ~10,000 |
| Karen | ~6,000 | ~1,500 | ~7,500 |
| Resolver (on-demand) | ~5,000 | ~2,000 | ~7,000 |
| Cache Manager | ~4,000 | ~1,000 | ~5,000 |
| **Full validation (Validator + Karen)** | | | **~17,500** |

### Framework Deliverables
| Operation | Est. Tokens (creation + validation) |
|-----------|--------------------------------------|
| Module lesson list | ~8,000 (creation) + ~17,500 (validation) = ~25,500 |
| Classroom map | ~5,000 + ~17,500 = ~22,500 |
| SOP update | ~10,000 + ~17,500 = ~27,500 |
| SCIO integration summary | ~6,000 + ~10,000 (abbreviated) = ~16,000 |

### Conversation
| Operation | Est. Tokens |
|-----------|-------------|
| Alan's message (typical) | ~500-2,000 |
| Builder's response (typical) | ~1,000-4,000 |
| Reading a source file | ~2,000-15,000 (varies by file size) |

---

## BUDGET PER SESSION (Conservative Estimate)

| Category | Tokens | % of Budget |
|----------|--------|-------------|
| Fixed (cache reads at startup) | ~13,000 | 8% |
| Conversation (est. 20 exchanges) | ~60,000 | 37% |
| Deliverables (est. 2-3 per session) | ~50,000-75,000 | 31-47% |
| Validation runs | ~35,000-52,500 | 22-33% |
| **TOTAL** | **~158,000-200,500** | **99-125%** |

---

## OPTIMIZATION RULES

### Rule 1: Validate Smartly
- Full validation (Validator + Karen) on FRAMEWORK DELIVERABLES only
- Abbreviated validation (Karen only) on suggestions, summaries, paradox analysis
- NO validation on conversational responses, status updates, file reads

### Rule 2: Cache Instead of Re-Read
- NEVER re-read the full SOP JS file (77KB = ~25,000 tokens) when cache files exist
- Cache files contain the same information at ~13,000 tokens total (48% savings)
- Only re-read SOP JS when cache files are missing or suspected stale

### Rule 3: Merge Agents
- Original 6 agents → 4 functional roles (saves ~15,000 tokens per full validation)
- Validator = merged Jenny + Deliverable Validator + Simplicity Filter + SOP Compliance
- One pass, one agent call, one token cost

### Rule 4: Budget Alerts (Conservative — per Alan's confirmation)
- At ~100K tokens used: YELLOW — Alert Alan. Abbreviated validation. Prepare to checkpoint.
- At ~120K tokens used: RED — Checkpoint NOW. Cache all state. No new deliverables.
- At ~140K tokens used: CRITICAL — STOP all work. Emergency cache dump.

### Rule 5: Sub-Agent Token Allocation
- If a sub-agent needs to read source files (SCIO transcripts, etc.), it gets its OWN context window
- Sub-agents should read CACHE files, not raw source files, whenever possible
- If a sub-agent's task exceeds ~30K tokens, split into 2 sub-sub-agents

---

## SESSION LOG

### Session: March 13, 2026 (Current)
| Operation | Est. Tokens | Cumulative |
|-----------|-------------|-----------|
| Session start + system prompt | ~15,000 | 15,000 |
| Context compaction summary loaded | ~8,000 | 23,000 |
| Section 1 doc reads (6 files) | ~12,000 | 35,000 |
| Section 1 transcript (1.5a) | ~5,000 | 40,000 |
| Section 1 analysis delivery | ~8,000 | 48,000 |
| Paradox discussion (3 messages) | ~6,000 | 54,000 |
| Memory question + SOP re-read | ~30,000 | 84,000 |
| Agent extraction (SOP content) | ~15,000 | 99,000 |
| Agent file reads (3 uploaded) | ~4,000 | 103,000 |
| Cache file creation (5 files) | ~15,000 | 118,000 |
| Agent definition creation (7 files) | ~10,000 | 128,000 |
| Architecture discussion (current) | ~8,000 | 136,000 |
| **Session 1 FINAL** | | **~136,000 (RED)** |

### Session 2: March 13, 2026 (Claude Code Migration)
| Operation | Est. Tokens | Cumulative |
|-----------|-------------|-----------|
| Session start + compaction summary | ~15,000 | 15,000 |
| D25 cache load (6 core + subcache index + backup log) | ~15,000 | 30,000 |
| CONTEXT_TRANSFER.md read | ~2,000 | 32,000 |
| token_tracker.js creation + testing | ~10,000 | 42,000 |
| Migration chat history read (308KB in chunks) | ~5,000 | 47,000 |
| Sanity check report delivery | ~3,000 | 50,000 |
| Token ledger acknowledgment | ~1,500 | 51,500 |
| D31 checkpoint (backup + cache updates) | ~8,000 | 59,500 |
| **CHECKPOINT — Session paused at GREEN** | | **~59,500** |

**Status: GREEN. Checkpointed cleanly. Next session starts fresh.**

### Session 3: March 13, 2026 (Claude Code)
| Operation | Est. Tokens | Cumulative |
|-----------|-------------|-----------|
| Session start + compaction summary | ~15,000 | 15,000 |
| D25 cache load (8 files) | ~13,000 | 28,000 |
| TOKEN_BUDGET_LOG threshold fix | ~2,000 | 30,000 |
| SOP v3.9.3 (D27 update) | ~5,000 | 35,000 |
| VALIDATION_WORKFLOW thresholds | ~1,000 | 36,000 |
| Module 4.1 lesson list (validated) | ~12,000 | 48,000 |
| PROGRAM_DETAILS_CACHE update | ~3,000 | 51,000 |
| CBP communication protocol | ~2,000 | 53,000 |
| Speed optimizations (2 fixes) | ~3,000 | 56,000 |
| Agent files updated (5 files) | ~5,000 | 61,000 |
| Legacy agents archived (3 files) | ~1,000 | 62,000 |
| System verification tests (5) | ~22,000 | 84,000 |
| D31 checkpoint (backup + cache updates) | ~8,000 | 92,000 |
| **Session 3 FINAL** | | **~92,000 (GREEN)** |

**Status: GREEN. Checkpointed cleanly.**

### Session 4: March 13, 2026 (Claude Code — Current)
| Operation | Est. Tokens | Cumulative |
|-----------|-------------|-----------|
| Session start + compaction summary | ~10,000 | 10,000 |
| Agent revert (read 2 files + edit 2 files) | ~5,000 | 15,000 |
| Role confirmation + SOP compliance fix | ~2,000 | 17,000 |
| D25 cache load (8 files) | ~13,000 | 30,000 |
| D25 integrity report + D32 backup (#8) | ~3,000 | 33,000 |
| Cache corrections (BUILD_STATE + TOKEN_LOG + BACKUP_LOG) | ~3,000 | 36,000 |
| SOP v3.8 JS copy + read (938 lines) | ~13,000 | 49,000 |
| V019 chat log read (2,443 lines) | ~12,000 | 61,000 |
| Session transcript extraction (37 user messages) | ~6,000 | 67,000 |
| USER_PROMPT_INVENTORY v1 creation | ~3,000 | 70,000 |
| USER_PROMPT_INVENTORY v2 creation (237 items, verbatim) | ~29,000 | 99,000 |
| SOP_FULL_REFERENCE.md creation (15 missing sections filled) | ~8,000 | 107,000 |
| D31 checkpoint (backup #9 + cache updates) | ~3,000 | 110,000 |
| **Session 4 FINAL** | | **~110,000 (YELLOW)** |

**Status: YELLOW. Checkpointed. Session 4 complete.**

### Session 5: March 13, 2026 (Claude Code)
| Operation | Est. Tokens | Cumulative |
|-----------|-------------|-----------|
| Session start + compaction summary | ~10,000 | 10,000 |
| D25 cache load (8 core + SUBCACHE_INDEX + BACKUP_LOG = 10 files) | ~15,000 | 25,000 |
| BUILD_STATE_CACHE edit (Session 4 deliverables) | ~2,000 | 27,000 |
| TOKEN_BUDGET_LOG edit (Session 4 final) | ~1,000 | 28,000 |
| BUILD_STATE debug (grep + re-read + retry edit) | ~1,500 | 29,500 |
| Token failure diagnostic | ~5,000 | 34,500 |
| USER_PROMPT_INVENTORY full read (560 lines, 4 chunks) | ~9,000 | 43,500 |
| Inventory presentation (4 chunks) | ~16,000 | 59,500 |
| Gap analysis + Bridge SOP proposal | ~4,000 | 63,500 |
| Bridge SOP v1.0 creation + save | ~12,000 | 75,500 |
| Visual protocol upgrade (icons + process position) | ~8,000 | 83,500 |
| Bridge SOP v1.1 edits | ~2,000 | 85,500 |
| Root cause analysis (token tracking) | ~8,000 | 93,500 |
| Prime SOP architecture (12 stages + icons + name) | ~10,000 | 103,500 |
| Alan's feedback integration + icon finalization | ~8,000 | 111,000 |
| Prime SOP v1.0 creation + save | ~8,000 | 119,000 |
| CLAUDE.md update (Prime SOP pointer) | ~1,000 | 120,000 |
| D31 checkpoint (this entry) | ~8,000 | 128,000 |
| **Session 5 FINAL** | | **~128,000 (RED)** |

**Status: RED. Checkpointed. Session 5 complete.**

### Sessions 6-9: March 14, 2026 (Claude Code — Prime SOP Perfection)
| Operation | Est. Tokens | Notes |
|-----------|-------------|-------|
| Session 6 | ~140K | Prime SOP v2.0 ground-up rebuild. RED. |
| Session 7 | ~130K | Prime SOP v2.1-v2.4 iterations + USER_PROMPTS_VERBATIM. RED. |
| Session 8 | ~145K | Prime SOP v2.5 + USER_PROMPT_FULFILLMENT_AUDIT (built, not saved). RED. |
| Session 9 | ~169K | Prime SOP v2.6 (8 structural enhancements). CRITICAL. |

**Note:** Sessions 6-9 all exceeded YELLOW. YELLOW auto-enforcement gates added in v2.7 to prevent recurrence.

### Session 10: March 15, 2026 (Claude Code — Current)
| Operation | Est. Tokens | Cumulative |
|-----------|-------------|-----------|
| Session start + compaction summary | ~15,000 | 15,000 |
| D25 cache load (PRIME_SOP + USER_PROMPTS_VERBATIM + TOKEN_BUDGET_LOG + BUILD_STATE) | ~15,000 | 30,000 |
| Prime SOP v2.7 edits (source chains + token reset + YELLOW gates) | ~10,000 | 40,000 |
| PER system files (directory + PER_INDEX + PER_001) | ~2,000 | 42,000 |
| v2.7 perfection audit | ~8,000 | 50,000 |
| Prime SOP v2.8 edits (QA mid-exec + N1-N8 + clarity rewrite + glossary + 3 pillars) | ~20,000 | 70,000 |
| BUILD_STATE + TOKEN_BUDGET_LOG updates | ~3,000 | 73,000 |
| **Session 10 CURRENT** | | **~73,000 (GREEN)** |

**Status: 🌱 GREEN. ~107K remaining.**

**NOTE:** All thresholds aligned across CLAUDE.md, APW_MASTER_CACHE D27, TOKEN_BUDGET_LOG Rule 4, and all agent files as of v3.9.3. Session token limit is 180K PER SESSION — resets to 0 each new session.
