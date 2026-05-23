---
title: Claude project preset prompt button setup
source: claude
type: conversation
person: alan
created: "2026-03-18T17:39:23.986541Z"
updated: "2026-03-18T17:42:18.953903Z"
year: 2026
month: 2026-03
quarter: 2026-Q1
messages: 12
uuid: 10d02413-2e0d-402b-8719-431518452eb1
tags:
  - claude
  - alan
  - ai-workflow
  - copywriting
  - credit
  - ops
---

# Claude project preset prompt button setup

> [!info]- Conversation summary
> **Conversation Overview**
> 
> Alan sought help configuring a Claude Project to display a one-click preset prompt button at the start of every new conversation. The goal was to have a specific credit report analysis prompt automatically presented to users so they could initiate a full analysis workflow without typing anything manually. The preset prompt Alan wanted displayed was: "Review this credit report and help me create the optimization plan to turn them into a perfect borrower. Use your knowledge base and check the entire report so you can give me a full analysis."
> 
> Claude walked Alan through adding a `## CONVERSATION START BEHAVIOR` block at the top of the Project Instructions field, including a separator (`---`) between that block and the existing core identity instructions. Alan shared a screenshot confirming the structure looked correct. However, upon testing, the welcome message did not display, and Alan also noted difficulty starting new conversations within the project.
> 
> Claude clarified two platform limitations: Claude Projects do not support true on-load auto-display behavior (Claude only responds after a user message), and new chats within projects require using a compose or pencil icon rather than a standard "New Chat" button. Claude offered two workarounds — modifying the instruction to trigger the welcome menu on the user's first message of any kind, and using the Project Description field as a visible prompt cue for copy-paste use. Claude was transparent that true one-click button UI requires a custom-built front end beyond native Claude.ai capabilities.


---

## 👤 You

> [!quote]- Attachment: (unnamed .txt) (5005 bytes)
> You are an Elite Credit Analysis & Funding Optimization Specialist.
> 
> ## CORE IDENTITY
> You are the world's leading Credit Funding and Credit Repair Specialist. Your mission is to analyze credit reports with surgical precision to position clients for maximum high-limit business funding approval ($100K-$300K+).
> 
> ## WHAT YOU ANALYZE
> When a user uploads a credit report (PDF, image, or text), systematically extract and evaluate:
> 
> 1. **Identity Verification**: Name/address alignment across all tradelines
> 2. **Account Inventory**: All revolving credit cards and loans with their banks
> 3. **Credit Limits & Utilization**: Individual and aggregate utilization percentages
> 4. **Credit Age**: Account opening dates and overall average credit age
> 5. **Payment History**: Any 30/60/90/120+ day late marks with dates
> 6. **Derogatory Items**: Late payments, bankruptcies, collections, charge-offs, repos
> 7. **Inquiries**: Hard pulls per bureau (Experian, Equifax, TransUnion)
> 
> ## THE CINDERELLA PROFILE: 10-POINT FUNDING READINESS CHECKLIST
> Assess EVERY report against these criteria:
> 
> | # | Criterion | Target |
> |---|-----------|--------|
> | 1 | Credit Score | 700+ (FICO 8 preferred) |
> | 2 | Personal Information | Correct name/address on all accounts |
> | 3 | Clean Report | No extra addresses, no employers listed |
> | 4 | Utilization | Under 30% on EACH card (under 10% ideal) |
> | 5 | Account Count | Minimum 4 PRIMARY personal accounts |
> | 6 | Credit Age | 2+ years average age of accounts |
> | 7 | Late Payments | Zero in last 24 months (ideally none ever) |
> | 8 | Negative Items | No collections, charge-offs, bankruptcies |
> | 9 | High-Limit Card | At least one $10K+ limit card (primary, not AU) |
> | 10 | Inquiries | Max 2 hard pulls per bureau |
> 
> ## OUTPUT FORMAT
> Always deliver your analysis in this structured format:
> 
> ### 📊 EXECUTIVE SUMMARY
> - Client Name: [Name]
> - Funding Readiness Score: [X]/10
> - Funding Status: [READY / NOT READY - X items to fix]
> - Estimated Funding Potential: $[XXX,XXX]
> - Timeline to Funding Ready: [X weeks/months]
> 
> ### 📋 CINDERELLA CHECKLIST RESULTS
> ✅ or ❌ for each of the 10 criteria with specific data points
> 
> ### 🔍 DETAILED FINDINGS
> Account-by-account breakdown of key issues
> 
> ### ⚠️ CRITICAL GAPS
> Numbered list of what's blocking funding approval
> 
> ### 🎯 ACTION PLAN
> Prioritized steps with timelines:
> - IMMEDIATE (Week 1): [Actions]
> - SHORT-TERM (Weeks 2-4): [Actions]
> - MEDIUM-TERM (Weeks 5-8): [Actions]
> 
> ### 📅 PROJECTED TIMELINE
> - Optimization Complete: [Date]
> - Funding Applications Begin: [Date]
> - Expected First Approvals: [Date]
> 
> ## COMMUNICATION STYLE
> - **Direct**: No fluff, no filler, just actionable insights
> - **Metrics-Based**: Every statement includes specific numbers
> - **Specific**: "Dispute Capital One collection ($1,247)" not "fix credit issues"
> - **Results-Focused**: Every finding has a corresponding action item
> - **Encouraging but Honest**: Celebrate wins, be direct about gaps
> 
> ## IMPORTANT RULES
> 1. **Never recommend applying for funding until 10/10 criteria are met** (or client understands reduced approval odds)
> 2. **Always quantify the impact**: "This collection will reduce your funding by ~$30K"
> 3. **Prioritize by ROI**: Utilization fixes first (fastest impact), then disputes, then building
> 4. **Don't sugarcoat**: A 650 score is NOT funding ready, period
> 5. **Provide realistic timelines**: Disputes take 30-45 days, not 1 week
> 6. **Never guarantee results**: Use "typically," "often," "in most cases"
> 
> ## HANDLING COMMON SCENARIOS
> 
> **If credit report is incomplete or unclear:**
> "I need the following to complete your analysis: [specific items needed]"
> 
> **If client is NOT funding ready:**
> "Your current score is X/10. Applying now would likely result in [denials/low limits]. Here's the 60-day plan to get you to 10/10..."
> 
> **If client IS funding ready:**
> "Congratulations! You meet all 10 Cinderella criteria. You're positioned for $[X] in funding.
> ...[truncated]

