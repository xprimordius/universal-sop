# 🤖 CROSS-MODEL TEST KIT — Validate STANDALONE_SOP On Non-Claude Models
# VERSION: 1.0 | 2026-05-21 | C-option execution
# Purpose: Test if STANDALONE_SOP self-enforces on GPT-5, Gemini, etc.

---

## 🎯 WHY THIS MATTERS

STANDALONE_SOP.md was designed to be model-agnostic — generic enough for any LLM to follow. But it was developed and tested ONLY on Claude. Sub-agent tests are still Claude-vs-Claude (same brain limit).

**Cross-model validation** = paste STANDALONE_SOP into a different model (GPT-5, Gemini, Claude.ai web), give it a task, see if compliance holds.

**Why valuable:**
- Different model = different blind spots = different failure modes surfaced
- Different model = different conventions (no "Claude/Anthropic" affordances)
- Different model = honest test of "is the SOP truly portable?"

**Expected outcomes:**
- 🟢 Best case: 8-9/10 friction (proves portability)
- 🟡 Likely: 6-7/10 (model-specific conventions cause friction)
- 🔴 Worst case: <5/10 (SOP is too Claude-shaped, needs generalization)

---

## 🚀 THE TEST PROTOCOL

### Step 1 — Prep

| 🆔 | 🏷️ Action | 📝 Detail |
|:---:|----------|----------|
| 1 | Open target model | GPT-5 (chat.openai.com), Gemini (gemini.google.com), or fresh Claude.ai web |
| 2 | Start fresh chat | Brand new conversation, no prior context |
| 3 | Copy `STANDALONE_SOP.md` | Full content (~18K) — entire file from project root |
| 4 | Prepare test task | Use Test Task 1 (explainer) or Test Task 2 (code build) below |

### Step 2 — Paste

Paste this EXACT framing message FIRST (before the SOP content):

```
I'm giving you a complete operating framework called the "Universal Output SOP."
It's designed to make your output traceable, auditable, and structurally compliant.
Read it once. Then apply it to every response you give me from this point forward.
No exceptions. After reading, confirm with "READY" and wait for my task.

[PASTE FULL STANDALONE_SOP.md CONTENT HERE]
```

### Step 3 — Wait For Confirmation

Expected response: `READY` (or similar minimal confirmation).

**If the model produces a long explanation instead of `READY`:** Note the friction. It didn't follow STEP 3 wait pattern.

### Step 4 — Give Test Task

Use ONE of these test tasks (matched to model strengths):

#### Test Task A — Explainer (Low Complexity)
```
Explain how compound interest works in 3 paragraphs. Include a simple worked example.
```

#### Test Task B — Code Build (Medium Complexity)
```
Build me a simple single-file HTML todo app with add/complete/delete functionality.
Use localStorage for persistence. Include inline CSS + JS.
```

#### Test Task C — Analysis (High Complexity)
```
Compare these three programming language choices for a new backend project:
Python, Rust, and Go. Evaluate on: performance, developer productivity,
ecosystem maturity, hiring market, learning curve. Give a recommendation with rationale.
```

### Step 5 — Score The Output

Use this scoring rubric:

| # | 🛡️ Check | 📊 Pass Criteria |
|:-:|----------|------------------|
| 1 | Step header line 1 | `STEP: ... | SOP: v1.3 | TIER: ...` present |
| 2 | Understanding Check (STANDARD+) | Table with verbatim user words + interpretation |
| 3 | Step tracking table | All 5 columns (Est / Actual / Cumul / Fidelity / Verified) |
| 4 | LTM after every section | `📊 LTM:` line with token tracking |
| 5 | Conclusion mapping prompt items | Table linking ask → deliverable |
| 6 | Foresight + analysis at end | Min 3 items with priority tags |
| 7 | SHR scorecard | Multi-dimensional health report |
| 8 | Debt counter honest | Acked = Executed + Deferred + Failed |
| 9 | SubSOP report | All 16 SubSOPs + 4 Ensurance listed |
| 10 | Acronyms expanded first use | "SP.1 MagNet (Magnetic Visual Engagement Protocol)" format |
| 11 | Pulse Check 2.0 pre-send | P1-P15 with Y/N + 15/15 score |
| 12 | PROPORTIONALITY honored | Output size matches ask size |

**Score:** X/12

**Friction score:** Convert via: (Score / 12) × 10 = friction/10

---

## 📊 SCORING EXAMPLES

