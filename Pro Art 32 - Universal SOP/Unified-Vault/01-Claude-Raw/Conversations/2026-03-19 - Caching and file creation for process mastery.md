---
title: Caching and file creation for process mastery
source: claude
type: conversation
person: alan
created: "2026-03-19T03:37:19.734874Z"
updated: "2026-03-19T04:53:18.414576Z"
year: 2026
month: 2026-03
quarter: 2026-Q1
messages: 8
uuid: 5237ef1f-510a-4018-ade0-06b17d48b1ed
tags:
  - claude
  - alan
  - ai-workflow
  - apw
  - sales
  - sales-framework
  - teaching
  - high-signal
---

# Caching and file creation for process mastery

> [!info]- Conversation summary
> **Conversation overview**
> 
> Alan is building a sales coaching and training practice called Ascend Prime Wealth (APW) and is working to master Constantine's Sales Structure alongside Gabe Mora's Bulletproof Process. The conversation focused on two main areas: creating operational mastery tools to accelerate sales training, and preparing strategic questions for an upcoming 1-on-1 session with Constantine about APW's offer structure and organic sales flow.
> 
> In the first part of the conversation, Alan asked what files or cached resources would help him master the sales process more effectively. Claude assessed the existing project knowledge (12 lesson transcripts, Constantine's raw structure, and coaching instructions) and identified four high-leverage operational tools that were missing. Claude then built all four as professionally designed PDFs: a Live Call Battle Card (single-page quick reference covering all four phases, key scripts, objection hierarchy, and silence moments), an Objection Handling Flowchart (visual decision tree mapping prospect responses to the correct handling path), a Script Library by Phase (every critical script from all 12 lessons organized with context, psychology, weak vs. strong versions), and a Call Review Diagnostic Template (phase-by-phase scoring checklist with root cause analysis and action item sections for reviewing recorded calls).
> 
> In the second part, Alan asked what questions to bring Constantine for a 1-on-1 focused on APW's offer and organic flow. Claude noted the absence of specific offer details in the project and provided a structured question set organized by category: offer architecture, organic pipeline, discovery customization, and objection handling. When Alan clarified he does not yet have a pitch built and needs guidance on an ascension model with multiple price points, Claude reframed the question set entirely around offer construction — covering offer clarity, ascension model architecture (tier structure, pricing psychology, what each tier solves vs. leaves open), pitch construction, sales gaps specific to multi-tier offers, and a meta question asking Constantine to architect the full model live. Claude recommended Alan prepare a one-page brief on APW's avatar and offer thinking to hand Constantine at the start of the session to skip setup time, and offered to help build that brief.


---

## 👤 You

is there anything we need to cache, or create new files, to better master this process and training to  mastery?

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is asking whether there's anything we should cache or create as files to better support mastering the sales training process. Let me think about what would be most useful.
> 
> Let me first search the project knowledge to understand what's already available, then assess what additional resources could be created.


> [!abstract]- Tool call: project_knowledge_search
> {"query": "sales structure framework overview"}


> [!note]- Claude's thinking
> Let me search for more specific content to understand what's in the project knowledge.


> [!abstract]- Tool call: project_knowledge_search
> {"query": "Constantine sales process phases objection handling"}


> [!note]- Claude's thinking
> Let me check what files are available in the project directory.


> [!abstract]- Tool call: view
> {"description": "Check all project files available", "path": "/mnt/project"}


> [!abstract]- Tool result: view
> 3.3M	/mnt/project
> 11K	/mnt/project/6_10_-_Handling_Money_-_Transcript.txt
> 3.5K	/mnt/project/6_11_-_Handling_Logistics_-_Transcript.txt
> 14K	/mnt/project/6_12_-_BONUS_-_Partner_-_Responsibility_Close_-_Transcript.txt
> 2.0K	/mnt/project/6_13_-_APW_Constantine_s_Sales_Structure.txt
> 8.5K	/mnt/project/6_15_-_CLAUDE_-_PROJECT_INSTRUCTIONS_Sales_Mastery_Coach.md
> 25K	/mnt/project/6_16_-_MASTER_PROJECT_INSTRUCTIONS_v2.md
> 13K	/mnt/project/6_1a_-_The_Bullet_Proof_Sales_Process_Intro_-_Transcript.txt
> 3.0M	/mnt/project/6_1b__The_Bullet_Proof_Sales_Process_Intro__Sales_Masterclass.pdf
> 33K	/mnt/project/6_1c_-_ ...[truncated]


> [!note]- Claude's thinking
> Now let me look at the master instructions and the Claude project instructions to understand what's already structured.


> [!abstract]- Tool call: view
> {"description": "Check the Claude project instructions", "path": "/mnt/project/6_15_-_CLAUDE_-_PROJECT_INSTRUCTIONS_Sales_Mastery_Coach.md"}


> [!abstract]- Tool result: view
> 1	# SALES MASTERY COACH — PROJECT INSTRUCTIONS
>      2	
>      3	## IDENTITY
>      4	
>      5	You are The Sales Mastery Coach — an elite-level consultative sales training AI built on Constantine's Sales Structure (the immutable architectural core) enriched by Gabe Mora's Bulletproof Sales Process (tactical depth for every phase).
>      6	
>      7	Your purpose: ensure every student becomes an outstanding, proficient master of high-ticket sales. You teach FRAMES (ways of thinking), not just scripts. You develop the ability to handle ANY situation by understanding the psychology beneath the words.
>  ...[truncated]


> [!note]- Claude's thinking
> Now let me check the master instructions v2 to see what's there vs what's in the system prompt Alan sent.


> [!abstract]- Tool call: view
> {"description": "Check Constantine's sales structure file", "path": "/mnt/project/6_13_-_APW_Constantine_s_Sales_Structure.txt"}


> [!abstract]- Tool result: view
> 1	Intro
>      2	
>      3	
>      4	Welcome, location, source, why us 
>      5	Strong frame (pressure-off agenda)
>      6	
>      7	
>      8	
>      9	
>     10	Discovery (Purpose: to get 
>     11	a) the information we need that is relevant to what we will pitch, 
>     12	b) reveal emotional leverage for the prospect to take action now, 
>     13	c) build rapport, and 
>     14	d) eliminate objections before the close) 
>     15	
>     16	
>     17	Main challenge (label with specific problem)
>     18	
>     19	
>     20	Background* (gather info/criteria for positioning/differentiation)
>     21	* Fina ...[truncated]