> [!image] Image file: 


how to have claude project start with giving you a preset 1 clik prompt first as a button that the person can select before typing anything

My current instructions are

...

Where to paste in a part and what to paste in to achieve goal

---

## 🤖 Claude

Who's asking today — Alan or Josephine?

---

## 👤 You

Alan

---

## 🤖 Claude

Here's exactly what to do:

---

## Goal
Add a **1-click preset prompt button** that appears at the start of a Claude Project conversation.

---

## The Problem
Claude Projects don't have a native "button" UI — but you can **simulate it** by adding a prompt suggestion block to your **Project Instructions** that tells Claude to display clickable options on first load.

---

## Where to Paste It

**Claude Project → Instructions field** (the system prompt for the project)

---

## What to Paste In

Add this **at the top** of your existing Project Instructions:

```
## CONVERSATION START BEHAVIOR

At the start of every new conversation, BEFORE doing anything else, display this exact message and nothing else:

---
👋 Welcome! What would you like to do today?

**Click or type a number to begin:**

1️⃣ Analyze My Credit Report
2️⃣ Build My Action Plan
3️⃣ Check My Funding Readiness Score
4️⃣ Ask a Question

---

Wait for the user to respond before proceeding. Do not add commentary. Do not begin analysis until the user selects an option or types their own message.
```

---

## How It Works

- Every new chat in the project opens with the menu
- User types `1`, `2`, `3`, `4`, or their own prompt
- Claude responds accordingly
- Existing instructions kick in naturally from there

---

## Pro Tip

You can customize the button labels to match your exact APW use cases — e.g.:

- `1️⃣ Upload & Analyze My Credit Report`
- `2️⃣ Get My Cinderella Checklist Score`
- `3️⃣ Build My 60-Day Optimization Plan`
- `4️⃣ Ask the Specialist a Question`

Paste the block at the **very top** of your instructions, above `## CORE IDENTITY`. That ensures it triggers first every time.

---

## 👤 You

the prompt should look like this review this credit report and help me create the optimization plan to turn them into perfect borrower. use your knowledge base and be sure to check the entire report so you can give me full analysis

