---
title: CLAUDE_PROJECT_SETUP.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:24.468905+00:00"
uuid: 35ebd6cb-e477-45f2-8d9e-ee99893dd9a8
tags:
  - claude
  - alan
  - credit
---
# CLAUDE_PROJECT_SETUP.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Claude Project Setup
tags: [APW, claude, setup, projects]
---

# Claude Project Setup · Step-by-Step

## Why Projects (not regular chat)

| Feature | Regular Chat | Claude Project |
|---|---|---|
| Persistent knowledge | ❌ Per-conversation | ✅ All chats inherit |
| Custom instructions | ❌ No | ✅ Project Instructions |
| File capacity | Limited per chat | Larger pooled knowledge |
| Cross-chat memory | Memory-based, lossy | Document-based, lossless |
| Best for | One-off questions | Recurring domain work |

**Verdict:** Projects are the right home for APW work. Memory is supplementary.

---

## Setup · 8 Steps

### Step 1 · Create the Project
- Open claude.ai
- Sidebar → **Projects** → **+ Create Project**
- Name: `APW Funding Intel`
- Description: `Master vault for Ascend Prime Wealth funding research, stacking strategy, credit intel, and SOP-governed AI outputs.`

### Step 2 · Set Custom Instructions
- Click **Set custom instructions** (or **Edit Project**)
- Paste the entire contents of `04_AI_SOP_System/AI_OUTPUT_SOP.md` into the instructions field
- Save

### Step 3 · Upload Source Data
Upload these 5 to Project Knowledge:
- [ ] `CC_Data_1.xlsx`
- [ ] `CC_Data_2.xlsx`
- [ ] `CC_Data_3.xlsx`
- [ ] `CC_Data_4_-_State_by_State_hard_inquiry_database.xlsx`
- [ ] `CC_Data_5_-_Inquiry_Database_v2.xlsx`

### Step 4 · Upload Canonical Data Files
- [ ] `CANONICAL_FACTS.json`
- [ ] `UNDERWRITER_MAP.json`
- [ ] `STATE_INDEX.json`
- [ ] `FILE_1_summary.md` through `FILE_5_summary.md`
- [ ] `VELOCITY_RULES.md`
- [ ] `FLAGS.md`

### Step 5 · Upload Stack Playbooks
- [ ] `STACK_LOCKED_RANGES.md`
- [ ] `STACK_MN.md`
- [ ] `STACK_OK.md`
- [ ] `TIMELINE_OPTIONS.md`
- [ ] `EXECUTION_CHECKLIST.md`

### Step 6 · Upload SOP Documents
- [ ] `AI_OUTPUT_SOP.md`
- [ ] `HALLUCINATION_PREVENTION.md`
- [ ] `HTML_GATE_PROTOCOL.md`
- [ ] `SELF_CHECK_PROTOCOL.md`

### Step 7 · Test the Setup
Open a new chat in the project. Run these 3 test queries:

1. **"What's the locked named-bank stack range from this project?"**
   - ✅ Expected: `$143K - $554K` (from CANONICAL_FACTS.json)
   - ❌ Failure: Different numbers or "I don't have that data"

2. **"What's the Amex velocity rule?"**
   - ✅ Expected: `2 approvals per 90 days, hard cap`
   - ❌ Failure: Wrong number or no source citation

3. **"How many MN-eligible Elan banks are in File 3?"**
   - ✅ Expected: `14 banks` with names listed
   - ❌ Failure: Different number → re-verify upload

### Step 8 · Lock In with First Real Query
Once tests pass, start a real work session. Reference docs by name when you want surgical accuracy:
- "Pull from STACK_LOCKED_RANGES"
- "Check FLAGS for double-dip banks"
- "Verify against CANONICAL_FACTS"

---

## What if a chat goes off the rails?

1. End that chat
2. Open new chat in the same project
3. Reference the SOP: "Apply AI_OUTPUT_SOP protocol"
4. The fresh chat re-inherits all project knowledge

---

## Maintenance

| Frequency | Task |
|---|---|
| Per chat | Verify outputs against CANONICAL_FACTS before acting |
| Weekly | Re-export from Obsidian if you've made updates |
| Monthly | Run FIDELITY_CHECKLIST audit |
| Per major data update | Re-upload .xlsx + update CANONICAL_FACTS.json |

---

**Next:** Read `USAGE_INSTRUCTIONS.md` for day-to-day workflow.
