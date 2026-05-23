---
title: README.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:03.165382+00:00"
uuid: 60c6db0e-a70d-4f5a-b34b-6b8e5c4c7d2b
tags:
  - claude
  - alan
  - credit
---
# README.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: APW Funding Intel · Migration Package v2.0
version: 2.0
created: 2026-05-15
owner: Alan Nguyen
purpose: Single-source-of-truth knowledge package for Claude Projects + Obsidian
tags: [APW, funding, credit, migration, master, v2]
---

# APW Funding Intel · Migration Package v2.0

> **v2.0 = full Python re-verification of every number in v1 + 2026 web-verification of velocity rules + Alan/Josephine protocol removed from project SOP.**

---

## Why v2

v1 had ~17% of quantitative claims slightly off (mostly under-counts in row totals) and one velocity rule structurally wrong (BofA). v2 corrects all of them. See `99_Audit/VERIFICATION_AUDIT.md` for the full v1→v2 diff.

---

## Package Contents

```
APW_Migration_v2/
├── 00_START_HERE/         ← Read these first
│   ├── README.md
│   ├── CLAUDE_PROJECT_SETUP.md
│   └── USAGE_INSTRUCTIONS.md
│
├── 01_Canonical_Data/     ← Single source of truth (v2)
│   ├── CANONICAL_FACTS.json    (v2.0 · re-verified)
│   ├── FILE_INVENTORY.md
│   ├── FILE_1_summary.md
│   ├── FILE_2_summary.md
│   ├── FILE_3_summary.md
│   ├── FILE_4_summary.md
│   ├── FILE_5_summary.md
│   ├── VELOCITY_RULES.md       (v2.0 · web-verified May 2026)
│   ├── FLAGS.md
│   ├── STATE_INDEX.json
│   └── UNDERWRITER_MAP.json
│
├── 02_Funding_Stack/      ← Execution playbooks
│   ├── STACK_LOCKED_RANGES.md
│   ├── STACK_MN.md
│   ├── STACK_OK.md
│   ├── TIMELINE_OPTIONS.md
│   └── EXECUTION_CHECKLIST.md
│
├── 03_Conversation_History/
│   ├── CONVERSATION_TRANSCRIPT.md
│   ├── USER_PROMPTS_CHECKLIST.md
│   └── AI_OUTPUTS_CHECKLIST.md
│
├── 04_AI_SOP_System/      ← v2 (dual-user removed from project SOP)
│   ├── AI_OUTPUT_SOP.md         (v2.0 · APW-focused)
│   ├── HALLUCINATION_PREVENTION.md
│   ├── HTML_GATE_PROTOCOL.md
│   └── SELF_CHECK_PROTOCOL.md
│
├── 05_Obsidian_Setup/
│   ├── OBSIDIAN_TUTORIAL.md
│   ├── recommended_plugins.md
│   └── vault_structure.md
│
└── 99_Audit/
    ├── FIDELITY_CHECKLIST.md
    ├── BOTTLENECK_AUDIT.md
    └── VERIFICATION_AUDIT.md   ← NEW · honest v1→v2 diff
```

---

## Quick Start

### Claude Projects (Primary)

1. Open claude.ai → create new Project named **"APW Funding Intel"**
2. Upload the 5 source `.xlsx` files to Project Knowledge
3. Upload all `.md` and `.json` files from this package
4. Paste **AI_OUTPUT_SOP.md** content (v2) into Project Instructions
5. Run the 5 validation tests from `AI_OUTPUT_SOP.md` to confirm SOP is active

### Obsidian Vault (Secondary)

1. Drop entire `APW_Migration_v2` folder into your vault
2. See `05_Obsidian_Setup/OBSIDIAN_TUTORIAL.md` for plugin recommendations

---

## What Changed v1 → v2

| Category | Status |
|---|---|
| File row totals | All re-verified · 4 of 5 files had under-counts in v1 |
| File 3 datapoints (BCC, geo, online) | All re-verified · multiple v1 over-counts corrected |
| Underwriter cluster counts | Re-verified · 4 of 5 had small v1 over-counts |
| Hard inquiry totals | Re-verified · v1 was -64 due to typo variants missed |
| **BofA velocity rule** | **CORRECTED · was wrong in framing (days → months)** |
| Chase 5/24 · Amex 2/90 | Web-verified May 2026 · still active · added detail |
| Amex 1/5 rule, hold limits | NEW in v2 |
| BofA 3/12 or 7/12 personal | NEW in v2 (checking relationship matters) |
| Alan/Josephine dual-user protocol | REMOVED from project SOP (kept in global preferences) |

Full diff in `99_Audit/VERIFICATION_AUDIT.md`.

---

## Trust Levels in v2

| Tag | Trust | What It Means |
|---|---:|---|
| VERIFIED_BYTE | 99% | Python-extracted from source .xlsx · numerically exact |
| ALAN_LOCKED | 100% | You specified it · authoritative |
| WEB_VERIFIED | 95% | Cross-checked May 2026 public sources |
| INDUSTRY_TYPICAL | 70% | Public-domain · may be stale |
| ESTIMATED | 50% | AI projection · directional only |

If something is missing a tag → treat as unverified · request verification.

---

## Version

**v2.0** · 2026-05-15 · post-verification audit
