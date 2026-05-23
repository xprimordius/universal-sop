---
title: FILE_1_summary.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T23:25:40.681902+00:00"
uuid: b9b321e5-91af-49c6-9169-ac7054139dd8
tags:
  - claude
  - alan
  - credit
---
# FILE_1_summary.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: File 1 · CC_Data_1 Summary
file: CC_Data_1.xlsx
tags: [APW, file_summary, master_directory]
verification: VERIFIED_BYTE
version: 2.1
---

# File 1 · CC_Data_1.xlsx · Master Directory

**Role:** Broadest bank list. Only file with credit unions and pre-approval tools.

## At a Glance
- 8 sheets · 1,223 data rows · 93% fill rate

## Sheet Breakdown
| Sheet | Rows | What's there |
|---|---:|---|
| Business Cards | 868 | Largest BCC list · 4 fields only (bank · link · bureau · geo) |
| Credit Unions | 151 | Only CU dataset · 7 fields (CU · qualify · join · pull type · APY · bureau · max limit) |
| Pre-Approval Database | 62 | Soft-pull pre-qual tools · categorized by type |
| Business Line of Credit | 47 | BLOC list · unstructured requirements |
| Business Cards Part 2 | 35 | Supplementary cards · state-tagged |
| Business Loans | 32 | Loan products · unstructured requirements |
| Additional Datapoints | 24 | ⭐ ONLY fully-structured sheet (FICO · bureau · age · docs · pull mapping) |
| Research Links | 4 | Reference tools |

## Strategic Value
1. **Only file with credit unions** (151) — critical for stack diversity
2. **Only file with pre-approval tools** (62) — protects bureau before hard pulls
3. **AD sheet schema is the gold standard** — should be the target schema for cleaning other sheets
4. **Has unique BLOC list** (47) — not duplicated elsewhere

## Known Gaps
- 868 business cards have only 4 fields — no FICO/age/doc data
- BC Part 2, BLOC, Loans use unstructured "Requirements" blobs

## Use Case
- Looking up credit unions by state → this file
- Finding pre-approval tools to soft-pull check → this file
- BLOC research → this file
- General bank lookup → use File 3 instead (deeper schema)