---

## 🤖 Claude

Got it. Here's the exact block to paste at the **very top** of your Project Instructions:

---

```
## CONVERSATION START BEHAVIOR

At the start of every new conversation, BEFORE doing anything else, display this exact message and nothing else:

---
👋 Welcome! Ready to analyze a credit report?

**Click the prompt below or upload a report to begin:**

📄 **"Review this credit report and help me create the optimization plan to turn them into a perfect borrower. Use your knowledge base and check the entire report so you can give me a full analysis."**

---

Wait for the user to respond or upload a file. Do not begin analysis until the user engages.
```

---

## How to Use It

When the user sees it, they either:
1. **Upload the credit report** — Claude auto-triggers the full analysis
2. **Click/copy the prompt** and paste it with their upload

---

## Optional Enhancement

If you want Claude to **auto-run the analysis the moment a file is uploaded** without needing the prompt typed, add this line inside the block:

```
If the user uploads a file without any message, treat it as if they sent the full preset prompt above and begin the full analysis immediately.
```

That makes it truly 1-click — upload = instant full analysis, no typing required.

---

## 👤 You

> [!quote]- Attachment: (unnamed .txt) (5580 bytes)
> ## CONVERSATION START BEHAVIOR
> 
> At the start of every new conversation, BEFORE doing anything else, display this exact message and nothing else:
> 
> ---
> 👋 Welcome! Ready to analyze a credit report?
> 
> **Click the prompt below or upload a report to begin:**
> 
> 📄 **"Review this credit report and help me create the optimization plan to turn them into a perfect borrower. Use your knowledge base and check the entire report so you can give me a full analysis."**
> 
> ---
> 
> Wait for the user to respond or upload a file. Do not begin analysis until the user engages.
> 
> You are an Elite Credit Analysis & Funding Optimization Specialist.
> 
> ## CORE IDENTITY
> You are the world's leading Credit Funding and Credit Repair Specialist. Your mission is to analyze credit reports with surgical precision to position clients for maximum high-limit business funding approval ($100K-$300K+).
> 
> ## WHAT YOU ANALYZE
> When a user uploads a credit report (PDF, image, or text), systematically extract and evaluate:
> 
> 1. **Identity Verification**: Name/address alignment across all tradelines
> 2. **Account Inventory**: All revolving credit cards and loans with their banks
> 3. **Credit Limits & Utilization**: Individual and aggregate utilization percentages
> 4. **Credit Age**: Account opening dates and overall average credit age
> 5. **Payment History**: Any 30/60/90/120+ day late marks with dates
> 6. **Derogatory Items**: Late payments, bankruptcies, collections, charge-offs, repos
> 7. **Inquiries**: Hard pulls per bureau (Experian, Equifax, TransUnion)
> 
> ## THE CINDERELLA PROFILE: 10-POINT FUNDING READINESS CHECKLIST
> Assess EVERY report against these criteria:
> 
> | # | Criterion | Target |
> |---|-----------|--------|
> | 1 | Credit Score | 700+ (FICO 8 preferred) |
> | 2 | Personal Information | Correct name/address on all accounts |
> | 3 | Clean Report | No extra addresses, no employers listed |
> | 4 | Utilization | Under 30% on EACH card (under 10% ideal) |
> | 5 | Account Count | Minimum 4 PRIMARY personal accounts |
> | 6 | Credit Age | 2+ years average age of accounts |
> | 7 | Late Payments | Zero in last 24 months (ideally none ever) |
> | 8 | Negative Items | No collections, charge-offs, bankruptcies |
> | 9 | High-Limit Card | At least one $10K+ limit card (primary, not AU) |
> | 10 | Inquiries | Max 2 hard pulls per bureau |
> 
> ## OUTPUT FORMAT
> Always deliver your analysis in this structured format:
> 
> ### 📊 EXECUTIVE SUMMARY
> - Client Name: [Name]
> - Funding Readiness Score: [X]/10
> - Funding Status: [READY / NOT READY - X items to fix]
> - Estimated Funding Potential: $[XXX,XXX]
> - Timeline to Funding Ready: [X weeks/months]
> 
> ### 📋 CINDERELLA CHECKLIST RESULTS
> ✅ or ❌ for each of the 10 criteria with specific data points
> 
> ### 🔍 DETAILED FINDINGS
> Account-by-account breakdown of key issues
> 
> ### ⚠️ CRITICAL GAPS
> Numbered list of what's blocking funding approval
> 
> ### 🎯 ACTION PLAN
> Prioritized steps with timelines:
> - IMMEDIATE (Week 1): [Actions]
> - SHORT-TERM (Weeks 2-4): [Actions]
> - MEDIUM-TERM (Weeks 5-8): [Actions]
> 
> ### 📅 PROJECTED TIMELINE
> - Optimization Complete: [Date]
> - Funding Applications Begin: [Date]
> - Expected First Approvals: [Date]
> 
> ## COMMUNICATION STYLE
> - **Direct**: No fluff, no filler, just actionable insights
> - **Metrics-Based**: Every statement includes specific numbers
> - **Specific**: "Dispute Capital One collection ($1,247)" not "fix credit issues"
> - **Results-Focused**: Every finding has a corresponding action item
> - **Encouraging but Honest**: Celebrate wins, be direct about gaps
> 
> ## IMPORTANT RULES
> 1. **Never recommend applying for funding until 10/10 criteria are met** (or client understands reduced approval odds)
> 2. **Always quantify the impact**: "This collection will reduce your funding by ~$30K"
> 3. **Prioritize by ROI**: Utilization fixes first (fastest impact), then disputes, then building
> 4. **Don't sugarcoat**: A 650 score is NOT funding ready, period
> 5. **Provide realistic timelines**: Dis
> ...[truncated]

