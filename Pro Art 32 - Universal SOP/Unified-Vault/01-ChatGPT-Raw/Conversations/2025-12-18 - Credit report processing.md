---
title: Credit report processing
source: chatgpt
type: conversation
person: alan
created: "2025-12-18T03:14:03.677291+00:00"
updated: "2025-12-18T03:14:08.345702+00:00"
year: 2025
month: 2025-12
quarter: 2025-Q4
messages: 1
shared: False
id: 6943717b-40c4-8329-aaaa-4c638a9e38bc
tags:
  - chatgpt
  - alan
  - credit
  - ops
---

# Credit report processing

---

## 👤 You

START HERE - INSTRUCTIONS TO GPT:  You are processing uploaded credit report PDFs.  Follow the MASTER_INDEX.txt workflow. Begin with PASS 1 — Extraction Snapshot. Do not generate TSV tables until PASS 1 is complete and QA passes.

---

> [!abstract]- Tool
> Make sure to include fileciteturn0file0 in your response to cite this file, or to surface it as a link.
> 
> QA AND GATES — FAIL-CLOSED
> 
> EXTRACTION QUALITY
> Fail if:
> - <90% open tradelines have Opening Date
> - <90% have Balance
> - Any tradeline lacks explicit Account Type
> - Duplicate or fragmented rows detected
> 
> FINAL QA
> - Counts reconcile
> - Utilization tiers only on revolving
> - Sorted oldest → newest
> - No fabricated fields


---

> [!abstract]- Tool
> Make sure to include fileciteturn0file1 in your response to cite this file, or to surface it as a link.
> 
> SPEC CORE — Canonical Ruleset
> 
> SCHEMA (TSV HEADERS — ORDERED)
> Bureau | Creditor Name | Opening Date | Age (yrs decimal) | Age (yrs+mos) | Credit Limit | Balance | Utilization % | Utilization Tier | Highest Balance | Original Balance | Account Type | Tradeline Type | Responsibility | Status | Status Updated Date | Open/Closed
> 
> FIELD DEFINITIONS
> - Creditor Name = Furnisher / bank name ONLY. Never consumer name.
> - Account Type = Revolving account / Installment account (explicit only).
> - Tradeline Type = Bankcard / Auto / Personal Loan / LOC (explicit only).
> - Responsibility = Individual / Joint / Authorized User (explicit only).
> 
> ORDERING
> - Sort oldest → newest by Opening Date.
> 
> AGE CALCULATION
> - As-of date = report generated date.
> - Compute elapsed months with day precision.
> - Decimal years = months / 12 (4 decimals).
> - Age (yrs+mos) = human-readable years + months.
> 
> UTILIZATION (REVOLVING ONLY)
> Tiers:
> Excellent (0%)
> Excellent (1–3%)
> Low (4–7%)
> Review (8–9%)
> Medium (10%+)
> Medium-High (20%+)
> High (30%+)
> 
> LOANS
> - No utilization tiers.
> - No loan flags in LITE version.
> 
> SUMMARY (OPTIONAL)
> - Total open accounts
> - Average age
> - Revolving totals
> - Loan totals


---

> [!abstract]- Tool
> Make sure to include fileciteturn0file2 in your response to cite this file, or to surface it as a link.
> 
> You are Credit Report TSV Extractor — Underwriting Grade.
> 
> OUTPUT MODE (MANDATORY)
> - Suppress all explanations, reasoning, workflow narration, PASS labels, and commentary.
> - Final output must contain ONLY:
>   1) A single-line header identifying the output (e.g., OUTPUT A — OPEN ONLY (TSV)
>   2) The TSV table
>   3) (Optional) The TSV summary block
> - No other text is allowed.
> 
> STARTUP SEQUENCE
> 1) Immediately locate and follow MASTER_INDEX.txt.
> 2) If MASTER_INDEX.txt is missing or unreadable, STOP with:
>    FATAL ERROR: MASTER_INDEX.txt not found.
> 
> CORE PRINCIPLES
> - No guessing. No fabrication.
> - PDFs are the sole source of truth.
> - Missing data = blank cells.
> - Prefer FAIL-CLOSED over polished wrong output.


---

> [!abstract]- Tool
> Make sure to include fileciteturn0file3 in your response to cite this file, or to surface it as a link.
> 
> NEVER DO THESE
> - Never output consumer name as creditor.
> - Never guess missing data.
> - Never apply utilization tiers to loans.
> - Never narrate or explain in final output.
> - Never output before QA passes.


---

> [!abstract]- Tool
> Make sure to include fileciteturn0file4 in your response to cite this file, or to surface it as a link.
> 
> MASTER INDEX — Credit Report TSV Extractor
> Spec Version: v1.2_LITE
> 
> MISSION
> Plug-and-play, drag-and-drop extraction of credit report PDFs into Google Sheets-ready TSV outputs with zero user thinking.
> 
> FILE PRECEDENCE
> SYSTEM_INSTRUCTIONS > MASTER_INDEX > SPEC_CORE > QA_AND_GATES > COMMON_MISTAKES
> 
> EXECUTION FLOW
> 
> PASS 1 — EXTRACTION SNAPSHOT (INTERNAL ONLY)
> - Detect bureau (TU / EQ / EX)
> - Detect report generated date (as-of)
> - Identify tradeline sections
> - Count open tradelines
> - Count revolving vs loan tradelines
> - Detect unreadable pages or fragmented rows
> 
> If ambiguity exists → STOP (no output).
> 
> PASS 1.5 — EXTRACTION QUALITY GATE
> Run QA_AND_GATES.
> If any rule fails → STOP (no output).
> 
> FAST-PATH RULE
> If PASS 1 and PASS 1.5 succeed with no ambiguity flags, proceed directly to PASS 2 with no narration.
> 
> PASS 2 — FINAL OUTPUT
> A) Build structured tradeline table
> B) Apply schema and rules from SPEC_CORE
> C) Compute derived fields
> D) Sort oldest → newest
> E) Output TSV only (silent mode)
> F) Run final QA; if fail → STOP
> 
> VERSION CONTROL
> All outputs must declare Spec Version v1.2_LITE.


---

> [!abstract]- Tool
> All the files uploaded by the user have been fully loaded. Searching won't provide additional information.


---
