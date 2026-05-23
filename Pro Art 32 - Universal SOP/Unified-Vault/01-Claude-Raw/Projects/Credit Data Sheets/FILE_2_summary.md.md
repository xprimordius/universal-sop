---
title: FILE_2_summary.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:28.301436+00:00"
uuid: 972e6fc8-4bdb-4b16-bbd6-9f847f51ac04
tags:
  - claude
  - alan
  - credit
---
# FILE_2_summary.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: File 2 · CC_Data_2 Summary
file: CC_Data_2.xlsx
tags: [APW, file_summary, zero_apr_cards]
verification: VERIFIED
---

# File 2 · CC_Data_2.xlsx · 0% APR Cards

**Role:** Cleanest 0% intro APR dataset with stacking flag.

## At a Glance
- 508 records · 498 unique banks · 50 states · 1 sheet

## Schema
`Data · Bank Name · CC Link · CC Eligible States · Location · Bureau Pulled · Double Dip · Underwriter`

## Key Numbers
| Metric | Count |
|---|---:|
| Total entries | 508 |
| Unique banks | 498 |
| Double-dippable banks | 35 |
| States covered | 50 |

## Underwriter Distribution
- Elan Financial: 274
- TCM Bank: 133
- Within Bank (Self): 49
- Card Assets: 6
- FNBO: 5
- Other: 41

## Bureau Distribution
- Experian: 123
- All 3 + D&B/SBFE: 120
- D&B/SBFE + TU: 66
- All 3: 47
- TransUnion: 29
- Equifax: 19

## Strategic Value
1. **The Double-Dip column is gold** — 35 banks confirmed to approve 2 cards on 1 hard pull
2. **State eligibility per card** — instant filter for "what can MN/OK apply to"
3. **Underwriter labels are clean** — easier to identify clustering than File 3

## How to Use
- Filter Double Dip = "Yes" → 35-bank list for same-day stacking
- Filter CC Eligible States = "MN" or "OK" → state-specific 0% offers
- Cross-reference Underwriter against velocity rules in VELOCITY_RULES.md

## Use Case Priority
**Use this file when:**
- Planning a same-day double-dip blitz
- Want to know 0% intro APR specifically (not all BCCs)
- Need clean bureau + UW labels

**Use File 3 instead when:**
- Need full state-by-state playbook with doc/geo info
- Looking for in-state regional banks
