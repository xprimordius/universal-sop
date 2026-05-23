---
title: FLAGS.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T23:25:40.595928+00:00"
uuid: 62436972-bc78-4aef-ba35-2331f7468ab9
tags:
  - claude
  - alan
  - credit
---
# FLAGS.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: FLAGS · Blocked · Double-Dip · Geo-Locked · No-Card
tags: [APW, flags, banks, critical]
verification: VERIFIED_BYTE
version: 2.1
last_updated: 2026-05-15
---

# FLAGS · Critical Bank Lists

> Single consolidated reference for banks requiring special treatment. Numbers locked to CANONICAL_FACTS.json v2.1. Cross-check before any application sequence.

---

## ⚡ Double-Dip Banks (35 confirmed · File 2)

> Same-day 2-card approval on a single hard pull. Apply both within minutes of each other before bureau reports.

### MN-Eligible Double-Dip (3)
| Bank | Underwriter | Bureau |
|---|---|---|
| Blaze Credit Union | Self | EQ + TU |
| Bremer Bank | Elan | D&B/SBFE + TU |
| 3HILL | Elan | D&B/SBFE + TU |

### OK-Eligible Double-Dip (1)
| Bank | Underwriter | Bureau |
|---|---|---|
| First-Citizens Bank & Trust Company | Self | EX only |

### Nationwide Double-Dip (covers MN + OK + most states)
| Bank | Underwriter | Bureau |
|---|---|---|
| Regions Bank | Self | All 3 |
| Marcus by Goldman Sachs | Self | All 3 |
| SSB Bank | Self | All 3 |
| Bank of America | Self | EX + TU |
| CFSBank | TCM | All 3 |
| City Bank | Apex | All 3 |
| Farmers & Merchants Bank Mound City KS | Bankers' Bank KS | All 3 |
| Bank of Idaho | TCM | EX |
| Springs Valley Bank & Trust | Self | EQ |
| United Bank | Self | TU |
| Wilmington Savings Fund Society FSB | Self | TU |
| Forcht Bank NA | Self | TU |
| Eagle Bank and Trust Company | TCM | TU |

### State-Restricted Double-Dip (not MN or OK eligible)
- **AL only:** AOD Federal Credit Union
- **AZ only:** First Credit Union
- **CA only:** Fremont Bank, First Entertainment Credit Union
- **DC/MD/VA:** Signal Financial FCU
- **ID only:** Independent Bank (Elan)
- **IL only:** Illinois State Credit Union
- **KS/MO:** UMB Bank
- **KY only:** Commonwealth Credit Union
- **LA only:** Red River Bank
- **MD only:** First Financial FCU MD, Har-co Credit Union
- **MD/OH/PA/VA:** Dollar Bank
- **NE only:** Cobalt Credit Union
- **RI only:** Westerly Community Credit Union
- **WA only:** Verity Credit Union
- **AL/AR/FL/GA/LA/MS/NC/NY/SC/TN/TX/VA:** First Horizon Bank
- **Other:** First State Bank and Trust (Elan), Bremer-related entities

---

## 🚫 Blocked Banks (113 · File 3) ⬆️ +1 from v1

> Banks flagged as DO-NOT-APPLY in the source data. Reasons unspecified but treat as auto-deny risk.

**Full list location:** `CC_Data_3.xlsx` → "BLOCKED BANKS" sheet
**Count:** 113 entries (was 112 in v1 · re-verified VERIFIED_BYTE in v2)
**Action:** Cross-check any bank name against this sheet before adding to stack

---

## 🗺️ Geo-Locked Institutions

### Confirmed Geo-Locked (from File 3 schema)
| Bank | State | Note |
|---|---|---|
| Wells Fargo | Multi-state | MN qualifies · OK does NOT |
| Bank of the West | OK + others | Geo-locked in OK |

### File 3 Geo-Lock Summary (state sheets only)
- **YES geo-locked:** 169 banks (was 179 in v1 · v2 corrected)
- **NOT geo-locked:** 640 banks (was 673 in v1 · v2 corrected)
- **Implication:** 169 / (169 + 640) = ~21% of banks with a geo flag require in-footprint applicant

**Action:** Check the "Geo-Locked?" column for any bank before applying out-of-state

---

## ❌ No-Card Banks (Skip These)

### OK (confirmed from File 3 data)
- First National Bank & Trust Company of Ardmore
- Shamrock Bank
- Sooner State Bank

**Action:** These banks exist in source data but offer NO business credit cards. Skip entirely in stack planning.

---

## 📍 Special Cases · Multi-Location (24 · was 25 in v1)

**Count:** 24 banks flagged as multi-location (v1 said 25 · v2 corrected)
**Location:** `CC_Data_3.xlsx` → "Banks with Multiple Locations" sheet
**Implication:** Different application paths per location · check source before assuming national reach.

---

## 🔍 Verification Protocol

Before recommending ANY bank for application, run this 4-step check:

1. ✅ **Not in BLOCKED list** (File 3 · 113 banks)
2. ✅ **Not in No-Card list** (geo-specific)
3. ✅ **Geo-eligible** for applicant's state (169 banks have geo restriction)
4. ✅ **Same-UW spacing respected** vs other planned apps

If any check fails → do not include in active stack.

---

## Update Protocol

When new data arrives:

1. Update source `.xlsx` first
2. Re-extract flag lists
3. Update this `FLAGS.md` file
4. Bump version in CANONICAL_FACTS.json
5. Re-upload to Claude Project
