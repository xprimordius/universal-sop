---
title: 285K processor pricing clarification
source: claude
type: conversation
person: alan
created: "2026-04-09T01:00:54.454483Z"
updated: "2026-04-09T01:01:05.905245Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 2
uuid: a5b96d13-b615-4759-b102-34bbd13c77f5
tags:
  - claude
  - alan
  - tech
---

# 285K processor pricing clarification

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person asked a brief question about PC component pricing, specifically why the Intel Core Ultra 9 285K appeared cheaper in a Dell configuration tool. Claude explained that the 285K is actually the most expensive and currently selected baseline option at the listed price, and that the other processors shown reflect price changes relative to that baseline — most being discounts for downgrading. Claude also addressed an apparent pricing anomaly where the non-K 285 variant showed a cost increase over the K version, attributing this to a Dell promotional discount being applied to the 285K but not the locked non-K variant. Claude recommended keeping the 285K selected, noting it is both the faster chip (with higher base clock speed and an unlocked multiplier) and the one benefiting from the active promotion.


---

## 👤 You

> [!image] Image file: IMG_1366.png


Why is the 285k cheaper

---

## 🤖 Claude

Hi Alan.

The 285K isn't actually cheaper — it's the **most expensive** option and is your current baseline ($3,599.99). The minus signs on the others are **discounts you'd get by downgrading** from the 285K:

| Processor | Price Change vs. 285K |
|---|---|
| Ultra 7 265 (non-K) | −$200 (cheapest) |
| Ultra 7 265K | −$100 |
| Ultra 9 285 (non-K) | +$100 *(odd — see below)* |
| **Ultra 9 285K** ✅ | baseline (selected) |

The quirk: the non-K 285 shows **+$100**, meaning it'd cost *more* than the K version you have selected. That's almost certainly a Dell pricing/promo artifact — there's likely an active discount on the 285K ("Save on Intel Core Ultra 9 285K" is shown right in the box) that isn't being applied to the locked non-K variant. Promo stacking, not a spec difference.

Spec-wise the K is still the better chip (3.7→5.7 GHz vs 1.9→5.6 GHz base/boost, unlocked multiplier). So you're getting the faster part *and* the promo. Keep the 285K selected.

---
