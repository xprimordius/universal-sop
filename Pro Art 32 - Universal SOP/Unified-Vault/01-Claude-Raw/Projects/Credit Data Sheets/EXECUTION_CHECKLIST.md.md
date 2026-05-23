---
title: EXECUTION_CHECKLIST.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:32.893387+00:00"
uuid: ec45a830-0c9e-4500-aaea-1e7a50bbfc43
tags:
  - claude
  - alan
  - credit
---
# EXECUTION_CHECKLIST.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Execution Checklist · Pre-Apply Through Post-Stack
tags: [APW, stack, execution, checklist]
verification: ALAN_LOCKED (ranges) + INDUSTRY_TYPICAL (process)
---

# Execution Checklist · From Prep to Deployment

> Step-by-step from "preparing" through "post-blitz CLI requests." Print or copy to project tracker.

---

## ☐ Phase 0 · Eligibility Verification (Week -2 to Week 0)

- [ ] Check 5/24 status (count personal cards opened in past 24 months across all issuers)
- [ ] Pull all 3 credit reports (annualcreditreport.com)
- [ ] Calculate AAoA (Average Age of Accounts) per bureau
- [ ] Calculate revolving utilization (target <10%)
- [ ] Identify any recent inquiries (last 6 months) on each bureau
- [ ] Confirm income figures + supporting documentation
- [ ] Verify EIN active, biz registered in target state
- [ ] Check if 2+ years of biz age (matters for SBFE-pulling banks)

## ☐ Phase 1 · Profile Optimization (Weeks 1-4 · Prep Phase)

### AU Tradeline Strategy
- [ ] Identify 2-3 seasoned AU tradelines (7+ year AAoA, low util, perfect payment)
- [ ] Add to credit profile 30-60 days before D-Day
- [ ] Confirm AUs report on all 3 bureaus

### Banking Relationships
- [ ] Open biz checking at Chase (30+ days before D-Day)
- [ ] Open biz checking at BofA (30+ days)
- [ ] Open biz checking at US Bank (30+ days)
- [ ] Open biz checking at Wells Fargo (MN only)

### Credit Pre-Qual (Soft Pull)
- [ ] Chase Pre-Qual: chase.com/personal/credit-cards/pre-qualified
- [ ] Amex Pre-Approval: americanexpress.com/credit-card-application
- [ ] Capital One Pre-Approval: capitalone.com/credit-cards/preapproval
- [ ] Discover Pre-Approval: discover.com/credit-cards/preapproved
- [ ] Skip any card NOT showing pre-qual (avoid wasted hard pulls)

### Bureau Strategy
- [ ] Freeze the 2 bureaus your TARGET bank doesn't pull (forces pull to strongest)
- [ ] Elan banks → freeze EX + EQ, leave TU open
- [ ] TCM banks → freeze TU + EQ, leave EX open
- [ ] Card Assets banks → freeze EX + TU, leave EQ open

---

## ☐ Phase 2 · D-Day Execution (Single Day)

### Pre-Submission (Morning of D-Day)
- [ ] Confirm utilization paid down to <10%
- [ ] Verify income figures match latest tax filings
- [ ] Have biz checking account numbers ready
- [ ] Have business documentation ready (EIN letter, biz registration)
- [ ] Set 4-hour focus block

### Same-Day Application Order (Critical Sequence)

**Wave A (Morning · 9am-11am):**
- [ ] Chase Ink Business #1 (online · within bank · EX/TU)
- [ ] Chase Ink Business #2 (different product · 30-60 min later)
- [ ] Amex #1 (national · EX) — pre-qual confirmed

**Wave B (Late Morning · 11am-1pm):**
- [ ] US Bank Business #1 (TU)
- [ ] US Bank Business #2 (different product)
- [ ] BofA Business application (request 4 cards on 1 hard pull)