> [!note]- Claude's thinking
> Now I have a clear picture of what's available. Let me think about what would be most useful to create as reference files for mastery.
> 
> The project has:
> 1. All transcript files (6.1 through 6.12)
> 2. Constantine's raw structure (6.13)
> 3. Claude project instructions (6.15) - a condensed version
> 4. Master project instructions v2 (6.16) - the full detailed version (which is also in the system prompt)
> 5. The PDF of the sales masterclass intro
> 
> What's MISSING that would accelerate mastery:
> 
> 1. **Quick Reference / Cheat Sheet** - A single-page battle card for live calls (the hierarchy, key scripts, decision trees)
> 
> 
> 2. **Objection Handling Decision Tree** - A visual flowchart mapping prospect responses to the right path forward
> 3. **Discovery Question Bank** - All discovery questions organized by sub-phase with depth prompts
> 4. **Call Diagnostic Checklist** - A structured framework for reviewing recorded calls
> 5. **Script Library** - All critical scripts extracted and organized by phase and situation
> 6. **Role-Play Scenario Bank** - Pre-built prospect profiles with different objection types for practice
> 7. **Common Mistakes & Fixes** - The most frequent errors mapped to root causes and exact fixes
> 
> I should propose these to Alan and start building the highest-impact ones first.


Good question. You've got the raw training (transcripts), the immutable architecture (Constantine's structure), and the master coaching instructions. What's missing are **operational mastery tools** — files that compress everything into formats you can use in the field and during practice.

Here's what I'd build, ranked by leverage:

---

**HIGH LEVERAGE — Build Now**

**1. Live Call Battle Card** (1-page PDF or doc)
Single-page reference for during/before calls. The full phase sequence, key transition scripts, objection hierarchy decision tree, and the "shut up" moments — all scannable in 5 seconds.

**2. Objection Handling Flowchart** (visual decision tree)
Prospect says X → you go here. Covers: smokescreen detection → which of the 3 scripts to use based on what you sense → money vs fear vs logistics routing → exact scripts at each node. This is the chess map.

**3. Script Library by Phase** (organized reference doc)
Every critical script extracted from all 12 lessons, organized by phase. Copy-paste ready. Includes: the why behind each script, when to deploy it, and what a weak version sounds like vs the strong version.

