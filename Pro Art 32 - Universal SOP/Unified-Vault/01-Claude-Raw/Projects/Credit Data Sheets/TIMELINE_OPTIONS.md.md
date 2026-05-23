---
title: TIMELINE_OPTIONS.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:32.834104+00:00"
uuid: af79a753-461f-4247-9dee-aca888efa4bc
tags:
  - claude
  - alan
  - credit
---
# TIMELINE_OPTIONS.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Timeline Options · Start Now vs Wait & Batch
tags: [APW, stack, timing, strategy]
verification: VERIFIED (locked ranges) + INDUSTRY_TYPICAL (reporting timeline)
---

# Timeline Options · The Core Trade-off

> Three strategic paths for deploying the stack. Choose based on goal: speed vs total $.

---

## Option A · START NOW (Rolling Apply)

### Goal: First $ in hand fastest

### Timeline
| Phase | Days | Actions |
|---|---|---|
| Week 0-1 | 0-7 | Chase #1, Amex #1, US Bank #1, BofA (4 on 1 pull) |
| Week 2-4 | 8-28 | Elan #1, TCM CC + Charge same-day |
| Month 2 | 30-60 | Chase #2, US Bank #2 |
| Month 3 | 60-90 | Amex #2 (clears 2/90), Elan #2 |
| Month 4-5 | 90-150 | Elan #3, regional wave 1 |
| Month 6-9 | 150-270 | Elan #4, regional wave 2 |

### Pros
- ✅ First approved cards in 5-7 business days
- ✅ Cash flow during deployment
- ✅ Can adjust strategy based on early results

### Cons
- ❌ Each card reports → next apps see new debt
- ❌ Denial cascade risk increases after Month 2
- ❌ Total approval $ usually LOWER

### Expected Total
- **$193K – $804K** (with 5 regionals)

---

## Option B · WAIT + BATCH (Same-Day Blitz)

### Goal: Maximum total approval $

### Timeline
| Phase | Duration | Actions |
|---|---|---|
| Prep Phase | Weeks 1-6 | AU tradelines · biz checking opens · pre-qual every card · pay down util |
| **D-DAY** | 1 day | ALL same-day-eligible apps fire: Chase x2, Amex x2, US Bank x2, BofA (4 on 1 pull), Elan x2 same-day double-dip, TCM CC + Charge, regionals batch (5-8) |
| D+1 to D+7 | 1 week | Recon calls on denials, account setup |
| Month 2-6 | 5 months | Elan #3 + #4 (3-6mo spacing required), Synchrony wave, CLI requests |

### Pros
- ✅ Cards approved BEFORE bureau reports cascade
- ✅ Highest total approval $
- ✅ Cleanest credit profile = best limits

### Cons
- ❌ First $ delayed ~45-60 days
- ❌ Requires discipline (no early apps during prep)
- ❌ Heavier prep work upfront

### Expected Total
- **$243K – $954K** (with 8 regionals)

---

## Option C · HYBRID (RECOMMENDED)

### Goal: Captures ~80% of Option B's funding with Option A's speed

### Timeline
| Phase | Duration | Actions |
|---|---|---|
| Prep | Weeks 1-4 | AU tradelines + biz checking + pre-qual checks |
| **D-DAY** | Week 5 (1 day) | All same-day plays: Chase x2 same-day, Amex x2 same-day, BofA (4 on 1 pull), US Bank x2, Elan x2 same-day double-dip, TCM CC + Charge, 3-5 regionals batched |
| Month 2-6 | 5 months | Elan #3 then #4 (spaced), remaining regionals, CLI requests, Synchrony wave |

### Pros
- ✅ First $ ~30-45 days (faster than B)
- ✅ Captures most of high-end total
- ✅ Manages denial cascade
- ✅ Most realistic for execution

### Cons
- ❌ Still requires 30-day prep discipline
- ❌ Not the fastest first $ option

### Expected Total
- **$223K – $954K** (with 8 regionals)

---

## Bureau Reporting Timeline · The Hidden Layer

| Bank | Reports In | Implication |
|---|---|---|
| Amex | Immediate-2 days | App #2 within hours of #1 only |
| Elan | 15-30 days | Double-dip window |
| Chase | ~30 days | 2-card same-day window |
| BofA | 30-45 days | Long chain window |
| TCM | 30-45 days | Most forgiving |

---

## Decision Matrix

| Question | Best Option |
|---|---|
| "I need cash THIS week" | A · Rolling |
| "I want maximum $ approved" | B · Batch |
| "I want both speed AND size" | C · Hybrid |
| "I have time to prep properly" | B or C |
| "I'm not 5/24 compliant yet" | Wait (delay all options) |

---

## Velocity Rule Reminders

Cannot be batched same-day:
- Elan x4 (3-6mo spacing)
- Amex x2 (technically 2/90 hard cap)

Can be batched same-day:
- BofA x4 (1 pull, 4 cards)
- TCM CC + Charge
- Multiple Elan same-day (then nothing for 90+ days)
- Chase x2 same-day (high risk · sometimes works)

See `VELOCITY_RULES.md` for full rule set.

---

## Note on Honesty

The expected totals above are PROJECTIONS based on Alan's locked ranges. Actual approvals depend on:
- 5/24 status
- AAoA (Average Age of Accounts)
- Income / DTI
- Recent inquiries
- Bureau scores
- Banking relationship history

No one can guarantee these numbers. The protocol is to optimize for the highest-probability outcome.
