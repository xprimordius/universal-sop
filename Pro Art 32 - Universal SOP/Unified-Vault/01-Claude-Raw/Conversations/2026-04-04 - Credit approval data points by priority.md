---
title: Credit approval data points by priority
source: claude
type: conversation
person: alan
created: "2026-04-04T22:49:36.856142Z"
updated: "2026-04-06T07:09:09.960530Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 8
uuid: 3482eeb4-1b98-4de9-a41a-c90b9a364465
tags:
  - claude
  - alan
  - apw
  - business-credit
  - credit
  - curriculum
  - dsl
  - funding
  - sales
  - teaching
  - high-signal
---

# Credit approval data points by priority

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person works in a domain involving credit education and business funding, with references to a program or curriculum called APW (likely a course or coaching product) and a framework called DSL. They asked Claude to produce a comprehensive, prioritized list of 40+ data points that bank underwriters, automated systems, and algorithms use when evaluating business credit applications. The initial request covered both personal and business credit factors, and the person then pushed Claude to expand specifically into business credit territory, providing their own domain knowledge as context — including website legitimacy, domain age, high-risk business names and industries, public directory presence (Google Business, Yelp, Facebook, Yellow Pages, TikTok, etc.), business address and phone legitimacy, DUNS number, and data uniformity across sources.
> 
> Claude produced a detailed tiered list, after which the person pushed back and asked Claude to trim it, correctly identifying that some items were marginal or inflated in importance. Claude revised the list down to approximately 35 genuinely impactful data points. The person then questioned OFAC specifically and asked what else might be questionable. Claude acknowledged OFAC is real but irrelevant to the person's audience, and further self-corrected by flagging branded email domain, 411-listed phone, high-risk business name keywords, and D&B Delinquency Predictor Score as marginal for teaching purposes. The conversation concluded with a refined core list of roughly 28–30 data points that genuinely move the needle in business credit underwriting.
> 
> The person demonstrated strong domain expertise, a low tolerance for filler or inflated claims, and a preference for direct correction when content doesn't meet their standards. They think in terms of what's teachable and actionable for their clients, not just what's technically true. Claude was asked repeatedly to cut and self-audit, which is a clear pattern preference — this person wants precision over comprehensiveness and will push back on anything that feels like padding. The conversation ended with Claude offering to format the final list for curriculum use, which was not yet accepted or declined.


---

## 👤 You

What are the 40+ different data points by priority that bank underwriters, systems, and algorithms use to approve or deny credit applications and auto approvals

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants a comprehensive list of 40+ data points used by bank underwriters and automated systems to evaluate credit applications. This is squarely in his expertise zone (credit/funding), so I should be thorough, precise, and organized — but not fluffy. He wants priority order.
> 
> Let me think through all the data points banks use across personal credit cards, business credit cards, and unsecured lending. I'll organize by priority tiers.
> 
> This is knowledge I can answer from training data — no search needed. Let me be comprehensive and structured.


Hey Alan. Here's the full breakdown — organized by weight/priority tier as used across automated decisioning engines (FICO-driven), manual underwriting, and hybrid systems.

---

## Tier 1 — Primary Decisioning (Heaviest Weight)

1. **FICO Score (or VantageScore)** — single strongest auto-approval/denial trigger
2. **Number of recent hard inquiries (6–12 months)** — velocity signal
3. **Total revolving utilization ratio** — aggregate across all cards
4. **Individual card utilization** — per-tradeline basis
5. **Derogatory marks** — collections, charge-offs, bankruptcies, tax liens
6. **Payment history (30/60/90/120+ day lates)** — recency matters more than count
7. **Stated/verified annual income** — drives credit limit ceiling
8. **Debt-to-income ratio (DTI)** — especially for banks that calculate it (Chase, Amex)
9. **Existing relationship with the issuer** — current accounts, deposits, history
10. **Age of oldest account (AAoA)** — thin file vs. seasoned file

---

## Tier 2 — Secondary Decisioning (Strong Influence)

11. **Average age of accounts (AAoA across all tradelines)**
12. **Number of open revolving accounts**
13. **Number of open installment accounts**
14. **Total number of accounts (open + closed)**
15. **Recent new accounts opened (last 6–24 months)** — Chase 5/24 lives here
16. **Months since most recent account opened**
17. **Months since most recent derogatory**
18. **Total available credit (aggregate credit limits)**
19. **Housing payment (rent/mortgage) vs. income**
20. **Employment status and length of employment**

---

## Tier 3 — Behavioral & Velocity Signals

