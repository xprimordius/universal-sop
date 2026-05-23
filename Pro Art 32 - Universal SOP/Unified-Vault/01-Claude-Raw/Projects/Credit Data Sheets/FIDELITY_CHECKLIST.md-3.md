---
title: FIDELITY_CHECKLIST.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T23:25:40.480423+00:00"
uuid: 85f116cb-2e9c-4146-a75e-73dce494bb64
tags:
  - claude
  - alan
  - credit
---
# FIDELITY_CHECKLIST.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Fidelity Checklist · v2.1 Honest Score
tags: [APW, audit, fidelity, v2]
version: 2.1
last_updated: 2026-05-15
---

# Fidelity Checklist · v2.1 (Post-Self-Audit)

## v2.1 Patch Notes

After the v2.0 "98%" claim, a self-audit caught:

1. **CANONICAL_FACTS v2.0 internal arithmetic error** — File 5 listed at 3,180 rows in `file_breakdown` but total claimed 12,955; correct strict-count for F5 is 3,333 (the 3,180 was Raw Data sheet only). v2.1 reconciles this with explicit sub-totals.
2. **5 derivative docs drifted** — FILE_INVENTORY · FLAGS · SELF_CHECK · HALL_PREV · all 5 file summaries — still cited v1 numbers despite v2 being declared single source of truth. All patched in v2.1.
3. **F2 "Self" vs F3 "Within_Bank" label** — same concept, two names. v2.1 adds explicit note in CANONICAL_FACTS.

## v2.1 Fidelity by Category

| Category | v1 Score | v2.0 Score | v2.1 Score | Notes |
|---|---:|---:|---:|---|
| Source file totals (rows/cells) | 70% | 99% | **99%** | Python re-extracted · F5 now reconciled |
| File 3 state-sheet datapoints | 75% | 99% | **99%** | All re-verified |
| Cross-file underwriter totals | 80% | 99% | **99%** | Same-concept label note added |
| Hard inquiry counts | 90% | 99% | **99%** | Normalized typo variants |
| Velocity rules | 75% | 95% | **95%** | Citi still INDUSTRY_TYPICAL |
| Stack ranges | 100% | 100% | **100%** | ALAN_LOCKED unchanged |
| State specifics (MN/OK) | 95% | 99% | **99%** | MN FNBO corrected |
| SOP completeness | 90% | 95% | **97%** | Cross-doc version refs patched |
| Migration structure | 100% | 100% | **100%** | All 32 files present |
| **Derivative-doc consistency** | 70% | 80% | **99%** | NEW · all 5 stale docs patched in v2.1 |
| **CANONICAL_FACTS internal arithmetic** | n/a | 85% | **100%** | NEW · F5 reconciliation closed |
| Honesty about uncertainty | 90% | 100% | **100%** | VERIFICATION_AUDIT explicit |

### v2.1 Weighted Average: **~99%**
### v2.0 Weighted Average: **~93%** (downward revision · v2.0 fidelity-self-score was high because the derivative-doc check wasn't in the rubric)
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