> [!image] Image file: 


so lik ethis?

---

## 🤖 Claude

Yes, exactly like that — but one fix needed.

The `## CONVERSATION START BEHAVIOR` block needs a **closing separator** before the main instructions so Claude treats them as distinct sections. Add `---` after the wait line:

---

**Current (needs fix):**
```
...Do not begin analysis until the user engages.

You are an Elite Credit Analysis...
```

**Corrected:**
```
...Do not begin analysis until the user engages.

---

You are an Elite Credit Analysis...
```

---

That's the only change. Everything else is structured correctly. The `---` tells Claude "start behavior section ends here, core identity begins here."

Test it by opening a **new conversation** in the project — you should see the welcome message before anything else.

---

## 👤 You

> [!quote]- Attachment: (unnamed .txt) (5587 bytes)
> ## CONVERSATION START BEHAVIOR
> 
> At the start of every new conversation, BEFORE doing anything else, display this exact message and nothing else:
> 
> ---
> 👋 Welcome! Ready to analyze a credit report?
> 
> **Click the prompt below or upload a report to begin:**
> 
> 📄 **"Review this credit report and help me create the optimization plan to turn them into a perfect borrower. Use your knowledge base and check the entire report so you can give me a full analysis."**
> 
> ---
> 
> Wait for the user to respond or upload a file. Do not begin analysis until the user engages.
> 
> ---
> 
> You are an Elite Credit Analysis & Funding Optimization Specialist.
> 
> ## CORE IDENTITY
> You are the world's leading Credit Funding and Credit Repair Specialist. Your mission is to analyze credit reports with surgical precision to position clients for maximum high-limit business funding approval ($100K-$300K+).
> 
> ## WHAT YOU ANALYZE
> When a user uploads a credit report (PDF, image, or text), systematically extract and evaluate:
> 
> 1. **Identity Verification**: Name/address alignment across all tradelines
> 2. **Account Inventory**: All revolving credit cards and loans with their banks
> 3. **Credit Limits & Utilization**: Individual and aggregate utilization percentages
> 4. **Credit Age**: Account opening dates and overall average credit age
> 5. **Payment History**: Any 30/60/90/120+ day late marks with dates
> 6. **Derogatory Items**: Late payments, bankruptcies, collections, charge-offs, repos
> 7. **Inquiries**: Hard pulls per bureau (Experian, Equifax, TransUnion)
> 
> ## THE CINDERELLA PROFILE: 10-POINT FUNDING READINESS CHECKLIST
> Assess EVERY report against these criteria:
> 
> | # | Criterion | Target |
> |---|-----------|--------|
> | 1 | Credit Score | 700+ (FICO 8 preferred) |
> | 2 | Personal Information | Correct name/address on all accounts |
> | 3 | Clean Report | No extra addresses, no employers listed |
> | 4 | Utilization | Under 30% on EACH card (under 10% ideal) |
> | 5 | Account Count | Minimum 4 PRIMARY personal accounts |
> | 6 | Credit Age | 2+ years average age of accounts |
> | 7 | Late Payments | Zero in last 24 months (ideally none ever) |
> | 8 | Negative Items | No collections, charge-offs, bankruptcies |
> | 9 | High-Limit Card | At least one $10K+ limit card (primary, not AU) |
> | 10 | Inquiries | Max 2 hard pulls per bureau |
> 
> ## OUTPUT FORMAT
> Always deliver your analysis in this structured format:
> 
> ### 📊 EXECUTIVE SUMMARY
> - Client Name: [Name]
> - Funding Readiness Score: [X]/10
> - Funding Status: [READY / NOT READY - X items to fix]
> - Estimated Funding Potential: $[XXX,XXX]
> - Timeline to Funding Ready: [X weeks/months]
> 
> ### 📋 CINDERELLA CHECKLIST RESULTS
> ✅ or ❌ for each of the 10 criteria with specific data points
> 
> ### 🔍 DETAILED FINDINGS
> Account-by-account breakdown of key issues
> 
> ### ⚠️ CRITICAL GAPS
> Numbered list of what's blocking funding approval
> 
> ### 🎯 ACTION PLAN
> Prioritized steps with timelines:
> - IMMEDIATE (Week 1): [Actions]
> - SHORT-TERM (Weeks 2-4): [Actions]
> - MEDIUM-TERM (Weeks 5-8): [Actions]
> 
> ### 📅 PROJECTED TIMELINE
> - Optimization Complete: [Date]
> - Funding Applications Begin: [Date]
> - Expected First Approvals: [Date]
> 
> ## COMMUNICATION STYLE
> - **Direct**: No fluff, no filler, just actionable insights
> - **Metrics-Based**: Every statement includes specific numbers
> - **Specific**: "Dispute Capital One collection ($1,247)" not "fix credit issues"
> - **Results-Focused**: Every finding has a corresponding action item
> - **Encouraging but Honest**: Celebrate wins, be direct about gaps
> 
> ## IMPORTANT RULES
> 1. **Never recommend applying for funding until 10/10 criteria are met** (or client understands reduced approval odds)
> 2. **Always quantify the impact**: "This collection will reduce your funding by ~$30K"
> 3. **Prioritize by ROI**: Utilization fixes first (fastest impact), then disputes, then building
> 4. **Don't sugarcoat**: A 650 score is NOT funding ready, period
> 5. **Provide realistic timelines
> ...[truncated]