21. **Months since last hard inquiry**
22. **Number of inquiries per bureau (bureau-specific)**
23. **Balance trends (increasing vs. decreasing over 3–6 months)**
24. **Number of accounts with balances**
25. **Ratio of accounts with balances to total accounts**
26. **Credit limit trends** — CLIs granted or denied recently
27. **Number of accounts opened in last 12 months specifically**
28. **Mix of credit types** — revolving, installment, mortgage, auto
29. **Presence of mortgage tradeline** — stability signal
30. **Authorized user accounts vs. primary holder accounts**

---

## Tier 4 — Issuer-Specific & Internal Signals

31. **Internal profitability score** — revenue from interest, fees, swipe volume
32. **Existing deposit relationship size** — especially Chase, BofA, US Bank
33. **Prior application history with issuer** — recent denials flag
34. **Spend velocity on existing issuer cards** — Amex watches this closely
35. **Payment behavior on existing issuer accounts** — paying in full vs. revolving
36. **ChexSystems / EWS report** — bank account history, closures, fraud flags
37. **Product-specific rules** — e.g., Amex 1-per-5 days, 2-in-90, once-per-lifetime
38. **Geographic/address verification** — fraud scoring, OFAC screening
39. **Time at current address**
40. **Social Security Number age/issuance consistency**

---

## Tier 5 — Fraud, Identity & Compliance Filters

41. **Identity verification score (ID Analytics, LexisNexis)**
42. **OFAC / sanctions screening**
43. **Synthetic identity flags** — SSN/name/DOB mismatch patterns
44. **IP address / device fingerprint** (online apps)
45. **Application velocity across issuers** — flagged via inquiry clustering
46. **Email age / phone number verification** (some fintech and online-first issuers)
47. **Bank account verification / funding source** (for secured or deposit-linked products)
48. **Public records** — judgments, liens beyond what's on bureau
49. **Business entity verification** (for biz cards) — EIN age, SOS filing, D&B/SBFE file
50. **Stated business revenue vs. industry norms** — plausibility check on biz apps

---

## Bonus — Often Overlooked

51. **Number of recent balance transfers** — signals rate-chasing
52. **Cash advance usage history** — negative behavioral signal
53. **Returned payments / NSFs on existing accounts**
54. **Disputes filed with bureaus** — some systems flag high dispute activity
55. **Account management behavior** — closing cards shortly after opening

---

**Key insight for your APW content:** Most applicants only think about #1 (score) and maybe #6 (lates). The edge is in controlling #2, #3, #15, #20, #31–35, and #49 — which is exactly where your fundability framework lives.

Want me to map these to specific APW lesson modules or build this into a client-facing asset?

---

## 👤 You

for business credit

including and not limited to website, high risk name, high risk industry, domain age, public presence like via yellow pages, yelp, facebook,  google business, tik tok , etc. business address legitimacy, business phone number legitimacy, duns nunber, uniform data across all sources, etc

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants a comprehensive list of 40+ data points that business credit underwriters, algorithms, and systems use — specifically for business credit applications. He's given me a good starting framework of what to include. Let me build this out comprehensively, organized by priority tier.


## Business Credit Approval Data Points — Full Matrix by Priority

---

### Tier 1 — Primary Automated Decisioning

1. **Personal FICO score of guarantor/owner** — still #1 for most unsecured biz credit
2. **Personal credit utilization (revolving)** — aggregated and per-card
3. **Business credit score (D&B PAYDEX)** — 80+ is the benchmark
4. **D&B Delinquency Predictor Score**
5. **D&B Financial Stress Score**
6. **Experian Business Intelliscore Plus**
7. **FICO SBSS (Small Business Scoring Service)** — SBA and many lenders use this; blends personal + business
8. **SBFE (Small Business Financial Exchange) data** — payment history reported by biz lenders
9. **Stated annual business revenue** — plausibility-checked against industry norms
10. **Time in business (years/months)** — 2+ years is the major threshold

---

### Tier 2 — Entity Legitimacy & Structure

11. **EIN (Employer Identification Number) — age and active status**
12. **Secretary of State filing** — active/good standing vs. dissolved/delinquent
13. **Entity type** — LLC, S-Corp, C-Corp, Sole Prop (sole prop = weakest)
14. **Business formation date vs. stated "time in business"** — inconsistency = flag
15. **Registered agent on file**
16. **Business address type** — commercial lease, home, virtual office, UPS Store
17. **Business address deliverability (USPS validation)**
18. **Business phone number** — listed, verifiable, 411-listed, toll-free vs. cell
19. **Phone number listed with directory assistance (411/ListedBy)**
20. **DUNS Number — existence, age, and completeness of D&B profile**
21. **Data uniformity / consistency** — exact name, address, phone, EIN match across ALL sources (this alone kills more apps than people realize)

---

### Tier 3 — Online & Public Presence Signals

