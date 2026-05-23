---
title: Amex siding with merchant on return refusal
source: claude
type: conversation
person: alan
created: "2026-04-13T18:58:03.172587Z"
updated: "2026-04-13T19:02:14.593083Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 4
uuid: a5f5e6cd-a9a0-49ea-8cb9-9abd7d1d8e54
tags:
  - claude
  - alan
  - amex
  - chargeback
  - dispute
  - legal
  - reg-z
  - scam
  - tech
---

# Amex siding with merchant on return refusal

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person is engaged in a dispute involving an Amazon purchase (a USB hub) for which they sought a refund but were blocked from using Amazon's return system, with Amazon communicating this restriction both verbally and in writing. After filing a chargeback with American Express (Amex), Amex sided with Amazon despite the person submitting written proof of Amazon's refusal to allow them to use the return system. The person questioned whether this situation constitutes abusive merchant behavior and why Amex would rule against them given the evidence provided.
> 
> Claude explained the structural gap in how chargeback processes work, noting that Amex's dispute analysts pattern-match against standard criteria (delivery confirmation, listing match, policy existence, no completed return) without evaluating whether the merchant's own conduct made the return impossible. Claude identified Amazon's defense as circular and potentially bad-faith, invoking the legal doctrine of prevention of performance — a party cannot demand proof of an action they themselves prevented. Claude also flagged that Amazon's rebuttal mischaracterized the dispute as a delivery/fraud issue rather than a refusal-to-accept-return issue.
> 
> With the person confirming they had submitted written proof of the lockout and Amex still ruled against Amazon, Claude escalated the analysis to frame this as a potential Regulation Z / Fair Credit Billing Act issue under 12 CFR §1026.13, separate from and stronger than the chargeback process. Claude outlined the statutory obligations this places on Amex, the investigation standard required, and potential remedies including statutory damages and a private right of action. Claude noted a timing consideration regarding the 60-day billing error notice window and requested five specific pieces of information before drafting formal correspondence: the exact language of Amazon's written restriction notice, when and how the proof was submitted to Amex, the content of Amex's written decision, the timeline of the first statement showing the charge and when the dispute was first filed, and whether the card is personal or business.


---

## 👤 You

> [!image] Image file: Notice of Dispute Information.pdf


Isn’t this abusive? Amex sided with them when they refused and would not allow me to use their return system anymore via phone and in writing 

Why is Amex siding with them

---

## 🤖 Claude

Quick clarification before I go deep: this is **Alan**, correct? (Asking per the dual-user protocol — Josephine handles different work.)

Assuming yes, here's the direct read:

## Short answer

**No, you're not crazy — but Amex isn't technically "wrong" under card network rules either.** What's happening is a structural gap in how chargebacks work, and Amazon is exploiting it. Here's what's actually going on:

## Why Amex sided with Amazon

Under Amex chargeback rules, for a "merchandise/services not as described" or "credit not processed" dispute, the merchant wins the recourse round if they can show:

1. **Proof the item shipped and was delivered** to an address on file ✅ (they showed tracking to Bloomington)
2. **Proof the listing matches what was ordered** ✅ (they attached the product page)
3. **Their published return policy** ✅ (30-day Amazon return window)
4. **No completed return** ✅ (Return Requested: false)

Amex's dispute analyst sees those four boxes checked and closes in the merchant's favor — **without ever evaluating whether Amazon unlawfully blocked you from using the return system in the first place.** That's the gap. The chargeback process is not designed to adjudicate "the merchant refused to let me return it." It's designed to verify shipment, delivery, and policy existence.

So Amazon's rebuttal is technically responsive to the chargeback codes — but it **completely sidesteps your actual claim**, which is that they constructively denied you the refund by locking you out of the return mechanism.

## Is it abusive? Yes — here's the specific abuse

Amazon's rebuttal contains a **logical sleight of hand**:

> "The customer must provide signed and trackable proof of return of merchandise to receive the credit."

This is circular and bad-faith **if** they refused to accept the return or revoked your access to the return system. You cannot produce "signed trackable proof of return" when the merchant has blocked the return channel. They are demanding evidence of an action they themselves prevented.

That's not a legitimate defense — that's **prevention of performance**, a recognized doctrine in contract law. A party cannot demand performance of a condition they made impossible.

The "31 prior orders to this address" line is also misdirection — address authorization was never the issue. You're not claiming fraud or "I didn't get it." You're claiming "they won't let me return it." Those are completely different disputes, and Amazon's rebuttal pretends you made the first one.

## Why this keeps happening structurally

Amex's merchant dispute team is processing volume. They pattern-match: *delivered + listing matches + return policy exists → merchant wins*. They are **not** lawyers. They are not evaluating UDAAP, prevention of performance, or whether the merchant's own conduct made the return impossible. That's not their job under network rules.

This is a known weakness in the chargeback system for large merchants who control their own return infrastructure (Amazon, Apple, etc.). When the merchant **is** the return mechanism, and they cut you off from it, the chargeback process structurally fails you.

## What I need from you to go further

Before I draft the rebuttal/escalation, I need to confirm specifics — I don't want to assume:

