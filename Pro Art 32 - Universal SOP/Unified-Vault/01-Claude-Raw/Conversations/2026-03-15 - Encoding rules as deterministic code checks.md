---
title: Encoding rules as deterministic code checks
source: claude
type: conversation
person: alan
created: "2026-03-15T18:31:19.223609Z"
updated: "2026-03-15T18:32:28.544813Z"
year: 2026
month: 2026-03
quarter: 2026-Q1
messages: 4
uuid: d0f00df6-b9ef-47e3-b3a2-08ecc59f15af
tags:
  - claude
  - alan
  - ai-workflow
  - high-signal
---

# Encoding rules as deterministic code checks

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person asked two focused technical questions about deterministic rule checking in the context of LLM evaluation pipelines. First, they asked what it means to write rules as deterministic code checks, and Claude explained the core distinction between probabilistic AI judgment and deterministic code execution. Claude provided a comparison table showing how rules like word count limits, required formatting, and JSON structure can be encoded as functions rather than evaluated by an AI judge, and outlined where this pattern appears in practice: LLM pipelines, eval frameworks like Braintrust and PromptFoo, production guardrails, and grading systems.
> 
> The person then asked whether they could use an LLM in "code mode" to write these deterministic checks. Claude confirmed this is a strong use case, explaining that the LLM is used once to author the function, after which the function runs without any AI involvement. Claude provided a concrete Python example of a multi-condition checker returning a structured result dict, and a table mapping rule types to the corresponding code patterns. Claude also noted the ceiling of this approach: structural and measurable rules translate well to code, while subjective rules like helpfulness still require an AI judge or human review. The person appears to be building or evaluating an LLM pipeline and is exploring how to combine coded checks with AI-based evaluation.


---

## 👤 You

What does it mean to write some of the rules as deterministic checks with code?

---

## 🤖 Claude

## Deterministic Rule Checks with Code

Instead of relying on AI judgment to evaluate whether a rule was followed, you **encode the rule as a function that returns pass/fail**.

---

### The Core Idea

AI is probabilistic — it *interprets* rules.
Code is deterministic — it *executes* rules.

Some rules can be expressed as logic that doesn't require interpretation. Those are candidates for code.

---

### Examples

| Rule | AI Judgment | Code Check |
|---|---|---|
| "Response must be under 300 words" | AI estimates | `len(response.split()) <= 300` |
| "Must include a citation" | AI infers | `"[source]" in response` |
| "No bullet points" | AI guesses | `"- " not in response` |
| "Price must be $X format" | AI interprets | `re.match(r'\$\d+', response)` |
| "Must answer in JSON" | AI assumes | `json.loads(response)` — pass/fail |
| "Response contains required fields" | AI scans | Check keys exist in parsed output |

---

### Why It Matters

**AI evals are soft.** When you ask a model to grade another model's output, you get an opinion.

**Code evals are hard.** When you run a function, you get a binary result — and it's fast, cheap, and repeatable.

---

### Where This Shows Up

1. **LLM pipelines** — validate model output before passing to next step
2. **Prompt eval frameworks** (like Braintrust, PromptFoo, Evals) — mix coded checks with AI judges
3. **Production guardrails** — reject or retry if output fails a structural rule
4. **Course/quiz grading** — check format compliance before scoring content

---

### The Pattern

```python
def check_rule(response: str) -> bool:
    # Deterministic: no AI needed
    return len(response.split()) <= 300 and response.strip().endswith(".")
```

Run this *before* or *instead of* asking an AI "did this follow the rule?"

---

### Bottom Line

**If a rule can be expressed as a condition — write it as one.**
Save AI judgment for rules that require actual interpretation (tone, helpfulness, accuracy).

---

## 👤 You

Can I code deterministic code with LLM? In code mode

---

## 🤖 Claude

Yes. That's actually one of the best uses of it.

---

## What "Code Mode" Means Here

You describe the rule in plain English → LLM writes the function → function runs deterministically every time after that.

The LLM is used **once to write the check**. The check itself needs no LLM to run.

---

## Example Flow

**You say:**
> "Write a function that checks if a response contains bullet points, is under 300 words, and ends with an action item."

**LLM writes:**
```python
def check_response(response: str) -> dict:
    has_bullets = any(line.strip().startswith("- ") for line in response.splitlines())
    word_count = len(response.split())
    ends_with_action = response.strip().lower().endswith("action item")

    return {
        "pass": not has_bullets and word_count <= 300 and ends_with_action,
        "bullets_found": has_bullets,
        "word_count": word_count,
        "ends_with_action": ends_with_action
    }
```

Now that function runs **instantly, free, and identically** every time — zero AI needed at runtime.

---

## What You Can Build This Way

| Rule Type | LLM Writes | Runs As |
|---|---|---|
| Format checks | Regex, string parsing | Pure Python/JS |
| Schema validation | JSON schema or key checks | `jsonschema`, plain logic |
| Required field presence | Key existence checks | Dict lookup |
| Tone proxies | Word list matching | String search |
| Length constraints | Word/char count | `len()` |
| Output structure | Parser + validator | Code |

---

## The Ceiling

LLM-written code handles **structural and measurable rules** cleanly.

It can't encode rules like *"is this response genuinely helpful?"* — that still needs an AI judge or human review.

---

## Bottom Line

Claude Code / code mode is a direct path to this. Describe the rule → get the function → plug it into your eval pipeline. You write zero boilerplate.

---