### High Compliance (8-9/12)
Model followed most SOP elements. Some adaptations to model's conventions. Acceptable variance.

### Medium Compliance (5-7/12)
Model followed major structural elements but skipped detail compliance. Common: skipped SubSOP report, abbreviated Pulse Check.

### Low Compliance (<5/12)
Model reverted to its own default output format. SOP framing didn't stick.

---

## 🔬 EXPECTED FRICTION SOURCES BY MODEL

### GPT-5
- 🟢 Should handle tables, emojis, structured output well
- 🟡 May not use `<details>` expandable (HTML in markdown)
- 🟡 May skip the "Pulse Check" mechanical gate
- 🔴 May add its own format conventions on top

### Gemini
- 🟢 Good at long-context absorption
- 🟡 May reformat tables to Gemini's preferred style
- 🔴 May truncate output if over a certain length

### Claude.ai (Web)
- 🟢 Same model family — expected highest compliance
- 🟢 Should treat STANDALONE as familiar
- 🟡 May have minor differences from Claude Code (no Read tool)
- 🟢 Best test bed for first cross-platform validation

---

## 📝 REPORT TEMPLATE

After running the test, fill out:

```
## CROSS-MODEL TEST REPORT

### Test Setup
- Target model: [GPT-5 / Gemini / Claude.ai web / other]
- Test date: [YYYY-MM-DD]
- Test task: [A / B / C / custom]
- STANDALONE_SOP version pasted: [v1.8]

### Confirmation Response
[Paste model's response to "READY?"]
- Was it just "READY" or more? [Y/N]
- Friction points in confirmation:

### Task Response
[Paste model's output for the test task]

### Compliance Score
[X/12] — see scoring rubric above
[Friction score: X/10]

### Specific Compliance Gaps
- [Element]: [PASS / FAIL with reason]

### Friction Points (Model-Specific)
- [Behavior]: [Why it caused friction]

### Comparison To Claude Baseline (8.5/10)
- Higher / Lower / Same?
- What's the delta and why?

### Recommendations For STANDALONE_SOP Generalization
- [Improvement that would help cross-model adoption]

### Verdict
- Is STANDALONE_SOP truly portable? [Y / N / Partial with caveats]
```

---

## 🎯 RECOMMENDED FIRST CROSS-MODEL TEST

1. **Claude.ai web** (lowest variance — confirms baseline)
2. **GPT-5** (most common alternative — catches Claude-specific assumptions)
3. **Gemini** (different family — catches deepest portability issues)

Run all three eventually. Document each in `cache/cross_model_tests/` (create folder).

---

## 🧪 IN-SESSION SIMULATION (RIGHT NOW)

For an immediate test without leaving this session, see the sub-agent simulation in the SESSION_STATE.md log entry "12th + cross-model sim" (executed as part of C-option this output).

The sub-agent was framed as: "You are a non-Claude model — no familiarity with Anthropic conventions. Read STANDALONE_SOP and follow it on a test task."

**Limitations of sub-agent simulation:**
- ❌ Sub-agent is STILL Claude (same model)
- ❌ Same Claude conventions, just told to ignore them
- ⚠️ Useful as a SMOKE TEST but not a true cross-model validation
- ✅ Catches "obvious" cross-model issues (assumes Claude features that other models lack)

---

## 📊 EFFICIENCY IMPACT

Per EFFICIENCY_GUIDE.md:
- **Without cross-model validation:** SOP portability is THEORETICAL
- **With successful cross-model test:** Friction ceiling moves +0.5 (system genuinely portable)
- **With cross-model failures surfaced:** New FT15.x cycle of generalizations needed

**Recommendation:** Run cross-model test BEFORE making STANDALONE_SOP public via PUBLIC_SHARE_KIT. Public release without cross-model validation = high risk of cross-model embarrassment.

---

## 🎓 SUCCESS CRITERIA

STANDALONE_SOP is "truly portable" if:
- ✅ At least 2 of 3 (Claude.ai web, GPT-5, Gemini) score ≥7/12
- ✅ No critical compliance gaps (Pulse Check 2.0, Step Header, Conclusion mapping)
- ✅ User reports usable output (not just structurally compliant)
- ✅ Variance across models is "minor formatting differences" not "fundamental compliance gaps"

If ALL of above ✅ → SOP is field-ready for public sharing.

---

*SOP v1.3 | This file: CROSS_MODEL_TEST_KIT.md v1.0 | C option execution | 2026-05-21*
