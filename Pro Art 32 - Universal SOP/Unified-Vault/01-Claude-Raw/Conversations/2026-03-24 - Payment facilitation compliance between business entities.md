---
title: Payment facilitation compliance between business entities
source: claude
type: conversation
person: alan
created: "2026-03-24T16:35:18.310623Z"
updated: "2026-03-24T16:43:29.197887Z"
year: 2026
month: 2026-03
quarter: 2026-Q1
messages: 10
uuid: bb45bea6-08bc-4e20-9344-1e4e4830293d
tags:
  - claude
  - alan
  - chargeback
  - dispute
  - funding
  - legal
  - tech
  - high-signal
---

# Payment facilitation compliance between business entities

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person is working on structuring a legal and compliant payment facilitation arrangement between two business entities: Biz 1, a business growth consulting company, and Biz 2, a business funding consulting company. Biz 2 is a client of Biz 1, and part of Biz 1's service offering includes access to its payment processor infrastructure so that Biz 2 can offer structured payment plans to its own clients. The conversation focused on understanding the legal framework governing this arrangement, how to organize it contractually, how to handle client-facing transparency when the contract is with Biz 2 but payments flow to Biz 1, and how to protect Biz 1 from chargeback exposure.
> 
> Claude walked through the core legal risks including money transmitter licensing, payment processor terms of service compliance, tax and 1099 reporting obligations, chargeback liability, and consumer protection requirements. The recommended structure centers on a Master Services Agreement between Biz 1 and Biz 2 with a Payment Processing Addendum, positioning payment processing as a named bundled service within the consulting relationship rather than a standalone money movement operation. The agent-of-payee framework was identified as the critical legal mechanism, with specific contract language recommended to satisfy both the money transmitter exemption and customer disclosure requirements.
> 
> For client-facing alignment, Claude outlined a triple-disclosure approach — in the signed client agreement, at the checkout page before payment submission, and in the confirmation receipt — all naming Biz 1 as the authorized payment processor on behalf of Biz 2 and specifying the billing descriptor the client will see on their statement. For chargeback protection, Claude detailed a two-front strategy: prevention through signed payment authorization forms, dynamic billing descriptors, and pre-charge reminders; and financial liability shifting through contractual mechanisms including a chargeback indemnification clause, a rolling reserve holdback of 5–10% held for 90–180 days, a right-to-deduct provision, a chargeback threshold trigger giving Biz 1 the right to pause or terminate processing, an independent refund right, and a 48-hour evidence obligation requiring Biz 2 to supply fulfillment documentation upon any dispute. The rolling reserve was identified as the non-negotiable centerpiece of the protection stack. Claude offered to draft the MSA, Payment Processing Addendum, chargeback protection clauses, and Payment Authorization Form at multiple points in the conversation.


---

## 👤 You

How to legally remain safe compliant and good as a biz entity 1 collecting payments on behalf of biz entity 2

Essentially biz 1 has relationships with payment processors 

Biz 2 does the fulfillment and selling but does not have its own payment processor to collect payments from clients

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is asking about the legal/compliance framework for one business entity collecting payments on behalf of another. This is a payment facilitation / third-party payment processing arrangement. Let me give him a clear, structured answer.
> 
> Key areas: payment facilitator models, merchant of record, agency agreements, money transmitter laws, state licensing, contractual protections.
> 
> Let me be direct and structured.


Hey Alan — this is a real and important compliance question. Here's the framework.

---

**What This Arrangement Is Called**

Biz 1 collecting payments on behalf of Biz 2 is functionally a **payment facilitation** or **merchant of record** arrangement. How you structure it determines your legal exposure.

---

**Two Clean Models**

**Model A — Agency / Pass-Through Agreement**
Biz 1 acts as Biz 2's **authorized agent** for payment collection only. Funds are collected on behalf of Biz 2, then remitted.

**Model B — Merchant of Record (MoR)**
Biz 1 is the seller of record, takes the payment, then pays Biz 2 a fulfillment fee or revenue share. Biz 1 owns the customer transaction.

Model B is simpler from a processor standpoint but shifts more liability to Biz 1. Model A keeps liability closer to Biz 2 but requires tighter documentation.

---

**Core Compliance Risks**

**1. Money Transmitter Licensing**
If Biz 1 is receiving funds and passing them to Biz 2, most states consider this **money transmission** unless a valid exemption applies. The main exemption: **agent of the payee**. To qualify, you need a written agreement where Biz 2 appoints Biz 1 as its agent for payment collection, and the obligation to the customer is extinguished at the moment Biz 1 receives the payment — not when Biz 2 gets it.

