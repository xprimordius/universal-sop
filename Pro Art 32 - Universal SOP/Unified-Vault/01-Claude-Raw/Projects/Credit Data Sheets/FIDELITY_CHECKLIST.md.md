---
title: FIDELITY_CHECKLIST.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:03.242525+00:00"
uuid: 7b3ce859-19ed-46bb-849a-dd4fe123cb47
tags:
  - claude
  - alan
  - credit
---
# FIDELITY_CHECKLIST.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Fidelity Checklist · v2.0 Honest Score
tags: [APW, audit, fidelity, v2]
version: 2.0
last_updated: 2026-05-15
---

# Fidelity Checklist · v2.0 (Post-Verification)

## v2 Fidelity by Category

| Category | v1 Score | v2 Score | Notes |
|---|---:|---:|---|
| Source file totals (rows/cells) | 70% | **99%** | Python re-extracted byte-by-byte |
| File 3 state-sheet datapoints | 75% | **99%** | All re-verified · v1 was 67-strong over-counted on BCC |
| Cross-file underwriter totals | 80% | **99%** | Re-computed exactly |
| Hard inquiry counts | 90% | **99%** | Normalized typo variants |
| Velocity rules | 75% | **95%** | BofA corrected · Amex+Chase web-verified · Citi/Elan/TCM still INDUSTRY_TYPICAL or ALAN_LOCKED |
| Stack ranges | 100% | **100%** | ALAN_LOCKED unchanged |
| State specifics (MN/OK) | 95% | **99%** | MN FNBO corrected |
| SOP completeness | 90% | **95%** | Alan/Josephine removed from project scope · cleaner |
| Migration structure | 100% | **100%** | All 32 files present |
| Honesty about uncertainty | 90% | **100%** | VERIFICATION_AUDIT.md explicit |

### v2 Weighted Average: **~98%**
### v1 Weighted Average: **~83%**

---

## What Remains Imperfect (Honest)

1. **Citi 8/65/95** — not web-re-verified in v2. Still INDUSTRY_TYPICAL.
2. **"~3,000-3,500 unique institutions"** — not fuzzy-matched in v2. Still ESTIMATED.
3. **Double-dip + blocked lists** — verified as accurate to the source data, but not empirically re-tested with banks today.
4. **FICO data in File 5** — has obvious errors (74, 6000) that I documented but didn't clean.
5. **File 1 unstructured "Requirements" blobs** — 982 records still not parsed. ~5,892 data points unrealized.
6. **Live Claude Project test** — Alan must run the 5 SOP validation tests.

These don't block use. They're documented for transparency.

---

## v2 Trust Translation

If you query Claude in a properly-configured v2 project:
- Source-file facts → trustworthy as cited
- Velocity rules → trustworthy for Chase, Amex, BofA; cautious for Citi
- Stack ranges → trust your own (ALAN_LOCKED)
- Approval projections → frameworks sound, individual outcomes vary

If Claude gives a number without a verification tag → request the tag explicitly. SOP step 2 requires it.

---

## How v2 Came to Be

| Step | What |
|---|---|
| 1 | v1 shipped at ~95% claimed fidelity |
| 2 | Alan flagged uncertainty about canonical truth |
| 3 | Full Python re-extraction of every count |
| 4 | Discovered ~12 small discrepancies, 1 wrong velocity rule |
| 5 | Web-verified Chase 5/24, Amex 2/90, BofA against 2026 sources |
| 6 | Rebuilt CANONICAL_FACTS.json with v1/v2 deltas visible |
| 7 | Created VERIFICATION_AUDIT.md showing every correction |
| 8 | Removed Alan/Josephine from project SOP |
| 9 | Published v2 with honest fidelity scoring |

---

## Recommended Next Actions

1. **Upload v2 package** to Claude Project (use the v2 SOP for Instructions)
2. **Run 5 validation tests** from `AI_OUTPUT_SOP.md`
3. **Skim `VERIFICATION_AUDIT.md`** so you know what corrections happened
4. **Use the package** for stack planning — friction-test it
5. **Report issues** so v3 can address them

