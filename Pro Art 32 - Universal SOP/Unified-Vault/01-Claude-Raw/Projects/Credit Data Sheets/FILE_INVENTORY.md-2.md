---
title: FILE_INVENTORY.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T23:25:40.564635+00:00"
uuid: ae8c3821-5999-4b89-b761-f7e2f18e946f
tags:
  - claude
  - alan
  - credit
---
# FILE_INVENTORY.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: File Inventory · Master Index
tags: [APW, data, inventory, master]
verification: VERIFIED_BYTE
version: 2.1
last_updated: 2026-05-15
---

# File Inventory · 5-File Funding Database

> Master index of all source files. Numbers locked to CANONICAL_FACTS.json v2.1.

## Quick Reference Table

| # | File | Sheets | Active | Data Rows | Primary Value |
|---|---|---:|---:|---:|---|
| 1 | CC_Data_1.xlsx | 8 | 8 | 1,223 | Master directory · 868 cards + 151 CUs + 47 BLOC + 32 loans + 62 pre-approval tools |
| 2 | CC_Data_2.xlsx | 1 | 1 | 508 | 0% APR cards · 35 double-dippable · underwriter labels |
| 3 | CC_Data_3.xlsx | 58 | 58 | 2,448 | State-by-state playbook · 50 states · doc/bureau/UW/geo per bank (2,231 state + 217 reference) |
| 4 | CC_Data_4.xlsx | 1 | 1 | 5,443 | Hard inquiry database · 1,319 unique creditors · bureau hits |
| 5 | CC_Data_5.xlsx | 53 | 53 | 3,333 | Live application data · 3,180 in Raw Data sheet (the meaningful "apps" figure) + 153 in Validation/States/placeholders |
| | **TOTAL** | **121** | **121** | **12,955** | |

**Arithmetic check:** 1,223 + 508 + 2,448 + 5,443 + 3,333 = 12,955 ✓ (matches `total_data_rows_strict` in CANONICAL_FACTS.json v2.1)

---

## File 1 · CC_Data_1.xlsx (Master Directory)

**Sheets and contents:**

| Sheet | Rows | Schema |
|---|---:|---|
| Business Cards | 868 | Bank · Bank Links · Credit Bureau Pulled · Geolocation |
| Business Cards Part 2 | 35 | Banks · State · Requirements (unstructured) |
| Additional Datapoints | 24 | Lender · Product · States · FICO Req · Bureau · Biz Age · Docs · Notes |
| Business Line of Credit | 47 | Banks · State · Requirements |
| Business Loans | 32 | Banks · State · Requirements |
| Credit Unions | 151 | CU · Qualify · Join Link · Pull Type · APY · Bureau · Max Limit |
| Pre-Approval Database | 62 | Cards · Links · Type · Approval Status · Shows Limit |
| Research Links | 4 | Site · Link · Description |

**Reading note:** Additional Datapoints is the only sheet with fully structured underwriting fields. Other sheets use unstructured "Requirements" blobs that need parsing.

---

## File 2 · CC_Data_2.xlsx (0% APR Cards)

- **508 records · 498 unique banks · 50 states**
- Underwriters: Elan 274 · TCM 133 · Self 49 (= Within_Bank in F3 schema) · Pinnacle 8 · Card Assets 6 · FNBO 5
- **35 confirmed double-dippable banks** (column flag)
- Bureau distribution: EX 123 · All-3+SBFE 120 · D&B+TU 66 · All-3 47 · TU 29 · EQ 19

**Schema:** Data · Bank Name · CC Link · CC Eligible States · Location · Bureau Pulled · Double Dip · Underwriter

**Highest strategic value:** the Double-Dip column. See `FLAGS.md` for the full 35-bank list.

**Cross-file label note:** F2 calls within-bank underwriting "Self" (49 entries). F3 state sheets call the same concept "Within_Bank" (266 entries). Combined bucket = 315.

---

## File 3 · CC_Data_3.xlsx (State Playbook) ⭐ HIGHEST OPS VALUE

- **2,448 total rows · 2,231 in state sheets · 217 in reference sheets**
- 50 state tabs + 8 reference tabs (Underwriters · BLOCKED BANKS · Multi-Location · etc.)
- **avg 44.6 banks/state**
- **113 blocked banks** flagged (do-not-apply)
- **24 multi-location banks** flagged
- 6 underwriters indexed: Elan · TCM · Zion Bankcorp · Card Assets · FNBO · Commerce

**State density (top + bottom):**

| Rank | State | Banks |
|---|---|---:|
| 1 | New York | 63 |
| 2-3 | Georgia · Utah | 57 |
| 4 | Montana | 53 |
| 5-8 | CA · FL · MD · OK | 51 |
| 46 | Vermont | 23 |
| 47 | Rhode Island | 19 |
| 48 | Hawaii | 13 |
| 49 | Alabama | 8 |
| 50 | Alaska | 7 |

**Schema per state tab:**
`Bank Name · Business Credit Card? · Which Bureau Pull From? · Underwriter? · Geo-Locked? · Statements Required? · Apply Online?`

---

## File 4 · CC_Data_4.xlsx (Hard Inquiry DB)

- **5,443 inquiry records · 1,319 unique creditors · 41 states**
- Bureau split (normalized for typo variants): TU 2,036 · EX 1,998 · EQ 1,319

**Schema:** State · Creditor Name · Bureau

**Known data-quality issues:** bureau name typos (`TrangUnion` · `Equitax` · `Exocrian` · `Iransunion`) — normalize via fuzzy match if parsing programmatically.

---

## File 5 · CC_Data_5.xlsx (Inquiry DB v2 · Live Apps)

- **3,333 total rows across all 53 sheets** (strict count)
  - Raw Data sheet: 3,180 application records · this is the meaningful "apps" figure
  - Validation sheet: 52
  - States sheet: 51
  - 50 state placeholder sheets: 1 row each (50 total)
- Schema (Raw Data): Bank Name · State · Bureau · Date Applied · Status · Credit Score
- **23 unique banks · 54 state codes (incl DC + dupes)**
- 97.8% approval rate (3,110 of 3,180) — SELF-SELECTED dataset · not generalizable
- "Raw Data " sheet name has **trailing space** (programmatic gotcha)

**Strategic value:** the only file with FICO scores and timestamped application data. FICO field has data quality issues (74 and 6000 are not valid scores).

---

## Schema Gap · The Action Item

| Sheet | Schema Strength |
|---|---|
| File 1 · Additional Datapoints | ⭐⭐⭐⭐⭐ Fully structured |
| File 2 · 0% APR | ⭐⭐⭐⭐ Good structure |
| File 3 · State tabs | ⭐⭐⭐⭐ Good structure |
| File 5 · Raw Data | ⭐⭐⭐⭐ Good structure |
| File 4 · Inquiries | ⭐⭐⭐ Minimal (3 fields) |
| File 1 · Business Cards | ⭐⭐ Thin (4 fields, no FICO/age/doc) |
| File 1 · BC Part 2, BLOC, Loans | ⭐ Unstructured blobs |

**Future enhancement:** parse File 1's unstructured "Requirements" blobs into the AD schema (~982 records × 6 fields = ~5,892 additional data points unlocked).