This is the single biggest legal trap. Without this exemption properly documented, Biz 1 could be operating as an unlicensed money transmitter — which is a federal crime under 18 U.S.C. § 1960 and a state-level violation in virtually every state.

**2. Payment Processor Terms of Service**
Most processors (Stripe, Square, PayPal, etc.) prohibit collecting payments for a different entity unless you're registered as a **payment facilitator (PayFac)** or the processor explicitly allows it. Doing this without disclosure = grounds for account termination, fund holds, or clawbacks.

**3. Tax & 1099 Reporting**
If Biz 1 collects and remits to Biz 2, the processor will issue a 1099-K to Biz 1. Biz 1 then needs to issue a 1099-NEC or 1099-MISC to Biz 2 for the amounts passed through — otherwise Biz 1 looks like it earned all the revenue, and the IRS will come asking.

**4. Chargeback & Refund Liability**
The entity on the processor account is liable for chargebacks. If Biz 2 fulfills poorly, Biz 1 eats the chargebacks. This must be addressed contractually.

**5. Consumer Protection / FTC**
The customer needs to know who they're actually buying from. If Biz 1's name shows on the charge but Biz 2 delivers, that disconnect creates UDAP / deceptive practices exposure if anything goes wrong.

---

**What You Need in Place**

- **Written Agency or MoR Agreement** between Biz 1 and Biz 2 — specifying roles, payment flow, fee structure, chargeback responsibility, indemnification, and termination rights
- **Agent-of-Payee language** explicitly stating the customer's payment obligation is satisfied upon Biz 1's receipt (critical for money transmitter exemption)
- **Processor disclosure** — notify the payment processor of the arrangement; some require sub-merchant registration
- **Clear customer-facing disclosures** — billing descriptor, terms of sale, and refund policy should make the arrangement transparent
- **1099 reporting structure** between Biz 1 and Biz 2
- **Indemnification clause** — Biz 2 indemnifies Biz 1 for chargebacks, refund claims, and fulfillment failures
- **Insurance** — Biz 1 should carry general liability and possibly E&O depending on volume

---

**Bottom Line**

The cleanest path: **written agent-of-payee agreement + processor disclosure + proper 1099 chain + customer transparency.** Without that documentation, Biz 1 is exposed on money transmission, tax misreporting, processor violations, and chargeback liability simultaneously.

Want me to draft the agency agreement between Biz 1 and Biz 2?

---

## 👤 You

Well how to organize this effectively 

Biz 1 is a business growth consulting biz

Biz 2 is a business funding consulting biz 

Biz 2 would be doing business with biz 1

Biz 2 needs help with organizing payment plans through payment processors for its clients and needs biz 1s services to use their payment plan processor for biz 1

---

## 🤖 Claude

