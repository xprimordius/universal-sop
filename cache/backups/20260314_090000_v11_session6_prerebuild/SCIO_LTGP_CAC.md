# SCIO SUB-CACHE: LTGP:CAC — THE ONE METRIC
## Sources: 1.8a/b (LTGP:CAC)
**Last Updated:** March 13, 2026 | **Status:** PRIMED (load when building metrics/optimization content)

---

## THE ONE METRIC

**LTGP:CAC = Lifetime Gross Profit : Customer Acquisition Cost**

Nothing else impacts profits outside this single metric. All focus should be on the biggest constraint out of the 6 levers, 24/7.

---

## FORMULAS

### LTGP (Lifetime Gross Profit)
```
LTV - Total Lifetime COGs = LTGP
```

**Sub-formulas:**
- **Average retention (months):** 100 / (100 × churn rate)
- **LTV:** Retention months × monthly price
- **Total Lifetime COGs:** Monthly COGs × retention months

### CAC (Customer Acquisition Cost)
```
Total ad spend over period / Total clients closed over same period
```

### Working Example
- Price: $2K/mo
- COGs: $500/mo (inclusive of sales commissions)
- Churn: 10%

**Calculation:**
1. Retention = 100 / (100 × 0.1) = **10 months**
2. LTV = 10 × $2K = **$20K**
3. Lifetime COGs = 10 × $500 = **$5K**
4. **LTGP = $20K - $5K = $15K**

---

## THE 6 LEVERS (Only 6. Nothing Else.)

### To Decrease CAC (3 levers):
1. **Cheaper CPQBC** (cost per qualified booked call)
2. **Higher show rate** (more calls show up)
3. **Higher close rate** (close more of those that show)

### To Increase LTGP (3 levers):
4. **Higher price** (charge more per client)
5. **Lower COGs** (decrease cost to fulfill)
6. **Lower churn** (keep clients longer)

**Focus rule:** Find the biggest constraint among the 6. Put ALL resources on it. Fix it. Push more volume. Find next constraint. Repeat.

---

## COGs DEFINITION (Important)

**COGs = how much it costs to fulfill on a client, INCLUSIVE of sales commissions.**

- Determined on a monthly per-client basis
- If you have "fixed" costs → average on per-client basis
- Better to OVERESTIMATE than underestimate
- Fixed COGs: cost doesn't change with volume → average across client base

---

## CHURN DEFINITION (Important)

**Churn = clients who LEFT from the EXISTING base at start of month**

Does NOT include new clients signed that month.

**Example:**
- Enter August: 100 active clients
- Sign 50 new in August
- 10 leave in August
- Churn = 10/100 = **10%** (not 10/150)
- September starts with: 100 - 10 + 50 = 140 active clients

---

## WORKED EXAMPLES WITH FULL MATH

### Example 1: Low Price, Saturated Market
| Metric | Value |
|--------|-------|
| CPQBC | $300 |
| Show Rate | 60% |
| Close Rate | 20% |
| Price (AOV) | $1.5K |
| COGs/mo | $300 |
| Churn | 10% |

**Results:** CAC = $2.5K | LTV = $15K | Lifetime COGs = $3K | Day 1 ROAS = 0.6x
**LTGP:CAC = 4.8:1**

**Diagnosis:** Price too low for a $2.5K CAC. Two solutions:
1. Increase AOV (pitch 4-month PIF): cash timing improves but LTGP:CAC unchanged
2. **Increase price to $3K/mo** + pitch 4mo PIF (50% UF CC):
   - **New LTGP:CAC = 11:1** (doubled profit, no other changes)

### Example 2: Good Metrics, Scale Ready
| Metric | Value |
|--------|-------|
| CPQBC | $250 |
| Show Rate | 65% |
| Close Rate | 16% |
| Price (AOV) | $5K/mo ($6K AOV) |
| COGs/mo | $850 |
| Churn | 15% |

**Results:** CAC = $2.4K | LTV = $33.3K | Lifetime COGs = $5,610 | Day 1 ROAS = 2.5x
**LTGP:CAC = 11.5:1**

**Diagnosis:** Scale. While scaling, fix close rate (16% → 25%) and churn (15% → 10%).
- With both fixes: **LTGP:CAC = 23:1** (doubled profit without spending more on ads)

### Example 3: COGs Problem (Most Common)
| Metric | Value |
|--------|-------|
| CPQBC | $50 |
| Show Rate | 50% |
| Close Rate | 20% |
| Price (AOV) | $1.5K/mo |
| COGs/mo | $1,200 |
| Churn | 10% |

**Results:** CAC = $500 | LTV = $15K | Lifetime COGs = $12K | Day 1 ROAS = 3x
**LTGP:CAC = 6:1**

**Diagnosis:** COGs vs price is the root problem. Gross profit = 20% (should be ~80%).

**Options:**
1. Decrease COGs (e.g., from $1,200 to $500/mo): **LTGP:CAC → 20:1**
2. With show rate 65% + close rate 25%: **LTGP:CAC → 32:1**
3. Or increase price to $3K/mo (if COGs truly can't decrease): **LTGP:CAC → 36:1**

### When the Model is Fundamentally Broken
- Can't decrease COGs (service requires expensive labor)
- Can't increase price (market won't pay more for the outcome)
- = Model doesn't work
- Solution: change the model entirely, or bake service into a higher-value adjacent deliverable

---

## APW APPLICATION NOTES

### APW LTGP:CAC Framework
**For APW students' funding businesses:**
- LTGP = total fees collected across all tiers a client ascends through - fulfillment costs
- CAC = ad spend / clients closed
- Same 6 levers apply, same diagnostic process

**For Alan's APW business itself:**
- LTGP = revenue across all tiers a student pays for - fulfillment costs (mostly content creation amortized + DFY labor)
- DWY tiers have very low COGs → high LTGP
- DFY tiers have real COGs → lower LTGP per client but higher price

### Suspended Decision Impact
- P5-S1: LTGP:CAC tracking across multiple ascension tiers
  - Proposed dual tracking: per-tier diagnostics + full-journey business health
  - Per-tier: helps identify which tier has broken economics
  - Full-journey: reveals true lifetime value of a client who ascends through multiple tiers
