---
title: Intapp and Harbor integration for general counsel guidelines
source: claude
type: conversation
person: josephine
created: "2026-04-07T19:18:17.046467Z"
updated: "2026-04-07T19:19:15.238680Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 2
uuid: deb922b4-6b15-4e58-9a7a-be62d4f0b945
tags:
  - claude
  - josephine
  - faegre
  - legal
  - legal-tech
  - high-signal
---

# Intapp and Harbor integration for general counsel guidelines

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person is exploring a technology initiative at Faegre Drinker (a large law firm), specifically for the firm's General Counsel office. They inquired about using Intapp—an existing firm deployment covering risk, compliance, intake, conflicts, and ethical walls—as the system of record for GC guidelines, with Harbor serving as a generative AI overlay layer on top of that infrastructure. The person asked Claude to provide a comprehensive educational briefing on both platforms and the combined use case.
> 
> Claude delivered a structured overview covering Intapp's core modules relevant to a law firm GC office (Intake, Conflicts, Walls, Risk & Compliance), Harbor's identity as a legal industry consultancy formed from a 2023 merger of several firms including HBR Consulting and LAC Group, and the architectural pattern for the proposed solution—a retrieval-augmented generation (RAG) layer built on top of Intapp data to make GC guidelines queryable in natural language. Claude also outlined a set of sharp evaluation questions around architecture, data residency, hallucination controls, access controls respecting Intapp Walls, audit logging, and pricing model. Claude explicitly flagged which elements of the briefing were certain versus inferred, and proposed three concrete next steps: searching Harbor's current product offerings, researching Intapp's competing native GenAI layer (Intapp Assist, launched in 2024), and building an evaluation framework for the GC conversation.


---

## 👤 You

Faegre general counsel office is looking for a tool intapp since that system is already at the firm for their general counsel guidelines with an overlay of gen ai harbor has a lot on this teach me all about it

---

## 🤖 Claude

# Intapp + Harbor for Faegre's GC Office: What You're Looking At

## The Short Answer

Faegre Drinker's General Counsel office is evaluating using **Intapp Walls / Intapp Risk & Compliance** (already deployed at the firm) as the system of record for GC guidelines, with **Harbor** providing a generative AI overlay to make those guidelines queryable, summarizable, and actionable in natural language.

That's the play. Now let me break down each piece accurately, and flag what I'm certain about vs. what's inference.

---

## 1. Intapp — What It Is

**Intapp** is the dominant software platform for professional services firms (Big Law, accounting, consulting). It's publicly traded (NASDAQ: INTA) and built specifically for the legal/professional vertical.

Core relevant modules for a law firm GC office:

| Module | Purpose |
|---|---|
| **Intapp Intake** | New business intake, conflicts checks, KYC/AML, engagement letter workflows |
| **Intapp Conflicts** | Conflicts of interest searching and clearance |
| **Intapp Walls** | Ethical walls / information barriers — controls who can access which matters |
| **Intapp Risk & Compliance** | Broader risk management, OCG (outside counsel guidelines) tracking, terms compliance |
| **Intapp Time** | Timekeeping |
| **Intapp Documents / DealCloud** | CRM and pipeline (more relevant on the corporate side) |

For a **GC office at a law firm**, the relevant stack is typically **Intake + Conflicts + Walls + Risk & Compliance**. That's where firm-internal policies, ethical screens, OCGs, and engagement terms live.

**Key point:** Intapp is structured data + workflow. It's good at *enforcing* rules and *routing* approvals. It is **not** natively good at letting a lawyer ask, "What's our policy on accepting a matter adverse to a current client in a different practice area?" in plain English.

That gap is where Harbor comes in.

---

## 2. Harbor — What It Is

**Harbor** (harborglobal.com) is a consulting and managed services firm formed from the 2023 merger of several legal industry consultancies: **HBR Consulting, LAC Group, Wilson Allen, and Edge International**. They are *the* dominant consultancy serving law firm operations, including risk, GC offices, IT, KM, and innovation.

Harbor is **not** a software vendor in the traditional sense. They are:

1. **Implementation partners** for Intapp (one of the largest Intapp implementation shops in the market)
2. **Strategic advisors** to law firm GC, risk, and compliance functions
3. **Builders of GenAI overlays and accelerators** on top of existing firm systems

Harbor has invested heavily in **GenAI for legal operations and risk/compliance use cases** over the last ~18 months, including productized accelerators that sit on top of Intapp data.

---

## 3. The Specific Play: GenAI Overlay on Intapp for GC Guidelines

Here's the architecture, conceptually:

