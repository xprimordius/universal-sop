---
title: FILE_3_summary.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T23:25:40.598969+00:00"
uuid: f98aa346-06cc-472e-a768-578b8296a11d
tags:
  - claude
  - alan
  - credit
---
# FILE_3_summary.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: File 3 · CC_Data_3 Summary
file: CC_Data_3.xlsx
tags: [APW, file_summary, state_playbook, critical]
verification: VERIFIED_BYTE
version: 2.1
priority: HIGHEST_OPS_VALUE
---

# File 3 · CC_Data_3.xlsx · State-by-State Playbook ⭐

**Role:** The execution doc. 50 states × ~45 banks/state with full underwriting schema.

## At a Glance
- 58 sheets total · 50 state tabs + 8 reference tabs
- 2,448 total rows · 2,231 in state sheets · 217 in reference sheets · avg 44.6 banks/state

## Schema (per state tab)
`Bank Name · Business Credit Card? · Which Bureau Pull From? · Underwriter? · Geo-Locked? · Statements Required? · Apply Online?`

## Special Sheets
- **BLOCKED BANKS** (113 entries · was 112 in v1) · do-not-apply list
- **Banks with Multiple Locations** (24 entries · was 25 in v1) · check before assuming national reach
- **Underwriters** (6 indexed) · Elan · TCM · Zion Bankcorp · Card Assets · FNBO · Commerce
- **AMEX, Chase Bank** · standalone reference sheets
- **List of Banks and Institutions, Funding Requirements** · meta-reference

## State Density Highlights
| Rank | State | Banks |
|---|---|---:|
| 1 | New York | 63 |
| 2-3 | Georgia · Utah | 57 |
| 4 | Montana | 53 |
| 5-8 | CA · FL · MD · OK | 51 |
| 50 | Alaska | 7 |

**Minnesota: 48 banks**
**Oklahoma: 51 banks**

## Strategic Value
1. **Only file with full per-state schema** — bureau, UW, geo, doc, apply method
2. **Blocked list** is the risk filter — saves hard pulls on impossible apps
3. **Underwriter clustering visible per state** — critical for sequencing
4. **Statements Required column** — identifies 820 no-doc banks (96% of logged)

## Key Distributions (state sheets only · v2 byte-verified)
| Metric | v2 Count | v1 Claimed |
|---|---:|---:|
| Has Business Credit Card | 1,507 | 1,574 |
| No BCC | 113 | 118 |
| No Doc | 820 | 820 |
| Full Doc | 24 | 24 |
| Geo-Locked | 169 | 179 |
| Not Geo-Locked | 640 | 673 |
| Online Apply | 1,085 | 1,155 |
| In-Branch Only | 138 | 143 |

## Use Case
- Planning state-specific stack → start here
- Identifying same-UW clusters per state → use UNDERWRITER_MAP.json
- Cross-checking blocked banks → ALWAYS before applying
- Determining if bank requires statements → this file's "Statements Required" column

## Quality Notes
- Some bank names have typos (Pennslyvania spelling, double-spaces)
- Some cells are empty for unfilled banks ("CALL BANK" placeholders)
- State sheet naming uses full state name not codes