22. **Business website — exists, functional, professional**
23. **Domain age** — older = more credible; brand-new domain = flag
24. **Domain WHOIS data** — privacy-protected is fine, but registration date matters
25. **SSL certificate (HTTPS)** — basic trust signal
26. **Website content quality** — real product/service pages vs. placeholder/template
27. **Google Business Profile — verified, active, reviews**
28. **Yelp listing — claimed, consistent NAP (Name/Address/Phone)**
29. **Facebook Business Page — active, consistent info**
30. **LinkedIn Company Page**
31. **Better Business Bureau (BBB) listing**
32. **Yellow Pages / YP.com listing**
33. **Apple Maps / Bing Places listing**
34. **TikTok, Instagram, or other social presence** — increasingly checked by manual reviewers
35. **Industry-specific directories** — Angi, Healthgrades, Avvo, etc. depending on vertical
36. **Consistency of NAP data across ALL directories** — even one mismatch (suite number, abbreviation, phone format) can trigger flags

---

### Tier 4 — Financial & Banking Signals

37. **Business bank account — exists, age, average balance**
38. **Bank account average daily balance (ADB)** — especially for fintech and LOC lenders
39. **Monthly deposits / revenue via bank statements** — many lenders verify stated revenue here
40. **Deposit consistency vs. volatility**
41. **NSF (non-sufficient funds) / overdraft history**
42. **Negative balance days**
43. **Number of business bank accounts / banking relationships**
44. **Merchant processing volume** (if applicable) — signals real revenue
45. **Business tax returns filed (most recent 1–2 years)** — doc lenders weight this heavily; no-doc lenders skip it but still may verify entity via IRS

---

### Tier 5 — Industry, Risk & Compliance Flags

46. **SIC / NAICS code — industry classification**
47. **High-risk industry flag** — cannabis, firearms, adult, crypto, gambling, nutraceuticals, collections, money services, bail bonds, etc.
48. **High-risk business name keywords** — if the legal or DBA name contains words associated with restricted industries, automated systems flag it before a human ever looks
49. **OFAC / sanctions screening on entity and owners**
50. **Licensing and permits** — especially for regulated industries (contractors, medical, financial services)
51. **Litigation / judgment / lien history on entity** — UCC filings, tax liens, civil judgments
52. **UCC filings — existing liens against the business**
53. **State tax standing** — delinquent state taxes can surface in underwriting

---

### Tier 6 — Owner / Guarantor Profile

54. **Ownership percentage** — 20%+ typically triggers personal guarantee requirement
55. **Owner personal credit inquiries (recent velocity)**
56. **Owner personal derogatory marks**
57. **Owner personal DTI**
58. **Owner time at current address**
59. **Owner other business affiliations** — multiple entities can be positive (experience) or negative (spread thin / stacking risk)
60. **Owner public records — bankruptcies, judgments, liens on personal profile**

---

### Tier 7 — Behavioral & Application-Level Signals

61. **Application consistency** — does stated revenue, time in business, and industry match what's verifiable?
62. **Application velocity** — how many biz credit apps across lenders in a short window
63. **Existing trade references on D&B file** — number and quality of reporting vendors
64. **Net 30/60/90 account payment history** — the foundation of the D&B file
65. **Number of trade lines on business credit file**
66. **Credit limit utilization on existing biz tradelines**
67. **Prior relationship with the specific lender**
68. **Business credit card payment behavior** — PIF vs. revolving vs. late

---

### Often Overlooked / Underestimated

69. **Virtual office / mail forwarding detection** — Regus, WeWork, iPostal flagged by some systems
70. **Google Street View verification** — some underwriters literally check if the address looks like a real business
71. **Email domain** — `@gmail.com` vs. `@yourbusiness.com` — branded email = credibility signal
72. **Voicemail / IVR setup on business phone** — professional greeting vs. generic voicemail
73. **D&B "Comprehensive Report" completeness** — missing fields (employee count, revenue range, SIC) weaken the file

---

## The #1 Killer Most Applicants Don't Know

**Data inconsistency across sources.** If the business name on the SOS filing says "Skyward USA, Inc." but the bank account says "Skyward USA LLC" and the Google listing says "Skyward" and the D&B file says "Skyward USA Inc" (no period) — automated systems flag it. Every abbreviation, comma, suite number, and phone format matters.

This is a massive teaching point for your APW curriculum — it's the gap between "good credit" and "actually fundable."

---

Want me to turn this into a client-facing asset, map it to your course modules, or build it into the DSL framework?

---

## 👤 You

some of these seem BS. please trim

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants me to trim the list to only the data points that genuinely matter in real-world business credit underwriting — cut anything that's speculative, marginal, or inflated in importance.
> 
> Let me be honest about what actually moves the needle vs. what I padded in there.


