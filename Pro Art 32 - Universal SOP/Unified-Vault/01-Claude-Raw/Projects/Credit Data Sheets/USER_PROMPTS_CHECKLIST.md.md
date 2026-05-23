---
title: USER_PROMPTS_CHECKLIST.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:51:36.376002+00:00"
uuid: cd1d8d46-cdf3-47f9-ab95-8cfea0de44f9
tags:
  - claude
  - alan
  - credit
---
# USER_PROMPTS_CHECKLIST.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: User Prompts Checklist · All Requests Tracked
tags: [APW, history, prompts, checklist]
verification: VERIFIED
---

# User Prompts Checklist · All Requests Tracked

> Every user prompt with what was asked + whether it was fulfilled.

| # | User Request | Fulfilled? | Notes |
|:---:|---|:---:|---|
| 1 | Read CC_Data_1, identify sheet structure | ✅ | 8 sheets indexed |
| 2 | Per-sheet breakdown + cumulative datapoints | ✅ | Done with schema strength analysis |
| 3 | Brief on all 5 files for funding-co audience | ✅ | Slack-pasteable format delivered |
| 4 | Create HTML visual brief (datapoint list provided) | ✅ | `funding_database_brief.html` |
| 5 | Break down 12,521 record number | ✅ | Honest breakdown · "records ≠ unique institutions" |
| 6 | Total overall counts | ✅ | 121 sheets · 13,076 rows · 72,366 cells · 54,295 populated |
| 7 | Strict counting (no empty rows) | ✅ | 12,773 records · 53,640 populated cells |
| 8 | Verify counts vs visible "800 max" observation | ✅ | Confirmed Files 4 & 5 are large outliers |
| 9 | Explicit 11-datapoint HTML brief | ✅ | `funding_datapoint_brief.html` |
| 10 | 0% APR count | ✅ | 508 records · 498 unique · 35 double-dip |
| 11 | Ideal MN + OK 0% stack | ✅ | `zero_apr_stack_mn_ok.html` |
| 12 | HTML Gate violation acknowledgment + fix | ✅ | v2 protocol provided |
| 13 | SMS/text version of stack brief | ✅ | Plain text format delivered |
| 14 | Update stack with locked ranges + don't claim unknown | ✅ | Recalibrated to ALAN_LOCKED · $143K-$554K named subtotal |
| 15 | Timeline options (start now vs batch) | ✅ | 3 options + decision matrix |
| 16 | Migration package · export everything | ⏳ | THIS PACKAGE |
| 17 | Confirmed: MD+JSON · Full scope · Obsidian + Projects | ✅ | All 3 options addressed |

---

## Request Coverage Categories

| Category | Requests | Status |
|---|:---:|:---:|
| Data inspection | 4 (#1, 2, 5, 6) | All ✅ |
| Data quality verification | 2 (#7, 8) | All ✅ |
| Brief/Summary generation | 3 (#3, 9, 13) | All ✅ |
| HTML artifact builds | 3 (#4, 9, 11) | All ✅ |
| Strategic analysis | 3 (#11, 14, 15) | All ✅ |
| Process correction | 2 (#12, 14) | All ✅ |
| Migration & systematization | 2 (#16, 17) | In progress (this package) |

---

## Open Items / Future Asks (anticipated)

These weren't explicit asks but were flagged as next-step options:

- [ ] Build day-by-day Wave 1-5 execution calendar with specific dates
- [ ] Multi-entity round-robin matrix (Skyward · APW · 3rd entity)
- [ ] Filter 35 double-dip list by state eligibility (started in FLAGS.md)
- [ ] Map current credit profile to optimal timeline option (requires 5/24 / AAoA inputs)
- [ ] Parse File 1 unstructured "Requirements" blobs into AD schema (~5,892 new data points)
- [ ] Build state-by-state similar to MN/OK for additional states (CA, FL, TX, etc.)

---

## Accountability Note

This checklist is a transparency tool. If any request was not fulfilled or only partially, it should be flagged here. Future sessions can audit completeness by referencing this doc.

**As of 2026-05-15 · all explicit user requests have been addressed.**