1. **The lockout** — When Amazon told you (phone + writing) that you can no longer use their return system, what exact reason did they give? Account-level ban? Specific to this order? "Excessive returns"? Do you have the written confirmation (email, chat transcript, account notice)?
2. **Timing** — Did the lockout happen *before* you tried to return this USB hub, or *because* you tried to return it?
3. **The product issue itself** — Why did you want to return the hub? Defective, not as described, didn't work, changed mind? This matters for which legal theory is strongest.
4. **Dispute stage** — Is this Amex decision final, or can you still submit a second rebuttal / "final dispute" / arbitration request? What did Amex's letter to you actually say about next steps?
5. **Card type** — Personal Amex or business Amex? (Affects which protections apply — Reg Z billing-error rights are stronger on personal consumer cards.)

Once I have those, I can build you the actual counter-strategy — which will almost certainly involve a **Reg Z §1026.13 billing-error escalation** (separate from the chargeback, with stronger legal teeth), a **written rebuttal to Amex reframing the dispute around prevention of performance and constructive refusal**, and depending on answers, a **CFPB complaint against Amex** for failing to properly investigate, plus optional state AG / Amazon corporate escalation.

Which of those five questions can you answer right now?

---

## 👤 You

But I’ve provided proof of their expression in writing that I’m not able to use their refund system

---

## 🤖 Claude

That changes the analysis significantly. Let me be direct:

## If you submitted written proof of the lockout and Amex still sided with Amazon, one of three things happened

**1. Amex's analyst never actually read your evidence.**
This is the most common failure. Large-merchant disputes get pattern-matched in minutes. Your written proof of Amazon's refusal sat in the file unread while the analyst checked the standard boxes (delivered ✅, listing matches ✅, policy exists ✅) and closed the case. This is a **procedurally defective investigation**, and it's actionable.

**2. The analyst read it but misclassified the dispute.**
If your chargeback was filed under "merchandise not received" or "not as described," the analyst evaluates it under those criteria — and your lockout evidence looks irrelevant to *those* codes. The dispute may have been filed under the wrong reason code from the start. The correct framing is **"credit not processed"** combined with **constructive refusal of refund** — a different evidentiary standard.

**3. Amex applied the wrong standard.**
Amex is not supposed to require you to prove a return that the merchant prevented. If they did, that's a **Reg Z violation** — not just bad service.

## This is no longer just a chargeback problem — it's now an Amex problem

Once you provided written proof of Amazon's refusal and Amex still ruled against you, **Amex itself** became a party to the harm. They had the evidence, they had the obligation to investigate, and they failed. That opens a separate legal track that's actually stronger than the chargeback.

## The strongest move now: Reg Z §1026.13 Billing Error Notice — directly to Amex

This is **not** a chargeback. It's a federal statutory right under the **Fair Credit Billing Act / Regulation Z**, and it has teeth the chargeback process doesn't:

- Amex has **30 days to acknowledge** your notice and **two billing cycles (max 90 days)** to resolve it
- During the investigation, Amex **cannot** report the disputed amount as delinquent or charge interest on it
- Amex must **conduct a reasonable investigation** — not just rubber-stamp the merchant's rebuttal
- If Amex fails to follow the procedure, they **forfeit the right to collect up to $50** of the disputed amount **regardless of who's right on the merits**, and you have a private right of action for actual damages, statutory damages up to $5,000, attorney's fees, and costs (15 U.S.C. §1640)
- The standard for Amex is **higher** than the chargeback standard — they must actually evaluate your evidence, not just count merchant documents

The key legal hook: under **12 CFR §1026.13(a)(3)**, a billing error includes *"A reflection on or with a periodic statement of an extension of credit for property or services not accepted by the consumer or not delivered to the consumer as agreed."* **"Not accepted"** and **"not delivered as agreed"** both apply when the merchant refuses to honor their own return policy — you constructively rejected the merchandise, and they prevented the rejection from being completed.

**Important caveat I want to flag honestly:** The strongest, cleanest application of §1026.13 is when the dispute is filed within **60 days of the first periodic statement** showing the charge. The Feb 2, 2026 transaction means your 60-day window likely closed around early-to-mid April 2026. If you're outside that window, Amex can decline the billing error notice on timeliness grounds — but **(a)** there are arguments for tolling when the merchant's conduct delayed your ability to discover the refusal, and **(b)** even outside the window, the framing still works as a CFPB complaint and a demand letter. I want to verify your exact dates before promising this path is clean.

## What I need to confirm before drafting

Five quick things — please answer what you can:

1. **The written proof from Amazon** — what exactly does it say? (Paste the wording or describe it.) "Your account is restricted from returns," "you've exceeded our return policy," "we will no longer accept returns from you," etc. The specific language matters enormously.
2. **When you sent that proof to Amex** — date submitted, and how (online portal, mail, fax, phone upload)?
3. **Amex's written decision to you** — what did their final letter say? Did it acknowledge your lockout evidence at all, or did it just recite Amazon's rebuttal points?
4. **The 60-day clock** — when was the first Amex statement that showed the $87.21 charge, and when did you first dispute it with Amex?
5. **Personal or business Amex card** — Reg Z applies fully to personal/consumer cards; business card protections are weaker and depend on your cardmember agreement.

Once I have those, I can draft you a Reg Z §1026.13 Billing Error Notice to Amex that reframes the dispute correctly, cites the regulation, attaches your proof, and puts Amex on notice that further inaction creates statutory liability for *them*. That letter alone often flips these cases — because now Amex's own legal exposure is on the table, not just Amazon's.

Which of those five can you answer right now?

---
