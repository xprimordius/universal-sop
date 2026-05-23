---
title: Exporting APW notes to Obsidian with animated grid visualization
source: claude
type: conversation
person: alan
created: "2026-04-20T01:42:56.171576Z"
updated: "2026-04-20T04:23:53.406565Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 6
uuid: 5a8bde88-2e82-42e0-bad3-cf11cbcf0d0c
tags:
  - claude
  - alan
  - ai-workflow
  - apw
  - blitz
  - curriculum
  - dsl
  - funding
  - legal
  - marketing
  - prime-protocol
  - sales
  - scio
  - teaching
  - ugc
  - vsl
  - high-signal
---

# Exporting APW notes to Obsidian with animated grid visualization

> [!info]- Conversation summary
> **Conversation Overview**
> 
> Alan asked Claude to build a complete, importable Obsidian vault for his business, Ascend Prime Wealth (APW), structured so that notes would automatically group into visual neural clusters in Obsidian's graph view. The core request had two parts: export his existing APW notes into properly formatted Obsidian markdown files, and establish a naming convention system that would allow all future Claude outputs to seamlessly integrate into the same vault without restructuring.
> 
> Claude built a 46-file vault from scratch across 10 folders covering every domain of the APW business: company profile and brand identity, offers (Blitz Path and Prime Protocol), curriculum architecture (six Skool classrooms using the MTP lesson format), marketing assets (Reels strategy, four content pillars, VSL and DSL frameworks), partnerships (SCIO/ScaleClients.io as Meta ad agency), tech stack (GoHighLevel, Skool, A2P compliance, payment processing), legal and compliance documents (Terms of Service, disclaimer, SMS/A2P posture, UGC creator agreement), KPI definitions (CPQBC, show rate, close rate), and a founder person-node. All 46 files were verified with zero broken wiki-links before delivery. The vault was zipped and delivered as a downloadable file.
> 
> The naming convention established was `[TYPE]-[DOMAIN]-[Topic].md` with defined prefixes (MOC-, APW-, SOP-, SCRIPT-, PERSON-, PARTNER-, KPI-, TPL-) and a hierarchical tag taxonomy (`#apw/<domain>`, `#type/<kind>`, `#status/<state>`) that drives Obsidian graph view color grouping. The README inside the vault includes the full graph view configuration: 10 color-coded groups mapped to APW's brand palette (cyan for offers, teal for curriculum, purple for marketing, gold for MOC hubs, red for legal, orange for tech, yellow for partners, green for KPIs, pink for people, steel for company), with specific node size, repel force, link distance, and center force settings to produce the animated cluster effect Alan wanted. Alan can invoke "format this for the vault" in any future session and Claude will apply the full spec including frontmatter, prefix, folder suggestion, tag triad, and related-link block.


---

## 👤 You

can you export my notes on APW to import properly and group and view in animated grid view into Obsidian to help me visualize everything and the moving parts?

look into how to properly be naming things so that i can seamlessly group all of your outputs into neural clusters in obsidian

---

## 🤖 Claude

> [!note]- Claude's thinking
> So Alan wants to export his APW notes into Obsidian with a structure that lets him organize them into neural clusters and view them in the graph visualization. I need to figure out the right naming convention and folder structure so the notes connect properly and create meaningful clusters when displayed.
> 
> Looking at what I know about his APW ecosystem—the business funding education, the specific KPIs and offer paths, the Skool classroom structure, the VSL/DSL infrastructure, the content strategy, and the legal/branding elements—I can map these into an Obsidian vault with proper tagging and linking so everything clusters naturally in the graph view. AD4C8, purple #9B30D0, gold #C9A030
>    - Skyward USA, Inc. (separate entity)
> 
> 3. **Obsidian best practices for neural clusters in graph view:**
>    - **Consistent naming conventions** with prefixes like `APW-` for all related notes
>    - **MOCs (Maps of Content)** — hub notes that link to all related notes
>    - **Tags** hierarchical like `#apw/offer/blitz`, `#apw/offer/prime`
>    - **[[Wiki-links]]** to build connections
>    - **YAML frontmatter** with type, status, tags, related
>    - **Folder structure** less important than links/tags in Obsidian
>    - Graph view colors can be grouped by folder path, tag, or query
> 
> For neural clustering specifically in graph view:
> - Use **Groups** in Graph view settings with queries like `path:APW/Offers` or `tag:#apw/legal`
> - Each group gets its own color
> - Links between notes create the "neural network" feel
> 
> Naming convention best practices:
> - Prefix with domain: `APW-`, `LEGAL-`, `HEALTH-`
> - Or use folder structure with consistent note types
> - Use consistent casing (kebab-case or Title Case)
> - Include note type: `MOC-`, `SOP-`, `NOTE-`, `SCRIPT-`
> 
> Now I need to focus on what he actually wants — a concrete deliverable he can use immediately. He's looking for exportable markdown files with his APW notes formatted for easy import, structured around his preference for headlines and tables that he can copy and paste directly into his system.
> 
> I'm planning out the vault structure with a master index hub, organized MOCs for each business area, and individual note files that all link together to create that neural network effect he's after. The key is getting the naming conventions, frontmatter, and internal linking right so the graph view automatically clusters properly when he imports it. Continuing through the offers section with pricing strategy and capital velocity protocols, then moving into the curriculum structure with course architecture, classroom modules, lesson formats, and quick-start materials, followed by the marketing pillar covering content strategy, reels, the four-pillar framework, and VSL approaches.
> 
> Now I'm mapping out the rest of the documentation structure—partnerships with SCIO and KPI tracking, the tech stack covering GHL, Skool, compliance, and payment processing, plus the legal and compliance layer with terms of service and disclaimers.
> 
> I'm also seeing the people section with key team members and a templates folder for standardized notes, SOPs, and offer documents. The naming convention uses prefixes like MOC for content hubs, APW for domain-specific docs, PERSON for team members, and TPL for reusable templates, with hierarchical tags for organizing the graph view. I'm mapping out the remaining graph view clusters with colors that align with his brand palette, then I'll put together a README with setup instructions, a graph configuration guide, and CSS customization options for the vault.
> 
> Now I need to actually build this out as a proper Obsidian vault structure that he can zip and import directly. I'm thinking through the architecture: each note needs to be lean without filler, interconnected with wiki-links to create that neural cluster effect, consistent YAML frontmatter across all files, hierarchical tags for graph organization, and MOC notes that comprehensively link to everything in their domain. Let me start drafting the actual content for a complete, functional vault. I have enough context from his memories to proceed without slowing down for clarification — the request is clearly about Alan's APW work, and his preferences confirm this is his style. Let me start building the note structure.
> 
> Building directory structure...


Building this out as an actual Obsidian vault you can drop in and open. Naming + linking conventions are designed so graph view renders true neural clusters (color-coded by domain, hubs glowing in the middle, everything interlinked).

Let me set it up.

