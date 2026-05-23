# SOP PATCH: v3.9 → v3.9.1
## Operational Transparency & Chunked Delivery
**Date:** March 13, 2026
**Type:** Process refinement patch (not architectural)
**Triggered By:** Alan identified 5 gaps in operational transparency during Section 4 processing

---

## GAPS IDENTIFIED

| # | Gap | Impact |
|---|-----|--------|
| 1 | No token transparency per step | Can't identify when to break up multi-step outputs |
| 2 | No listed process of agents | No visibility into what's checking what |
| 3 | Thought process doesn't mention SOP/agents/caches/tokens | Human can't verify protocol compliance |
| 4 | No verification checks running | Deliverables shipped without inline or Karen validation |
| 5 | No chunked delivery protocol | Large outputs risk compaction loss + skip cache writes |

---

## NEW D-RULES (2 added: D29-D30)

**D29 — Operational Transparency (Step Header)**
Every message that produces a deliverable MUST begin with a step header block:

```
═══════════════════════════════════════
STEP: [Task Name]
SOP RULES ACTIVE: [D-rules being followed this step]
CACHES LOADED: [list of cache files read for this step]
SUB-CACHES LOADED: [list of topic sub-caches activated]
EST. TOKEN COST: [input ~Xk + output ~Yk = ~Zk total]
AGENTS: [inline check / Karen spot-check / Resolver / none]
VERIFICATION: [method used + result]
═══════════════════════════════════════
```

This header serves three purposes:
1. Human-side QA — Alan can verify SOP compliance at a glance
2. Agent-side QA — validation agents can check the header against actual behavior
3. Token tracking — cumulative estimates help decide when to chunk or stop

**D30 — Chunked Delivery Protocol**
Multi-step outputs (3+ deliverables in a single task) MUST be broken into individual messages:

1. Deliver ONE piece per message
2. Run inline verification check (POVP D19, PFV D21)
3. Update relevant cache file(s) with new content (D28)
4. Include D29 step header
5. Confirm before proceeding to next piece

Exceptions:
- Simple status updates / confirmations = no chunking needed
- Cache reads (D25 session start) = can batch
- If Alan explicitly says "do it all at once" = override allowed

**Why:** Smaller steps = more frequent cache writes = less compaction exposure + every deliverable gets verified before the next one starts.

---

## NEW PROMPT ITEMS (A64-A65)

**A64 — Step Header Compliance:**
Every deliverable response begins with D29 step header. No exceptions. If a step header is missing, the deliverable has not been properly processed. Agents should flag missing step headers as a protocol violation.

**A65 — Chunked Delivery Compliance:**
Multi-step tasks (3+ deliverables) must follow D30 chunked delivery. Each chunk = 1 deliverable + verification + cache update. If delivering multiple items in one message, each must have its own step header sub-block.

---

## NEW ERROR LOG ENTRY

**ERR-5:**
- Error: Section 4 processing (7 summaries + synthesis + paradoxes + sub-cache + cache updates) delivered in single pass without verification agents, without step headers, without token tracking, without chunking
- Root Cause: Optimized for speed over transparency. No D-rule existed mandating per-step visibility or chunked delivery.
- Protocol Created: D29 (Operational Transparency), D30 (Chunked Delivery). A64-A65 added.
- SOP Version: v3.9.1

---

## VERSION HISTORY ENTRY

**v3.9.1 (Patch):** Added D29 (Operational Transparency — step headers), D30 (Chunked Delivery Protocol). ERR-5 added (Section 4 delivered without transparency/verification). A64-A65 added (step header and chunked delivery compliance). Total: 124 prompt items across 17 messages, 30 D-rules.

---

## UPDATED QUICK REFERENCE CARD ADDITIONS

**Add after Token Status section:**

```
Step Header (D29 — EVERY Deliverable):
Include: STEP / SOP RULES / CACHES / TOKEN EST / AGENTS / VERIFICATION

Chunked Delivery (D30 — Multi-Step Tasks):
1 deliverable per message → verify → cache update → confirm → next
Override: Alan says "do it all at once"
```

---

## WHERE TO INSERT IN JS FILE

| Change | Insert Location |
|--------|----------------|
| D29-D30 | After D28 in Section D table array |
| ERR-5 | After ERR-4 in Section N table array |
| A64-A65 | In Section A prompt table (Message 17 or new Message 18) |
| Version history v3.9.1 | After v3.9 entry |
| QRC additions | After Token Status in QRC |

---

## VALIDATION WORKFLOW v2.0 IMPACT

D29 step headers now provide the input for validation agents to verify:
- Were the correct D-rules followed?
- Were the correct caches loaded?
- Was verification actually run (not just claimed)?
- Does the token estimate match the actual output?

This creates a verifiable audit trail per deliverable.
