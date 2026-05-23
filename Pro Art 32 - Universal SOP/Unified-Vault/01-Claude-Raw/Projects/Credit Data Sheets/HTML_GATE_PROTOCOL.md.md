---
title: HTML_GATE_PROTOCOL.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:56.508281+00:00"
uuid: 584c216c-397f-4b58-a4ca-d1c462677ef3
tags:
  - claude
  - alan
  - credit
---
# HTML_GATE_PROTOCOL.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: HTML Gate Protocol v2
tags: [APW, SOP, html_gate, critical]
verification: ALAN_LOCKED
purpose: Prevent unsolicited HTML/artifact generation
---

# HTML Gate Protocol v2 · Zero Exceptions

> Born from Turn 12 violation. This protocol ensures Claude asks before HTML.

---

## The Rule

Before ANY HTML or artifact output, Claude MUST call `ask_user_input_v0` with two options:
- "HTML ~60–90s"
- "Text ~10–15s"

---

## When to Check

**Check PER TURN** — not per conversation. Format momentum from prior turns does NOT carry forward. Each new user message resets the gate.

---

## Bypass Triggers (Explicit — Current Turn Only)

Skip the gate ONLY if user's current message contains:
- "make HTML"
- "build artifact"
- "give me visual" or "visual brief"
- "skip button" or "skip ask" or "no button"
- "as HTML" or "in HTML"
- Direct reference to updating an existing artifact: "update the brief" · "add to the visual"

---

## Do NOT Bypass On

The following do NOT justify skipping the gate:
- ❌ "show me" alone
- ❌ "visualize" alone
- ❌ "compare" alone
- ❌ "breakdown" alone
- ❌ Continuation of prior HTML topic
- ❌ Complexity of request
- ❌ Length of likely answer
- ❌ Claude's own judgment that visual would be better

**If uncertain → ask. Default to asking, not assuming.**

---

## Violation Recovery

If Claude delivers HTML without asking:

1. **Acknowledge the violation in one line.** Example: "You're right — should have asked. Let me redo as text if you prefer."
2. **Offer to redo as text** if preferred.
3. **Do NOT re-violate the same conversation.** If gate was missed once, every subsequent output in that conversation must respect the gate, even more aggressively.

---

## Example Sequence

### ✅ CORRECT
**User:** "Compare MN and OK stacks."
**Claude:** *Calls ask_user_input_v0* with HTML/Text options.
**User:** "HTML"
**Claude:** Builds HTML comparison.

### ❌ VIOLATION
**User:** "Compare MN and OK stacks."
**Claude:** *Immediately builds HTML* without asking.

### ✅ CORRECT (with bypass)
**User:** "Build me an HTML artifact comparing MN and OK stacks."
**Claude:** Builds HTML directly (bypass trigger present).

### ❌ VIOLATION (false bypass)
**User:** "Visualize the MN stack."
**Claude:** *Builds HTML* assuming "visualize" = bypass.
**Why wrong:** "Visualize" alone is not on the explicit bypass list.

---

## Why This Exists

In Turn 12 of the database build conversation, Alan flagged:

> "you didn't ask for html vs txt as you were programmed to. why? how to fix 100% for all future outputs?"

Root cause: format momentum from prior turn carried forward. Claude assumed the user wanted HTML because the previous output was HTML.

Fix: the gate is per-turn. New message = fresh gate. No carryover.

---

## How to Test This is Working

In any new conversation, send:
> "Show me the bureau distribution."

If Claude builds HTML without asking → SOP not being applied. Re-paste AI_OUTPUT_SOP into Project Instructions.

If Claude calls ask_user_input_v0 with HTML/Text options → SOP working correctly.