> [!note]- Claude's thinking
> Let me understand the arrangement:
> 
> - Biz 1 = Business growth consulting (has payment processor relationships, can set up payment plans)
> - Biz 2 = Business funding consulting (APW - Alan's business)
> - Biz 2's clients need


---

## 👤 You

Well how to organize this effectively 

Biz 1 is a business growth consulting biz

Biz 2 is a business funding consulting biz 

Biz 2 would be doing business with biz 1

Biz 2 needs help with organizing payment plans through payment processors for its clients and needs biz 1s services to use their payment plan processor for biz 2

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is describing a specific arrangement:
> 
> - Biz 1 = business growth consulting company (has payment processor relationships, likely ScaleClients.io or similar)
> - Biz 2 = APW (Ascend Prime Wealth) - business funding consulting
> - Biz 2 is a CLIENT of Biz 1
> - Biz 2 needs payment plan infrastructure for its own clients
> - Biz 1 offers use of their payment processor as part of their service to Biz 2
> 
> This reframes things. Biz 1 isn't just randomly collecting payments — Biz 1 is a service provider to Biz 2, and part of that service includes payment processing infrastructure.
> 
> 
> So this is likely ScaleClients.io as the growth partner managing ads and payment collection, with APW as their client needing that payment infrastructure for their own business. Let me map out the cleanest structure for how these pieces fit together.


Got it — this changes the picture meaningfully. Here's the clean version.

---

**The Real Relationship**

Biz 2 (funding consulting) is a **client** of Biz 1 (growth consulting). Biz 1 provides business growth services to Biz 2, and **one of those services** is access to Biz 1's payment plan processor so Biz 2's clients can pay on structured terms.

This is not a random pass-through. It's a **service relationship with embedded payment infrastructure.** That's a much cleaner frame.

---

**Cleanest Structure: Sub-Merchant or Managed Account Model**

Biz 1 acts as the **merchant of record** on the processor, and Biz 2's client payments flow through Biz 1's processor account. Biz 1 then remits Biz 2's share minus fees.

**Why this works:** Biz 1 is already providing consulting services to Biz 2. The payment processing is a **bundled service deliverable** — not an independent money movement operation. This keeps it within the scope of a normal B2B service agreement rather than triggering money transmitter concerns, as long as it's structured correctly.

---

**How to Organize It**

**Layer 1 — Master Services Agreement (MSA) between Biz 1 and Biz 2**

This is the backbone. It should cover:

- Biz 1's full scope of services (growth consulting, ad management, payment processing facilitation, etc.)
- Payment processing as a **named service** within the agreement
- Fee structure — what Biz 1 charges for the service (flat fee, percentage, or bundled into overall consulting fee)
- Revenue remittance terms — how and when Biz 2 receives its portion of collected client payments
- Chargeback allocation — Biz 2 bears responsibility for chargebacks caused by its clients or fulfillment failures
- Indemnification — Biz 2 indemnifies Biz 1 for claims arising from Biz 2's services, products, or client disputes
- Termination and wind-down provisions

**Layer 2 — Payment Processing Addendum**

A specific schedule or addendum to the MSA that covers:

- Biz 1 is the merchant of record on the processor
- Biz 2 authorizes Biz 1 to collect payments from Biz 2's clients on Biz 2's behalf
- Agent-of-payee language — customer's payment obligation to Biz 2 is satisfied upon Biz 1's receipt
- Payment plan terms, installment structures, and failed payment handling
- Billing descriptor disclosure — what the client sees on their statement
- Refund policy ownership (Biz 2 controls refund decisions, Biz 1 executes)
- Reserve or holdback rights if chargeback rates spike

**Layer 3 — Customer-Facing Disclosures (Biz 2's Clients)**

Biz 2's enrollment agreements, terms, and checkout flow must clearly state:

- Payments are processed by Biz 1 (or Biz 1's trade name) on behalf of Biz 2
- The billing descriptor that will appear on statements
- Payment plan terms, late payment consequences
- Who to contact for billing questions vs. service questions
- Refund/cancellation policy

This prevents chargebacks rooted in "I don't recognize this charge" — the #1 source of disputes in this model.

**Layer 4 — Tax & Accounting**

- Processor issues 1099-K to Biz 1 for all volume
- Biz 1 issues 1099-NEC to Biz 2 for remitted amounts
- Both entities track gross collections, fees retained, and net remittances
- Biz 1 only reports its fee income as revenue, not the pass-through

**Layer 5 — Processor Compliance**

- Biz 1 must check its processor agreement to confirm sub-merchant or third-party collection is permitted
- If not explicitly allowed, Biz 1 needs to disclose the arrangement and get written approval
- Some processors (Stripe, Square) have formal **platform/marketplace** structures for exactly this — worth checking if Biz 1's processor offers it

---

**Visual Summary**

| Layer | What | Who Owns It |
|---|---|---|
| MSA | Full service relationship | Biz 1 ↔ Biz 2 |
| Payment Addendum | Processing terms, remittance, chargebacks | Biz 1 ↔ Biz 2 |
| Client Disclosures | Billing transparency, refund policy | Biz 2 → its clients |
| Tax Chain | 1099-K → Biz 1, 1099-NEC → Biz 2 | Both entities |
| Processor Approval | Confirm TOS compliance | Biz 1 → processor |

---

**The Key Protective Principle**

Everything flows from one fact: **Biz 2 is a client of Biz 1, and payment processing is a contracted service within that relationship.** As long as that's documented, disclosed to the processor, and transparent to the end customer — you're clean.

Want me to draft the MSA and Payment Processing Addendum?

---

## 👤 You

How to have this aligned in contracts when they see the contract is with biz 2 but the payment goes to biz 1

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants to know how to handle the customer-facing contract alignment — specifically, the client signs a contract with Biz 2 (the funding consulting company) but the payment goes to Biz 1 (the growth consulting company). He needs to know how to make this seamless and legally clean so it doesn't confuse clients or create chargeback/dispute exposure.


This is the exact friction point that causes chargebacks and client confusion. Here's how to handle it cleanly.

---

**The Problem**

Client signs an agreement with Biz 2. Client's credit card gets charged by Biz 1. Client doesn't recognize the charge → disputes it → chargeback → processor flags Biz 1's account.

Or worse: client feels misled → FTC/UDAP exposure for both entities.

---

**The Fix: Three-Point Alignment**

**1. Disclosed in the Contract Itself**

Biz 2's client agreement must include a **Payment Processing Disclosure** section. Not buried in fine print — visible, clear, and signed/acknowledged. Language like:

> *"Client acknowledges that [Biz 2 Name] utilizes [Biz 1 Name / Trade Name] as its authorized payment processing partner. All payments under this Agreement will be collected by [Biz 1 Name] on behalf of [Biz 2 Name]. Charges will appear on Client's statement as [BILLING DESCRIPTOR]. Client's payment obligation to [Biz 2 Name] is satisfied upon receipt of payment by [Biz 1 Name]."*

That last sentence is the **agent-of-payee clause** — it's doing double duty as both customer disclosure and money transmitter exemption language.

**2. Disclosed at Checkout / Payment Collection**

Wherever the client enters payment info — whether it's a GHL order form, Stripe checkout, invoice, or manual card entry — the page or form must clearly state:

> *"Payment processed by [Biz 1 Name] on behalf of [Biz 2 Name]. Your statement will show a charge from [BILLING DESCRIPTOR]."*

This needs to appear **before** they hit submit. Not in a confirmation email after. Before.

**3. Disclosed in Confirmation / Receipt**

The payment confirmation email should reinforce:

- What they purchased (Biz 2's program/service)
- Who processed the payment (Biz 1)
- What the charge looks like on their statement
- Who to contact for billing questions vs. service questions

---

**Contract Architecture**

Here's how the actual documents should be layered from the client's perspective:

| Document | What It Says | Key Language |
|---|---|---|
| **Biz 2's Client Agreement** | Service terms, deliverables, refund policy, payment schedule | Includes Payment Processing Disclosure naming Biz 1 |
| **Payment Authorization Form** | Authorizes recurring/installment charges | Clearly states Biz 1 is the collecting entity and shows billing descriptor |
| **Checkout Page** | Where card info is entered | Pre-submit disclosure: "Processed by [Biz 1] on behalf of [Biz 2]" |
| **Confirmation Email** | Receipt + next steps | Reinforces billing descriptor, contact info for billing vs. fulfillment |

---

**Why This Works Legally**

The client's **contractual relationship** is with Biz 2. That doesn't change. Biz 1 is simply the **authorized collection agent.** As long as the client is told three things before they pay:

1. **Who is charging them** (Biz 1)
2. **On whose behalf** (Biz 2)
3. **What it looks like on their statement** (billing descriptor)

…there's no deception, no confusion, and no gap for a chargeback to exploit. If a client disputes anyway, you have signed acknowledgment they were told — which is a strong representment defense.

---

**One More Layer: The Billing Descriptor**

This matters more than people realize. If Biz 1's descriptor says something like "BIZ1CONSULTING" but the client only knows Biz 2's name, that mismatch alone triggers disputes.

**Best practice:** If the processor allows it, set a **dynamic or soft descriptor** that includes Biz 2's name. For example:

> `BIZ1* BIZ2 FUNDING`

Not all processors support this, but Stripe and most modern platforms do. Worth configuring.

---

**Summary**

The contract is with Biz 2. The payment goes to Biz 1. That's fine — as long as the client **knows, acknowledges, and signs** before money moves. Triple-disclose: in the contract, at checkout, and in the receipt. Match the billing descriptor to what they expect.

Want me to draft the Payment Processing Disclosure clause and Payment Authorization Form?

---

## 👤 You

How to also protect biz 1 from chargebacks

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants to know how to protect Biz 1 from chargebacks when Biz 1 is collecting payments on behalf of Biz 2. Let me give him a comprehensive but concise framework.


**Two Realities to Accept First**

Biz 1 is the merchant of record. The processor doesn't care about the MSA between Biz 1 and Biz 2 — if a chargeback hits, Biz 1's account takes the hit. So protection has to work on **two fronts**: preventing chargebacks from happening, and shifting the financial loss to Biz 2 when they do.

---

**Front 1 — Prevent Chargebacks**

**Pre-Transaction**

- Triple disclosure (covered in our last exchange) — contract, checkout, receipt all naming Biz 1 as processor with billing descriptor shown
- **Signed Payment Authorization Form** with explicit language: client authorizes recurring/installment charges by Biz 1, acknowledges billing descriptor, acknowledges refund policy
- Collect this **before** running the first charge — digital signature with timestamp and IP capture

**During the Payment Plan**

- Send payment reminders 3–5 days before each installment hits
- Include the billing descriptor in the reminder so they recognize the charge
- Provide a clear, easy path to contact someone about billing questions — if they can reach a human fast, they won't call their bank instead
- If a payment fails, notify immediately and offer resolution before it escalates

**Billing Descriptor**

- Dynamic descriptor including Biz 2's name (e.g., `BIZ1* BIZ2FUNDING`)
- This alone eliminates a significant percentage of "I don't recognize this charge" disputes

---

**Front 2 — Shift Financial Liability to Biz 2**

This is the contractual armor. All of this goes in the MSA and Payment Processing Addendum between Biz 1 and Biz 2.

**Chargeback Indemnification Clause**

Biz 2 fully indemnifies Biz 1 for any chargebacks, refund demands, or payment disputes arising from Biz 2's clients — including the chargeback amount, processor fees, penalty fees, and Biz 1's costs to respond.

**Rolling Reserve / Holdback**

Biz 1 retains a percentage of each payment (typically 5–10%) in a **reserve account** for 90–180 days before releasing to Biz 2. This creates a funded buffer. If chargebacks hit, Biz 1 deducts from the reserve first.

This is the single most important mechanical protection. Without it, Biz 1 has to chase Biz 2 for reimbursement after the fact — which may never come.

**Chargeback Threshold Trigger**

If Biz 2's chargeback rate exceeds a defined threshold (e.g., 0.75% of transactions or 1% of volume), Biz 1 has the right to:

- Increase the reserve percentage
- Pause payment collection for Biz 2
- Terminate the payment processing service entirely

This protects Biz 1's processor account from getting flagged or shut down. Visa and Mastercard monitor chargeback ratios at the merchant level — if Biz 2's clients blow up the ratio, Biz 1 loses its processor relationship entirely. Non-negotiable protection.

**Right to Deduct**

Biz 1 has the contractual right to deduct chargebacks, fees, and penalties directly from any funds owed to Biz 2 — before remittance. No waiting for reimbursement. Automatic offset.

**Refund Control**

Define in the addendum who authorizes refunds. Best structure: Biz 2 makes the refund decision, but Biz 1 has an **independent right to issue a refund** if Biz 1 reasonably determines that not refunding would result in a chargeback or processor penalty. This gives Biz 1 a release valve.

---

**Front 3 — Win Chargebacks When They Happen**

Even with prevention, some will come. Biz 1 needs a **representment package** ready to go.

**What wins chargeback disputes:**

- Signed client agreement showing the service terms
- Signed payment authorization with billing descriptor acknowledgment
- IP address and timestamp of digital signature
- Checkout page screenshot showing pre-submit disclosure
- Payment reminder emails proving the client knew charges were coming
- Delivery/fulfillment evidence from Biz 2 (login records, email correspondence, session attendance, etc.)

**Critical requirement in the MSA:** Biz 2 is contractually obligated to provide fulfillment evidence to Biz 1 within 48 hours of a chargeback notification. If Biz 2 fails to provide evidence, the chargeback loss is automatically Biz 2's responsibility and deducted from the reserve.

---

**Full Protection Stack — Summary**

| Protection | Type | Where It Lives |
|---|---|---|
| Triple disclosure | Prevention | Client agreement, checkout, receipt |
| Signed payment auth with descriptor | Prevention + Representment | Client-facing form |
| Dynamic billing descriptor | Prevention | Processor configuration |
| Payment reminders before each charge | Prevention | Automated emails/SMS |
| Chargeback indemnification | Liability shift | MSA / Payment Addendum |
| Rolling reserve (5–10%, 90–180 days) | Financial buffer | MSA / Payment Addendum |
| Right to deduct from funds owed | Financial buffer | MSA / Payment Addendum |
| Chargeback threshold trigger | Account protection | MSA / Payment Addendum |
| Independent refund right | Account protection | MSA / Payment Addendum |
| 48-hour evidence obligation | Representment | MSA / Payment Addendum |
| Representment package on file | Recovery | Internal process |

---

**The Non-Negotiable**

The rolling reserve is the one thing that makes everything else enforceable. Without it, every other clause is just a breach-of-contract claim Biz 1 has to litigate to collect. With it, Biz 1 already holds the money and deducts automatically. That's real protection.

Want me to draft the full chargeback protection clauses for the MSA?

---
