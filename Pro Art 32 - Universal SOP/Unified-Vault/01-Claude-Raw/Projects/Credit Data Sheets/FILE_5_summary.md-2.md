---
title: FILE_5_summary.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T23:25:40.516876+00:00"
uuid: d04872c6-e08b-4997-aab0-84426b3b4ea2
tags:
  - claude
  - alan
  - credit
---
# FILE_5_summary.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: File 5 · CC_Data_5 Summary
file: CC_Data_5_-_Inquiry_Database_v2.xlsx
tags: [APW, file_summary, live_apps, fico]
verification: VERIFIED_BYTE
version: 2.1
---

# File 5 · CC_Data_5.xlsx · Inquiry DB v2 · Live App Data

**Role:** Only file with timestamped application data + FICO scores. Approval evidence.

## At a Glance
- **3,333 total rows across all 53 sheets** (strict full-file count)
  - Raw Data sheet: 3,180 application records (the meaningful "apps" figure)
  - Validation sheet: 52
  - States sheet: 51
  - 50 state placeholder sheets: 1 row each (50 total)
- 23 unique banks · 54 state codes (incl DC + dupes)
- ⚠️ "Raw Data " sheet name has a **trailing space** (programmatic gotcha)

## Schema (Raw Data)
`Bank Name · State · Bureau · Date Applied · Status · Credit Score`

## Key Metrics
| Metric | Value |
|---|---:|
| Total apps | 3,180 |
| Approved | 3,110 |
| Denied | 70 |
| Approval rate | 97.8% |
| Unique banks | 23 |
| States represented | 54 codes (incl DC + dupes) |

## Strategic Value
1. **Only file with FICO scores** — see what credit score got approved at which bank
2. **Timestamped apps** — pattern analysis over time
3. **97.8% approval rate** = self-selected dataset (people who got approved logged it)

## Important Caveats
- **Self-selection bias** — the 97.8% approval rate is NOT generalizable
- People who got denied are less likely to have logged the application
- Treat as "what's possible" not "what's typical"
- Only 23 unique banks — narrow sample

## Structure Issue
- 50 of 53 sheets are state-tab placeholders with 1 row of content each (header-only or stub)
- Only "Raw Data " (with trailing space) and "Validation" have meaningful content
- The "States" sheet has 51 rows of state-list reference data
- The file appears to be v2 build in progress — never completed per-state
- FICO data quality: min/max include errors (74 and 6000 are not valid scores)

## Use Case
- "What FICO got approved at Chase last year?" → query this file
- "When did people apply to BofA?" → date data lives here
- Pattern analysis: bureau pull vs approval correlation
- Validating velocity rule timing (gap between successful apps)

## Recommended Cleanup
1. Drop the 51 empty state placeholder sheets
2. Consolidate Raw Data + Validation into one normalized sheet
3. Add denial-context column (when known)
4. Cross-link Bank Name to standardized names in other files
