# CONTEXT TRANSFER — Conversation Learnings
# Everything learned across sessions that isn't in the cache files.
# Read this ONCE at project start, then refer to caches for ongoing work.

## SESSION HISTORY (3 sessions total)

### Session 1 (Earliest — compacted twice)
- Brain dump, classroom map, module list built
- SOP evolved from v3.1 through v3.8
- ERR-1: Classroom 3 listed as CONDITIONAL (caught, fixed, created POVP)
- ERR-2: Combined deliverables (violated D1)
- ERR-3: Skipped optimization cycle
- Section 0 processed (5 lessons), Section 1 processed (8 lessons)
- Module 4.1 lessons delivered, 4.1.2 split confirmed (Blitz + Prime Protocol)

### Session 2 (Previous)
- Section 4 processed (7 lessons on fulfilment/delivery)
- Cache system architecture built (6 core + 9 sub-caches)
- Sub-agent validation system designed (10 agents)
- SOP v3.9 (D25-D28), v3.9.1 (D29-D30), v3.9.2 (D31-D32)
- Backup system established
- ERR-4: Section 1 delivered without compliance (compaction wiped SOP from memory)
- ERR-5: Section 4 delivered without step headers/agents/verification
- ERR-6: Cache overwrites with no backup

### Session 3 (Most Recent — This Session)
- Full agent QA sweep (6 agents deployed total across 2 rounds)
- 11 failure points identified and documented
- Karen verdict: REJECTED — "sophisticated system designed, documented, not enforced"
- Jenny: 18 FAIL / 7 PASS / 2 PARTIAL / 5 N/A across 32 D-rules
- Cache Manager: HEALTHY — data layer solid, zero integrity issues
- Alan's explicit directive: "perfect the SOP and token system and cache and compacting for 100% accuracy FIRST"
- Export created (123 files) for Claude Code migration

## CRITICAL LEARNINGS (Do Not Repeat These Mistakes)

### 1. Agents Will Refuse to Work
When deploying sub-agents, if the prompt doesn't explicitly say "Read these files using the Read tool" with full file paths, agents will:
- Claim the files don't exist
- Call it "roleplay"
- Refuse to do anything
- Burn tokens producing nothing

FIX: Every agent prompt MUST start with "STEP 1: Read these files using the Read tool: [list]. STEP 2: Then do your analysis."

### 2. Writing Rules ≠ Following Rules
Across 3 sessions, the SOP grew from 0 to 32 D-rules. Compliance went from ~15% (early) to ~75% (late) to still not 100%. The pattern:
- Identify gap → write rule → promise to follow → immediately violate → Alan catches it → repeat

FIX: No more meta-rules about enforcement. Just enforce. If the step header isn't on the message, don't send it.

### 3. Token Estimates Must Be BEFORE, Not AFTER
D27 was written as "include token budget status line" but was consistently applied as a retrospective footnote. By the time you report "RED," you've already burned the tokens.

FIX: Estimate BEFORE writing. The D29 header IS the gate. If the estimate says the output would push past YELLOW, checkpoint instead of delivering.

### 4. Compaction Is the Enemy
Compaction (context compression) is lossy and uncontrollable. It wiped the SOP from memory in Session 1, causing ERR-4. The cache system exists specifically as insurance against compaction.

FIX: Never let compaction happen. Checkpoint at YELLOW. Start fresh session with full token budget. Caches make every session start as informed as the last one ended.

### 5. Cache Overwrites Are Dangerous
Before D32, every cache update overwrote the file with no backup. One bad edit = permanent data loss.

FIX: D32 — backup ALL cache files before ANY modification. Log in BACKUP_LOG.md. Rollback if needed.

### 6. Alan's Frustration Triggers (from USER_FOUNDATION_CACHE + direct feedback)
- Missing details he already provided
- Token counts not shown
- Agents not running
- Promising compliance "next time"
- Wordy responses
- Assumptions presented as facts
- Repeating clarification questions when context exists
- Moving to framework deliverables before the system is perfected

### 7. What's Actually Working Well
- Cache architecture: solid, consistent, healthy (Cache Manager confirmed)
- SCIO knowledge extraction: 87%+ accuracy across 22 principles
- Sub-cache system: 9 topic caches, properly indexed, correct token estimates
- Backup system: 4 snapshots, rollback procedure documented
- Paradox identification: 14 paradoxes catalogued across 3 sections
- SOP documentation: comprehensive, well-structured, version-controlled

The DATA layer works. The OPERATIONS layer doesn't. That's what needs fixing.

## OPEN DECISIONS (Need Alan's Input)

### Section 4 Paradoxes (3 OPEN)
- P1-S4: AM client capacity — DFY may need fewer clients per AM than SCIO's 35-50 range
- P3-S4: Two-track onboarding — automated for DWY, 1-on-1 for DFY. Confirm?
- P4-S4: "Every client like your last" — care standard same across tiers, delivery mechanism differs. Confirm?

### Suspended Decisions (4 total — revisit when ready)
- P1-S1: Productization vs 6 tiers — one conveyor belt with different exit points?
- P4-S1: Variable costs vs DFY fulfillment — DWY first, DFY after $150K+ revenue?
- P5-S1: LTGP:CAC tracking — dual tracking (per-tier + full-journey)?
- P5-S4: Related to Section 4 (see SCIO_KNOWLEDGE_CACHE for details)

## FILE PATH NOTES

All paths in the export have been updated to relative paths from project root. CLAUDE.md, BUILD_STATE_CACHE, and all cache files use relative paths (e.g., `cache/APW_MASTER_CACHE.md`). No further path updates needed.
