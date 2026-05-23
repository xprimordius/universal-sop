---
name: feedback-model-escalation-protocol
description: "Alan wants Claude to proactively flag the right model AND effort level for each task. Every model has all four effort levels. Models are distinct in character, not just a capability ladder."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 93a59399-6023-481c-8192-fc0e325aad50
---

When a task warrants a different model or effort level than what's currently running, surface a **Model check** notice BEFORE proceeding:

> 🧠 **Model check:** [one-line reason]. Recommend **[model] at [effort]** because [why]. Switch with `/model [id]` then re-send — or say "proceed as-is."

Do NOT silently attempt hard tasks at the wrong model/effort. Surface the recommendation first.

**Why:** Alan makes informed model+effort decisions per task. Both dimensions matter independently.

---

## The three models — distinct characters, not just a ladder

**Sonnet 4.6** — Fast, precise, literal
- Follows specs closely, low drift, excellent at iterative code edits
- Best when the task is well-defined and you want speed + accuracy
- Can still go Max effort for thorough analysis — just faster than Opus

**Opus 4.6** — Balanced depth + nuance
- More thorough reasoning, better at ambiguous or multi-constraint problems
- Good for architecture, writing, complex debugging, nuanced judgment calls
- Slower than Sonnet, but not as heavy as 4.7

**Opus 4.7** — Deepest reasoning, extended thinking
- Best for novel problems, hardest bugs, mission-critical decisions
- Leverages extended thinking for true multi-step reasoning chains
- Use when depth matters more than speed, or when 4.6 hasn't cracked it

---

## Effort levels — apply to ALL three models

| Level | What it means | When to use |
|---|---|---|
| **Medium** | Standard pass. One approach, no extra review. | Clear task, known pattern, single file, quick answer |
| **High** | Considers alternatives, checks assumptions, reviews edge cases. | Multiple valid approaches, some ambiguity, moderate complexity |
| **Very High** | Multiple reasoning passes, broad context sweep, validates approach before acting. | Complex design, hard bug, cross-file impact, competing constraints |
| **Max** | Exhaustive. Treats the task as if the stakes are high. | Mission-critical, irreversible actions, need to be right the first time |

---

## Recommendation matrix (starting point — context always overrides)

| Task type | Model | Effort |
|---|---|---|
| Routine bug fix, clear spec, single file | Sonnet 4.6 | Medium |
| Multi-file refactor, clear goal | Sonnet 4.6 | High |
| Stuck on a bug after 1 attempt | Sonnet 4.6 | Very High |
| Stuck after 2+ attempts | Opus 4.6 | High |
| New system architecture | Opus 4.6 | Very High |
| Complex architecture with many unknowns | Opus 4.7 | Very High |
| Hard bug Opus 4.6 hasn't solved | Opus 4.7 | Max |
| Security / production-critical review | Opus 4.7 | Very High |
| Nuanced writing (client-facing, published) | Opus 4.6 | High |
| Mission-critical decision, irreversible | Opus 4.7 | Max |
| Fast iteration / exploratory coding | Sonnet 4.6 | Medium |
| Deep analysis of unfamiliar large codebase | Opus 4.6 | Very High |

---

## How Alan switches in Claude Code

```
/model claude-sonnet-4-6   ← fast, precise
/model claude-opus-4-6     ← balanced depth
/model claude-opus-4-7     ← deepest reasoning
```

After switching, re-send the original message. Context carries over.
Effort level is communicated to Alan in the recommendation; he sets it via `/effort` or the UI toggle if available.