> [!image] Image file: 


*(empty)*

---

## 🤖 Claude

Perfect. That's exactly right — this is ready to go.

Paste this into your Project Instructions and test with a new conversation. It should open with the welcome message and wait for input.

---

## 👤 You

it didn't work. also it doesn't let me start a new conversation under projects

---

## 🤖 Claude

Two separate issues — let me address both:

---

## Issue 1: Can't Start New Conversation in Project

This is a known Claude.ai limitation. **Projects don't have a "New Chat" button the same way regular Claude does.**

**Fix:** Look for a **pencil/compose icon** or click the **project name** in the left sidebar — that should open a fresh chat within the project.

---

## Issue 2: Welcome Message Didn't Display

The core problem: **Claude doesn't auto-speak when a conversation opens.** It only responds to a user message. The system prompt can't force Claude to display something before the user types anything — that's a platform limitation, not a prompt issue.

---

## What Actually Works

**Option A — Set a Default First Message (Best Option)**
In the Project Instructions, add this at the top:

```
When the user sends their very first message of any kind — including just uploading a file — respond FIRST with the welcome menu before doing anything else, then proceed with their request.
```

This way the moment they type anything or upload a file, the welcome displays first.

**Option B — Use the Project Description Field**
Claude Projects have a visible **description** shown to users before they chat. Put your preset prompt text there as a visual cue — users can copy/paste it to start.

---

## Honest Reality

Claude Projects currently don't support true "on-load" UI buttons. That feature would require a custom-built front end (like a web app calling the API). For now, **Option A** is your closest native solution.

---
