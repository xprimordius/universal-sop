---
title: vault_structure.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:52:06.793621+00:00"
uuid: efbef847-de68-4788-921e-e91be54acc38
tags:
  - claude
  - alan
  - credit
---
# vault_structure.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Vault Structure · APW
tags: [APW, obsidian, structure]
---

# APW Vault Structure

```
APW (Vault Root)
│
├── APW_Migration/                ← This package
│   ├── 00_START_HERE/
│   │   ├── README.md
│   │   ├── CLAUDE_PROJECT_SETUP.md
│   │   └── USAGE_INSTRUCTIONS.md
│   │
│   ├── 01_Canonical_Data/        ← Single source of truth
│   │   ├── CANONICAL_FACTS.json
│   │   ├── FILE_INVENTORY.md
│   │   ├── FILE_1_summary.md
│   │   ├── FILE_2_summary.md
│   │   ├── FILE_3_summary.md
│   │   ├── FILE_4_summary.md
│   │   ├── FILE_5_summary.md
│   │   ├── VELOCITY_RULES.md
│   │   ├── FLAGS.md
│   │   ├── STATE_INDEX.json
│   │   └── UNDERWRITER_MAP.json
│   │
│   ├── 02_Funding_Stack/          ← Execution playbooks
│   │   ├── STACK_LOCKED_RANGES.md
│   │   ├── STACK_MN.md
│   │   ├── STACK_OK.md
│   │   ├── TIMELINE_OPTIONS.md
│   │   └── EXECUTION_CHECKLIST.md
│   │
│   ├── 03_Conversation_History/   ← Context preservation
│   │   ├── CONVERSATION_TRANSCRIPT.md
│   │   ├── USER_PROMPTS_CHECKLIST.md
│   │   └── AI_OUTPUTS_CHECKLIST.md
│   │
│   ├── 04_AI_SOP_System/          ← Behavioral protocols
│   │   ├── AI_OUTPUT_SOP.md
│   │   ├── HALLUCINATION_PREVENTION.md
│   │   ├── HTML_GATE_PROTOCOL.md
│   │   └── SELF_CHECK_PROTOCOL.md
│   │
│   ├── 05_Obsidian_Setup/         ← This folder
│   │   ├── OBSIDIAN_TUTORIAL.md
│   │   ├── recommended_plugins.md
│   │   └── vault_structure.md
│   │
│   └── 99_Audit/                  ← Fidelity tracking
│       ├── FIDELITY_CHECKLIST.md
│       └── BOTTLENECK_AUDIT.md
│
├── Daily/                         ← Auto-created by Daily Notes plugin
│   ├── 2026-05-15.md
│   └── ...
│
├── Templates/                     ← Templates for new notes
│   ├── new_bank_application.md
│   ├── recon_call_log.md
│   └── weekly_review.md
│
└── Tracking/                      ← Live application tracking
    ├── Application_Status_Kanban.md
    ├── AU_Tradeline_Tracker.md
    └── CLI_Schedule.md
```

---

## Naming Conventions

### Files
- ALL_CAPS for canonical / system docs (CANONICAL_FACTS · VELOCITY_RULES)
- Title_Case for content docs (STACK_MN · STACK_OK)
- lower_case for tutorials and meta docs

### Folders
- Numeric prefix (00_ 01_ 02_) for ordered reading
- Underscores not spaces
- Descriptive names (no abbreviations)

### Tags
Hierarchical: `#APW/funding/stack/MN` allows drill-down
Flat: `#APW`, `#funding`, `#stack`, `#MN` allow combinatorial search

Both work. Pick one style and stick to it.

---

## What Belongs Where

| Content | Folder |
|---|---|
| Numerical facts · counts · ranges | 01_Canonical_Data |
| Bank lists · institution metadata | 01_Canonical_Data |
| Stack tier playbooks | 02_Funding_Stack |
| Daily execution journal | Daily/ |
| AI behavioral rules | 04_AI_SOP_System |
| Personal notes / brainstorms | (root of vault, not in APW_Migration) |
| Application tracking | Tracking/ |

---

## What NOT to Edit

Treat these as protected:
- `CANONICAL_FACTS.json` — only edit when explicitly updating canonical truth
- `STACK_LOCKED_RANGES.md` — only edit when Alan locks new ranges
- `VELOCITY_RULES.md` — only edit when industry rules change

Always:
1. Bump version number
2. Update `_meta.last_updated`
3. Log change in FIDELITY_CHECKLIST.md
4. Re-upload to Claude Project

---

## Backup Strategy

### Local
- Time Machine (Mac) or File History (Windows)
- Vault folder included by default

### Cloud
- iCloud Drive: vault folder auto-syncs
- Dropbox/OneDrive: point vault at synced folder

### Version Control
- Init git in vault root: `git init`
- Commit before major edits
- Push to private GitHub repo
- Use Obsidian Git plugin for automation