**4. Call Review Diagnostic Template** (structured checklist)
For reviewing your own recorded calls. Phase-by-phase scoring: did you hit it, skip it, go shallow? Auto-identifies root cause patterns (shallow discovery, skipped commitment, misdiagnosed objection type, etc.).

---

**MEDIUM LEVERAGE — Build After Core 4**

**5. Role-Play Scenario Bank** — 10-15 pre-built prospect profiles with specific objection combos (fear + money stacking, deep partner resistance, closed-off "just saw the ad" prospect, etc.) so you can drill specific situations.

**6. Common Mistakes → Root Cause → Fix Map** — The top 15-20 failure patterns from the training mapped to: what it looks like, why it happens, and the exact correction with script language.

**7. Discovery Depth Guide** — Every discovery sub-phase with: the opening question, 3-5 depth follow-ups for common surface answers, and examples of "gold" responses vs "surface" responses you need to push through.

---

What I'd recommend: let me build **#1 (Battle Card)** and **#2 (Objection Flowchart)** first — those give you the most immediate operational value. Then #3 and #4.

Want me to start building? And which format do you want — PDFs you can print, docs you can edit, or both?

---

## 👤 You

yes

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants me to build these files. Let me start with #1 (Battle Card) and #2 (Objection Flowchart). I'll need to read the skill files for the appropriate format, then build them.
> 
> Let me think about format - he said "yes" to both. Let me build PDFs he can print AND make them high quality. Let me start with the Battle Card.
> 
> Let me read the relevant skill files first, then build both documents.


> [!abstract]- Tool call: view
> {"description": "Read PDF skill for creating high-quality PDFs", "path": "/mnt/skills/public/pdf/SKILL.md"}


> [!abstract]- Tool result: view
> 1	---
>      2	name: pdf
>      3	description: Use this skill whenever the user wants to do anything with PDF files. This includes reading or extracting text/tables from PDFs, combining or merging multiple PDFs into one, splitting PDFs apart, rotating pages, adding watermarks, creating new PDFs, filling PDF forms, encrypting/decrypting PDFs, extracting images, and OCR on scanned PDFs to make them searchable. If the user mentions a .pdf file or asks to produce one, use this skill.
>      4	license: Proprietary. LICENSE.txt has complete terms
>      5	---
>      6	
>      7	# PDF Processing Guide
>       ...[truncated]


> [!note]- Claude's thinking
> Let me build both files. I'll use reportlab for high-quality PDFs. Let me start with the Battle Card, then the Objection Flowchart.
> 
> Let me build these as polished, professional PDFs using reportlab. I need to create comprehensive, well-designed documents.
> 
> Let me start coding.


Building both now. Starting with the Battle Card, then the Objection Flowchart.

> [!abstract]- Tool call: bash_tool
> {"description": "Check available Python packages for PDF creation", "command": "pip list 2>/dev/null | grep -iE \"reportlab|pypdf|pdfplumber\" && echo \"---\" && python3 -c \"from reportlab.lib.pagesizes import letter; print('reportlab OK')\" 2>&1"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"pdfplumber                 0.11.9\npypdf                      5.9.0\npypdfium2                  5.4.0\nreportlab                  4.4.10\n---\nreportlab OK\n","stderr":""}


> [!note]- Claude's thinking
> Good, reportlab is available. Let me build both PDFs now. I'll create professional, high-quality documents.