> [!abstract]- Tool call: bash_tool
> {"command": "mkdir -p /home/claude/apw-vault/{00-Index,01-Company,02-Offers,03-Curriculum,04-Marketing,05-Partnerships,06-Tech-Stack,07-Legal-Compliance,08-People,09-KPIs-Metrics,99-Templates,_attachments} && ls /home/claude/apw-vault", "description": "Create APW Obsidian vault folder structure"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"{00-Index,01-Company,02-Offers,03-Curriculum,04-Marketing,05-Partnerships,06-Tech-Stack,07-Legal-Compliance,08-People,09-KPIs-Metrics,99-Templates,_attachments}\n","stderr":""}


> [!abstract]- Tool call: bash_tool
> {"command": "mkdir -p /home/claude/apw-vault/00-Index /home/claude/apw-vault/01-Company /home/claude/apw-vault/02-Offers /home/claude/apw-vault/03-Curriculum /home/claude/apw-vault/04-Marketing /home/claude/apw-vault/05-Partnerships /home/claude/apw-vault/06-Tech-Stack /home/claude/apw-vault/07-Legal-Compliance /home/claude/apw-vault/08-People /home/claude/apw-vault/09-KPIs-Metrics /home/claude/apw-vault/99-Templates /home/claude/apw-vault/_attachments && ls /home/claude/apw-vault", "description": "Create folders individually (brace expansion didn't work)"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"00-Index\n01-Company\n02-Offers\n03-Curriculum\n04-Marketing\n05-Partnerships\n06-Tech-Stack\n07-Legal-Compliance\n08-People\n09-KPIs-Metrics\n99-Templates\n_attachments\n{00-Index,01-Company,02-Offers,03-Curriculum,04-Marketing,05-Partnerships,06-Tech-Stack,07-Legal-Compliance,08-People,09-KPIs-Metrics,99-Templates,_attachments}\n","stderr":""}


> [!abstract]- Tool call: bash_tool
> {"command": "rm -rf \"/home/claude/apw-vault/{00-Index,01-Company,02-Offers,03-Curriculum,04-Marketing,05-Partnerships,06-Tech-Stack,07-Legal-Compliance,08-People,09-KPIs-Metrics,99-Templates,_attachments}\" && ls /home/claude/apw-vault", "description": "Remove the literal brace-named folder"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"00-Index\n01-Company\n02-Offers\n03-Curriculum\n04-Marketing\n05-Partnerships\n06-Tech-Stack\n07-Legal-Compliance\n08-People\n09-KPIs-Metrics\n99-Templates\n_attachments\n","stderr":""}


> [!note]- Claude's thinking
> Now I'm organizing the project structure and starting to generate the files in batches, beginning with a README that includes setup instructions.


Now I'll build the README first — it'll explain the whole system.

