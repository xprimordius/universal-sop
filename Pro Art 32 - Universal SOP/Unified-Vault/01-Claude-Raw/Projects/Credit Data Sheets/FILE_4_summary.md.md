---
title: FILE_4_summary.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:28.265590+00:00"
uuid: cc825731-2ad0-4f4a-ac13-5b320bd3a27e
tags:
  - claude
  - alan
  - credit
---
# FILE_4_summary.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: File 4 · CC_Data_4 Summary
file: CC_Data_4_-_State_by_State_hard_inquiry_database.xlsx
tags: [APW, file_summary, hard_inquiries]
verification: VERIFIED
---

# File 4 · CC_Data_4.xlsx · Hard Inquiry Database

**Role:** Real-world bureau-pull intel — which bureau hits when which creditor pulls in which state.

## At a Glance
- 5,379 inquiry records · 1,319 unique creditors · 41 states represented · 1 sheet

## Schema
`State · Creditor Name · Bureau`

## Bureau Distribution
- TransUnion: 2,003 (38%)
- Experian: 1,970 (37%)
- Equifax: 1,305 (24%)
- Other/typos: ~101

## Strategic Value
1. **Predicts bureau pull BEFORE applying** — match creditor + state → see which bureau hits
2. **5,000+ data points** for pattern matching
3. **41 states covered** with empirical evidence

## Known Data-Quality Issues
- Bureau name typos: `TrangUnion`, `Equitax`, `Exocrian`, `Iransunion`, `Tranaunion`
- Some empty rows used as state dividers (must be filtered when parsing)
- Bureau column inconsistent (sometimes mixed)

## Cleaning Notes
When parsing programmatically, normalize bureau names:
```
'TrangUnion' / 'Iransunion' / 'Tranaunion' → 'TransUnion'
'Equitax' / 'Equilax' → 'Equifax'
'Exocrian' / 'Exporian' → 'Experian'
```

## Use Case
- Bureau prediction: "If I apply to Wells Fargo in TX, which bureau pulls?"
- Pattern: Compare same creditor across states → variance in pull behavior
- Risk planning: Freeze the bureau you DON'T want pulled before applying

## Limitations
- Self-reported data — accuracy depends on source contributors
- 9 states missing entirely (41 of 50)
- No application status / FICO / date data
