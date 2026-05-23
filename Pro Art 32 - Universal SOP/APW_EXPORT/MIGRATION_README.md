# APW PROJECT EXPORT — MIGRATION GUIDE
## For migrating to Claude Code, API, or any new environment
**Exported:** March 13, 2026
**SOP Version:** v3.9.2 (32 D-rules, 126 prompt items)

---

## FOLDER STRUCTURE

```
APW_EXPORT/
├── cache/                        # Core data layer (load ALL at session start per D25)
│   ├── APW_MASTER_CACHE.md       # SOP: all 32 D-rules, POVP/PFV protocols, error log, locked decisions
│   ├── BUILD_STATE_CACHE.md      # Current build position, deliverables done, 11 failure points + solutions
│   ├── SCIO_KNOWLEDGE_CACHE.md   # 22 SCIO principles, paradox resolutions, lesson summaries, exact numbers
│   ├── PROGRAM_DETAILS_CACHE.md  # 8 classrooms, 12 modules, 6-tier ascension, lesson lists
│   ├── USER_FOUNDATION_CACHE.md  # Alan's explicit decisions, preferences, non-negotiables
│   ├── TOKEN_BUDGET_LOG.md       # Token tracking (needs active maintenance per D27)
│   ├── subcache/                 # Topic-specific pre-processed SCIO knowledge (load per D26)
│   │   ├── SUBCACHE_INDEX.md     # Maps topics to sub-cache files with token estimates
│   │   ├── SCIO_OFFER_DESIGN.md
│   │   ├── SCIO_PRICING_ASCENSION.md
│   │   ├── SCIO_GROWTH_MECHANICS.md
│   │   ├── SCIO_SCALING_PRODUCTIZATION.md
│   │   ├── SCIO_TOC_KPIS.md
│   │   ├── SCIO_PNL_COMPENSATION.md
│   │   ├── SCIO_LTGP_CAC.md
│   │   ├── SCIO_BUSINESS_TRACKER.md
│   │   └── SCIO_FULFILMENT_DELIVERY.md
│   ├── sop_changes/              # Version history for SOP patches
│   │   ├── SOP_V39_CHANGES.md    # D25-D28 (cache system)
│   │   ├── SOP_V391_CHANGES.md   # D29-D30 (transparency + chunking)
│   │   └── SOP_V392_CHANGES.md   # D31-D32 (checkpoint + versioning)
│   └── backups/
│       └── BACKUP_LOG.md         # Master log of all cache snapshots (4 backups exist)
├── agents/                       # Agent definitions (10 agents)
│   ├── VALIDATION_WORKFLOW.md    # Master workflow: when to run what agent
│   ├── oversight-executive.md    # Top-level controller — coordinates all agents
│   ├── jenny-sop-verifier.md     # Layer 1: word-by-word POVP spec verification
│   ├── validator-merged.md       # Layer 1: merged single-pass validator (Jenny + others)
│   ├── karen-reality-check.md    # Layer 2: audits the auditors, checks Alan alignment
│   ├── cache-manager.md          # Data integrity, updates, backup, token tracking
│   ├── paradox-resolver.md       # SCIO/APW tension analysis (on-demand)
│   ├── deliverable-validator.md  # Completeness checker (counts, elements, gaps)
│   ├── simplicity-filter.md      # D7 enforcer (5th grader test)
│   └── sop-compliance-checker.md # Full audit agent (all rules, all prompts)
└── sop_scripts/                  # Original SOP generation scripts
    ├── sop_v38_CURRENT.js        # JS generator for full SOP prompt (v3.8 base)
    ├── PASTE_THIS_FIRST.md       # Session start instructions for web Claude
    ├── WEB_CLAUDE_INSTRUCTIONS.md
    ├── APW_CONTINUATION_GUIDE.md # How to continue across sessions
    └── blitz_vs_prime.py         # Blitz vs Prime Protocol path logic
```

---

## HOW TO USE IN NEW ENVIRONMENT

### Session Start (D25 — mandatory)
1. Load ALL 6 core cache files from `/cache/`
2. Load `SUBCACHE_INDEX.md` from `/cache/subcache/`
3. Verify cache integrity (timestamps, cross-check for contradictions)
4. Confirm all data loaded before any work

### Before Every Output (D19, D20, D27, D29)
1. Show D29 step header: STEP / SOP RULES / CACHES / TOKEN EST / AGENTS / VERIFICATION
2. Estimate token cost BEFORE writing (D27) — prospective, not retrospective
3. Run POVP inline (D19) — word-by-word check against relevant D-rules
4. Display D20 checklist at end of output

### Before Every Cache Modification (D32)
1. Backup ALL cache files to timestamped directory
2. Log backup in BACKUP_LOG.md
3. Then modify
4. If error → rollback from backup

### Token Gating (D27 + D31)
- Budget: ~160K tokens per session
- GREEN (<120K): Full operations
- YELLOW (120K-140K): Abbreviated validation, alert user
- RED (140K-160K): Cache all state, prepare checkpoint
- CRITICAL (>160K): Stop all work, checkpoint immediately
- Estimate BEFORE output. If output would push past YELLOW → checkpoint instead of delivering.

### Agent Deployment
- Agent prompts MUST start with: "STEP 1: Read these files using the Read tool: [list]. STEP 2: Then do your analysis."
- Agents will refuse to work if they think it's roleplay. Explicit file paths fix this.
- See VALIDATION_WORKFLOW.md for when to run which agent.

---

## 11 KNOWN FAILURE POINTS (Must Fix in New Environment)

| # | Failure | D-Rule | Solution |
|---|---------|--------|----------|
| 1 | No token counts on any output | D27 | Footer on every msg |
| 2 | Jenny/Validator never successfully ran | D18/D19 | "Read files first" in agent prompt |
| 3 | Step headers missing/inconsistent | D29 | Line 1, non-negotiable |
| 4 | POVP never executed | D19 | Inline check before delivery |
| 5 | PFV never executed | D21 | Last 4 lines before send |
| 6 | D20 checklist never displayed | D20 | End of every framework output |
| 7 | D30 chunking violated | D30 | Multi-step = multi-message |
| 8 | D32 backup timing late | D32 | Backup before each edit |
| 9 | Wasted tokens on failed agents | — | Fix agent prompt pattern |
| 10 | Promising without doing | ALL | Enforce or don't send |
| 11 | Token estimates after output, not before | D27 | Estimate in header BEFORE writing |

---

## CURRENT BUILD STATE

- **Active Step:** Step 4 — 7DFS Lessons Per Module
- **Active Module:** 4.1 (Command Briefing — Choose Your Path)
- **SCIO Sections Processed:** 0, 1, 4 (Sections 2-3, 5-9 pending)
- **Paradoxes:** 4 LOCKED (S0), 2 LOCKED + 3 SUSPENDED (S1), 1 RESOLVED + 3 OPEN + 1 SUSPENDED (S4)
- **PRIORITY:** Perfect SOP enforcement + token system + cache/compacting FIRST. No framework deliverables until system is 100%.

---

## WHAT NEEDS TO HAPPEN IN NEW ENVIRONMENT

1. Perfect the SOP enforcement system (solve all 11 failure points)
2. Perfect the token gating system (conservative estimates, prospective gate, checkpoint before RED)
3. Perfect the cache/compacting system (backup before every modify, checkpoint before compaction)
4. THEN resume Module 4.1 lesson list with split applied
