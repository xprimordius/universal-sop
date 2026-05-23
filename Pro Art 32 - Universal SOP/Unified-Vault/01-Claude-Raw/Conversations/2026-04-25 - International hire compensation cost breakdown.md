---
title: International hire compensation cost breakdown
source: claude
type: conversation
person: alan
created: "2026-04-25T19:19:52.170008Z"
updated: "2026-04-25T19:23:28.660068Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 4
uuid: 2c16b7bc-1a60-48b9-9a38-59eb8192e5c9
tags:
  - claude
  - alan
  - hiring
---

# International hire compensation cost breakdown


---

## 👤 You

What would it cost broken down and cumulatively to implement this for an international hire?

9:30am - 6:00pm Monday - Friday 
(8 hours) 

Benefits
Paid vacation days - 10-15 days OPEN to convo
(6 paid vacation days after first 6 months)

PTO - 5 days 

3 emergency days - family dying example - paid

---

## 🤖 Claude

> [!note]- Claude's thinking
> I'm recognizing this is a hiring cost analysis question that would work well as an interactive HTML tool, but I need to first clarify which user is asking since this could relate to either Alan's APW business or Josephine's NL Core LLC operations.
> 
> Beyond that, the calculation hinges on several unknowns—the hire's country, their role level, and expected salary range all dramatically shift the total cost picture. I should ask for these specifics along with confirming who's speaking, then I can build out a proper cost breakdown. I need to use the mobile-friendly input tool to ask these three questions upfront since this is the start of the conversation and the dual-user protocol requires confirmation. I'll keep it tight and focused on what's essential to build the cost breakdown.


Quick gate before I build the cost breakdown — three things I need to lock in to give you accurate numbers (cost varies massively by country and base pay).

> [!abstract]- Tool call: ask_user_input_v0
> {"questions": [{"question": "Who's running point on this — Alan or Josephine?", "options": ["Alan (APW)", "Josephine (NL Core)"], "type": "single_select"}, {"question": "Where's the hire based?", "options": ["Philippines", "Latin America", "Eastern Europe", "Other / tell me"], "type": "single_select"}, {"question": "Base monthly pay range you're targeting?", "options": ["$800–$1,500/mo (VA tier)", "$1,500–$3,000/mo (mid)", "$3,000–$5,000/mo (senior)", "$5,000+ (specialist/exec)"], "type": "single_select"}]}


