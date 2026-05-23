---
title: VELOCITY_RULES.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:03.115410+00:00"
uuid: c6473315-6b66-4b04-b0d4-4262a622cebe
tags:
  - claude
  - alan
  - credit
---
# VELOCITY_RULES.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Velocity Rules · v2 · Web-Verified May 2026
tags: [APW, velocity, rules, critical, v2]
verification: WEB_VERIFIED in May 2026
priority: CRITICAL
version: 2.0
v1_correction: BofA rule was wrong in v1 ("2/30/60/90 days") · corrected here
---

# Velocity Rules v2 · Web-Verified May 2026

> Rules that trigger auto-denial when violated. Each rule re-checked against current 2026 public sources.

---

## ⚡ 1 · Chase 5/24 (VERIFIED ACTIVE 2026)

**The rule:** No more than 5 personal credit cards opened in the past 24 months across ALL issuers.

**Business cards that do NOT count toward 5/24:**
- Chase business cards
- Amex business cards
- Citi business cards
- BofA business cards
- US Bank business cards
- Wells Fargo business cards
- PNC business cards

**Business cards that DO count toward 5/24:**
- Capital One business cards (except Venture X Business and Spark Cash Plus)
- Discover business cards
- TD Bank business cards

**Authorized user accounts:** Count toward 5/24, BUT Chase reconsideration line will sometimes exclude AU accounts upon request.

**Status:** Active and strictly enforced as of 2026. Source: Upgraded Points, The Points Guy, NerdWallet, Bankrate, Pointalize (all May 2026).

---

## ⚡ 2 · Amex 2/90 + 1/5 (VERIFIED ACTIVE 2026)

**The 2/90 rule:** Max 2 Amex credit cards approved per rolling 90-day window.

**The 1/5 rule (new in v2):** Only 1 Amex card approved per 5 days. Must wait 6+ days between applications even if you're inside the 90-day window.

**Charge card exclusion:** Charge cards (Green, Gold, Platinum) HISTORICALLY did not count toward 2/90. 2026 reports indicate this is tightening for some applicants. Treat with caution.

**Hold limits:**
- Max 5 Amex credit cards open at one time
- Max 10 Amex charge cards open at one time (No Preset Spending Limit cards)
- Combined limits apply

**Practical implication:** To get 2 Amex cards, apply on Day 1 and Day 7+. Then no more Amex for 84+ days. Source: Bankrate, WalletHub, AskSebby, Pointalize 2026.

---

## ⚡ 3 · Bank of America 2/3/4 (CORRECTED v2)

⚠️ **v1 ERROR FIXED:** v1 said "2/30/60/90 days." The correct rule is in MONTHS.

**The 2/3/4 rule:**
- Max 2 BofA cards per 2 months
- Max 3 BofA cards per 12 months
- Max 4 BofA cards per 24 months

**Plus the 3/12 or 7/12 rule (depending on checking relationship):**
- Without BofA checking account: 3/12 rule (max 3 new personal cards from any issuer in 12 months)
- With BofA checking account: 7/12 rule (max 7 new personal cards from any issuer in 12 months)

**Business cards generally don't count** in the 3/12 or 7/12 calculation.

**Strategic implication:** BofA checking account = double the velocity allowance. Open checking 30-60 days BEFORE applying for cards. Source: Travel On Points, multiple 2026 sources.

---

## ⚡ 4 · Citi 8/65/95 (INDUSTRY_TYPICAL · not re-verified in v2)

**Rule:** 1 Citi card per 8 days · 2 per 65 days · 8 per 95 days

**Note:** This was in v1. Not specifically re-verified via web in v2 audit. Treat as INDUSTRY_TYPICAL until re-checked.

---

## ⚡ 5 · Elan 3-6 Months (ALAN_LOCKED)

**Rule:** 3-6 months spacing between Elan-underwritten applications to avoid same-UW denials.

**Exception:** Same-day double-dip works (2 Elan banks applied to within minutes of each other, before either reports). Then 90+ day wait minimum before next Elan app.

**Max recommended:** 4 Elan cards per credit cycle.

**Verification status:** ALAN_LOCKED · not from public sources. Treat as authoritative for this stack.

---

## ⚡ 6 · TCM Same-UW 60+ days (ALAN_LOCKED)

**Rule:** 60+ days between TCM-underwritten applications.

**Special advantage:** Same-day TCM CC + Charge Card stack at same bank works (1 pull, 2 products, $70K combined limit potential).

**Verification status:** ALAN_LOCKED · not from public sources.

---

## 📊 Velocity Matrix at a Glance

| Issuer | Time Limit | Card Cap | Notes |
|---|---|---|---|
| Chase | 24 months (5/24) | 5 cards | Business cards from most issuers don't count |
| Amex | 90 days | 2 cards | Plus 1/5 rule · 5 credit cards held max |
| BofA | 2/12/24 months | 2/3/4 cards | Checking account = 7/12 allowance vs 3/12 |
| Citi | 8/65/95 days | 8 per 95 days | Most generous spacing · slowest churn |
| Elan | 3-6 months | 4 cards | Same-day double-dip exception |
| TCM | 60+ days | n/a per app | CC+Charge same-day allowed |

---

## 🚨 What Changed From v1

| Rule | v1 Said | v2 Verified |
|---|---|---|
| Chase 5/24 | ✅ Correct | ✅ Correct + added business card details |
| Amex 2/90 | ✅ Correct | ✅ Correct + added 1/5 + hold limits |
| BofA | ❌ "2/30/60/90 days" | ✅ "2/3/4 months" + 3/12 or 7/12 |
| Citi | ✅ Plausible | ⚠️ Not re-verified · INDUSTRY_TYPICAL |
| Elan | ✅ Alan-confirmed | ✅ Unchanged · ALAN_LOCKED |
| TCM | ✅ Alan-confirmed | ✅ Unchanged · ALAN_LOCKED |

---

## What Violates These Rules

❌ Applying for 3rd Amex card on day 91 (still inside 90 from app #1)
❌ Applying for 3rd BofA card in same 2-month window
❌ Capital One business card opened recently → counts toward 5/24
❌ Two Elan-underwritten banks applied 30 days apart (mid-zone = stacked denials)
❌ TCM Minnwest + TCM HomeTown applied 14 days apart

## What These Rules Allow

✅ Two Chase business cards same-day (don't report to personal)
✅ Two Amex cards 7-89 days apart (within 2/90, respects 1/5)
✅ Multiple BofA cards on one pull (request 3-4 same app)
✅ TCM CC + Charge same-day at same bank
✅ Two Elan banks same-day double-dip → wait 90+ days

---

## Source Citations (2026)

| Rule | Primary Sources Verified |
|---|---|
| Chase 5/24 | Upgraded Points, The Points Guy, NerdWallet, Bankrate, Pointalize, FinanceBuzz, PointsNav |
| Amex 2/90 | Bankrate, WalletHub, AskSebby, Pointalize, The Points Analyst, Money Atlas |
| BofA 2/3/4 + 3/12/7/12 | Travel On Points (verified 2026) |
| Citi 8/65/95 | NOT re-verified · INDUSTRY_TYPICAL |
| Elan / TCM spacing | ALAN_LOCKED · public sources don't confirm specifics |

All sources accessed May 15, 2026. Rules can change. Re-verify quarterly.