```
┌─────────────────────────────────────────┐
│  Faegre Lawyers / Staff (end users)     │
│  Ask natural-language questions         │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│  Harbor GenAI Layer                     │
│  - LLM (likely Azure OpenAI / Claude)   │
│  - RAG over GC guidelines               │
│  - Prompt templates / guardrails        │
│  - Audit logging                        │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│  Intapp (system of record)              │
│  - GC guidelines / policies             │
│  - OCGs                                 │
│  - Conflicts data                       │
│  - Intake rules / matter metadata       │
│  - Walls / ethical screens              │
└─────────────────────────────────────────┘
```

**What this unlocks for the GC office:**

- A partner can ask, "Can I accept this matter?" and get a guideline-grounded answer with citations to the actual firm policy.
- Intake staff can ask, "What are the conflict rules when Client X is involved on the other side?" without paging the GC office.
- The GC team can summarize an incoming OCG in seconds and flag terms that conflict with firm policy.
- Audit trail is preserved because the LLM is grounded in Intapp data, not free-floating.

**What it does *not* do (and Harbor will tell you this):**

- It doesn't replace the GC office's judgment on novel or high-stakes calls.
- It's only as good as the underlying guideline content in Intapp — garbage in, garbage out.
- It requires real governance: who can ask what, what gets logged, what gets escalated.

---

## 4. Why This Combination Specifically

| Factor | Why It Matters |
|---|---|
| **Intapp is already deployed** | No new system of record, no migration, leverages sunk cost and existing data governance |
| **Harbor knows Intapp deeply** | They've implemented it at most AmLaw 200 firms — they know the data model and the firm's likely config |
| **GenAI overlay is additive** | Doesn't disrupt existing workflows; sits on top |
| **GC office is a high-leverage use case** | Repetitive guideline questions consume disproportionate GC time |
| **Auditability** | RAG-based answers grounded in firm policy are defensible in a way ChatGPT answers are not |

---

## 5. What to Ask Harbor (If You're Evaluating This)

If you're advising or scoping this, the sharp questions are:

1. **Architecture** — Is the LLM hosted in Faegre's tenant (Azure OpenAI private) or Harbor's? Where does the data live during inference?
2. **Grounding** — Is it true RAG on Intapp data, or are guidelines being fine-tuned into a model? (RAG is the right answer for policy content that changes.)
3. **Source of truth** — How are guidelines maintained in Intapp? Structured fields, attached docs, or a knowledge base module? This determines retrieval quality.
4. **Hallucination controls** — What's the guardrail when the LLM doesn't find a grounded answer? Does it say "I don't know," or does it improvise?
5. **Audit logging** — Every query, every answer, every citation — logged where, retained how long, reviewable by whom?
6. **Access controls** — Does the GenAI layer respect Intapp Walls? A lawyer screened off a matter shouldn't be able to query around it.
7. **Update workflow** — When the GC office updates a guideline, how fast does the GenAI layer reflect it? (Should be near real-time with RAG.)
8. **Pricing model** — Harbor typically charges implementation + ongoing managed services. Is this a fixed-scope project or a subscription?
9. **Pilot scope** — What's the smallest meaningful pilot? Usually: one practice group, one guideline category (e.g., conflicts or OCG review).
10. **Benchmarks** — What other AmLaw firms has Harbor done this for, and what were the measured outcomes?

---

## 6. What I'm Certain About vs. Inferring

**Certain:**
- Intapp is the dominant risk/compliance/intake platform in BigLaw and is almost certainly deployed at Faegre Drinker.
- Harbor (post-merger entity) is a top-tier Intapp implementation and law firm consulting shop.
- Harbor has been actively building GenAI offerings for legal ops and risk/compliance.
- The architecture I described (RAG on top of Intapp) is the standard pattern for this use case.

**Inference (verify directly with Harbor):**
- The exact name and packaging of Harbor's GenAI-on-Intapp offering. Harbor productizes and rebrands frequently. They may call it something specific like "Harbor AI for Risk & Compliance" or position it as a custom build per client.
- Whether Harbor has a *productized* offering for this specific use case (GC guidelines on Intapp) vs. a *consulting engagement* that builds it custom. As of mid-2025 it was trending toward productized accelerators, but I'd want to confirm current state.
- Faegre Drinker's specific Intapp configuration and which modules they have licensed.

---

## 7. Recommended Next Step

If you want me to go deeper, the highest-leverage moves are:

**A.** Let me search Harbor's site and recent press for their current GenAI product names, case studies, and any Faegre-specific announcements.

**B.** Pull Intapp's own GenAI strategy (they launched **Intapp Assist**, their native GenAI layer, in 2024 — which is a competitive consideration vs. Harbor's overlay). The Intapp Assist vs. Harbor overlay decision is a real fork in the road and worth a side-by-side.

**C.** Build you a one-page evaluation framework you can take into the GC conversation.

Want me to run the search and bring back current, verified specifics on Harbor's offering and Intapp Assist as a comparison? That's where this gets actionable.

---