Fair call. Here's the trimmed list — only data points that genuinely drive approvals/denials in real-world underwriting.

---

### Personal Credit (Guarantor)

1. Personal FICO score
2. Personal revolving utilization
3. Personal payment history (lates, derogatories)
4. Personal inquiries (recent velocity)
5. Personal DTI
6. Personal public records (BK, liens, judgments)

### Business Credit Scores & Trade History

7. D&B PAYDEX score
8. D&B Delinquency Predictor Score
9. Experian Intelliscore Plus
10. FICO SBSS score
11. Number of trade lines reporting on biz file
12. Net 30/60/90 payment history
13. Existing biz credit utilization

### Entity Legitimacy

14. EIN — active, age
15. Secretary of State — active/good standing
16. Entity type (LLC, S-Corp, C-Corp vs. sole prop)
17. Time in business
18. DUNS number — exists, profile completeness
19. Data uniformity across all sources (name, address, phone, EIN — exact match everywhere)

### Business Financials

20. Stated annual revenue (plausibility-checked)
21. Business bank account — exists, age, average balance
22. Monthly deposit volume/consistency
23. NSF/overdraft history
24. UCC filings / existing liens

### Address & Phone

25. Business address type — commercial vs. home vs. virtual (virtual gets flagged)
26. Business phone — verifiable, 411-listed
27. Branded email domain vs. Gmail/Yahoo

### Online Presence

28. Business website — exists, functional, domain age
29. Google Business Profile — verified
30. General web presence consistency (Facebook, Yelp, directories — matters mainly for NAP consistency, not individually)

### Risk Flags

31. High-risk SIC/NAICS code
32. High-risk keywords in business name
33. OFAC/sanctions screening
34. Application consistency — does stated info match verifiable data
35. Application velocity across lenders

---

**Cut:** TikTok, Instagram, LinkedIn, Apple Maps, Bing Places, Google Street View, voicemail greeting, SSL certificate, BBB listing, owner time at address, registered agent, tax returns (only matters for doc deals), merchant processing volume (niche), and several others that were real but marginal.

35 data points that actually matter. Want me to build this into a client-facing fundability checklist?

---

## 👤 You

this is better. OFAC i've never heard of. but what else

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is questioning OFAC and asking what else might be BS or marginal. Let me think about this honestly.
> 
> OFAC (Office of Foreign Assets Control) is real — it's a mandatory compliance screening that every financial institution runs. It's not optional. But from the applicant's perspective, it's not something they can optimize or control (unless they're on a sanctions list, in which case they have bigger problems). So it's not really a "fundability" data point that matters for his audience.
> 
> Let me think about what else on the list is marginal or not really actionable for his APW clients:
> 
> - **OFAC** — real but irrelevant to his audience. It's a compliance checkbox, not a fundability lever.
> 
> 
> - **High-risk keywords in business name** — automated systems do flag certain words, but it's pretty rare in practice.
> - **Branded email domain vs. Gmail** — most lenders don't really care about this. Manual underwriters might notice it, but it's not moving the needle on automated decisions.
> - **411-listed phone** — this mattered more in the past. It still helps with D&B profile building but isn't a major factor in actual lending decisions.
> - **D&B Delinquency Predictor Score** — it exists, but I'm wondering how many lenders actually pull this separately versus just looking at PAYDEX instead.
> 
> I should be honest about which of these are actually marginal.


OFAC is real — it's a federal sanctions screening every bank is legally required to run. But it's a compliance checkbox, not a fundability lever. Your clients will never fail OFAC unless they're on a terrorist watchlist. Not relevant to teach.

Other ones I'd flag as marginal for your audience:

- **Branded email domain** — manual reviewers might notice, but it's not driving automated approvals/denials. Nice-to-have, not make-or-break.
- **411-listed phone** — matters for building the D&B profile, but most lenders aren't checking 411 directly in underwriting anymore. It's more of a D&B file completeness play.
- **High-risk business name keywords** — real but edge-case. Only matters if someone literally names their LLC something flaggable. Worth a quick mention, not a full lesson.
- **D&B Delinquency Predictor Score** — real score, but most lenders just look at PAYDEX. Listing it separately overstates its independent weight.

**What I'd keep as the true core for APW:**

Personal credit profile (score, utilization, history, inquiries), business credit scores (PAYDEX, Intelliscore, SBSS), entity legitimacy (EIN, SOS, entity type, time in business, DUNS), financials (bank account, revenue, deposits, liens), data uniformity, business address type, web presence/domain age, risk codes, and application behavior.

That's roughly **28–30 real data points** that actually move the needle.

Want me to lock that final list and format it for your curriculum?

---
