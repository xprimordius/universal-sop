# TOKEN BUDGET LOG
## Tracks token usage, capacity, and optimization decisions
**Last Updated:** March 13, 2026

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

### Rule 4: Budget Alerts
- At ~120K tokens used: WARNING — reduce validation to Karen-only
- At ~140K tokens used: CRITICAL — cache all current state, prepare for compaction
- At ~160K tokens used: COMPACTION IMMINENT — update all cache files immediately

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
| **ESTIMATED REMAINING** | | **~50,000-65,000** |

**Status: HEALTHY — but approaching caution zone for heavy validation runs**