> [!abstract]- Tool call: create_file
> {"description": "Root README explaining the vault, naming conventions, and graph view neural cluster setup", "path": "/home/claude/apw-vault/README.md", "file_text": "---\ntitle: APW Vault — README\ntype: readme\ntags: [type/readme, apw/meta]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW Obsidian Vault — Setup & Conventions\n\n**Purpose:** Visualize every moving part of Ascend Prime Wealth as an interlinked neural network in Obsidian's graph view, with color-coded clusters by domain.\n\n---\n\n## 1. Import Instructions\n\n1. Download this folder (unzipped).\n2. Open Obsidian → **Open anot ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/README.md


Now the templates and core MOCs.

> [!abstract]- Tool call: create_file
> {"description": "Standard note template", "file_text": "---\ntitle: \ntype: note\ntags: [type/note, apw/]\nstatus: draft\ncreated: \nrelated: []\n---\n\n# {{title}}\n\n**Context:** \n\n**Key points:**\n- \n- \n- \n\n**Related:**\n- [[MOC-APW-Master]]\n- \n\n**Next action:** \n", "path": "/home/claude/apw-vault/99-Templates/TPL-Note.md"}


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/99-Templates/TPL-Note.md


> [!abstract]- Tool call: create_file
> {"description": "SOP template", "file_text": "---\ntitle: \ntype: sop\ntags: [type/sop, apw/]\nstatus: draft\ncreated: \nowner: \n---\n\n# SOP — {{title}}\n\n**Purpose:** \n\n**Trigger:** when this SOP runs.\n\n**Inputs:**\n- \n\n**Steps:**\n1. \n2. \n3. \n\n**Outputs / Done definition:**\n- \n\n**Failure modes:**\n- \n\n**Related:**\n- [[MOC-APW-Master]]\n", "path": "/home/claude/apw-vault/99-Templates/TPL-SOP.md"}


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/99-Templates/TPL-SOP.md


> [!abstract]- Tool call: create_file
> {"description": "Offer template", "file_text": "---\ntitle: \ntype: offer\ntags: [type/note, apw/offer]\nstatus: draft\ncreated: \nprice: \nduration: \ntarget_range: \n---\n\n# Offer — {{title}}\n\n**One-liner:** \n\n**Promise (outcome):** \n\n**Target avatar:** \n\n**Price / Terms:** \n\n**Duration:** \n\n**Scope / Deliverables:**\n- \n- \n- \n\n**Value equation (Hormozi):**\n- Dream outcome: \n- Perceived likelihood of achievement: \n- Time delay: \n- Effort & sacrifice: \n\n**Guarantees / Risk reversal:** \n\n**Related:**\n- [[MOC-APW-Offers]]\n", "path": "/home/claude/apw-vault/99-Template ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/99-Templates/TPL-Offer.md


Now the master MOC — hub of hubs.

> [!abstract]- Tool call: create_file
> {"description": "Master MOC - central hub of the entire vault", "file_text": "---\ntitle: MOC — APW Master\ntype: moc\ntags: [type/moc, apw/company]\nstatus: active\ncreated: 2026-04-19\n---\n\n# 🌌 MOC — APW Master\n\n**The hub of hubs.** Entry point for the entire Ascend Prime Wealth ecosystem.\n\n---\n\n## 🏢 Company\n\n- [[MOC-APW-Company]]\n- [[APW-Company-Profile]]\n- [[APW-Brand-Identity]]\n- [[APW-Mission-Vision]]\n- [[APW-Skyward-USA-Entity]]\n\n## 💰 Offers\n\n- [[MOC-APW-Offers]]\n- [[APW-Offer-Blitz-Path]]\n- [[APW-Offer-Prime-Protocol]]\n- [[APW-Offer-Value-Equation]]\n- [[APW-Offer- ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Master.md


> [!abstract]- Tool call: create_file
> {"description": "Company MOC", "file_text": "---\ntitle: MOC — APW Company\ntype: moc\ntags: [type/moc, apw/company]\nstatus: active\ncreated: 2026-04-19\n---\n\n# 🏢 MOC — APW Company\n\nHub for the corporate entity, brand, and mission of Ascend Prime Wealth.\n\n## Notes\n- [[APW-Company-Profile]]\n- [[APW-Brand-Identity]]\n- [[APW-Mission-Vision]]\n- [[APW-Skyward-USA-Entity]]\n\n## Related MOCs\n- [[MOC-APW-Master]]\n- [[MOC-APW-Legal]]\n- [[MOC-APW-Offers]]\n\n## People\n- [[PERSON-Alan-Nguyen]] — Founder & CEO\n", "path": "/home/claude/apw-vault/00-Index/MOC-APW-Company.md"}


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Company.md


> [!abstract]- Tool call: create_file
> {"description": "Offers MOC", "file_text": "---\ntitle: MOC — APW Offers\ntype: moc\ntags: [type/moc, apw/offer]\nstatus: active\ncreated: 2026-04-19\n---\n\n# 💰 MOC — APW Offers\n\nHub for all APW offers, pricing, value logic, and client ascension paths.\n\n## Core Offers\n\n| Offer                                      | Range         | Duration      | Tier        |\n| ------------------------------------------ | ------------- | ------------- | ----------- |\n| [[APW-Offer-Blitz-Path]]                   | $50K–$200K+   | 30–60 days    | Entry/Mid   |\n| [[APW-Offer-Prime-Protocol]]            ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Offers.md


> [!abstract]- Tool call: create_file
> {"description": "Curriculum MOC", "file_text": "---\ntitle: MOC — APW Curriculum\ntype: moc\ntags: [type/moc, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# 🎓 MOC — APW Curriculum\n\nHub for the APW teaching architecture — six Skool classrooms delivered via the MTP lesson format.\n\n## Architecture\n\n- [[APW-Course-Architecture]]\n- [[APW-Course-Lesson-Format-MTP]] — WHY / WHAT / HOW / DO NOT / Action Item\n\n## Fast-Start Sequence\n\n- [[APW-Course-7-Day-Fast-Start]]\n- [[APW-Course-Quick-Start-Checklist]]\n\n## Three-Pillar Fundability Framework\n\n- [[APW-Course-Pillar-Busi ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Curriculum.md


> [!abstract]- Tool call: create_file
> {"description": "Marketing MOC", "file_text": "---\ntitle: MOC — APW Marketing\ntype: moc\ntags: [type/moc, apw/marketing]\nstatus: active\ncreated: 2026-04-19\n---\n\n# 📣 MOC — APW Marketing\n\nHub for content, sales assets, and paid acquisition.\n\n## Organic / Content\n\n- [[APW-Content-Reels-Strategy]] — 9 concepts across 4 pillars\n- [[APW-Content-4-Pillars]]\n\n## Sales Assets\n\n- [[APW-VSL-Framework]]\n- [[APW-DSL-Blueprint]] — comparison blueprint v10\n\n## Paid\n\n- [[PARTNER-SCIO-ScaleClients]] — Meta ad management\n\n## Creators\n\n- [[APW-UGC-Creator-Agreement]]\n\n## Related MOCs ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Marketing.md


> [!abstract]- Tool call: create_file
> {"description": "Partners MOC", "file_text": "---\ntitle: MOC — APW Partners\ntype: moc\ntags: [type/moc, apw/partner]\nstatus: active\ncreated: 2026-04-19\n---\n\n# 🤝 MOC — APW Partners\n\nHub for all external partnerships, agencies, and vendor relationships.\n\n## Active\n\n- [[PARTNER-SCIO-ScaleClients]] — Meta ad agency\n\n## Related MOCs\n\n- [[MOC-APW-Master]]\n- [[MOC-APW-Marketing]]\n- [[MOC-APW-KPIs]]\n", "path": "/home/claude/apw-vault/00-Index/MOC-APW-Partners.md"}


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Partners.md


> [!abstract]- Tool call: create_file
> {"description": "Tech Stack MOC", "file_text": "---\ntitle: MOC — APW Tech Stack\ntype: moc\ntags: [type/moc, apw/tech]\nstatus: active\ncreated: 2026-04-19\n---\n\n# ⚙️ MOC — APW Tech Stack\n\nHub for all tools, platforms, and infrastructure powering APW.\n\n## Core Platforms\n\n- [[APW-Tech-GHL]] — CRM, SMS, email, funnels\n- [[APW-Tech-Skool]] — course delivery (6 classrooms)\n- [[APW-Tech-Payment-Processing]] — split-pay + WAP workaround\n- [[APW-Tech-Compliance-A2P]] — SPF/DKIM/DMARC + A2P SMS registration\n\n## Related MOCs\n\n- [[MOC-APW-Master]]\n- [[MOC-APW-Curriculum]] — delivered on ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Tech-Stack.md


> [!abstract]- Tool call: create_file
> {"description": "Legal MOC", "file_text": "---\ntitle: MOC — APW Legal & Compliance\ntype: moc\ntags: [type/moc, apw/legal]\nstatus: active\ncreated: 2026-04-19\n---\n\n# ⚖️ MOC — APW Legal & Compliance\n\nHub for all APW legal documents, compliance infrastructure, and regulatory posture.\n\n## Core Documents\n\n- [[APW-Legal-TOS]] — Terms of Service (ascendprimewealth.com)\n- [[APW-Legal-Disclaimer]]\n- [[APW-Legal-SMS-A2P]] — TCPA / A2P compliance\n- [[APW-UGC-Creator-Agreement]] — MN governing law, $1K fee\n\n## Related MOCs\n\n- [[MOC-APW-Master]]\n- [[MOC-APW-Tech-Stack]] — GHL compliance ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-Legal.md


> [!abstract]- Tool call: create_file
> {"description": "KPIs MOC", "file_text": "---\ntitle: MOC — APW KPIs\ntype: moc\ntags: [type/moc, apw/kpi]\nstatus: active\ncreated: 2026-04-19\n---\n\n# 📊 MOC — APW KPIs\n\nHub for all APW performance metrics, targets, and measurement logic.\n\n## Ads / Acquisition\n\n- [[KPI-APW-CPQBC]] — Cost per Qualified Booked Call — target: ≤ $300\n\n## Funnel\n\n- [[KPI-APW-Show-Rate]] — target: ≥ 60%\n- [[KPI-APW-Close-Rate]] — target: ≥ 25%\n\n## Offer Math (derived targets)\n\n| Metric        | Value           |\n| ------------- | --------------- |\n| Program price | $10,000         |\n| Program dur ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/00-Index/MOC-APW-KPIs.md


Now the content notes — Company, Offers, Curriculum, Marketing, Partnerships, Tech, Legal, KPIs, People.

> [!abstract]- Tool call: create_file
> {"description": "Company profile note", "file_text": "---\ntitle: APW — Company Profile\ntype: note\ntags: [type/note, apw/company]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Company Profile\n\n**Legal name:** Ascend Prime Wealth LLC\n**Brand:** Ascend Prime Wealth (APW)\n**Location:** Minneapolis, MN\n**Support email:** support@ascendprimewealth.com\n**Domain:** ascendprimewealth.com\n\n**What APW does:** Business funding education and coaching. Teaches clients how to access **$100K–$500K+** in unsecured business funding via:\n- credit optimization\n- strategic institutional mapping ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/01-Company/APW-Company-Profile.md


> [!abstract]- Tool call: create_file
> {"description": "Brand identity note", "file_text": "---\ntitle: APW — Brand Identity\ntype: note\ntags: [type/note, apw/company]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Brand Identity\n\n**Theme:** Cosmic / celestial. Ascension, elevation, scale, mastery.\n\n## Color System\n\n| Role       | Color    | Hex        |\n| ---------- | -------- | ---------- |\n| Background | Dark navy| (base dark)|\n| Primary    | Cyan     | `#00C6E8`  |\n| Secondary  | Teal     | `#1AD4C8`  |\n| Accent 1   | Purple   | `#9B30D0`  |\n| Accent 2   | Gold     | `#C9A030`  |\n\n## Visual Language\n\n- De ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/01-Company/APW-Brand-Identity.md


> [!abstract]- Tool call: create_file
> {"description": "Mission vision note", "file_text": "---\ntitle: APW — Mission & Vision\ntype: note\ntags: [type/note, apw/company]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Mission & Vision\n\n**Mission:** Teach entrepreneurs how to unlock $100K–$500K+ in unsecured business capital through credit optimization, lender mapping, and sequenced application execution — without income verification bottlenecks.\n\n**Vision:** The default on-ramp to business capital for ambitious founders who refuse to be capital-constrained.\n\n**Core promise:** Predictable access to real capital — on a re ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/01-Company/APW-Mission-Vision.md


> [!abstract]- Tool call: create_file
> {"description": "Skyward USA note", "file_text": "---\ntitle: APW — Skyward USA Entity (Adjacent)\ntype: note\ntags: [type/note, apw/company]\nstatus: active\ncreated: 2026-04-19\n---\n\n# Skyward USA, Inc. — Adjacent Entity\n\n**NOT an APW subsidiary.** Skyward USA is a separate legal entity Alan operates.\n\n- **Legal name:** Skyward USA, Inc.\n- **Experian Business BIN:** 428222169\n- **Status on Experian Business:** Low-Medium Risk (score 55 as of March 2026)\n- **Active work:** dispute letter sent for unauthorized inquiries; net-30 vendor strategy in play; Dell business financing evaluate ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/01-Company/APW-Skyward-USA-Entity.md


---

## 👤 You

Continue

---

## 🤖 Claude

> [!abstract]- Tool call: create_file
> {"description": "Blitz Path offer note", "file_text": "---\ntitle: APW — Offer — Blitz Path\ntype: offer\ntags: [type/note, apw/offer, apw/offer/blitz]\nstatus: active\ncreated: 2026-04-19\nprice: $10,000\nduration: 4 months\ntarget_range: $50K–$200K+\n---\n\n# Offer — Blitz Path\n\n**One-liner:** Fast-lane access to $50K–$200K+ in unsecured business capital in 30–60 days.\n\n**Target avatar:** Founders who need capital fast, already have foundational credit/profile basics in place, and want a sequenced application blitz executed properly.\n\n**Funding range:** $50K–$200K+\n**Timeline:** 30–60 ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/02-Offers/APW-Offer-Blitz-Path.md


> [!abstract]- Tool call: create_file
> {"description": "Prime Protocol offer note", "file_text": "---\ntitle: APW — Offer — Prime Protocol\ntype: offer\ntags: [type/note, apw/offer, apw/offer/prime]\nstatus: active\ncreated: 2026-04-19\nprice: $10,000\nduration: 4 months (program); 3–10 months (outcome horizon)\ntarget_range: $300K–$500K+\n---\n\n# Offer — Prime Protocol\n\n**One-liner:** Full-spectrum $300K–$500K+ capital access via credit repair, profile architecture, and multi-wave execution.\n\n**Target avatar:** Founders who need serious capital, may have credit profile gaps, and are willing to run a full 3–10 month protocol f ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/02-Offers/APW-Offer-Prime-Protocol.md


> [!abstract]- Tool call: create_file
> {"description": "Value equation note", "file_text": "---\ntitle: APW — Offer Value Equation\ntype: note\ntags: [type/note, apw/offer]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Offer Value Equation (Hormozi Framework)\n\n**Goal:** maximize numerator, minimize denominator.\n\n```\nValue = (Dream Outcome × Perceived Likelihood of Achievement)\n        ─────────────────────────────────────────────────────\n                (Time Delay × Effort & Sacrifice)\n```\n\n## Applied to APW\n\n### Numerator\n- **Dream outcome:** $100K–$500K+ real, usable business capital — unsecured, no income do ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/02-Offers/APW-Offer-Value-Equation.md


> [!abstract]- Tool call: create_file
> {"description": "Capital Velocity Protocol note", "file_text": "---\ntitle: APW — Capital Velocity Protocol (Mechanism)\ntype: note\ntags: [type/note, apw/offer]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Capital Velocity Protocol (Mechanism Name)\n\n**What it is:** APW's proprietary-named mechanism for the full sequence that compresses time-to-capital.\n\n**Why the name matters:** Velocity = capital × time. The name signals that APW is not just about *how much* capital a client can access — it's about *how fast*. This is the differentiator against generic \"business credit\" offers  ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/02-Offers/APW-Offer-Capital-Velocity-Protocol.md


> [!abstract]- Tool call: create_file
> {"description": "Pricing strategy note", "file_text": "---\ntitle: APW — Pricing Strategy\ntype: note\ntags: [type/note, apw/offer]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Pricing Strategy\n\n## Current anchor\n- **Program price:** $10,000\n- **Duration:** 4-month program container\n- Same price across Blitz and Prime — the differentiation is outcome ceiling + scope, not price point\n\n## Why single price (for now)\n- Simplifies sales call math ($10K / 4 months = under $2,500/mo)\n- Keeps CPQBC math clean against [[KPI-APW-CPQBC]] target\n- Avoids mid-call negotiation friction\n-  ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/02-Offers/APW-Offer-Pricing-Strategy.md


Now curriculum notes.

> [!abstract]- Tool call: create_file
> {"description": "Course architecture note", "file_text": "---\ntitle: APW — Course Architecture\ntype: note\ntags: [type/note, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Course Architecture\n\n**Delivered on:** [[APW-Tech-Skool]] — six classrooms\n**Lesson format:** [[APW-Course-Lesson-Format-MTP]] — WHY / WHAT / HOW / DO NOT / Action Item\n\n## Six Classrooms (high-level)\n\n1. **Foundations** — mindset, fundability concept, Three-Pillar framework\n2. **Personal Profile** — see [[APW-Course-Pillar-Personal-Profile]]\n3. **Business Profile** — see [[APW-Course-Pillar- ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/03-Curriculum/APW-Course-Architecture.md


> [!abstract]- Tool call: create_file
> {"description": "MTP lesson format note", "file_text": "---\ntitle: APW — Lesson Format (MTP)\ntype: note\ntags: [type/note, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Lesson Format: Master Teaching Protocol (MTP)\n\n**Applies to:** every APW course lesson. Also the default structure for any new teaching content across the business.\n\n## The five-part lesson structure\n\n| Part        | Purpose                                                                                 |\n| ----------- | ---------------------------------------------------------------------------- ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/03-Curriculum/APW-Course-Lesson-Format-MTP.md


> [!abstract]- Tool call: create_file
> {"description": "7 Day Fast Start note", "file_text": "---\ntitle: APW — 7 Day Fast Start (7DFS)\ntype: note\ntags: [type/note, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — 7 Day Fast Start (7DFS)\n\n**Purpose:** First-week momentum. A quick win that proves the program works before the heavy lifting begins.\n\n## Design goal\nGet every new client one visible, early result within 7 days — typically a fundability snapshot, a credit improvement action, or a completed foundational setup. The point is momentum, not depth.\n\n## Sequencing logic\n- Day 1: foundational setup + ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/03-Curriculum/APW-Course-7-Day-Fast-Start.md


> [!abstract]- Tool call: create_file
> {"description": "Quick start checklist note", "file_text": "---\ntitle: APW — Quick Start Checklist\ntype: note\ntags: [type/note, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Quick Start Checklist\n\n**When:** Day 0 of client onboarding.\n**Form:** single-page, speak-friendly, glanceable.\n\n## Structure (the three-pillar fundability frame)\n\n### 1. Business Profile baseline\n- [[APW-Course-Pillar-Business-Profile]]\n- Entity clean? EIN? Address? Phone? Web presence? D-U-N-S?\n\n### 2. Personal Profile baseline\n- [[APW-Course-Pillar-Personal-Profile]]\n- Tri-bureau s ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/03-Curriculum/APW-Course-Quick-Start-Checklist.md


> [!abstract]- Tool call: create_file
> {"description": "Business Profile pillar", "file_text": "---\ntitle: APW — Pillar — Business Profile\ntype: note\ntags: [type/note, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Pillar: Business Profile\n\nOne of three fundability pillars. This is what lenders see when they evaluate the *entity*.\n\n## What it covers\n- Entity structure (LLC/Corp status, good standing)\n- EIN, D-U-N-S, business address, phone, website\n- Business bank account hygiene\n- Vendor tradeline buildout (net-30 strategy)\n- Business credit bureau profiles (Experian Business, D&B, Equifax Busines ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/03-Curriculum/APW-Course-Pillar-Business-Profile.md


> [!abstract]- Tool call: create_file
> {"description": "Personal Profile pillar", "file_text": "---\ntitle: APW — Pillar — Personal Profile\ntype: note\ntags: [type/note, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Pillar: Personal Profile\n\nOne of three fundability pillars. This is what lenders see when they evaluate the *person*.\n\n## What it covers\n- Tri-bureau reports (Equifax, Experian, TransUnion)\n- Score optimization (utilization mechanics, payment history)\n- AAoA (Average Age of Accounts) — see the 7.5 / 9.5-year target modeling\n- Authorized user tradeline strategy\n- Inquiry management\n- Der ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/03-Curriculum/APW-Course-Pillar-Personal-Profile.md


> [!abstract]- Tool call: create_file
> {"description": "Application Strategy pillar", "file_text": "---\ntitle: APW — Pillar — Application Strategy\ntype: note\ntags: [type/note, apw/curriculum]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Pillar: Application Strategy\n\nThird fundability pillar. How, when, and in what order applications are submitted — the execution layer.\n\n## What it covers\n- Lender/institution mapping per profile\n- Application sequencing (order + timing within the bureau window)\n- Stacking — multiple approvals before bureau refresh closes the window\n- Wave-based multi-round strategy for Prime\n- Am ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/03-Curriculum/APW-Course-Pillar-Application-Strategy.md


Now marketing.

> [!abstract]- Tool call: create_file
> {"description": "Reels strategy note", "file_text": "---\ntitle: APW — Reels Strategy\ntype: note\ntags: [type/note, apw/marketing, apw/marketing/reels]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Instagram Reels Strategy\n\n**Structure:** 9 concepts across 4 pillars — see [[APW-Content-4-Pillars]].\n**Primary CTA:** drive to [[APW-VSL-Framework]].\n\n## Output spec\n- Vertical 9:16\n- First 3 seconds = pattern interrupt (hook test)\n- Under 60 seconds default, under 30 for hook-dominant formats\n- Open loop → micro-payoff → CTA\n- Brand colors from [[APW-Brand-Identity]]\n\n## Postin ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/04-Marketing/APW-Content-Reels-Strategy.md


> [!abstract]- Tool call: create_file
> {"description": "4 content pillars note", "file_text": "---\ntitle: APW — 4 Content Pillars\ntype: note\ntags: [type/note, apw/marketing, apw/marketing/reels]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — 4 Content Pillars\n\nEvery Reel, caption, and short-form asset maps to one of four pillars. Pillars are the tag system for the content library.\n\n## The Four\n\n1. **Education** — teach one fundability truth cleanly\n   - \"Why lenders approve X but deny Y\"\n   - Myth-busting about business credit\n   - Three-pillar fundability explainers\n\n2. **Proof** — results, client wins, recei ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/04-Marketing/APW-Content-4-Pillars.md


> [!abstract]- Tool call: create_file
> {"description": "VSL framework note", "file_text": "---\ntitle: APW — VSL Framework\ntype: script\ntags: [type/script, apw/marketing, apw/marketing/vsl]\nstatus: draft\ncreated: 2026-04-19\n---\n\n# APW — VSL Framework\n\n**Asset type:** Video Sales Letter — primary conversion asset at top of funnel.\n**Target finished length:** ~9–12 minutes.\n**Raw shoot estimate:** ~1.5–2.25 hours to capture all needed takes.\n\n## Structural spine\n1. **Hook** — pattern interrupt + promise (first 15 seconds earn the next minute)\n2. **Problem** — the cost of being capital-constrained; misdiagnosis of what  ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/04-Marketing/APW-VSL-Framework.md


> [!abstract]- Tool call: create_file
> {"description": "DSL blueprint note", "file_text": "---\ntitle: APW — DSL Blueprint\ntype: script\ntags: [type/script, apw/marketing, apw/marketing/dsl]\nstatus: draft\ncreated: 2026-04-19\n---\n\n# APW — DSL Blueprint\n\n**Asset type:** DSL (Digital Sales Letter) — interactive HTML comparison blueprint.\n**Framework source:** SCIO 51-slide framework adapted for APW.\n**Status:** Iterated through v10. DSL script not yet written (pending).\n\n## What the DSL does\n- Expands the VSL into a deeper, interactive, read-at-your-own-pace sales asset\n- Side-by-side comparison structure — \"what most f ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/04-Marketing/APW-DSL-Blueprint.md


Now partnerships, tech, legal, KPIs, people.

> [!abstract]- Tool call: create_file
> {"description": "SCIO partner note", "file_text": "---\ntitle: Partner — SCIO (ScaleClients.io)\ntype: note\ntags: [type/note, apw/partner]\nstatus: active\ncreated: 2026-04-19\n---\n\n# Partner — SCIO (ScaleClients.io)\n\n**Relationship type:** Meta ad agency partner for APW paid acquisition.\n**Target market they run to:** medical practice owners.\n\n## KPI targets owned jointly\n\n| KPI             | Target     | Note                                       |\n| --------------- | ---------- | ------------------------------------------ |\n| **CPQBC**       | ≤ $300     | Cost per Qualified Boo ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/05-Partnerships/PARTNER-SCIO-ScaleClients.md


> [!abstract]- Tool call: create_file
> {"description": "GHL tech note", "file_text": "---\ntitle: APW — Tech — GoHighLevel (GHL)\ntype: note\ntags: [type/note, apw/tech]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Tech: GoHighLevel (GHL)\n\n**Role in stack:** CRM, SMS, email, funnel automation, pipeline management.\n\n## What it runs\n- Lead intake from Meta ads (SCIO) + organic (Reels)\n- Booking automation for sales calls\n- SMS/email nurture sequences\n- Pipeline management for booked → shown → closed\n- Billing reminders (TCPA-compliant)\n\n## Compliance surface\n- SPF / DKIM / DMARC configured for ascendprimewealth.co ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/06-Tech-Stack/APW-Tech-GHL.md


> [!abstract]- Tool call: create_file
> {"description": "Skool tech note", "file_text": "---\ntitle: APW — Tech — Skool\ntype: note\ntags: [type/note, apw/tech]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Tech: Skool\n\n**Role in stack:** course delivery platform.\n**Configuration:** six classrooms mapped to [[APW-Course-Architecture]].\n\n## Why Skool\n- Simple classroom + community in one place\n- Mobile-friendly for students\n- Handles progress tracking and access gating natively\n\n## What lives here\n- All six classrooms\n- [[APW-Course-7-Day-Fast-Start]] onboarding sequence\n- Lessons formatted per [[APW-Course-Lesson ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/06-Tech-Stack/APW-Tech-Skool.md


> [!abstract]- Tool call: create_file
> {"description": "Compliance A2P tech note", "file_text": "---\ntitle: APW — Tech — Compliance (A2P + Email Deliverability)\ntype: note\ntags: [type/note, apw/tech]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Tech: Compliance (A2P + Email Deliverability)\n\n**Why this lives under tech (not legal):** this is the infrastructure layer. The legal posture is separate — see [[APW-Legal-SMS-A2P]].\n\n## SMS / A2P\n- A2P 10DLC registration completed for ascendprimewealth.com in GHL\n- TCPA-compliant opt-in + opt-out language\n- Required disclosures on every message series\n- Rate limits + carr ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/06-Tech-Stack/APW-Tech-Compliance-A2P.md


Alan, I hit the tool-use cap partway through the build. Here's where it stands.

---

## ✅ What's built and ready

**Full vault skeleton** with 10 folders, README, 3 templates, and 30 interlinked notes across:

- **00-Index** — 9 MOCs (Master + 8 domain hubs)
- **01-Company** — Profile, Brand Identity, Mission/Vision, Skyward USA
- **02-Offers** — Blitz Path, Prime Protocol, Value Equation, Capital Velocity Protocol, Pricing Strategy
- **03-Curriculum** — Architecture, MTP lesson format, 7DFS, Quick Start, 3 pillars
- **04-Marketing** — Reels Strategy, 4 Pillars, VSL Framework, DSL Blueprint
- **05-Partnerships** — SCIO
- **06-Tech-Stack** — GHL, Skool, A2P Compliance (Payment Processing stub pending)

## ⚠️ What's not yet built

- `APW-Tech-Payment-Processing` (referenced, not created)
- Legal notes: `APW-Legal-TOS`, `APW-Legal-Disclaimer`, `APW-Legal-SMS-A2P`, `APW-UGC-Creator-Agreement`
- KPI notes: `KPI-APW-CPQBC`, `KPI-APW-Show-Rate`, `KPI-APW-Close-Rate`
- `PERSON-Alan-Nguyen`
- Final ZIP + `present_files` delivery

**These are the exact remaining files, and I have the naming + linking structure already locked in.** In a fresh message just say **"continue the vault"** and I'll finish the remaining 9 notes, zip it, and deliver.

## The naming convention (your actual ask) — locked in

**Format:** `[TYPE]-[DOMAIN]-[Topic].md`

**Prefixes:** `MOC-` (hub), `APW-` (domain note), `SOP-`, `SCRIPT-`, `PERSON-`, `PARTNER-`, `KPI-`, `TPL-`

**Tag spine (drives graph clusters):** `#apw/offer`, `#apw/curriculum`, `#apw/marketing`, `#apw/legal`, `#apw/tech`, `#apw/partner`, `#apw/kpi`, `#apw/person`, `#apw/company` — plus `#type/moc` always colored gold so MOCs glow as hub-suns at the center of each cluster.

**Graph view config** (10 color groups mapped to your brand palette: cyan/teal/purple/gold primary, plus red/orange/yellow/green/pink/steel for the other clusters) is fully documented in the README inside the vault.

Say **continue** and I'll finish + ship the zip.

---

## 👤 You

Continue

---

## 🤖 Claude

> [!abstract]- Tool call: create_file
> {"description": "Payment processing tech note", "file_text": "---\ntitle: APW — Tech — Payment Processing\ntype: note\ntags: [type/note, apw/tech]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Tech: Payment Processing\n\n**Role in stack:** collect program payments ($10K, 4-month container) reliably, with chargeback protection.\n\n## Current state\n- Processor denials encountered at launch prep\n- **Split-pay / WAP workaround** explored as interim route\n- Rolling reserve chargeback protection considered in payment facilitation structure modeling\n\n## Design requirements\n- Handle $10K  ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/06-Tech-Stack/APW-Tech-Payment-Processing.md


> [!abstract]- Tool call: create_file
> {"description": "Legal Terms of Service note", "file_text": "---\ntitle: APW — Legal — Terms of Service\ntype: note\ntags: [type/note, apw/legal]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Legal: Terms of Service\n\n**Scope:** governs use of ascendprimewealth.com and the APW program.\n**Status:** drafted and in place on the domain.\n\n## Key sections\n- Parties, entity name, governing law\n- Scope of service — education and coaching; APW does not underwrite, issue, or guarantee credit\n- No guarantee of any specific funding outcome\n- Client obligations — truthful profile info, respo ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/07-Legal-Compliance/APW-Legal-TOS.md


> [!abstract]- Tool call: create_file
> {"description": "Legal disclaimer note", "file_text": "---\ntitle: APW — Legal — Disclaimer\ntype: note\ntags: [type/note, apw/legal]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Legal: Disclaimer\n\n**Purpose:** establish clear boundaries on what APW is and is not, across every sales surface.\n\n## Core disclaimers\n\n- **Educational / coaching only** — APW provides business funding education and coaching; APW is not a lender, broker, underwriter, financial advisor, CPA, or law firm.\n- **No earnings / funding guarantee** — no specific funding amount, approval, or income result is pro ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/07-Legal-Compliance/APW-Legal-Disclaimer.md


> [!abstract]- Tool call: create_file
> {"description": "SMS A2P legal note", "file_text": "---\ntitle: APW — Legal — SMS / A2P Compliance\ntype: note\ntags: [type/note, apw/legal]\nstatus: active\ncreated: 2026-04-19\n---\n\n# APW — Legal: SMS / A2P Compliance\n\n**Purpose:** legal posture on TCPA and A2P 10DLC obligations.\n**Paired with:** [[APW-Tech-Compliance-A2P]] — infrastructure implementation of this posture.\n\n## Obligations observed\n\n- **Prior express written consent** before marketing SMS to any number\n- **Clear opt-in language** on all lead capture (what they're opting into, frequency, message & data rates disclosur ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/07-Legal-Compliance/APW-Legal-SMS-A2P.md


> [!abstract]- Tool call: create_file
> {"description": "UGC creator agreement note", "file_text": "---\ntitle: APW — UGC Creator Agreement\ntype: note\ntags: [type/note, apw/legal]\nstatus: active\ncreated: 2026-04-19\ngoverning_law: Minnesota\nfee: $1,000\ndeadline: April 12\n---\n\n# APW — UGC Creator Agreement\n\n**Purpose:** contract with user-generated content creators producing Reels / short-form for APW.\n\n## Key terms\n\n| Term              | Value                                           |\n| ----------------- | ----------------------------------------------- |\n| Governing law     | Minnesota                             ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/07-Legal-Compliance/APW-UGC-Creator-Agreement.md


> [!abstract]- Tool call: create_file
> {"description": "CPQBC KPI note", "file_text": "---\ntitle: KPI — CPQBC (Cost Per Qualified Booked Call)\ntype: note\ntags: [type/note, apw/kpi]\nstatus: active\ncreated: 2026-04-19\ntarget: ≤ $300\nowner: SCIO + APW\n---\n\n# KPI — CPQBC (Cost Per Qualified Booked Call)\n\n**Target:** ≤ $300\n**Owned by:** [[PARTNER-SCIO-ScaleClients]] (execution) + APW (qualification criteria)\n\n## Definition\nTotal paid ad spend ÷ number of **qualified** booked calls.\n\n\"Qualified\" means the lead meets APW's criteria — not just anyone who clicked a calendar link.\n\n## Why ≤ $300\nAt $300 CPQBC with 60% ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/09-KPIs-Metrics/KPI-APW-CPQBC.md


> [!abstract]- Tool call: create_file
> {"description": "Show rate KPI note", "file_text": "---\ntitle: KPI — Show Rate\ntype: note\ntags: [type/note, apw/kpi]\nstatus: active\ncreated: 2026-04-19\ntarget: ≥ 60%\nowner: APW\n---\n\n# KPI — Show Rate\n\n**Target:** ≥ 60%\n**Owned by:** APW (confirmation sequences, qualification quality)\n\n## Definition\nBooked calls that actually show ÷ booked calls total.\n\n## Why 60%\nBelow 60%, unit economics fall off a cliff — cost per shown call rises linearly as show rate drops. At 60%, a $300 CPQBC becomes a $500 cost-per-shown-call, which still supports the $10K offer at 25% close.\n\n## Pr ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/09-KPIs-Metrics/KPI-APW-Show-Rate.md


> [!abstract]- Tool call: create_file
> {"description": "Close rate KPI note", "file_text": "---\ntitle: KPI — Close Rate\ntype: note\ntags: [type/note, apw/kpi]\nstatus: active\ncreated: 2026-04-19\ntarget: ≥ 25%\nowner: APW\n---\n\n# KPI — Close Rate\n\n**Target:** ≥ 25%\n**Owned by:** APW (closer + offer clarity + pre-call priming)\n\n## Definition\nEnrollments (paid) ÷ shown sales calls.\n\n## Why 25%\nAt CPQBC $300, 60% show, 25% close → $2,000 cost per close on a $10K offer. That's the floor ratio that keeps the offer scalable without raising price.\n\n## Primary levers\n- **Pre-call priming** — VSL + (eventually) DSL do 80% o ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/09-KPIs-Metrics/KPI-APW-Close-Rate.md


> [!abstract]- Tool call: create_file
> {"description": "Alan Nguyen person note", "file_text": "---\ntitle: Alan Nguyen\ntype: note\ntags: [type/note, apw/person]\nstatus: active\ncreated: 2026-04-19\nrole: Founder & CEO, APW\n---\n\n# Alan Nguyen — Founder & CEO\n\n**Role:** Founder and CEO of Ascend Prime Wealth LLC (APW).\n**Adjacent entity:** operates Skyward USA, Inc. as a separate business vehicle.\n\n## Why this node exists\nIn the graph view, Alan is the root person-node that nearly every domain touches. This note is intentionally linked to all major MOCs so it renders as a second gravitational center alongside [[MOC-APW-Ma ...[truncated]


> [!abstract]- Tool result: create_file
> File created successfully: /home/claude/apw-vault/08-People/PERSON-Alan-Nguyen.md


Now let me do a final structural verification, then zip and deliver.

> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude/apw-vault && find . -type f -name \"*.md\" | sort && echo \"---\" && echo \"Total files: $(find . -type f -name '*.md' | wc -l)\"", "description": "Verify all files present"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"./00-Index/MOC-APW-Company.md\n./00-Index/MOC-APW-Curriculum.md\n./00-Index/MOC-APW-KPIs.md\n./00-Index/MOC-APW-Legal.md\n./00-Index/MOC-APW-Marketing.md\n./00-Index/MOC-APW-Master.md\n./00-Index/MOC-APW-Offers.md\n./00-Index/MOC-APW-Partners.md\n./00-Index/MOC-APW-Tech-Stack.md\n./01-Company/APW-Brand-Identity.md\n./01-Company/APW-Company-Profile.md\n./01-Company/APW-Mission-Vision.md\n./01-Company/APW-Skyward-USA-Entity.md\n./02-Offers/APW-Offer-Blitz-Path.md\n./02-Offers/APW-Offer-Capital-Velocity-Protocol.md\n./02-Offers/APW-Offer-Pricing-Strategy.md\n./02-Offers/ ...[truncated]


> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude/apw-vault && echo \"=== Broken link check (links to files that don't exist) ===\" && \\\npython3 << 'EOF'\nimport os, re, glob\n\n# Build set of actual note names (basename without .md)\nnotes = set()\nfor f in glob.glob('**/*.md', recursive=True):\n    notes.add(os.path.basename(f)[:-3])\n\n# Scan every file for [[links]] and check if target exists\nbroken = []\nfor f in glob.glob('**/*.md', recursive=True):\n    content = open(f).read()\n    for match in re.findall(r'\\[\\[([^\\]]+)\\]\\]', content):\n        target = match.split('|')[0].split('#')[0].strip()\n   ...[truncated]


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"=== Broken link check (links to files that don't exist) ===\nFound 3 broken link(s):\n  README.md → [[Note Name]]\n  README.md → [[links]]\n  04-Marketing/APW-DSL-Blueprint.md → [[APW-DSL-Blueprint HTML SOP v2]]\n","stderr":""}


> [!abstract]- Tool call: str_replace
> {"description": "Fix the DSL Blueprint inline wiki-link — it's a framework name, not a linked note, so backtick it instead", "old_str": "Uses: **APW DSL Blueprint HTML SOP v2** — reproducible interactive HTML comparison artifacts. Applied whenever a new comparison asset is generated.", "new_str": "Uses: **APW DSL Blueprint HTML SOP v2** — reproducible interactive HTML comparison artifacts. Applied whenever a new comparison asset is generated.\n\n_(Framework name above intentionally not wiki-linked — if you later create a dedicated SOP note for this, rename it `SOP-APW-DSL-Blueprint-HTML-v2.md` ...[truncated]


> [!abstract]- Tool result: str_replace
> Successfully replaced string in /home/claude/apw-vault/04-Marketing/APW-DSL-Blueprint.md


The other two "broken links" in README (`[[Note Name]]` and `[[links]]`) are inside code examples explaining syntax — not real links. Let me confirm and verify the final state.

> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude/apw-vault && python3 << 'EOF'\nimport os, re, glob\n\n# Build set of actual note names\nnotes = set()\nfor f in glob.glob('**/*.md', recursive=True):\n    notes.add(os.path.basename(f)[:-3])\n\n# Check real broken links (exclude code blocks and inline code)\nbroken = []\nfor f in glob.glob('**/*.md', recursive=True):\n    content = open(f).read()\n    # Strip fenced code blocks\n    content_stripped = re.sub(r'```[\\s\\S]*?```', '', content)\n    # Strip inline code\n    content_stripped = re.sub(r'`[^`]*`', '', content_stripped)\n    for match in re.findall(r'\\[\ ...[truncated]


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"Real broken links: 1\n  04-Marketing/APW-DSL-Blueprint.md → [[APW-DSL-Blueprint HTML SOP v2]]\n\n=== Note breakdown ===\n  APW note: 28\n  KPI: 3\n  MOC: 9\n  PARTNER: 1\n  PERSON: 1\n  TEMPLATE: 3\n  other: 1\n  TOTAL: 46\n","stderr":""}


> [!abstract]- Tool call: view
> {"description": "Check the DSL file to find the remaining broken link", "path": "/home/claude/apw-vault/04-Marketing/APW-DSL-Blueprint.md"}


> [!abstract]- Tool result: view
> 1	---
>      2	title: APW — DSL Blueprint
>      3	type: script
>      4	tags: [type/script, apw/marketing, apw/marketing/dsl]
>      5	status: draft
>      6	created: 2026-04-19
>      7	---
>      8	
>      9	# APW — DSL Blueprint
>     10	
>     11	**Asset type:** DSL (Digital Sales Letter) — interactive HTML comparison blueprint.
>     12	**Framework source:** SCIO 51-slide framework adapted for APW.
>     13	**Status:** Iterated through v10. DSL script not yet written (pending).
>     14	
>     15	## What the DSL does
>     16	- Expands the VSL into a deeper, interactive, read-at-your-own-pace sales asset
>     17	 ...[truncated]


Found the leftover on line 18. Fixing:

> [!abstract]- Tool call: str_replace
> {"description": "Remove the remaining broken wiki-link on line 18", "new_str": "- Built as HTML following the **APW DSL Blueprint HTML SOP v2** → reproducible artifact builds", "old_str": "- Built as HTML following [[APW-DSL-Blueprint HTML SOP v2]] → reproducible artifact builds", "path": "/home/claude/apw-vault/04-Marketing/APW-DSL-Blueprint.md"}


> [!abstract]- Tool result: str_replace
> Successfully replaced string in /home/claude/apw-vault/04-Marketing/APW-DSL-Blueprint.md


> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude/apw-vault && python3 << 'EOF'\nimport os, re, glob\nnotes = {os.path.basename(f)[:-3] for f in glob.glob('**/*.md', recursive=True)}\nbroken = []\nfor f in glob.glob('**/*.md', recursive=True):\n    content = open(f).read()\n    content = re.sub(r'```[\\s\\S]*?```', '', content)\n    content = re.sub(r'`[^`]*`', '', content)\n    for match in re.findall(r'\\[\\[([^\\]]+)\\]\\]', content):\n        target = match.split('|')[0].split('#')[0].strip()\n        if target and target not in notes:\n            broken.append((f, target))\nprint(f\"Broken links: {len(broken ...[truncated]


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"Broken links: 0\n✅ Vault is clean.\n","stderr":""}


Clean. Now zip and deliver.

> [!abstract]- Tool call: bash_tool
> {"command": "cd /home/claude && zip -r /mnt/user-data/outputs/APW-Obsidian-Vault.zip apw-vault -x \"*.DS_Store\" && ls -la /mnt/user-data/outputs/", "description": "Zip the vault for download"}


> [!abstract]- Tool result: bash_tool
> {"returncode":0,"stdout":"  adding: apw-vault/ (stored 0%)\n  adding: apw-vault/00-Index/ (stored 0%)\n  adding: apw-vault/00-Index/MOC-APW-Curriculum.md (deflated 45%)\n  adding: apw-vault/00-Index/MOC-APW-Legal.md (deflated 39%)\n  adding: apw-vault/00-Index/MOC-APW-Master.md (deflated 54%)\n  adding: apw-vault/00-Index/MOC-APW-Offers.md (deflated 51%)\n  adding: apw-vault/00-Index/MOC-APW-Partners.md (deflated 31%)\n  adding: apw-vault/00-Index/MOC-APW-Tech-Stack.md (deflated 40%)\n  adding: apw-vault/00-Index/MOC-APW-Marketing.md (deflated 39%)\n  adding: apw-vault/00-Index/MOC-APW-Company ...[truncated]


> [!abstract]- Tool call: present_files
> {"filepaths": ["/mnt/user-data/outputs/APW-Obsidian-Vault.zip"]}


Done. **46 files, 9 MOCs, 28 domain notes, 3 KPIs, zero broken links.**

## How to open

1. Unzip
2. Obsidian → **Open folder as vault** → select the `apw-vault` folder
3. Open `README.md` first — it walks you through the graph-view config step-by-step
4. Then open `MOC-APW-Master.md` — hub of hubs

## What the graph will look like

Once you apply the 10 color groups from README Section 4, you'll see **gold MOCs (hub-suns)** sitting at the center of distinct colored clusters — cyan for offers, teal for curriculum, purple for marketing, red for legal, orange for tech, yellow for partners, green for KPIs, pink for people, steel for company. Cross-cluster links (e.g., SCIO linking marketing ↔ partners ↔ KPIs) show up as bright threads between tribes — that's the "neural" feel.

## Naming convention (locked in, reusable)

Going forward, every output I produce for you can drop straight into this vault if it follows:

```
[TYPE]-[DOMAIN]-[Topic].md
```

- **Prefixes:** `MOC-`, `APW-`, `SOP-`, `SCRIPT-`, `PERSON-`, `PARTNER-`, `KPI-`, `TPL-`
- **Domain segment:** `company`, `offer`, `course`, `content`, `vsl`, `dsl`, `legal`, `tech`, `partner`, `kpi`
- **Tag spine:** one `#apw/<domain>` + one `#type/<kind>` + one `#status/<state>`
- **Link density rule:** every new note links (a) its parent MOC, (b) 2–5 siblings, (c) any cross-domain note it genuinely touches

Tell me "format this for the vault" on any future output and I'll apply the full spec — frontmatter, prefix, folder suggestion, tag triad, and related-link block — ready to drop in.

## What I flagged for later

- **DSL Blueprint HTML SOP v2** is referenced as a framework name but doesn't have its own SOP note yet. When you want one, say the word — it'll become `SOP-APW-DSL-Blueprint-HTML-v2.md` in `06-Tech-Stack/` (or I can create a `10-SOPs/` folder if you want procedural docs separated from infra). 
- **Josephine Literski / NL Core** material was intentionally excluded — this vault is APW-only, per the separation rule in your memory. If you want a parallel NL Core vault with the same conventions, I can build it.
- **Consumer dispute work (FIB/DBFI, Amex, BiggerPockets)** also excluded — those aren't APW business operations. A separate "Disputes" vault with its own cluster system (CFPB complaints, evidence matrices, FTVL outputs, etc.) would be cleaner than mixing them in here.

---
