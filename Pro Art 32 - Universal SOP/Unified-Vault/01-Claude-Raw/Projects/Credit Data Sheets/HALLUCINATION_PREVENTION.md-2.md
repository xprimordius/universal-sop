---
title: HALLUCINATION_PREVENTION.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T23:25:40.588624+00:00"
uuid: 0ebcc502-e7bb-4efb-9c45-a54dbcb39016
tags:
  - claude
  - alan
  - credit
---
# HALLUCINATION_PREVENTION.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Hallucination Prevention Protocol
tags: [APW, SOP, accuracy, critical]
verification: VERIFIED
purpose: Reduce false claims to near-zero
---

# Hallucination Prevention Protocol

> Concrete rules for preventing AI from fabricating numbers, banks, rules, or sources.

---

## The Three Categories of Hallucination

### Category 1 · Fabricated Numbers
**Example:** "There are 1,247 banks in the database" (when actual is 868 or 2,231 depending on file)

**Prevention:**
- Cite source for every number: "X = [number] (source: [file/doc] · [verification level])"
- Never round or estimate without explicit flag
- Cross-check against CANONICAL_FACTS.json before quoting

### Category 2 · Invented Banks/Rules
**Example:** "First Pacific National Bank pulls Experian in MN" (bank doesn't exist in source)

**Prevention:**
- Only reference banks present in STATE_INDEX.json or source .xlsx
- Quote bank names verbatim from source (don't normalize unless flagged)
- Never invent velocity rules · industry rules must be cited or labeled INDUSTRY_TYPICAL

### Category 3 · Drifted Ranges
**Example:** Initial AI estimate was Chase $25K-$62K. Later conversation drifts to Chase $30K-$70K.

**Prevention:**
- All ranges live in STACK_LOCKED_RANGES.md or CANONICAL_FACTS.json
- AI references the doc, doesn't restate from memory
- ALAN_LOCKED ranges are immutable without explicit Alan approval

---

## The 4-Step Pre-Claim Check

Before stating any factual claim, Claude must internally verify:

### Step 1 · Is this from a canonical doc?
- If yes → cite the doc + verification level
- If no → proceed to Step 2

### Step 2 · Is this from a source .xlsx?
- If yes → cite "verified from File X · Sheet Y · Row Z"
- If no → proceed to Step 3

### Step 3 · Is this industry-typical?
- If yes → label INDUSTRY_TYPICAL · add disclaimer
- If no → proceed to Step 4

### Step 4 · Am I making this up?
- If yes → STOP · do not state · ask Alan or flag as "I don't have this data"
- If no → label ESTIMATED with reasoning

---

## Anti-Hallucination Phrases

Use these explicitly:

✅ "Per CANONICAL_FACTS.json v2.1..."
✅ "Verified in File 3 · Oklahoma sheet · row 14..."
✅ "I'm not certain on this — this is industry-typical and not in your data"
✅ "I don't have this in your dataset · need to verify"
✅ "This is an ESTIMATE based on [reasoning] — treat as directional"

Avoid these:

❌ "Generally banks..."
❌ "Typically the range is..."
❌ "It's well known that..."
❌ "Most stacks include..."
❌ "I think it's around..."

The avoid-list phrases are red flags that AI is generating from training data, not from your verified sources.

---

## The Confrontation Test

When Alan challenges a number/fact:

### ❌ WRONG: Caving Immediately
**Alan:** "That's not right, the number is X."
**Claude:** "You're right, sorry, it's X."
**Why wrong:** AI didn't re-verify. May have just been told a wrong number. Lost epistemic ground without evidence.

### ❌ WRONG: Defending Without Re-Verification
**Alan:** "That's not right, the number is X."
**Claude:** "I disagree, my number is correct."
**Why wrong:** AI didn't re-verify either. May be defending a hallucination.

### ✅ CORRECT: Re-Verify First
**Alan:** "That's not right, the number is X."
**Claude:** *Re-reads CANONICAL_FACTS.json / source file*
**Claude:** "I re-checked: CANONICAL_FACTS shows [actual number] from File 3 row 14. If you have updated data, update the canonical doc and I'll use the new number."

---

## Source Hierarchy When Claims Conflict

If two docs in the project disagree:

1. **CANONICAL_FACTS.json** wins
2. **STACK_LOCKED_RANGES.md** wins for ranges
3. **Source .xlsx file** wins for raw data
4. **Other .md files** are derivative · update them to match the above

If user disagrees with canonical doc → user must update the doc explicitly. AI does not silently override the canonical.

---

## Per-Output Self-Check

Before sending, Claude verifies internally:

| Item | Y/N |
|---|---|
| Every quantitative claim has a citation | □ |
| Every fact tagged with verification level | □ |
| No "generally" / "typically" / "around" phrases | □ |
| No bank names not in source data | □ |
| No velocity rules without INDUSTRY_TYPICAL or ALAN_LOCKED tag | □ |
| No drifted ranges (locked ranges = locked ranges) | □ |
| If uncertain, explicit "I don't know" or "needs verification" used | □ |

If any box is ☐ → re-write before sending.

---

## What This Protocol Costs

Time: ~10-15% longer per output for citation lookups.
Value: ~80%+ reduction in hallucinated claims.

Goal: a system where if Claude says it, Alan can trust it without re-checking. The cost is upfront discipline. The benefit is no second-guessing.
