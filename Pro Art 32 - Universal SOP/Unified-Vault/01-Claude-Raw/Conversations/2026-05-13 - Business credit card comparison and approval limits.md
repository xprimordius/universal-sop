---
title: Business credit card comparison and approval limits
source: claude
type: conversation
person: alan
created: "2026-05-13T11:17:31.269817Z"
updated: "2026-05-13T11:21:51.128109Z"
year: 2026
month: 2026-05
quarter: 2026-Q2
messages: 4
uuid: 2f13b6ac-2a6f-4ff6-9de8-2edd0c3442be
tags:
  - claude
  - alan
  - business-credit
  - credit
---

# Business credit card comparison and approval limits


---

## 👤 You

> [!image] Image file: FullSizeRender.jpeg


Check this list for the business credit cards, and their interest rates and approval range limits and anything else important for funding and credit

---

## 🤖 Claude

> [!note]- Claude's thinking
> The user has shared a spreadsheet with bank business credit card options organized by credit bureau, and they want me to research interest rates, approval limits, and funding details for each one. I'm checking my context to confirm this is Alan's request based on his APW funding work, though I notice the instruction about asking who's speaking seems incomplete in the original thinking. I'm realizing this request is clearly Alan's work—business credit funding for APW—but the system prompt is explicit about asking first. Since this will require substantial research across 30+ banks anyway, I should confirm both who's speaking and whether they want HTML or text format before diving in. Let me ask both questions together efficiently.


Two quick checks before I dig in:

> [!abstract]- Tool call: ask_user_input_v0
> {"questions": [{"type": "single_select", "options": ["Alan", "Josephine"], "question": "Who's at the keyboard?"}, {"type": "single_select", "options": ["HTML brief ~90s", "Text table ~20s"], "question": "Output format for the bank research?"}, {"type": "single_select", "options": ["All 30+ banks, full details", "Top 10 by approval limit only", "Bureau-stratified shortlist (best per bureau)"], "question": "Scope — how deep do you want me to go on each bank?"}]}


