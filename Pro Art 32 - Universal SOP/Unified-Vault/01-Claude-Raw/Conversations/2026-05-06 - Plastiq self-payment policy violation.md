---
title: Plastiq self-payment policy violation
source: claude
type: conversation
person: alan
created: "2026-05-06T12:47:10.973316Z"
updated: "2026-05-06T12:48:25.934806Z"
year: 2026
month: 2026-05
quarter: 2026-Q2
messages: 4
uuid: aa15269e-cadf-4d75-a3aa-7bb22ddcb526
tags:
  - claude
  - alan
  - payments
---

# Plastiq self-payment policy violation


---

## 👤 You

> [!image] Image file: IMG_2214.png


Why exactly

---

## 🤖 Claude

> [!note]- Claude's thinking
> Looking at the screenshot, I can see this is Alan's refund since Skyward USA Inc is his company and the Visa card ending in 1775 matches his account. The email shows a $3,014.20 refund from Plastiq, but I don't have visibility into why it was issued—I'd need to check the transaction details or ask Alan directly what prompted the refund.
> 
> That said, the most likely explanation is that Plastiq flagged this as a self-payment violation. Since Skyward USA is Alan's own entity and he was paying it from his personal Visa card, Plastiq's system probably caught this as an attempt to pay himself, which violates their terms of service. They explicitly prohibit using their platform to send money to businesses you own or control, so the refund would be automatic in that case.


**Most likely cause: self-payment policy violation.**

Skyward USA, Inc. is your own entity. Plastiq's terms prohibit paying a business you own or control — they classify it as manufactured spend / cash access circumvention and reverse the charge when their risk team flags it.

Other possibilities (less likely given your setup):
- KYC/verification failure on recipient bank account
- Card issuer (Visa 1775) declined the funding side
- Recipient didn't claim/accept within window
- Generic risk-engine flag (new payee + high amount)

**Confirm the exact reason — pick one:**
- **A** — Email plastiq-service@plastiq.com asking for the specific refund reason code (fastest, paper trail)
- **B** — Live chat on Plastiq during business hours, ask for the risk note on the transaction
- **C** — I draft a 3-line inquiry email for you to send

---

## 👤 You

But I didn’t put the name of anyone from skyward

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan's arguing that sending it to the company name without a specific person shouldn't trigger a self-payment flag, but Plastiq's detection goes deeper than just recipient names — they're cross-referencing the business entity itself against their database, plus checking tax IDs and bank account ownership to catch these transfers.
> 
> Since the receiving account is owned by Skyward, which Alan controls, the system would flag it regardless of whether he named an individual. That said, it could also be an unrelated risk signal, a billing address match to the recipient's business address, or even the card issuer declining it.


Plastiq doesn't match on contact name — they match on **entity + bank account ownership**.

Even with no person named:
- Skyward USA, Inc. is registered to you (state filings public)
- The recipient bank account is owned by Skyward → owned by you
- Card billing address may match Skyward's registered address
- IP/device fingerprint links sender + recipient

Their risk engine triggers on any of those, contact name is irrelevant.

**That said — could also be:**
- Visa 1775 issuer declined the cash-like funding (some banks block Plastiq)
- Recipient ACH info mismatch (account/routing rejected)
- Random risk flag unrelated to ownership

**Only way to know for sure — pick one:**
- **A** — I draft you a 2-line email to plastiq-service@plastiq.com asking for the exact refund reason code
- **B** — You hit live chat now, ask "what triggered the refund on transaction [ID]"
- **C** — Wait and see if Visa 1775 shows a decline code in your card portal first

---
