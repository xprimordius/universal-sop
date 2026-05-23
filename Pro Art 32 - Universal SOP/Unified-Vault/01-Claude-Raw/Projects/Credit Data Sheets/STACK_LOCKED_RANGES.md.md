---
title: STACK_LOCKED_RANGES.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:32.839699+00:00"
uuid: ff0e572d-7d81-4fed-bf35-abd91dd408eb
tags:
  - claude
  - alan
  - credit
---
# STACK_LOCKED_RANGES.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Stack · Locked Ranges
tags: [APW, stack, ranges, alan_locked, critical]
verification: ALAN_LOCKED
priority: CRITICAL
---

# 0% APR Stack · Locked Ranges

> Authoritative ranges as locked by Alan. These supersede any earlier AI estimates.

---

## Named-Bank Stack

| Bank | Range Per Card | Quantity | Subtotal | Velocity / Timeline |
|---|---|:---:|---|---|
| Chase | $25K – $62K | 2 | $50K – $124K | 10-60+ days |
| Elan | $3K – $12K – $30K | 4 | $12K – $120K | 3-6mo between apps · up to 4 cards |
| Amex | $10K – $12K – $50K+ | 2 | $20K – $100K+ | 10-60+ days · max 2/90 |
| Bank of America | $5K – $10K – $20K | 4 | $20K – $80K | 30-90 days · 4 cards on 1 hard pull possible |
| US Bank | $3K – $30K | 2 | $6K – $60K | 0-30+ days |
| TCM (CC + Charge) | $35K + $35K | 1 stack | $35K – $70K | 0-5 days · sometimes 0% sometimes interest |

### Named-Bank Subtotal
- **Low:** $143,000
- **Mid:** ~$301,000
- **High:** $554,000

---

## Local Regional Banks + Credit Unions

- **Range per viable institution:** $10K – $50K
- **Rate:** Sometimes 0%, sometimes interest
- **Quantity:** **USER-DEFINED** (not pre-locked)

### Scenarios

| Institutions | Low Add | High Add |
|---:|---:|---:|
| 3 | $30K | $150K |
| 5 | $50K | $250K |
| 8 | $80K | $400K |
| 10 | $100K | $500K |

---

## Cumulative Range Matrix

| Configuration | Low | High |
|---|---:|---:|
| Named banks only | $143K | $554K |
| + 3 regionals | $173K | $704K |
| + 5 regionals | $193K | $804K |
| + 8 regionals | $223K | $954K |
| + 10 regionals | $243K | $1,054K |

---

## What's Verified vs Unverified

### ✅ ALAN_LOCKED
- All named-bank ranges
- Quantities per named bank
- Velocity rules per issuer
- Timeline windows

### ⚠️ UNVERIFIED / OPEN
- "Viable institution" count for regionals (user defines)
- 0% vs interest split for TCM and regionals
- State-specific eligibility per regional bank (must cross-check FLAGS.md + STATE_INDEX.json)
- AAoA / utilization baseline (user-specific)

---

## Reference Order for Stack Planning

1. **Velocity check** → `VELOCITY_RULES.md`
2. **Geo + flag check** → `FLAGS.md`
3. **State bank availability** → `STATE_INDEX.json`
4. **Underwriter clustering** → `UNDERWRITER_MAP.json`
5. **Locked ranges** → this file
6. **Execution** → `EXECUTION_CHECKLIST.md`

---

## Update Protocol

When ranges change (new approval data, market shift):

1. Update `CANONICAL_FACTS.json` first
2. Update this file second
3. Bump version
4. Re-upload to Claude Project

**Do NOT** let AI estimate or override these ranges without explicit Alan approval.
