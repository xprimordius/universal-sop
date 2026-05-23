---
title: AI vendor contract key clauses
source: claude
type: conversation
person: josephine
created: "2026-04-15T14:15:37.596661Z"
updated: "2026-04-15T14:15:55.324007Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 2
uuid: 28dc4878-e446-4eb1-9a8e-78b2939f5749
tags:
  - claude
  - josephine
  - contracts
  - legal
  - procurement
---

# AI vendor contract key clauses

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person asked for a concise, practical overview of what to watch for in AI vendor contracts, specifically referencing OpenAI models as an example. Claude provided five key contract review areas relevant to commercial AI procurement: data use and model training rights, IP ownership of outputs, confidentiality and data retention and deletion terms, indemnification for IP infringement claims, and liability caps along with uptime SLAs and termination rights. Claude also noted several additional watch-out areas including model deprecation notice periods, rate limit changes, governing law, and unilaterally updateable acceptable use policies.
> 
> The response referenced specific vendor practices and programs by name, including OpenAI's Zero Data Retention option, Copyright Shield indemnification offerings from OpenAI, Anthropic, Microsoft, and Google, and distinctions between consumer versus API and enterprise-tier data handling defaults. Claude briefly noted at the outset that the question could relate to vendor procurement purposes, suggesting some awareness of a possible organizational context, though no specific role or company was confirmed by the person. Claude offered a follow-up to pull current clauses from OpenAI's and Anthropic's commercial terms in a side-by-side table, but the conversation ended without the person responding to that offer. The person's preferred format was clearly bullet points, and the request was brief and direct.


---

## 👤 You

In ai contracts what to look for like open ai models give me 5 bullets

---

## 🤖 Claude

Quick check before I answer — is this **Alan** or **Josephine**? This sits in Josephine's commercial-contracts wheelhouse, but you (Alan) may be asking for APW vendor purposes. Answering generically for now:

**5 things to look for in AI vendor contracts (OpenAI, Anthropic, etc.)**

- **Data use & training rights** — Confirm in writing that your inputs/outputs are *not* used to train their models. For OpenAI API + ChatGPT Business/Enterprise this is the default; for consumer ChatGPT it is not. Check the exact clause, not the marketing page.

- **IP ownership of outputs** — Vendor should assign all right, title, and interest in outputs to you. Watch for carve-outs ("to the extent permitted by law"), non-exclusivity, or language saying outputs may be "similar" to those given to other customers (which limits enforceability against copycats).

- **Confidentiality, retention & deletion** — How long is data retained (OpenAI default is 30 days for abuse monitoring; Zero Data Retention is available on request for eligible endpoints), who can access it, and what's the deletion SLA on termination. Require sub-processor disclosure.

- **Indemnification (especially IP infringement)** — Does the vendor indemnify you if their output triggers a copyright/IP claim? OpenAI ("Copyright Shield"), Anthropic, Microsoft, and Google all offer some version — but each has conditions (must use content filters, must not have caused the infringement, caps on liability). Read the conditions, not the headline.

- **Liability caps, uptime SLAs & termination** — Standard cap is fees paid in prior 12 months — often inadequate for mission-critical use. Check uptime commitments, service credits, termination-for-convenience rights, and data export format/window on exit.

**Bonus watch-outs:** model deprecation notice periods, rate limit / quota changes mid-term, governing law & venue, and any "acceptable use policy" that the vendor can update unilaterally (effectively letting them change the contract).

Want me to pull the actual current clauses from OpenAI's and Anthropic's commercial terms side-by-side in a table?

---