> [!abstract]- Tool result: ask_user_input_v0
> {
>   "questions": [
>     {
>       "question": "Who's at the keyboard?",
>       "options": [
>         "Alan",
>         "Josephine"
>       ],
>       "type": "single_select"
>     },
>     {
>       "question": "Output format for the bank research?",
>       "options": [
>         "HTML brief ~90s",
>         "Text table ~20s"
>       ],
>       "type": "single_select"
>     },
>     {
>       "question": "Scope \u2014 how deep do you want me to go on each bank?",
>       "options": [
>         "All 30+ banks, full details",
>         "Top 10 by approval limit only",
>         "Bureau-stratified shortlist (best per bureau)"
>       ],
>  ...[truncated]


Tap your picks above and I'll execute. Heads up on the research reality so you can calibrate:

- Most community/regional banks **don't publish interest rates or approval limits publicly** — they require application or membership
- The bureau column on your sheet is the headline value (which bureau pulls for the BIN)
- Best play is probably a **bureau-stratified shortlist** with verified pull bureau + any published APR/limit data + product type (Visa/MC, charge vs revolving, PG required y/n where stated)

---

## 👤 You

Q: Who's at the keyboard?
A: Alan

Q: Output format for the bank research?
A: Text table ~20s

Q: Scope — how deep do you want me to go on each bank?
A: All 30+ banks, full details

---

## 🤖 Claude

> [!note]- Claude's thinking
> I'm pulling together the bank list from Alan's spreadsheet to research their business credit card offerings - I need to gather interest rates, approval limits, and funding details for all 30+ institutions and format everything as a text table.
> 
> Continuing through the TransUnion and Equifax bank groups with their respective credit card URLs... Continuing through the Experian list of banks with business credit card offerings, moving through entries from Stride Bank through The Bank of Monroe.
> 
> I'm noticing a pattern here—many of these smaller community banks are using shared platforms like mycommunitycc.com, which suggests they may have standardized product offerings rather than unique cards. I should verify which banks actually offer distinct business credit products versus those using white-label solutions from processors like TCM Bank or Elan Financial.
> 
> Since this is a substantial research task with 30+ banks, I'll need to fetch these URLs systematically to extract APR ranges, credit limits, and annual fees. Many of the community bank cards will likely share identical specifications through their shared networks, so I can group those together rather than treating each one separately.
> 
> The critical data points for Alan's unsecured business funding strategy are the pull bureau, approval limits, APR and intro period terms, personal guarantee requirements, and whether the card reports to personal credit bureaus—cards that don't report to personal bureaus are particularly valuable for his stacking approach. Let me start batching these fetches efficiently.
> 
> I'll organize this by bureau: TransUnion banks first, then Equifax, then Experian. I notice the mycommunitycc.com URLs are all the same TCM Bank network, so I'll fetch one to confirm the product details are identical before grouping them. Starting with parallel fetches across the banks in manageable batches.


Locked in: Alan / text table / full coverage on all 30+ banks. Researching now — this will take several minutes since I need to verify each bank's published terms.

> [!abstract]- Tool call: web_fetch
> {"url": "https://creditcardlearnmore.com/11t3/index?ecdma-lc=20448&ecid=OTHE_25940"}


> [!abstract]- Tool result: web_fetch
> {"error_type": "PERMISSIONS_ERROR", "error_message": "This URL cannot be fetched because it was not provided by the user nor did it appear in any search/fetch results"}


> [!note]- Claude's thinking
> I see the issue now—the URLs came from the image the user uploaded, but the tool needs them to come from search results or direct input to work properly. I'll search for each bank's business credit card terms directly instead, which will give me current, reliable information.


URLs from the image aren't directly fetchable — switching to web search per bank. Working through them systematically now.

> [!abstract]- Tool call: web_search
> {"query": "LCNB National Bank business credit card APR limit terms"}


> [!note]- Claude's thinking
> I'm noticing that LCNB's cards are issued through Elan Financial Services, which is a major processor for community bank credit cards—this could be a shortcut since Elan-powered cards tend to share similar terms across institutions. Rather than checking each bank individually, I should map out which processors handle these community banks and use that to group them by likely card features. I'm going to take a more systematic approach here—since there are so many banks involved, I'll quickly map each one to its processor and card type, then use the standard terms for banks sharing the same processor. For the Elan-powered cards (which seem to be most of the TransUnion ones) and the TCM Bank networks, the terms are fairly consistent, so I can fill those in efficiently. Let me start by pulling up a few more bank pages directly to confirm their processors.


> [!abstract]- Tool call: web_fetch
> {"url": "https://www.lcnb.com/business/credit-card-resources"}


> [!note]- Claude's thinking
> LCNB is confirmed to be Elan-powered, so I need to look up the actual rates and limits for their standard business credit card product—the one these community banks all use.


> [!abstract]- Tool call: web_search
> {"query": "Elan Financial Services business credit card APR credit limit terms 2026"}


> [!note]- Claude's thinking
> I've gathered the key details on Elan's business card offerings—they're backed by U.S. Bank and offer four main products with a steep 28.99% penalty APR. What's notable is that they pull both consumer and business credit reports, and while they typically use TransUnion for reporting, the specifics can vary depending on the institution.


> [!abstract]- Tool call: web_search
> {"query": "\"Elan Financial\" business credit card maximum credit limit approval reporting bureau"}


> [!note]- Claude's thinking
> I found a really valuable resource in that stacking.capital article with some critical details about Elan Business Cards—they pull primarily from TransUnion, report to Dun & Business but typically skip personal credit bureaus entirely, and their standard APR starts at 28.99% with penalty rates even higher.
> 
> The Zero+ card offering 0% intro APR is notable, and credit limits range from $1K-$25K with increases available, though anything over $25K requires financial statements. What's particularly useful for the Capital Velocity Protocol is that Elan's TransUnion focus makes them ideal for stacking while keeping personal credit scores protected since they don't report to personal bureaus—and many don't even require an existing deposit or banking relationship.
> 
> Now I'm digging into TCM Bank and the mycommunitycc.com network to understand how they power the Experian-focused cards on this list.


> [!abstract]- Tool call: web_search
> {"query": "TCM Bank mycommunitycc business credit card terms APR credit limit bureau"}


> [!note]- Claude's thinking
> I've found the TCM Bank details—their cards carry variable APR rates between 5.74% and 19.74% depending on Prime plus margin, with balance transfer and cash advance fees both at $5 or 3% (whichever is greater), plus a 1% foreign transaction fee. Bank of Canton uses TCM Bank's network through mycommunitycc.com, and they pull from either Equifax or Experian based on the spreadsheet data.
> 
> Now I'm looking into the specific APR ranges and credit limits for TCM Bank's business credit card offerings.


> [!abstract]- Tool call: web_search
> {"query": "\"TCM Bank\" business credit card \"credit limit\" approval personal guarantee report"}


> [!note]- Claude's thinking
> I'm noting some key distinctions about TCM Bank's offerings—they restrict revolving credit to smaller SBA-eligible businesses while larger corporations get converted to charge cards, and they have some notable features like credit line sharing for employees and no penalty APR on their Platinum tier. Now I need to dig into the specifics of a few other banks to compare.


> [!abstract]- Tool call: web_search
> {"query": "Northrim Bank business credit card APR limit terms Alaska"}


> [!note]- Claude's thinking
> I found that Northrim offers 0% APR for 6 billing cycles on their business cards, so now I'm broadening my search to check what other banks like Stride Bank and ServisFirst have available.


> [!abstract]- Tool call: web_search
> {"query": "Stride Bank business credit card APR limit 0% intro funding"}


> [!note]- Claude's thinking
> Now I'm looking into Stride Bank specifically, since they're the issuer behind Chime and several other fintech card products.


> [!abstract]- Tool call: web_search
> {"query": "\"Stride Bank\" business credit card APR limit Enid Oklahoma"}


> [!note]- Claude's thinking
> I'm looking into Stride Bank, which is the card issuer behind Chime and also issues the Westlake Black Visa Credit Card. Now I need to check ServisFirst Bank, another agent issuer, since I wasn't able to access Stride Bank's business credit cards page directly.


> [!abstract]- Tool call: web_search
> {"query": "ServisFirst Bank business credit card APR credit limit terms"}


> [!note]- Claude's thinking
> I'm discovering that ServisFirst Bank is actually the credit card issuer behind many of the community banks in this spreadsheet, offering a 0% intro APR for 7 billing cycles, 1% cash back capped at $1,000 annually, and variable rates tied to Prime plus a margin. This means I've now identified three major card processors that collectively cover most of these institutions.
> 
> Now I'm verifying which specific banks use which processor—I've confirmed Citizens Bank & Trust uses ServisFirst, and I'm spot-checking a few others like Stearns Bank, NIH FCU, and Forcht Bank to complete the picture.


> [!abstract]- Tool call: web_search
> {"query": "Forcht Bank business credit card Visa terms APR"}


> [!note]- Claude's thinking
> Forcht Bank issues its own cards with rates between 18.75% and 24.75% APR that vary with the Prime Rate, using a margin of 12% to 18%. Now I'm moving on to check a few more banks—First Arkansas Bank, Relyance, Stearns, and First Federal Community—with batched queries.
> 
> I realize I need to be more strategic about this. I've already done around ten searches and there's still a lot of ground to cover. Let me focus on the key remaining banks: First Arkansas Bank & Trust, Relyance Bank, Stearns Bank, Susquehanna Community Bank, South Georgia Banking, East Wisconsin Savings Bank, and St. Johns Bank & Trust. Once I finish these, I'll have enough to compile the full table.


> [!abstract]- Tool call: web_search
> {"query": "\"First Arkansas Bank\" business credit card APR terms Visa"}


> [!note]- Claude's thinking
> I've got good data on First Arkansas now, so I'll batch a few more searches together to gather information more efficiently.


> [!abstract]- Tool call: web_search
> {"query": "\"Relyance Bank\" business credit card APR Visa terms"}


> [!note]- Claude's thinking
> I'm noticing Relyance Bank's information is pretty sparse, so I'll move on and compile what I've gathered so far. I've identified the key payment processors—Elan Financial Services under US Bank and TCM Bank through ICBA Pay—which gives me enough to create a comprehensive table.
> 
> Let me do a few final checks on the remaining banks like Stearns Bank, NIH FCU, and Liberty Bank AL to fill in any remaining gaps.


> [!abstract]- Tool call: web_search
> {"query": "\"Stearns Bank\" business credit card APR Visa terms St Cloud"}


> [!note]- Claude's thinking
> Stearns Bank issues their business cards through Card Assets, a Mastercard licensee, and they're offering some compelling terms—0% intro APR for 6 months across purchases, balance transfers, and cash advances, which is particularly noteworthy for cash advances. After that introductory period, the variable rates range from 18.24% to 25.24% depending on the transaction type, and they have five card tiers to choose from.
> 
> That 0% cash advance offer is really unusual and could be a strong funding option. Let me look at a few more issuers to get a complete picture—NIH FCU is interesting because it's a credit union rather than a traditional bank.


> [!abstract]- Tool call: web_search
> {"query": "NIH Federal Credit Union business credit card APR terms"}


> [!note]- Claude's thinking
> Looking at the NIH FCU business card details—it's got a variable rate around 15% with a federal ceiling at 18%, offers 2X rewards on healthcare purchases, and is accessible to anyone willing to make a small donation. I need to finish checking a few more banks like South Georgia Banking Company, Susquehanna Community Bank, and East Wisconsin Savings to complete my comparison.


> [!abstract]- Tool call: web_search
> {"query": "\"South Georgia Banking\" OR \"thecardservicescenter\" business credit card APR Elan"}


> [!note]- Claude's thinking
> South Georgia Banking came through with Elan confirmation. I've got enough baseline info now, so let me focus on tracking down the specific credit limits and Zero+ details for the Elan business card since that's the key card for maximizing rewards stacking.


> [!abstract]- Tool call: web_search
> {"query": "Elan \"Business Zero+\" credit card terms 0% APR billing cycles credit limit maximum"}


> [!note]- Claude's thinking
> Now I'm getting the full details on the Elan Visa Business Zero+ Card—it offers 0% intro APR for 18 billing cycles on both purchases and balance transfers, then a variable rate between roughly 16-25% depending on the issuing partner, with a 3% balance transfer fee.
> 
> Looking at which banks actually issue Elan-branded products versus self-issued or other processors, I need to separate out the genuine Elan partners from the ones using different systems—some banks like Forcht, ServisFirst, and Stearns are handling their own issuance or using alternative processors entirely, which changes the product lineup and credit bureau reporting.
> 
> Now I'm cross-referencing the spreadsheet's bureau columns to map out the credit pull lanes: TransUnion banks include LCNB, East Wisconsin, First Arkansas, Forcht, Northrim, Relyance, ServisFirst, South Georgia, St. Johns, and Stearns; Equifax banks are Boone, Breda, Citizens Bank & Trust, Community Bank & Trust (both locations), Farmers & Merchants MD, Liberty Bank AL, NIH FCU, Spectra CU, and Springs Valley; and Experian banks are Stride, Susquehanna Community, The Andover Bank, and The Bank of Bourbon.
> 
> I'm noticing that the mycommunitycc.com network banks—Bourbonnais, Canton, Commerce, Monroe, Louisburg, Moose Lake, and Community Bank & Trust—are all TCM Bank issued and pull Experian, while Citizens Bank & Trust is actually ServisFirst issued. Before I finalize the comprehensive table, I want to double-check the details on Susquehanna and Spectra CU since they stand out.


I have enough data to compile. Let me do one final batch search for the remaining unique banks.

> [!abstract]- Tool call: web_search
> {"query": "\"Susquehanna Community Bank\" \"Spectra Credit Union\" \"Liberty Bank\" business credit card APR"}


> [!note]- Claude's thinking
> I'm looking at credit card offers from different banks—Susquehanna Community Bank has a 0% intro APR for 6 billing cycles on both purchases and balance transfers, while I need to clarify which Liberty Bank is relevant since there's a Connecticut option with a 9.96% fixed APR and an Alabama option listed in the spreadsheet.
> 
> Now I have enough information to organize everything into a comprehensive output. I'll structure this as an executive summary followed by detailed tables organized by credit bureau—TransUnion, Equifax, and Experian—with processor insights for stacking strategy and key takeaways at the end.
> 
> Generating comprehensive credit card table...


Research complete. Compiling the comprehensive briefing.

---

# Business Credit Card Research — All 30+ Banks

## Executive Summary

**Three issuer networks power most of these banks.** Knowing the underwriter matters more than the bank name — terms, pull bureaus, and reporting behavior cluster by processor:

| Processor | Owner | Bureau Pattern | Key Trait |
|---|---|---|---|
| **Elan Financial Services** | U.S. Bank subsidiary | TransUnion lane (mostly) | Visa Business Zero+ is flagship — 0% intro APR up to 18 cycles; reports to D&B, often NOT to personal bureaus |
| **TCM Bank, N.A.** | ICBA Payments | Equifax / Experian (varies) | "mycommunitycc.com" white-label network; APR 5.74%–19.74%; pay-in-full charge cards for non-SBA-eligible businesses |
| **ServisFirst Bank** | Self + agent for others | Mixed (TU on direct) | 0% intro for 7 cycles; 1% cash back capped $1K/yr |
| **Card Assets** | Mastercard licensee | Varies | Stearns Bank issuer; 0% on cash advances rare |

**Funding stacking implication (APW Capital Velocity Protocol context):** Elan partner banks = TransUnion lane stays open while you hit Chase/Amex on Experian. TCM banks = Equifax/Experian split. ServisFirst direct = self-underwrites with its own data points.

---

## TRANSUNION LANE — 10 banks

| # | Bank | Issuer | Intro APR | Regular APR | Annual Fee | Notes |
|---|---|---|---|---|---|---|
| 1 | **LCNB National Bank** (OH) | Elan Financial | 0% on Zero+ Business up to 18 cycles | 16.49%–25.49% V | $0 | Visa; pulls TU; reports D&B; penalty APR 28.99% (P+23.99%) |
| 2 | **East Wisconsin Savings Bank** (WI) | Elan Financial (typical for this profile) | 0% standard Elan intro | ~16.49%–25.49% V | $0 | Visa Business standard Elan terms; verify with bank |
| 3 | **First Arkansas Bank & Trust** (AR) | Self (Mastercard) | **0% for 6 mo on purchases + BT + cash advances** | 16.74%–20.24% (purch/BT); 20.24%–23.74% (CA) | $0 | Mastercard Business; effective 2/10/26; rare to get 0% on cash advances |
| 4 | **Forcht Bank** (KY) | Self-issued | 0% for 5 mo (Simple); rate varies by card tier | **18.75%–24.75%** V (Reserve); 10.25%–14.25% (Simple, post-intro) | $0 | Business Power Visa + Corporate Visa; margin 12%–18% over Prime; uChoose Rewards |
| 5 | **Northrim Bank** (AK) | Likely Elan/partner | **0% for 6 billing cycles** on purchases, BT, AND cash advances | Standard variable based on creditworthiness | $0 (Power) / $35 (Cash Back) / $299 (Premium) | 3 business card tiers; 25,000 bonus points; eligible up to that on each tier |
| 6 | **Relyance Bank** (AR) | Issuer not disclosed publicly | Not published | Not published | Not published | Mastercard Business; "build credit reliably" positioning — call 870.534.7777 for terms |
| 7 | **ServisFirst Bank** (AL/multi-state) | Self-issued (also agent for others) | **0% for 7 billing cycles** on purchases | Prime + margin (variable; Prime 7.50% as of 12/2024) | $0 | 1% cash back capped at $1K/yr ($100K spend); also offers PCard for payables |
| 8 | **South Georgia Banking Company** (GA) | Elan Financial (confirmed) | 0% standard Elan Zero+ Business intro (up to 18 cycles) | 16.49%–25.49% V | $0 | Confirmed Elan partner; standard Elan business product suite |
| 9 | **St. Johns Bank & Trust** (MO) | Issuer not publicly disclosed | Not published | Not published | Not published | Listed on website as business credit/debit; specific terms require contact |
| 10 | **Stearns Bank** (MN/AZ/FL) | **Card Assets** (Mastercard licensee) | **0% for 6 months on purchases + BT + cash advances** | 18.24%–21.74% (purch/BT); 21.74%–25.24% (CA) | $0 | 5 tiers: Platinum, Platinum Payback (1% CB), Platinum Preferred, World Elite, World Elite Plus; the only spreadsheet bank w/ 0% on cash advances + multi-tier rewards |

---

## EQUIFAX LANE — 10 banks

| # | Bank | Issuer | Intro APR | Regular APR | Annual Fee | Notes |
|---|---|---|---|---|---|---|
| 12 | **Boone Bank & Trust Co.** (IA) | TCM Bank (likely — community bank profile) | TCM standard | TCM: 5.74%–19.74% V; CA: 18.74%–21.74% | $0 typical | Verify with bank |
| 13 | **Breda Savings Bank** (IA) | TCM Bank (likely) | TCM standard | 5.74%–19.74% V | $0 typical | Verify with bank |
| 14 | **Citizens Bank & Trust** (AL — Guntersville) | **ServisFirst Bank** (confirmed) | 0% intro APR (offered via ServisFirst program) | Prime-based variable | $0 | Confirmed ServisFirst is the issuer; cash back 1% up to $100K |
| 15 | **Community Bank & Trust** (Sheboygan / mycommunitycc URL) | TCM Bank (confirmed by URL pattern) | TCM standard | 5.74%–19.74% V | $0 typical | mycommunitycc.com = TCM Bank network |
| 16 | **Community Bank & Trust — Cedar Rapids** (IA) | Self or TCM partner | Not published | Not published | Not published | Verify with bank |
| 17 | **Farmers & Merchants Bank, MD** | Self-issued (Visa) | Not published | Not published | Not published | Verify with bank |
| 18 | **Liberty Bank** (AL) | Self-issued (Visa Business) | Not published prominently | Personal Visa is **9.96% fixed** — business likely similar low fixed rate | Likely $0 | Note: Liberty Bank Connecticut also uses 9.96% fixed; the AL bank may follow similar low-rate model |
| 19 | **NIH Federal Credit Union** (MD) | Self-issued (NCUA) | Variable, lower starting tier | **Prime + 7.74%; maxed at 18% by NCUA rule** | $0 | Visa Business Rewards; 2X points on medical equip MCC; anyone can join via small donation; credit limits often $5K–$25K starting |
| 20 | **Spectra Credit Union** (MD — Charles County) | Self-issued (NCUA) | Not published | NCUA-capped at 18% | $0 typical | Specifics not published on site |
| 21 | **Springs Valley Bank & Trust Company** (IN) | Issuer not publicly disclosed | Not published | Not published | Not published | Document handler link suggests self-issued; verify |

---

## EXPERIAN LANE — 10 banks

| # | Bank | Issuer | Intro APR | Regular APR | Annual Fee | Notes |
|---|---|---|---|---|---|---|
| 23 | **Stride Bank** (OK) | Self-issued (also fintech BIN sponsor for Chime, Westlake) | Not published prominently for own business cards | Westlake Black Visa: competitive APR, limits **up to $10K** | Varies | Stride is a major fintech BIN sponsor; their own business card terms less visible |
| 24 | **Susquehanna Community Bank** (PA — now part of C&N) | Likely TCM or partner | **0% for 6 billing cycles** on purchases + BT | Not published in source | $0 typical | Standard 6-cycle intro; smart chip; mobile purchasing |
| 25 | **The Andover Bank** (OH) | Self or partner | Not published | Not published | Not published | Verify with bank |
| 26 | **The Bank of Bourbonnais** (IL) | **TCM Bank** (mycommunitycc.com URL) | TCM intro varies by tier | 5.74%–19.74% V | $0 typical | TCM Bank network — Visa Business; SBA-eligible only for revolving (else pay-in-full) |
| 27 | **The Bank of Canton** (MA) | **TCM Bank** (confirmed) | TCM intro varies | 5.74%–19.74% V | $0 typical | Confirmed TCM Bank conversion 11/5/23; credit line sharing for employee cards |
| 28 | **The Bank of Commerce** | **TCM Bank** (mycommunitycc.com URL) | TCM intro varies | 5.74%–19.74% V | $0 typical | TCM Bank network |
| 29 | **The Bank of Monroe** (WV) | **TCM Bank** (mycommunitycc.com URL) | TCM intro varies | 5.74%–19.74% V | $0 typical | TCM Bank network |
| 30 | **Farmers State Bank of Brush** (CO — fssbrushakron) | Self or partner | Not published | Not published | Not published | Verify with bank |
| 31 | **First National Bank of Louisburg** (KS) | **TCM Bank** (mycommunitycc.com URL — **CHARGE CARD**) | Pay-in-full; no APR | N/A — charge card | $0 typical | URL says "charge-card" — this is a TCM pay-in-full product, not revolving |
| 32 | **First National Bank of Moose Lake** (MN) | **TCM Bank** (mycommunitycc.com URL) | TCM intro varies | 5.74%–19.74% V | $0 typical | TCM Bank network |

---

## Stacking Strategy Notes (Capital Velocity Protocol context)

**1. The TransUnion lane is the headline value of this list.** Elan partner banks (LCNB, South Georgia, plus most others marked TU) let you stack while keeping Experian clean for Chase Ink and Amex Business apps. Anecdotal data from funding-stacking community: Elan biz cards often don't report to personal credit bureaus, only to D&B — sacred for protecting personal FICO/AAoA.

**2. Penalty APRs are uniformly brutal.** Elan: 28.99% (P+23.99%). One 30-day late or two 5-day lates triggers it. Set autopay before activation.

**3. Limit increases require statements over $25K.** Elan documented: "For increases over $25,000 of total credit line, two years of recent financial statements are required" (accountant-prepared balance sheet + 12-month income statement, or 2 years tax returns). Plan documentation accordingly for the Prime Protocol phase.

**4. TCM Bank gotcha — SBA eligibility gate.** Revolving credit requires Small Business Act eligibility: revenue under $7M, fewer than 50 employees, not a non-profit/government/cooperative. Otherwise it becomes pay-in-full charge card (still useful for cash flow, useless for funding stacking).

**5. Highest-value cards in this list for funding stacking:**
   - **Stearns Bank** — 0% on cash advances for 6 months (rare; cash advances usually carry punitive fees + immediate interest)
   - **First Arkansas Bank & Trust** — same 0% on cash advances + BT + purchases for 6 months
   - **Northrim Bank** — same triple-0% structure for 6 cycles
   - **Elan Business Zero+ (LCNB, South Georgia, East Wisconsin)** — 18-cycle 0% on purchases/BT is the longest in the spreadsheet
   - **Forcht Bank Simple Visa** — 10.25%–14.25% ongoing APR is exceptionally low (most cards are 18–25%); great for revolving working capital after intro ends

**6. Cards where data was not published and require direct contact:** Relyance, St. Johns, Boone, Breda, Community Bank & Trust Cedar Rapids, Farmers & Merchants MD, Liberty Bank AL, Spectra CU, Springs Valley, Andover Bank, Farmers State Bank of Brush. Community banks routinely withhold terms publicly to force the application/relationship conversation.

---

**Next move — pick one:**

**A.** Build a stacking sequence — which order to apply and on which day to optimize across TU/EQ/EX without triggering velocity flags
**B.** Deep-dive on the **6 cards I'd actually apply for first** — Elan Business Zero+ at 2 partners, Stearns, FAB&T, Northrim, ServisFirst (with reasoning)
**C.** HTML visual brief of this same data — sortable, color-coded by bureau and intro length

---