> [!abstract]- Tool call: create_file
> {"description": "Create the Live Call Battle Card PDF - single page reference for during/before calls", "path": "/home/claude/battle_card.py", "file_text": "#!/usr/bin/env python3\n\"\"\"\nLIVE CALL BATTLE CARD — 1-Page Quick Reference\nBuilt from Constantine's Sales Structure + Gabe Mora's Bulletproof Process\n\"\"\"\n\nfrom reportlab.lib.pagesizes import letter\nfrom reportlab.lib.units import inch\nfrom reportlab.lib.colors import HexColor, white, black\nfrom reportlab.pdfgen import canvas\nfrom reportlab.lib.enums import TA_LEFT, TA_CENTER\nfrom reportlab.platypus import Paragraph\nfrom re ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/battle_card.py


> [!note]- Claude's thinking
> Now let me run it and build the objection flowchart too.


> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude && python3 battle_card.py 2>&1", "description": "Generate the battle card PDF"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"Battle Card saved to /home/claude/battle_card.pdf\n","stderr":""}


> [!note]- Claude's thinking
> Good, battle card is created. Now let me build the objection handling flowchart.


Now building the Objection Handling Flowchart:

> [!abstract]- Tool call: create_file
> {"description": "Create the Objection Handling Flowchart PDF - visual decision tree for navigating objections", "file_text": "#!/usr/bin/env python3\n\"\"\"\nOBJECTION HANDLING FLOWCHART — Visual Decision Tree\nBuilt from Constantine's Sales Structure + Gabe Mora's Bulletproof Process\n\"\"\"\n\nfrom reportlab.lib.pagesizes import letter\nfrom reportlab.lib.units import inch\nfrom reportlab.lib.colors import HexColor, white, black\nfrom reportlab.pdfgen import canvas\n\nWIDTH, HEIGHT = letter\n\n# Colors\nDARK_BG = HexColor(\"#0F172A\")\nPURPLE = HexColor(\"#7C3AED\")\nPURPLE_LIGHT = HexColor( ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/objection_flowchart.py


> [!note]- Claude's thinking
> Let me run the flowchart script.


> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude && python3 objection_flowchart.py 2>&1", "description": "Generate the objection handling flowchart PDF"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"Flowchart saved to /home/claude/objection_flowchart.pdf\n","stderr":""}


> [!note]- Claude's thinking
> Now let me also build the Script Library by Phase (#3) and the Call Review Diagnostic Template (#4) since he said yes to everything. Let me build these as well.


Now building **#3 Script Library** and **#4 Call Review Diagnostic Template**:

> [!abstract]- Tool call: view
> {"description": "Read docx skill for creating Word documents", "path": "/mnt/skills/public/docx/SKILL.md"}


> [!abstract]- Tool result: view
> 1	---
>      2	name: docx
>      3	description: "Use this skill whenever the user wants to create, read, edit, or manipulate Word documents (.docx files). Triggers include: any mention of 'Word doc', 'word document', '.docx', or requests to produce professional documents with formatting like tables of contents, headings, page numbers, or letterheads. Also use when extracting or reorganizing content from .docx files, inserting or replacing images in documents, performing find-and-replace in Word files, working with tracked changes or comments, or converting content into a polished Word documen ...[truncated]


> [!note]- Claude's thinking
> I'll build the Script Library and Call Review Template as well-structured PDFs using reportlab since the user wants printable reference tools.


> [!abstract]- Tool call: create_file
> {"description": "Create the Script Library by Phase - comprehensive reference of all critical scripts organized by sales phase", "file_text": "#!/usr/bin/env python3\n\"\"\"\nSCRIPT LIBRARY BY PHASE — Complete Script Reference\nEvery critical script from Constantine's Sales Structure + Gabe Mora's Bulletproof Process\nOrganized by Phase with: The Script | When to Use | Why It Works | Weak Version vs Strong Version\n\"\"\"\n\nfrom reportlab.lib.pagesizes import letter\nfrom reportlab.lib.units import inch\nfrom reportlab.lib.colors import HexColor, white\nfrom reportlab.pdfgen import canvas\n\n ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/script_library.py


> [!note]- Claude's thinking
> Let me run this and then create the call review template.


> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude && python3 script_library.py 2>&1", "description": "Generate the script library PDF"}


> [!abstract]- Tool result: bash_tool
> {"returncode":1,"stdout":"Traceback (most recent call last):\n  File \"/home/claude/script_library.py\", line 535, in <module>\n    builder.build()\n  File \"/home/claude/script_library.py\", line 531, in build\n    print(f\"Script Library saved to {output_path}\")\n                                     ^^^^^^^^^^^\nNameError: name 'output_path' is not defined\n","stderr":""}


> [!note]- Claude's thinking
> Fix the error - need to store the output path.


> [!abstract]- Tool call: str_replace
> {"description": "Fix the output_path reference", "path": "/home/claude/script_library.py", "old_str": "    def __init__(self, output_path):\n        self.c = canvas.Canvas(output_path, pagesize=letter)\n        self.page_num = 0", "new_str": "    def __init__(self, output_path):\n        self.output_path = output_path\n        self.c = canvas.Canvas(output_path, pagesize=letter)\n        self.page_num = 0"}


> [!abstract]- Tool result: str_replace
> Successfully replaced string in /home/claude/script_library.py


> [!note]- Claude's thinking
> Also need to fix the reference to output_path in the save method.


> [!abstract]- Tool call: str_replace
> {"description": "Fix output_path reference in save", "new_str": "        print(f\"Script Library saved to {self.output_path}\")", "old_str": "        print(f\"Script Library saved to {output_path}\")", "path": "/home/claude/script_library.py"}


> [!abstract]- Tool result: str_replace
> Successfully replaced string in /home/claude/script_library.py


> [!note]- Claude's thinking
> Now let me also fix the max_w variable in the draw_script_entry method to handle the long scripts that might overflow. Let me run it now.


> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude && python3 script_library.py 2>&1", "description": "Generate the script library PDF"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"Script Library saved to /home/claude/script_library.pdf\n","stderr":""}


> [!note]- Claude's thinking
> Now let me build the Call Review Diagnostic Template.


Now building the Call Review Diagnostic Template:

> [!abstract]- Tool call: create_file
> {"description": "Create the Call Review Diagnostic Template - structured checklist for reviewing recorded sales calls", "file_text": "#!/usr/bin/env python3\n\"\"\"\nCALL REVIEW DIAGNOSTIC TEMPLATE\nPhase-by-phase scoring checklist for reviewing sales calls\nIdentifies root causes of lost deals and missed opportunities\n\"\"\"\n\nfrom reportlab.lib.pagesizes import letter\nfrom reportlab.lib.units import inch\nfrom reportlab.lib.colors import HexColor, white\nfrom reportlab.pdfgen import canvas\n\nWIDTH, HEIGHT = letter\n\nDARK_BG = HexColor(\"#0F172A\")\nPURPLE = HexColor(\"#7C3AED\")\nPURPLE ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/call_review_diagnostic.py


> [!note]- Claude's thinking
> Let me run it.


> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude && python3 call_review_diagnostic.py 2>&1", "description": "Generate the call review diagnostic PDF"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"Call Review Diagnostic saved to /home/claude/call_review_diagnostic.pdf\n","stderr":""}


> [!note]- Claude's thinking
> All four PDFs are generated. Let me copy them to the outputs directory and present them.


> [!abstract]- Tool call: bash_tool
> {"command": "cp /home/claude/battle_card.pdf /mnt/user-data/outputs/Sales_Battle_Card.pdf\ncp /home/claude/objection_flowchart.pdf /mnt/user-data/outputs/Objection_Handling_Flowchart.pdf\ncp /home/claude/script_library.pdf /mnt/user-data/outputs/Script_Library_by_Phase.pdf\ncp /home/claude/call_review_diagnostic.pdf /mnt/user-data/outputs/Call_Review_Diagnostic.pdf\necho \"All files copied\"", "description": "Copy all PDFs to output directory"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"All files copied\n","stderr":""}


> [!note]- Claude's thinking
> Let me present all four files to the user.


> [!abstract]- Tool call: present_files
> {"filepaths": ["/mnt/user-data/outputs/Sales_Battle_Card.pdf", "/mnt/user-data/outputs/Objection_Handling_Flowchart.pdf", "/mnt/user-data/outputs/Script_Library_by_Phase.pdf", "/mnt/user-data/outputs/Call_Review_Diagnostic.pdf"]}


> [!note]- Claude's thinking
> All four PDFs are created and presented. Let me give Alan a summary of what was built.


Four operational mastery tools built and ready:

**1. Sales Battle Card** — Single-page reference for before/during calls. Full phase sequence, key scripts, objection hierarchy, silence moments. Scannable in seconds.

**2. Objection Handling Flowchart** — Visual decision tree. Prospect says X → follow this path. Smokescreen detection → 3 diagnostic scripts → duffle bag routing → money/fear/partner tracks with exact scripts at each node.

**3. Script Library by Phase** — Every critical script from all 12 lessons, organized by phase. Each entry includes: the exact script, when to use it, the psychology behind it, and weak vs strong versions.

**4. Call Review Diagnostic** — Phase-by-phase scoring checklist (1-5 scale) with checkboxes for every key moment. Includes root cause analysis section (8 most common failure patterns) and action items for next call.

---

**Next up when you're ready:**
- **#5** Role-Play Scenario Bank (10-15 prospect profiles with specific objection combos)
- **#6** Common Mistakes → Root Cause → Fix Map
- **#7** Discovery Depth Guide

These are your medium-leverage tools — drill-specific rather than call-reference. Want me to build those next?

---

## 👤 You

What specific questions can I bring Constantine for a 1 on 1 live about ascend prime wealth and its offer and organic flow

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is asking about specific questions he can bring to a 1-on-1 live session with Constantine about "Ascend Prime Wealth" (which seems to be his offer/brand) and its offer structure and organic flow. Let me search the project knowledge to see if there's any context about Ascend Prime Wealth or his specific offer.


> [!abstract]- Tool call: project_knowledge_search
> {"query": "Ascend Prime Wealth offer organic flow"}


> [!note]- Claude's thinking
> No results from project knowledge. Let me search for more context about offer structure, pitching, and the sales process from the training materials.


> [!abstract]- Tool call: project_knowledge_search
> {"query": "offer pitch structure deliverables positioning"}


> [!note]- Claude's thinking
> Let me also search past conversations for context on Ascend Prime Wealth.


> [!abstract]- Tool call: conversation_search
> {"query": "Ascend Prime Wealth offer"}


> [!abstract]- Tool result: conversation_search
> No matching conversations found.


> [!note]- Claude's thinking
> No past context on this specific offer. Let me search for more about organic flow and offer building in past conversations.


> [!abstract]- Tool call: conversation_search
> {"query": "organic sales flow offer structure pitch"}


> [!abstract]- Tool result: conversation_search
> No matching conversations found.


> [!note]- Claude's thinking
> I don't have specific context on "Ascend Prime Wealth" as an offer. But I know the full sales framework deeply. Alan wants to maximize his 1-on-1 time with Constantine by bringing sharp, high-leverage questions. Let me think about what questions would be most valuable based on the framework gaps and real-world application challenges.
> 
> The key areas where Constantine's guidance would be most valuable:
> 1. How to structure the specific APW offer within the pitch framework
> 2. Organic flow - how calls come in without paid ads, how to build the pipeline
> 3. Positioning/differentiation for his specific market
> 4. Discovery customization for his avatar
> 5. Price anchoring and value stack specific to his offer
> 
> 
> 6. Now I'm organizing these into a strategic question set that will give Alan the most actionable guidance during their time together.


I don't have context on Ascend Prime Wealth's specific offer details, avatar, or pricing in this project. That actually matters — because the sharper your questions are, the more Constantine can give you in a 1-on-1.

Here's what I'd bring, organized by highest leverage:

---

**OFFER ARCHITECTURE (get this nailed first — everything else flows from it)**

- "Here's my offer at [price]. Here's what's included. What would you change, add, or remove to make the pitch land harder?"
- "What's the ideal number of deliverables/steps to present in the pitch for my market — and how do I decide what to show vs what to bundle quietly?"
- "How do I structure my value stack and price anchor specifically for [your price point]? What total value number feels credible without feeling inflated?"
- "Do I need a pre-pitch for my market, or is the category well-known enough to skip it?"

**ORGANIC FLOW (this is where most people get stuck)**

- "What's the most efficient organic-to-call pipeline you've seen work? DM → call? Content → application → call? What converts best?"
- "How do I create content that does the PRE-SELLING so prospects arrive on calls already warm — not cold and skeptical?"
- "What's the right CTA structure for organic content that drives booked calls without sounding desperate?"
- "How many touchpoints should someone have with my content before they're ready for a call — and how do I engineer that?"
- "What's the frame I should set in the DMs or application process BEFORE the call so discovery isn't starting from zero?"

**DISCOVERY CUSTOMIZATION**

- "Given my avatar is [describe them], which discovery sub-phases need the most depth vs which can I move through quickly?"
- "What's the most common smokescreen in my market, and what's the best script to break through it?"
- "How do I handle prospects who come from organic and already know the price — they've seen it in content or DMs? Does the pitch structure change?"

**CLOSE / OBJECTION HANDLING**

- "What's the most common reason deals die in my price range, and what's the fix?"
- "If most of my prospects are [entrepreneurs / employees / etc.], should I default to the comparison disarm or duffle bag as my primary diagnostic?"
- "What payment plan structure works best at my price point for closing same-day?"

**THE ONE META QUESTION (ask this last)**

- "If you were selling my offer to my avatar, what's the ONE thing you'd do differently than what I just described?"

---

**How to maximize the session:** Come with your current pitch recorded or outlined. Walk him through it live. Let him interrupt and correct in real-time — that's worth 10x more than theoretical Q&A. The questions above fill the gaps around whatever he doesn't cover organically.

What's your offer, price point, and avatar? I can sharpen these questions to be specific to APW so you walk in locked and loaded.

---

## 👤 You

I don’t have my pitch yet. What checklist questions especially with sales gaps on my after especially around the ascension model and different price points

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is asking for checklist questions to bring to Constantine for a 1-on-1, specifically focused on:
> 1. Building his pitch (he doesn't have one yet)
> 2. Sales gaps in his offer
> 3. Ascension model structure
> 4. Different price points
> 
> He's building Ascend Prime Wealth. I don't have specifics on the offer, but I can use the framework knowledge to help him build the RIGHT questions that will extract maximum value from Constantine.
> 
> Let me think about what gaps exist when someone doesn't have a pitch yet and needs to build an ascension model.


Good — knowing you don't have the pitch yet changes everything. The 1-on-1 should be about getting Constantine to help you BUILD it, not refine it. Here's the checklist organized by what you need answered in order.

---

**BLOCK 1: OFFER CLARITY (answer these before anything else can work)**

- "Here's my avatar and their core problem. Am I framing the problem correctly, or would you position it differently?"
- "What are the 3-5 deliverables/outcomes I should build around — and which ones does my market actually pay for vs which ones they THINK they want?"
- "How do I structure my core offer so the pitch stays under 3-5 steps and doesn't turn into a 20-minute education session?"
- "What's the single transformation my offer should promise — and how do I say it in one sentence?"

**BLOCK 2: ASCENSION MODEL (this is where most people leave money on the table)**

- "How many tiers should I have, and what should each tier actually DO differently — not just 'more access' but structurally different outcomes?"
- "How do I price each tier so the jump feels logical, not arbitrary? What's the psychology behind the gap between tiers?"
- "Should my front-end offer be designed to profit or to acquire — and how does that change what I include?"
- "At what price point does the sales process need to change? Where's the line between 'can close on a single call' vs 'needs a longer sequence'?"
- "How do I build the ascension so clients naturally WANT to upgrade vs feeling nickel-and-dimed?"
- "What should the entry offer solve completely, and what should it intentionally leave open so the next tier feels necessary?"
- "Do I pitch the full ascension on the first call, or only sell the entry and upsell later? What's the timing?"

**BLOCK 3: PITCH CONSTRUCTION (build it with him live if possible)**

- "Can we build my pitch structure together right now — callback → solution → benefit for each step — using my specific offer?"
- "What social proof or certainty-building do I lead with if I'm early and don't have a ton of case studies yet?"
- "How do I value-stack across tiers without making the lower tier feel weak by comparison?"
- "What's the right price anchor for my highest tier, and what total value number do I stack to?"
- "How do I present multiple price points without creating decision paralysis? Do I offer one tier on the call and only introduce others if needed?"

**BLOCK 4: SALES GAPS (where deals will die if not addressed)**

- "If someone qualifies for my highest tier but only wants to pay entry-level — how do I handle that without discounting?"
- "How do I handle 'I'll start with the basic and upgrade later' when I know they need the higher tier?"
- "What's the right response when they compare my pricing to cheaper competitors or DIY options?"
- "At my price points, what's the most likely objection type — fear, money, or both stacked — and what's my default sequence?"
- "How do I structure payment plans across different tiers so I'm not giving away the top offer on installments that take forever?"
- "If I'm doing organic and prospects already have a sense of pricing before the call, how does that change discovery and the pitch?"

**BLOCK 5: THE BUILD QUESTION (get him to architect it with you)**

- "If you were launching this offer from scratch with my avatar and market — what would tier 1, tier 2, and tier 3 look like, what would you price them at, and what would the pitch sound like for each?"

---

**How to use this in the session:** Don't try to cover all of these. Start with Block 1 and 2 — offer clarity and ascension structure. If he builds those with you live, Block 3 becomes the natural next step. Blocks 4-5 fill remaining time.

The single highest-leverage outcome from this call: **walk away with your tier structure, price points, and core pitch skeleton written down.** Everything else — scripts, objection handling, organic flow — maps onto Constantine's framework once the offer is locked.

Want me to help you prep a one-page brief of APW's avatar, problem, and what you're thinking for the offer so you can hand it to Constantine and skip the setup time?

---
