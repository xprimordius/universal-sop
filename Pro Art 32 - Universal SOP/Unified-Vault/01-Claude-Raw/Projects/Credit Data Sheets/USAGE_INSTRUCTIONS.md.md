---
title: USAGE_INSTRUCTIONS.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:24.559536+00:00"
uuid: a5244ce2-375c-41b6-8b2a-e3149d151388
tags:
  - claude
  - alan
  - credit
---
# USAGE_INSTRUCTIONS.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Usage Instructions
tags: [APW, usage, workflow]
---

# Day-to-Day Usage Instructions

## The 3 Question Types

### Type 1 · Reference Lookup ("What is X?")
**Example:** "What's the MN Elan cluster bank count?"

- Go straight to `CANONICAL_FACTS.json` or `STATE_INDEX.json`
- Answer should be 1-line, exact number, with file source cited
- No HTML, no essay

### Type 2 · Strategic Analysis ("How should I X?")
**Example:** "Should I batch all apps or roll them out?"

- AI reads `STACK_LOCKED_RANGES.md` + `VELOCITY_RULES.md` + `TIMELINE_OPTIONS.md`
- Output: structured comparison with explicit trade-offs
- Format gated by HTML_GATE_PROTOCOL (asks user first)

### Type 3 · Execution ("Run my stack")
**Example:** "Build my Wave 1 calendar for MN"

- AI reads `STACK_MN.md` + `EXECUTION_CHECKLIST.md`
- Output: day-by-day plan with bank names, sequence, recon scripts
- Must cross-check FLAGS.md before any bank is recommended

---

## Reference Doc Cheat Sheet

| If you need... | Open... |
|---|---|
| A specific number | `CANONICAL_FACTS.json` |
| Bank list for a state | `STATE_INDEX.json` |
| Underwriter clusters | `UNDERWRITER_MAP.json` |
| Velocity / spacing rules | `VELOCITY_RULES.md` |
| Blocked / double-dip / geo flags | `FLAGS.md` |
| Stack ranges | `STACK_LOCKED_RANGES.md` |
| MN-specific playbook | `STACK_MN.md` |
| OK-specific playbook | `STACK_OK.md` |
| Timing strategy | `TIMELINE_OPTIONS.md` |
| Step-by-step execution | `EXECUTION_CHECKLIST.md` |
| How AI should respond | `AI_OUTPUT_SOP.md` |

---

## Update Protocol

When something changes (new bank data, range update, rule clarification):

1. **Edit `CANONICAL_FACTS.json` first** — this is the source of truth
2. Propagate the change to any affected `.md` files
3. Re-upload changed files to Claude Project
4. Bump version number in the file front-matter
5. Log the change in `99_Audit/FIDELITY_CHECKLIST.md`

---

## Common Pitfalls

| Pitfall | Avoidance |
|---|---|
| AI uses estimated numbers without flagging | Cite source explicitly: "Per CANONICAL_FACTS..." |
| Stack ranges drift between conversations | Always paste/reference `STACK_LOCKED_RANGES.md` |
| Same-underwriter clustering triggers denials | Cross-check UNDERWRITER_MAP before any app sequence |
| Blocked banks accidentally recommended | Always validate against FLAGS.md |
| HTML output when text was wanted | SOP requires asking — if AI forgets, redirect |

---

## When in Doubt

Default protocol when you're unsure if AI has correct context:

```
You: "Confirm the locked named-bank stack range and source it."
AI should respond: "$143K - $554K (CANONICAL_FACTS.json v1.0, locked by Alan on [date])"
```

If that handshake fails → upload may be incomplete. Re-check Step 4 of CLAUDE_PROJECT_SETUP.