> [!abstract]- Tool result: ask_user_input_v0
> {
>   "questions": [
>     {
>       "question": "Who's running point on this \u2014 Alan or Josephine?",
>       "options": [
>         "Alan (APW)",
>         "Josephine (NL Core)"
>       ],
>       "type": "single_select"
>     },
>     {
>       "question": "Where's the hire based?",
>       "options": [
>         "Philippines",
>         "Latin America",
>         "Eastern Europe",
>         "Other / tell me"
>       ],
>       "type": "single_select"
>     },
>     {
>       "question": "Base monthly pay range you're targeting?",
>       "options": [
>         "$800\u2013$1,500/mo (VA tier)",
>         "$1,500\u2013$3,000/mo (mid)",
>  ...[truncated]


Tap the answers and I'll spin up the full breakdown — base salary, time-off cost (vacation + PTO + emergency days monetized at daily rate), effective hourly cost, and cumulative annual all-in. Country matters because statutory 13th month / severance / payroll tax differ significantly (PH = mandatory 13th month, LATAM varies by country, EE = social contributions stack high).

---

## 👤 You

Q: Who's running point on this — Alan or Josephine?
A: Alan (APW)

Q: Where's the hire based?
A: Equador

Q: Base monthly pay range you're targeting?
A: $13-$14/hr for 40hrs per week

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants a cost breakdown for hiring someone in Ecuador at $13-14 per hour for full-time work, so I'm calculating the annual and monthly salary range—roughly $27,000-$29,000 yearly or about $2,250-$2,400 monthly. The key distinction I need to clarify is whether this would be a direct employee relationship or a contractor arrangement, since that fundamentally changes the tax and compliance obligations.
> 
> If Alan hires as an employee through an Employer of Record, Ecuadorian labor law kicks in with significant mandatory costs: a 13th month bonus, a 14th month payment tied to minimum wage, employer social security contributions around 12%, reserve fund obligations after a year, and 15 days of mandatory vacation—which actually exceeds what Alan mentioned. There are also severance and profit-sharing considerations depending on the company structure. Alternatively, if structured as a contractor, it's much simpler—just the hourly rate with no additional benefits or employer obligations, though I should verify whether that's legally viable for this situation.
> 
> Now I'm calculating what the actual compensation looks like at the $13.50/hour midpoint, breaking down the annual, monthly, and weekly figures to see the full picture.
> 
> For paid time off, I need to account for the difference between year one and subsequent years — starting with just 14 days off after the first six months, then jumping to 20 days once the full benefits kick in. I should also flag that Ecuador typically observes around 12 national holidays, and it's unclear whether Alan's hire would get those, US holidays, or none at all, so that's worth clarifying.
> 
> Now I'm working through the actual annual cost calculation. The tricky part is whether the $13.50/hour rate assumes they're billing for every hour worked or if it's effectively a salary that accounts for paid time off. If they only bill hours actually worked, that's 48 weeks × 40 hours × $13.50 = $25,920. But if the rate is meant to cover the full year including PTO, then it's the full $28,080. For an international contractor with PTO benefits, the all-in cost should be $28,080 annually.
> 
> If we go the EOR route instead, I need to layer in the compliance costs: monthly EOR fees around $500-700, plus Ecuador's mandatory benefits like the 13th and 14th month payments, employer IESS contributions at 12.15%, and reserve fund accruals at 8.33%. That pushes the total to roughly $40,000-45,000 per year for the same $28K base salary.
> 
> I'm going to create a comparison showing both models side-by-side with the full cost breakdown, highlighting the key Ecuador labor law requirements that make the EOR option necessary for true compliance. The $13.50/hr rate is quite competitive for Ecuador—roughly five times the local minimum wage and comparable to premium Filipino VA rates—so this should attract strong candidates. Now I'm designing the artifact with Alan's specifications: a hero section leading with the key number, headline card, comparison blocks, data table, verdict box, and his preferred design system of Fraunces and Plus Jakarta fonts with a purple/pink/cyan/mint palette on a dark base.
> 
> Building the HTML artifact... I'm laying out the structure for this cost breakdown: a hero section with the location and total annual cost, followed by side-by-side contractor versus employee scenarios, a detailed cost table, time-off calculations, and a final recommendation box with open questions about holidays and EOR providers. The math is straightforward—$13.50/hour at 2,080 annual hours gives roughly $28K base, and I'll monetize time off at $108 per day to show the full picture.
> 
> Now I'm realizing the framing matters here: if we're paying $13.50/hour for all 52 weeks regardless of days off, the actual productive hours drop when accounting for PTO, so I need to clarify whether we're looking at the total cash outlay or the effective hourly cost per productive hour worked.
> 
> Let me work through the math at different wage levels—$13, $13.50, and $14 per hour—to show Alan how PTO impacts the true cost per productive hour, and then factor in whether we're covering federal holidays on top of that.
> 
> Now I'm building the HTML structure for a clean, visual briefing document that leads with the annual cash figure and breaks down the effective productive rate underneath.
> 
> Building the layout... The contractor model looks cleanest at around $28K annual cash outlay with an effective productive rate of $14.62/hr, avoiding Ecuador's mandatory employee benefits. I could go full compliance with an EOR like Deel for $40-45K all-in, but I need to nail down a few things first—whether to use a 1099 structure or W-2 equivalent, which holidays to observe, how to handle equipment, and if time tracking is necessary. Let me start building this out.
> 
> Actually, I'm realizing there's real classification risk here. Ecuador uses USD so no currency conversion headaches, but the set hours of 9:30am-6pm M-F is a major red flag for both the IRS and Ecuador's SRI—they'll look at fixed hours, location, equipment, and whether this is the primary income source. I need to flag that the contractor structure only works if I can genuinely treat this as a contractor arrangement rather than a disguised employee relationship. The 6 paid vacation days I mentioned earlier is also below Ecuador's statutory 15 days for employees, which only flies for contractors. Let me build out the actual document now.
> 
> Building the HTML with mobile-responsive design...


> [!abstract]- Tool call: create_file
> {"description": "International hire cost breakdown for Ecuador-based contractor at $13-14/hr", "path": "/mnt/user-data/outputs/ecuador_hire_cost_breakdown.html", "file_text": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>International Hire · Ecuador · Cost Brief</title>\n<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n<link href=\"https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0, ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /mnt/user-data/outputs/ecuador_hire_cost_breakdown.html


> [!abstract]- Tool call: present_files
> {"filepaths": ["/mnt/user-data/outputs/ecuador_hire_cost_breakdown.html"]}


**$28,080/year base · $30,460 Y1 all-in · $14.62 effective hourly.**

Inside:
- Three rate scenarios ($13 / $13.50 / $14)
- Contractor vs EOR side-by-side (~$13K/yr gap)
- Cumulative table Y1 → Y2
- PTO monetized at daily rate
- 5 open variables flagged (holidays, classification risk, 13th-month, probation, equipment)

**Next move — pick one:**

**A.** Lock the contractor path · I'll draft the Ecuador-compliant 1099-equivalent agreement (deliverables-language, W-8BEN, kill switch, equipment stipend)

**B.** Compare EOR providers · Deel vs Remote vs Oyster vs Ontop for Ecuador specifically — fees, speed, support

**C.** Add holidays + 13th-month layer · rebuild the cost model with full "premium retention" stack to see the loyalty-optimized version

---
