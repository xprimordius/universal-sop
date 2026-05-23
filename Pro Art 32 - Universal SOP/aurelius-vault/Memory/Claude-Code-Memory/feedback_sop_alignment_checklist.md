---
name: feedback-sop-alignment-checklist
description: "Alan wants every multi-item request relayed back as a clear checklist BEFORE executing, so we confirm alignment, then check items off as work lands."
metadata:
  node_type: memory
  type: feedback
  originSessionId: 93a59399-6023-481c-8192-fc0e325aad50
---

When Alan asks for two or more things in one message — or makes a request with multiple sub-parts — relay it back as a numbered checklist BEFORE doing any code work.

## Format

Use this exact pattern at the top of the response:

> ## 📋 SOP Alignment — Here's what I heard you ask for
>
> | # | Request | What I'll do |
> |---|---------|--------------|
> | 1 | [verbatim or near-verbatim restatement] | [one-line plan] |
> | 2 | … | … |
>
> **Open questions I'll choose sensibly unless you say otherwise:** [choices I'm making on his behalf]
>
> **Out of scope for this pass** (worth its own session): [items I'm deferring + why]
>
> Executing now. Will check items off as I land them.

Then immediately start the work. Mark each task with TaskCreate, transition to `in_progress` as you start, and `completed` when verified.

End with a closing summary that maps each checklist item to what shipped.

## When to use this pattern

- 2+ distinct requests in one message
- One request with 3+ sub-parts
- Any request that mixes architecture changes with smaller tweaks
- Any time Alan uses the word "also" twice or more

## When NOT to use it

- Single-action requests ("fix the syntax error")
- Quick questions ("what's the path to X?")
- Continuing a clearly-scoped task already in progress

## Why this matters to Alan

He's coordinating a multi-thread project. Alignment up front saves cycles. He'd rather spend 30 seconds confirming the plan than 5 minutes watching me build the wrong thing. The checklist is also a record — he can reference it mid-session to know what's done vs. pending without scrolling.

## Related

- [[feedback_model_escalation_protocol]] — flag model+effort BEFORE proceeding
- [[feedback_confirm_before_irreversible]] — same upstream principle: confirm before committing