**Wave C (Afternoon · 1pm-3pm):**
- [ ] Elan double-dip pair (e.g., Bremer + Frandsen same-day · TU only)
- [ ] TCM CC + Charge at same bank (e.g., Minnwest for MN · NBC OK for OK)

**Wave D (Late Afternoon · 3pm-5pm):**
- [ ] First-Citizens B&T double-dip ×2 (OK only · EX only)
- [ ] Blaze CU double-dip ×2 (MN only · EQ+TU)
- [ ] 3-5 regional batches

### Per-Application Discipline
- [ ] Same income on every app (do not vary)
- [ ] Same employment dates
- [ ] Combined personal + biz income (if allowed)
- [ ] Save confirmation pages / screenshots
- [ ] Note approval/pending/denial status

---

## ☐ Phase 3 · D+1 to D+7 (Recon Week)

- [ ] Pull mail / online portals · check decision letters
- [ ] For denials: call reconsideration line within 24-48 hours
  - Chase Recon: 1-888-270-2127 · ~40% overturn rate
  - Amex Recon: 1-866-314-0237
  - BofA Recon: 1-800-732-9194
  - US Bank Recon: 1-800-872-2657
- [ ] Recon script ready: re-state income, payment history, banking relationship
- [ ] Activate approved cards
- [ ] Set up auto-pay on all approved cards
- [ ] Document approved limits in tracker

---

## ☐ Phase 4 · Month 2-3 (Spacing-Locked Apps)

- [ ] Elan #3 (90+ days after Elan #2 same-day double-dip)
- [ ] Synchrony retail wave (Amazon · Lowe's · Home Depot)
- [ ] First CLI request on Chase cards (day 91)
- [ ] First CLI request on BofA cards (day 91)

---

## ☐ Phase 5 · Month 4-6 (Extension)

- [ ] Elan #4 final card
- [ ] Capital One Spark Cash Plus (if pre-qual)
- [ ] Citi Business Custom Cash (if 8/65/95 allows)
- [ ] Wells Fargo Reflect Biz (MN only · 18mo 0% intro)
- [ ] BLOC applications (3-5 from File 1 list)

---

## ☐ Phase 6 · Month 6-9 (Balance Transfer Wave)

- [ ] Open 3-4 0% BT cards
- [ ] Roll balances from earlier 0% intro cards near expiration
- [ ] Continue CLI requests at 90-day intervals on all cards
- [ ] Track utilization across all cards (target <30% per card, <10% aggregate)

---

## ☐ Ongoing · CLI + Monitoring

- [ ] Monthly review of all card statements
- [ ] Quarterly CLI requests on every card (cycle through)
- [ ] Track AU tradeline reporting consistency
- [ ] Pull credit reports quarterly (free via annualcreditreport.com)
- [ ] Update CANONICAL_FACTS.json with any new rules / data points

---

## Red Flags · Stop and Reassess

🛑 Two consecutive denials in same wave → pause, check for shared risk factor
🛑 New negative tradeline reporting → freeze further apps until resolved
🛑 Bureau scores dropped >30 points → utilization issue, paydown before more apps
🛑 Same-UW back-to-back denials → spacing violated, wait 90 days minimum
🛑 5/24 violation (forgot a recent personal card) → no Chase apps until clear

---

## What's Verified vs Industry-Typical

| Element | Verification |
|---|---|
| Locked ranges | ALAN_LOCKED |
| Velocity rules | INDUSTRY_TYPICAL + Alan-confirmed |
| Recon phone numbers | INDUSTRY_TYPICAL (verify current at time of execution) |
| Approval probability | NOT GUARANTEED — depends on user profile |
| Pre-qual links | INDUSTRY_TYPICAL (URLs may change) |

---

## Final Reminder

This is a PLAN. Real-world results vary. Don't:
- Skip pre-qual checks
- Apply when 5/24 violation pending
- Stack same-UW within spacing window
- Carry high utilization into D-Day

Do:
- Trust the sequence
- Recon every denial
- Document everything
- Adjust based on early results
