const fs = require('fs');
const {
  Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell,
  Header, Footer, AlignmentType, LevelFormat,
  HeadingLevel, BorderStyle, WidthType, ShadingType,
  PageNumber, PageBreak
} = require('docx');

// ============ HELPERS ============
const border = { style: BorderStyle.SINGLE, size: 1, color: "CCCCCC" };
const borders = { top: border, bottom: border, left: border, right: border };
const thickBorder = { style: BorderStyle.SINGLE, size: 2, color: "5B2D8E" };
const thickBorders = { top: thickBorder, bottom: thickBorder, left: thickBorder, right: thickBorder };
const headerShading = { fill: "5B2D8E", type: ShadingType.CLEAR };
const altShading = { fill: "F5F0FA", type: ShadingType.CLEAR };
const warnShading = { fill: "FFF3CD", type: ShadingType.CLEAR };
const cellMargins = { top: 60, bottom: 60, left: 100, right: 100 };

function headerCell(text, width) {
  return new TableCell({
    borders: thickBorders, width: { size: width, type: WidthType.DXA },
    shading: headerShading, margins: cellMargins,
    children: [new Paragraph({ children: [new TextRun({ text, bold: true, color: "FFFFFF", font: "Arial", size: 20 })] })]
  });
}
function cell(text, width, shade) {
  return new TableCell({
    borders, width: { size: width, type: WidthType.DXA },
    shading: shade ? altShading : undefined, margins: cellMargins,
    children: [new Paragraph({ children: [new TextRun({ text, font: "Arial", size: 20 })] })]
  });
}
function statusCell(status, width, shade) {
  const colors = { "Done": "28A745", "Locked": "5B2D8E", "Pending": "FFC107", "In Progress": "17A2B8", "Ongoing": "6C757D" };
  const color = colors[status] || "000000";
  return new TableCell({
    borders, width: { size: width, type: WidthType.DXA },
    shading: shade ? altShading : undefined, margins: cellMargins,
    children: [new Paragraph({ children: [new TextRun({ text: status, bold: true, color, font: "Arial", size: 20 })] })]
  });
}

function makeTable(headers, rows, colWidths) {
  const totalWidth = colWidths.reduce((a, b) => a + b, 0);
  const headerRow = new TableRow({ children: headers.map((h, i) => headerCell(h, colWidths[i])) });
  const dataRows = rows.map((row, ri) => new TableRow({
    children: row.map((c, ci) => {
      if (typeof c === 'object' && c.status) return statusCell(c.status, colWidths[ci], ri % 2 === 1);
      return cell(String(c), colWidths[ci], ri % 2 === 1);
    })
  }));
  return new Table({ width: { size: totalWidth, type: WidthType.DXA }, columnWidths: colWidths, rows: [headerRow, ...dataRows] });
}

function heading(text, level) {
  return new Paragraph({ heading: level, spacing: { before: level === HeadingLevel.HEADING_1 ? 360 : 240, after: 120 }, children: [new TextRun({ text, font: "Arial" })] });
}
function para(text, opts = {}) {
  return new Paragraph({ spacing: { after: opts.afterSpacing || 120 }, children: [new TextRun({ text, font: "Arial", size: 20, bold: opts.bold, italics: opts.italic, color: opts.color })] });
}
function boldPara(label, text) {
  return new Paragraph({ spacing: { after: 120 }, children: [new TextRun({ text: label, font: "Arial", size: 20, bold: true }), new TextRun({ text, font: "Arial", size: 20 })] });
}

const numbering = {
  config: [
    { reference: "bullets", levels: [{ level: 0, format: LevelFormat.BULLET, text: "\u2022", alignment: AlignmentType.LEFT, style: { paragraph: { indent: { left: 720, hanging: 360 } } } }] },
    { reference: "numbers", levels: [{ level: 0, format: LevelFormat.DECIMAL, text: "%1.", alignment: AlignmentType.LEFT, style: { paragraph: { indent: { left: 720, hanging: 360 } } } }] },
  ]
};
function bullet(text) {
  return new Paragraph({ numbering: { reference: "bullets", level: 0 }, spacing: { after: 60 }, children: [new TextRun({ text, font: "Arial", size: 20 })] });
}
function numItem(text) {
  return new Paragraph({ numbering: { reference: "numbers", level: 0 }, spacing: { after: 60 }, children: [new TextRun({ text, font: "Arial", size: 20 })] });
}

// ============ BUILD DOCUMENT ============
const children = [];

// TITLE PAGE
children.push(new Paragraph({ spacing: { before: 3000 } }));
children.push(new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "ASCEND PRIME WEALTH", font: "Arial", size: 56, bold: true, color: "5B2D8E" })] }));
children.push(new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 240 }, children: [new TextRun({ text: "COURSE FRAMEWORK BUILD", font: "Arial", size: 40, color: "5B2D8E" })] }));
children.push(new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 120 }, children: [new TextRun({ text: "MASTER SOP v3.8", font: "Arial", size: 48, bold: true, color: "000000" })] }));
children.push(new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 120 }, children: [new TextRun({ text: "Single Source of Truth", font: "Arial", size: 28, italics: true, color: "666666" })] }));
children.push(new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 480 }, children: [new TextRun({ text: "Consolidated from all prior versions. This is the ONLY SOP document.", font: "Arial", size: 22, color: "888888" })] }));
children.push(new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "Last Updated: March 12, 2026 (v3.8)", font: "Arial", size: 22, color: "888888" })] }));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ STATUS LABEL DEFINITIONS (NEW IN v3.1) ============
children.push(heading("STATUS LABEL DEFINITIONS", HeadingLevel.HEADING_1));
children.push(para("These labels are used throughout the SOP and prompt audit checklist. Every item uses exactly one of these statuses."));
children.push(makeTable(
  ["Status", "Meaning", "When It Changes"],
  [
    [{ status: "Done" }, "Task completed and verified. Output delivered.", "Only moves here after output is confirmed correct."],
    [{ status: "Locked" }, "Decision confirmed by Alan. Final unless Alan explicitly reopens it.", "Set when Alan confirms. Only Alan can unlock."],
    [{ status: "In Progress" }, "Currently being worked on. Not yet complete.", "Moves to Done when delivered + verified."],
    [{ status: "Pending" }, "Not started yet. Waiting for prerequisite steps.", "Moves to In Progress when work begins."],
    [{ status: "Ongoing" }, "Continuous requirement. Never fully complete. Applies to every output forever.", "Never moves to Done. Active throughout entire build."],
  ],
  [1500, 4430, 3430]
));

children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ CURRENT BUILD POSITION ============
children.push(heading("CURRENT BUILD POSITION", HeadingLevel.HEADING_1));
children.push(para("This tracker shows exactly where we are in the build process at all times. Updated after each confirmed step.", { italic: true }));
children.push(makeTable(["Step", "Deliverable", "Status"],
  [
    ["Step 0", "SOP Checklist (master operating document)", { status: "Done" }],
    ["Step 1", "Brain Dump (internalize + group content)", { status: "Done" }],
    ["Step 2a", "Bird's Eye Classroom Map (classrooms ONLY)", { status: "Done" }],
    ["Step 2b", "Program-Level Macro Roadmap & Timeline", { status: "Pending" }],
    ["Step 3", "7DFS Classroom - Module List (restructuring: Blitz/Prime Protocol paths)", { status: "In Progress" }],
    ["Step 4", "7DFS - Lessons Per Module (one by one)", { status: "Pending" }],
    ["Step 5", "Remaining Classrooms - Modules (Alan picks order)", { status: "Pending" }],
    ["Step 6", "Remaining Classrooms - Lessons (one by one)", { status: "Pending" }],
    ["Step 7", "Roadmaps & Timelines (program, classroom, module)", { status: "Pending" }],
    ["Step 8", "Standard Lesson Template + Master Checklist System", { status: "Pending" }],
    ["Step 9", "Win Architecture + Reassurance Architecture", { status: "Pending" }],
    ["Step 10", "DFY Classroom Outline", { status: "Pending" }],
    ["Step 11", "Client Shoes Walkthrough (confusion/constraint audit)", { status: "Pending" }],
    ["Step 12", "Final Systematic Alignment Review", { status: "Pending" }],
  ],
  [1200, 5560, 2600]));
children.push(para(""));
children.push(para("NEXT ACTION: Complete 7DFS module restructure (Blitz/Prime Protocol paths) -> Optimization Cycle -> Alan picks next step", { bold: true, color: "5B2D8E" }));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION 0: DOCUMENT MAP ============
children.push(heading("SECTION 0: DOCUMENT MAP + SYNERGY", HeadingLevel.HEADING_1));
children.push(para("Catalogs every source document and image, what each contains, and how they work together."));

children.push(heading("APW-Specific Documents (10)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Document", "What It Contains"],
  [
    ["1", "APW Wireframe v2", "Most complete wireframe. 5 classrooms + Graduation. Win architecture, reassurance architecture, DFY callouts, filming priority, standard lesson format, readiness checks. ~998 lines. PRIMARY structural reference."],
    ["2", "APW Remastered Wireframe", "Doctoral-level analysis of ALL previous wireframes + 6 diagram references. Section I = what each source got right/wrong. Section II = rebuilt wireframe. Strongest analytical document."],
    ["3", "APW Final Master Wireframe (Foundation-Preserving)", "WHY/WHAT/HOW/DO NOT format applied to Foundation. 5 classrooms, no graduation sequence. Source of truth for foundation modules."],
    ["4", "APW Final Hybrid Wireframe", "Merge of Foundation-Preserving into approved classroom flow. Shortest, cleanest version."],
    ["5", "APW Value Equation (Loom Transcript)", "Hormozi Value Equation applied to APW. Guarantee structure Layer 1 + Layer 2. Special approved cases. Raw founder voice."],
    ["6", "Offer Braindump", "Raw content inventory. Credit optimization, secondary bureaus, bank underwriting theory, internal bank scores, funding sequence logic, 9-step overview. Master topic list."],
    ["7", "Offer Details - Cooking (v1)", "Value equation breakdown, positioning vs competitors, guarantee structure, DWY/DFY, disclaimers, one-of-one positioning."],
    ["8", "Offer Details - Cooking (v2)", "Extended: DFY costs, hard inquiry removal DFY process, administrative fees, certified mail costs, secondary bureau admin."],
    ["9", "003 Pricing Ascension Model - APW", "Ascension pricing applied to APW. Competitor landscape. Trial-to-backend logic. Internal strategy."],
    ["10", "004 SCIO Onboarding DFY Copy", "Ideal client profile, deliverables, qualification requirements, case studies (Jasmine, Hung, Laura, Denise, Damon)."],
  ], [400, 2200, 6760]));

children.push(heading("External Reference Documents (3 - Sarah Turner, 8-Figure Course Creator)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Document", "What It Contains"],
  [
    ["11", "How To Create an Online Course that Sells", "5-step framework: topic validation, beta testing, lesson structure, learning styles, funnel overview."],
    ["12", "How to Create a Successful Online Course", "Learning theory: Vygotsky, 6 adult learning principles. Curriculum: modules = big steps, lessons = topic + measurable objective. Learning styles. Self-assessment."],
    ["13", "Grow/Scale/Start Your Life-Changing Course Masterclass", "Business model. 30 min/day compounding. Community > course for retention. Challenges as engagement drivers."],
  ], [400, 2200, 6760]));

children.push(heading("Internal Strategy Documents (4)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Document", "What It Contains"],
  [
    ["14", "Pricing Ascension Model (doc)", "SCIO pricing framework: trial to backend high-ticket. Applies to DWY to DFY upsell."],
    ["15", "Pricing Ascension Model Video Transcript", "Extended walkthrough with examples across business stages."],
    ["16", "001 SCIO Onboarding DFY", "SCIO DFY onboarding flow reference."],
    ["20", "Clarity & Simplification - Clint Response (03.11.2026)", "Complete 6-tier ascension model (0a DIY Credit Opt, 0b DFY ONLY, 1 Trial, 2 DWY, 3 DWY+DFY Ascended, 4 Full White Glove). V1 (Blitz) vs V2 (Prime Protocol) execution paths with bank-specific sequences and timelines. DFY ONLY delay analysis. Trial deliverables and exclusions. Pricing test ladder. Market feedback process."],
  ], [400, 2200, 6760]));

children.push(heading("Images Analyzed (5)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Image", "Content", "Placement"],
  [
    ["1", "Utilization Spectrum", "Color-coded 0%-30%+ utilization ranges", "Credit Optimization intro + Foundation reference"],
    ["2", "6 Credit Tiers", "Tier 1-6 routing with ETAs and funding outcomes", "Foundation (THE routing mechanism for client path)"],
    ["3", "Potential Offers", "Internal planning document, all offer tiers", "Internal reference only (validates ascension model)"],
    ["4", "Psych Success Fitness", "Mind map: emotional mastery, patience, mindset, surrender, gratitude, visualization", "Foundation 1.4 (compressed) + Graduation (deeper layers)"],
    ["5", "12-Step Success Path", "Full student journey orientation through mastery", "Foundation 1.5 (student-facing roadmap). Step 5 dupe to renumber."],
  ], [400, 1600, 3380, 3980]));

children.push(heading("How They All Synergize (4-Layer Model)", HeadingLevel.HEADING_2));
children.push(boldPara("Layer 1 - WHAT to teach: ", "Offer Braindump + Offer Details v1/v2 + SCIO Onboarding = every topic, deliverable, qualification, case study, guarantee term."));
children.push(boldPara("Layer 2 - HOW to structure: ", "4 wireframe versions. v2 = most complete. Remastered = analytical backbone. Foundation-Preserving = depth. Hybrid = clean merge."));
children.push(boldPara("Layer 3 - WHY it works: ", "Sarah Turner 3 transcripts = 8-figure methodology: learning theory, engagement, self-assessment, community, challenges, MVP, learning styles, win tracking, goal-setting."));
children.push(boldPara("Layer 4 - HOW to monetize: ", "Pricing Ascension Model + Value Equation + Clint Response = ascension logic (0a DIY -> 0b DFY ONLY -> 1 Trial -> 2 DWY -> 3 DWY+DFY Ascended -> 4 Full White Glove). V1 Blitz vs V2 Prime Protocol execution paths."));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION A: CLIENT INSTRUCTIONS ============
children.push(heading("SECTION A: WHAT THE CLIENT (ALAN) HAS INSTRUCTED", HeadingLevel.HEADING_1));
children.push(para("Every explicit instruction from all 8 messages, tracked for completion."));
children.push(makeTable(["#", "Requirement", "Status"],
  [
    ["A1", "Fully internalize all 19 documents + 5 images without missing nuanced points", { status: "Done" }],
    ["A2", "Group content in organized fashion before building", { status: "Done" }],
    ["A3", "Cap classrooms at ~10 max (fewer = better)", { status: "Locked" }],
    ["A4", "7 Day Fast Start classroom carries 80% of the transformation", { status: "Locked" }],
    ["A5", "Remaining 20% = setup (before) + advanced/nuanced (after)", { status: "Locked" }],
    ["A6", "Simplicity is king - 3rd to 5th grade language for new concepts", { status: "Locked" }],
    ["A7", "Optimize for quick wins at every stage", { status: "Locked" }],
    ["A8", "Optimize for consistent happiness/achievement (video game addiction model)", { status: "Locked" }],
    ["A9", "Optimize for checklists all the way through + completion tasks", { status: "Locked" }],
    ["A10", "Optimize for clarity all the way through", { status: "Locked" }],
    ["A11", "Standard lesson format: WHY / WHAT / HOW / DO NOT / ACTION", { status: "Locked" }],
    ["A12", "Roadmaps & timelines for: entire program, each classroom, each module", { status: "Locked" }],
    ["A13", "SOP checklist built BEFORE any framework output", { status: "Done" }],
    ["A14", "Surface suggestions/insights that benefit and improve results", { status: "Ongoing" }],
    ["A15", "Propose prompt/process alterations for maximized success", { status: "Ongoing" }],
    ["A16", "Client shoes walkthrough - identify all confusion/dissatisfaction/constraint points + solutions", { status: "Pending" }],
    ["A17", "Final systematic alignment review", { status: "Pending" }],
    ["A18", "Never assume - always ask to clarify", { status: "Ongoing" }],
    ["A19", "Graduation = its own standalone classroom", { status: "Locked" }],
    ["A20", "Monthly/weekly/daily action plans must tie to the roadmap/timeline", { status: "Locked" }],
    ["A21", "SOP must include program context section showing what builder knows", { status: "Done" }],
    ["A22", "Build process: bird's eye classrooms ONLY -> confirm -> 7DFS modules -> confirm -> lessons one by one -> confirm -> Alan picks next classroom", { status: "Locked" }],
    ["A23", "After every confirmation: suggestions/insights cycle -> confirm -> repeat until no improvements -> then next step", { status: "Locked" }],
    ["A24", "Review Sarah Turner transcripts for improvements - take 8-figure agency seriously", { status: "Done" }],
    ["A25", "Add Filming Priority column to deliverables", { status: "Done" }],
    ["A26", "Add Content Source tracker per module/lesson", { status: "Done" }],
    ["A27", "Add Ascension Trigger check per classroom", { status: "Done" }],
    ["A28", "Create master prompt audit checklist tracking every user prompt", { status: "Done" }],
    ["A29", "Classroom 3 (Credit Optimization): REQUIRED for all students. Intro lessons with checklist determine skip/proceed for remaining content. NOT a conditional classroom.", { status: "Locked" }],
    ["A30", "Classrooms 1-5 = required core path. Classrooms 6-7-8 = optional/ascension", { status: "Locked" }],
    ["A31", "Black Box name stays - intentionally secret/grey area strategies", { status: "Locked" }],
    ["A32", "Every output must be checked against SOP + prompt checklist before delivery", { status: "Locked" }],
    ["A33", "SOP must be consolidated single source of truth (not spread across versions)", { status: "Done" }],
    ["A34", "Goal-setting lesson added to onboarding - critical gap identified", { status: "Locked" }],
    ["A35", "Rapid Repeat Funding module added to Credit Optimization classroom", { status: "Locked" }],
    ["A36", "Add status label definitions to SOP", { status: "Done" }],
    ["A37", "Add named pre-output verification protocol to prevent output errors", { status: "Done" }],
    ["A38", "Every output must START or END with the user prompt checklist + SOP checklist checked off in real time", { status: "Locked" }],
    ["A39", "Bonus: list check completions inline as you go, in addition to bulk list", { status: "Locked" }],
    ["A40", "Add Process Flow Verification (PFV) to SOP to prevent skipping the optimization cycle or other process steps", { status: "Done" }],
    ["A41", "Add Error Log section documenting every mistake, cause, and protocol added", { status: "Done" }],
    ["A42", "Add Current Build Position tracker to SOP", { status: "Done" }],
    ["A43", "Add D22: The SOP is a deliverable (explicit, not implicit)", { status: "Done" }],
    ["A44", "Add Quick Reference Card as last page of SOP", { status: "Done" }],
    ["A45", "Add 6 Credit Tier ETAs from Image 2 into Section G", { status: "Done" }],
    ["A46", "Every SOP update must increment version number and explicitly state it (D23)", { status: "Locked" }],
    ["A47", "Bird's eye map: note which classrooms contain DFY callouts", { status: "Done" }],
    ["A48", "Bird's eye map: add estimated weight/density per classroom (not module detail)", { status: "Done" }],
    ["A49", "Bird's eye map: add Reassurance Checkpoint (RC) markers at classroom level for predictable doubt moments", { status: "Done" }],
    ["A50", "Bird's eye map: add WHY Reconnection touchpoints at classroom level (Foundation end, 7DFS midpoint, Graduation)", { status: "Done" }],
    ["A51", "Classroom map confirmed complete after Round 3 — deeper detail belongs at module/lesson level", { status: "Locked" }],
    ["A52", "SOP outputs must state current version AND new proposed version number (D24)", { status: "Locked" }],
    ["A53", "7DFS needs restructuring: account opening Week 1, research concurrent, applications Week 5 or 9", { status: "In Progress" }],
    ["A54", "People have clearly defined separate paths that must be communicated clearly, simply, intuitively", { status: "Locked" }],
    ["A55", "V1 = The Blitz (speed, personal+business, one-time, 6-24mo cooldown). V1b = business only sub-option.", { status: "Locked" }],
    ["A56", "V2 = The Prime Protocol (recommended, 90-120 day, business only, multi-round, repeatable)", { status: "Locked" }],
    ["A57", "Quick Win path: LightStream 48hrs, Chase 10 days after account open, Navy pledge loan seed, BOA seed 2mo, AMEX 1-9 weeks", { status: "Locked" }],
    ["A58", "Realistic timelines: account opening Week 1+, research Weeks 1-4 concurrent, review Week 4, apps Week 5 (speed) or Week 9 (leverage)", { status: "Locked" }],
    ["A59", "Install Clint Response doc (Doc #20) into SOP as source document", { status: "Done" }],
    ["A60", "6-tier ascension model, DFY ONLY delay analysis, trial structure — all integrated into SOP", { status: "Done" }],
  ],
  [500, 6860, 2000]));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION B: CONFIRMED DESIGN DECISIONS ============
children.push(heading("SECTION B: CONFIRMED DESIGN DECISIONS", HeadingLevel.HEADING_1));
children.push(makeTable(["#", "Decision", "Final Answer"],
  [
    ["B1", "Business Entity Setup", "Module within Foundation classroom (not separate classroom)"],
    ["B2", "Credit Optimization/Repair", "Its own classroom. REQUIRED for all students - every student enters. Intro lessons with checklist determine if student can skip remaining content or must complete it (with referenced videos for each item). Foundation routes clients here. Includes fix-it packet for inquiry removal during rapid repeat funding."],
    ["B3", "DFY Track", "Embedded callouts in each lesson pointing to DFY classroom + DFY Slack. Locked DFY classroom visible to all (intrigue/desire). Content TBD."],
    ["B4", "Bank Lists Access", "Locked behind money-back guarantee waiver (Layer 2). Clients retain results guarantee (Layer 1). Data tracked."],
    ["B5", "Pricing Ascension Model", "Internal primarily. Surface where relevant for ascension upsell design."],
    ["B6", "Graduation Sequence", "Its own standalone classroom (NOT a module within another classroom)"],
    ["B7", "Target Classroom Count", "8 classrooms confirmed. 1-5 required core. 6-7-8 optional/ascension."],
    ["B8", "Lesson Video Length", "1-10 min vast majority. Outliers 20 min. Rare 40 min max."],
    ["B9", "Checklists", "Embedded in Skool (user-facing) + text readiness checks + SOP checklists for builders"],
    ["B10", "Action Plans", "Both: master generalized checklist + per-lesson pull-in items for measurable progress. Must integrate with roadmap/timeline."],
    ["B11", "Black Box Naming", "Name stays. Intentionally secret - hidden strategies, methods, and grey area content."],
    ["B12", "Execution Path Naming — V1 = The Blitz", "Speed path. Personal + Business. Max immediate extraction. One-time. Delays future rounds 6-24+ months. Sub-option V1b = business only for future eligibility."],
    ["B13", "Execution Path Naming — V2 = The Prime Protocol", "Recommended 90-120 day multi-round path. Business only. Repeatable in 1 week - 1 month. Requires $5-10K+ cash reserved. THE flagship strategy."],
    ["B14", "6-Tier Ascension Model", "0a) DIY Credit Opt ($47-97/mo or $997). 0b) DFY ONLY ($0-2K + 10% fees, no education, SLOWER). 1) Trial (~$750). 2) DWY ($5K-$15K). 3) DWY + DFY Ascended ($10K-$30K). 4) Full White Glove ($15K-$35K)."],
    ["B15", "DFY ONLY is slower than DFY+DWY", "DFY ONLY completes steps sequentially (pay 10% per step before next). 4+ weeks Month 1 delay. 9-12+ months extended phase delay. DFY+DWY = 90-120 days. Teaching point inside course."],
    ["B16", "Trial = first module access only", "Trial clients see Classroom 1 only. Demonstrates credibility. Excludes: bank lists, sequencing, templates, scripts, playbooks, underwriting strategies."],
  ],
  [500, 3000, 5860]));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION C: DELIVERABLES ============
children.push(heading("SECTION C: WHAT NEEDS TO BE BUILT (DELIVERABLES)", HeadingLevel.HEADING_1));
children.push(makeTable(["#", "Deliverable", "Filming Priority", "Status"],
  [
    ["C1", "Bird's eye classroom map (all classrooms labeled, sequenced, role, core/optional)", "N/A (structural)", { status: "Done" }],
    ["C2", "Program-level macro roadmap & timeline with milestone markers", "N/A (structural)", { status: "Pending" }],
    ["C3", "7DFS classroom - module list", "PHASE 1 - FILM FIRST", { status: "Pending" }],
    ["C4", "7DFS - lessons per module", "PHASE 1", { status: "Pending" }],
    ["C5", "Remaining classrooms - module lists (one at a time, Alan picks)", "PHASE 2-4", { status: "Pending" }],
    ["C6", "Remaining classrooms - lessons per module", "PHASE 2-4", { status: "Pending" }],
    ["C7", "Classroom-level roadmaps", "N/A (structural)", { status: "Pending" }],
    ["C8", "Module-level roadmaps", "N/A (structural)", { status: "Pending" }],
    ["C9", "Standard lesson template (WHY/WHAT/HOW/DO NOT/ACTION)", "N/A (template)", { status: "Pending" }],
    ["C10", "Master checklist system (generalized + per-lesson pull-in)", "N/A (operational)", { status: "Pending" }],
    ["C11", "Win architecture map", "N/A (design)", { status: "Pending" }],
    ["C12", "Reassurance architecture map", "N/A (design)", { status: "Pending" }],
    ["C13", "DFY locked classroom outline", "PHASE 5 (post-launch)", { status: "Pending" }],
    ["C14", "Client confusion/constraint audit", "N/A (analysis)", { status: "Pending" }],
    ["C15", "Ascension trigger map (natural upsell per classroom)", "N/A (design)", { status: "Pending" }],
  ],
  [500, 4360, 2500, 2000]));

children.push(heading("Filming Priority Order", HeadingLevel.HEADING_2));
children.push(bullet("PHASE 1: 7 Day Fast Start (Classroom 4) - 80% of transformation. Film first."));
children.push(bullet("PHASE 2: Foundation (Classroom 2) - prerequisites protect student + legal."));
children.push(bullet("PHASE 3: Welcome & Orientation (Classroom 1) - film last so it feels current."));
children.push(bullet("PHASE 4: Credit Optimization (Classroom 3) - film alongside Phase 2."));
children.push(bullet("PHASE 5 (POST-LAUNCH): Graduation, Bank Intel, Black Box, DFY."));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION D: PROCESS RULES ============
children.push(heading("SECTION D: HOW WE BUILD (PROCESS RULES)", HeadingLevel.HEADING_1));
children.push(para("These rules govern every step of the build. No exceptions."));
children.push(makeTable(["#", "Rule", "Description"],
  [
    ["D1", "Step-by-step, never skip ahead", "Bird's eye classrooms ONLY -> confirm -> 7DFS modules -> confirm -> lessons. Never jump levels. Never combine steps in a single output."],
    ["D2", "Confirm before proceeding", "Every deliverable requires Alan's explicit confirmation before moving to next"],
    ["D3", "Suggestions cycle after every confirmation", "After confirm -> optimization suggestions with reasoning -> confirm/adjust -> cycle until done -> then next step. MANDATORY."],
    ["D4", "Alan chooses next step", "After each section, present logical next options. Alan picks."],
    ["D5", "7DFS classroom built FIRST", "Core classroom before any other classroom details"],
    ["D6", "Never assume", "If unclear, ask. Do not guess. Do not infer meaning beyond what was explicitly stated."],
    ["D7", "Simplicity filter", "Every output checked: would a 5th grader understand the progression?"],
    ["D8", "Win check", "Every module must have at least one designed win"],
    ["D9", "Checklist check", "Every module must have completion tasks / checklist items"],
    ["D10", "DFY callout check", "Every relevant lesson must include DFY callout"],
    ["D11", "Credit repair routing check", "Foundation must clearly route ALL clients to Classroom 3. Skip logic is INTERNAL to Classroom 3, not external."],
    ["D12", "Guarantee documentation check", "Every guarantee-relevant action step must have documentation instruction"],
    ["D13", "Confirm -> Suggest -> Confirm cycle", "After every confirmation: suggestions -> confirm/adjust -> repeat until no improvements -> then next. Label: OPTIMIZATION CYCLE - Round [#]"],
    ["D14", "Ascension trigger check", "Every classroom must have at least one natural moment where next tier becomes desirable"],
    ["D15", "Content source verification", "Every module/lesson must trace to at least one source doc. No source = flag as new addition needing confirmation"],
    ["D16", "Filming priority tagging", "Every module tagged with filming phase"],
    ["D17", "Sarah Turner principle check", "(1) measurable objective per lesson, (2) multiple learning styles, (3) self-assessment checkpoint, (4) community prompt, (5) win tracking"],
    ["D18", "SOP compliance check", "Every output verified against this SOP + prompt audit checklist BEFORE delivery. No exceptions."],
    ["D19", "PRE-OUTPUT VERIFICATION PROTOCOL (POVP)", "Named protocol. Before delivering ANY output: (1) Read each relevant prompt item word-by-word, (2) Compare against output for exact match, (3) Flag any mismatch, (4) Correct before delivering. See Section L for full protocol."],
    ["D20", "Real-time checklist display", "Every output must START or END with the prompt checklist + SOP checklist checked off in real time. Bonus: list checks inline as they complete."],
    ["D21", "PROCESS FLOW VERIFICATION (PFV)", "Before ending ANY response that delivers a framework output, verify: (1) Did I execute the optimization cycle? (D3/D13/Section H), (2) Did I skip any build steps? (D1), (3) Did I present options for Alan to pick next? (D4), (4) Did I label the cycle round? (Section H label). If any answer is NO, do not end the response — execute the missing step. See Section M for full protocol."],
    ["D22", "The SOP is a deliverable", "The SOP itself is subject to EVERY process rule: optimization cycles (D3/D13/Section H), POVP (D19/Section L), PFV (D21/Section M), real-time checklist display (D20). No deliverable is exempt. If it gets outputted, it gets the full treatment."],
    ["D23", "Version increment on every SOP update", "Every confirmed change to the SOP creates a new version number (e.g., v3.5 -> v3.6). The version number must be explicitly stated when delivering the update. No silent edits. No in-place overwrites without a new version."],
    ["D24", "State current AND proposed version numbers", "When proposing an SOP update, builder must explicitly state: 'SOP Update: v[current] -> v[new]' before making changes. Both numbers visible so Alan always knows where we are and where we're going."],
  ],
  [500, 2500, 6360]));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION E: PRINCIPLES ============
children.push(heading("SECTION E: WHY WE DO IT THIS WAY (PRINCIPLES)", HeadingLevel.HEADING_1));
children.push(makeTable(["#", "Principle", "Reasoning"],
  [
    ["E1", "Quick wins", "Clients who feel progress early stay longer, complete more, refer more. Video game dopamine loop."],
    ["E2", "3rd-5th grade language", "Confusion = dropout. Simplicity = confidence = execution."],
    ["E3", "Checklists everywhere", "Removes thinking. Removes ambiguity. Creates measurable progress."],
    ["E4", "WHY/WHAT/HOW/DO NOT/ACTION format", "WHY = buy-in. WHAT = understanding. HOW = execution. DO NOT = prevents mistakes. ACTION = results."],
    ["E5", "Gate hard before core", "Unready clients executing too early = bad results, refunds, bad reviews, support burden."],
    ["E6", "Celebrate relentlessly", "Emotional anchors at every stage prevent dropout at predictable doubt moments."],
    ["E7", "Document everything", "Guarantee trail protects Alan legally + creates accountability + proof for testimonials."],
    ["E8", "DFY visible but locked", "Creates intrigue, desire, natural upsell without being pushy."],
    ["E9", "Shorter lessons (1-10 min)", "Lower barrier to start, higher completion rates, more frequent win moments."],
    ["E10", "Confirm-suggest-cycle", "Prevents building wrong thing. Catches optimizations in real-time."],
    ["E11", "Zones of proximal development (Vygotsky/Sarah Turner)", "Push just beyond current ability. Not so hard it overwhelms."],
    ["E12", "6 adult learning principles (Sarah Turner)", "Know WHY before HOW. Practical, relevant, problem-solving, intrinsic motivation. Validates WHY/WHAT/HOW/DO NOT/ACTION."],
    ["E13", "MVP first, expand later (Sarah Turner)", "Launch 7DFS + Foundation first. Film later classrooms post-launch when real data informs content."],
    ["E14", "Compounding actions (30 min/day)", "Consistent small actions beat marathon sessions."],
    ["E15", "Community > course for retention (Sarah Turner)", "Seed engagement from Module 1.1. Wednesday Wins, challenges, peer support."],
    ["E16", "Challenges as engagement drivers (Sarah Turner)", "Periodic live challenges increase completion and create social proof."],
  ],
  [500, 3000, 5860]));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION F: CLIENT EXPERIENCE TARGETS ============
children.push(heading("SECTION F: CLIENT EXPERIENCE OPTIMIZATION TARGETS", HeadingLevel.HEADING_1));
children.push(makeTable(["#", "Target", "How We Achieve It"],
  [
    ["F1", "Quick wins", "First win within 30 min of joining. Win in every module."],
    ["F2", "Highest probability of success", "Gate hard. Don't let unready clients execute. Clear roadmaps."],
    ["F3", "Maximum clarity", "No jargon without explanation. Checklists. Visual roadmaps."],
    ["F4", "Simplicity", "Fewer classrooms. Shorter lessons. One concept per lesson."],
    ["F5", "Ease / effortlessness", "Remove thinking - tell them exactly what to do, in what order, with what words."],
    ["F6", "Remove heavy lifting", "Templates, scripts, sequences, checklists, DFY option."],
    ["F7", "Maximize happiness/satisfaction", "Win architecture + celebration + reassurance at doubt moments."],
    ["F8", "Goals identified & documented", "Onboarding captures goals + defines first level of success. Roadmap maps to action."],
    ["F9", "Tangible actionable roadmap", "Program -> classroom -> module -> daily. All integrated."],
    ["F10", "Unreasonable not to succeed", "Complete every checklist item = mathematically near-impossible to fail."],
  ],
  [500, 2500, 6360]));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION G: PROGRAM CONTEXT ============
children.push(heading("SECTION G: PROGRAM CONTEXT - WHAT THE BUILDER KNOWS", HeadingLevel.HEADING_1));
children.push(para("Confirms builder understanding so Alan can identify gaps.", { italic: true }));

children.push(heading("The Offer", HeadingLevel.HEADING_2));
children.push(para("APW (Ascend Prime Wealth) teaches people how to repeatedly unlock $100K-$500K+ in business funding within 90 days without tax returns, income documentation, or paying funding companies 10% fees. Core promise: self-sufficiency."));
children.push(boldPara("Two tiers: ", "DWY ($5K-$12K) and DFY ($10K-$25K or +$3-5K add-on)."));

children.push(heading("Guarantee Structure", HeadingLevel.HEADING_2));
children.push(boldPara("Layer 1 (Outcome): ", "Complete steps + 80%+ calls + use support. Not funded = keep working free until funded."));
children.push(boldPara("Layer 2 (Money-Back): ", "100% curriculum + 90%+ calls + documented proof + not at $100K minimum = full refund within 90 days."));
children.push(boldPara("90-Day Clock: ", "Starts ONLY when funding-ready status confirmed."));
children.push(boldPara("Special Approved Cases: ", "Guarantee = funding execution only. Credit optimization excluded. 12-month cap, 20% partial."));
children.push(boldPara("Bank Lists: ", "Requires waiving Layer 2. Retains Layer 1."));

children.push(heading("Qualification Requirements", HeadingLevel.HEADING_2));
children.push(bullet("720-750+ FICO 8 minimum (can help if below = special approved)"));
children.push(bullet("3-5+ open tradelines/credit cards"));
children.push(bullet("Primary card $10K+ limit ($2,500+ workable but slower)"));
children.push(bullet("2+ year business entity with SOS (can help acquire aged ~$2K)"));
children.push(bullet("No derogatory items (can help = special approved)"));
children.push(bullet("<1 recently opened credit-reporting account in past 6 months"));
children.push(bullet("2+ years average credit age (5-9+ ideal)"));
children.push(bullet("<2 hard inquiries per bureau (flexible based on age)"));
children.push(bullet("<30% utilization (can help navigate higher)"));

children.push(heading("Core Process (9 Steps)", HeadingLevel.HEADING_2));
children.push(numItem("Establish fundable credit profile + fundable business entity"));
children.push(numItem("Create funding sequence via compatible banks & bureau pulls"));
children.push(numItem("Open accounts and develop banking relationships"));
children.push(numItem("Apply and await results - adjust based on feedback"));
children.push(numItem("Complete funding round wave across bureaus"));
children.push(numItem("Remove hard inquiries (credit is for entity, not individual)"));
children.push(numItem("Prepare for next round/wave - repeat 1-6 (THE LOOP)"));
children.push(numItem("Leverage funding (0% promo periods, liquidation options)"));
children.push(numItem("Budget 1-3% per month for minimums (6-12 month reserve)"));

children.push(heading("Bank Underwriting Theory", HeadingLevel.HEADING_2));
children.push(bullet("Banks match banks - mirror credit limits from Tier 1 institutions"));
children.push(boldPara("Internal score factors: ", "deposit amounts ($10K+ daily), transaction count (10-25+/mo), money-in vs out, diversity (ACH, Zelle, cash, check, wire), frequency, products, internal history."));
children.push(boldPara("Sequence: ", "National banks -> regional banks -> credit unions."));
children.push(boldPara("Two paths: ", "Speed Path (quicker/lower max) vs Leverage Path (longer/higher max)."));

children.push(heading("6 Credit Tiers (from Image 2 - THE Routing Mechanism)", HeadingLevel.HEADING_2));
children.push(para("This tier system determines each client's path, timeline, and expected funding outcome. Critical for classroom map and roadmap."));
children.push(makeTable(["Tier", "Profile", "ETA to Funding-Ready", "Expected Funding Outcome"],
  [
    ["Tier 1", "750+ FICO, clean profile, 5+ tradelines, low utilization", "0 - already ready (skip Classroom 3)", "$100K-$250K+ Round 1"],
    ["Tier 2", "720+, minor issues (1-2 inquiries, slightly high utilization)", "2-4 weeks optimization", "$100K-$200K Round 1"],
    ["Tier 3", "680-720, moderate issues", "1-3 months optimization", "$50K-$150K Round 1"],
    ["Tier 4", "600-680, significant issues (collections, late payments)", "3-6 months (special approved case)", "$30K-$100K Round 1"],
    ["Tier 5", "500-600, major rebuilding needed", "6-12 months (special approved case)", "Variable - depends on rebuild"],
    ["Tier 6", "<500, severe damage", "12+ months (special approved case)", "Variable - long-term project"],
  ],
  [900, 2800, 2800, 2860]));
children.push(para("Tier 1 clients skip Classroom 3 content via intro checklist. All others complete relevant portions. The Loop (Round 2+) compounds results: $100K Round 1 can become $300K-$500K+ over 2-3 rounds."));

children.push(heading("Execution Paths (Named)", HeadingLevel.HEADING_2));
children.push(makeTable(["Path", "Name", "Type", "Repeat Eligibility", "Cash Needed", "Funding Potential M1", "Additional"],
  [
    ["V1a", "The Blitz (Personal + Business)", "Max speed, one-time extraction", "6-24+ month delay", "None", "$100K-$300K+", "$100K-$350K+ after. $500K+ best case."],
    ["V1b", "The Blitz (Business Only)", "Speed, preserve future rounds", "Future rounds eligible", "None", "Less than V1a", "Preserves optionality"],
    ["V2", "The Prime Protocol (RECOMMENDED)", "90-120 day multi-round", "Repeat 1wk-1mo", "$5-10K+ reserved", "$100K-$200K+", "$50K-$250K+ after. $500K+ best case."],
  ], [700, 2200, 1800, 1400, 1000, 1200, 1060]));
children.push(para("The Prime Protocol (V2) is the flagship strategy. The Blitz (V1) is the speed alternative for those who accept the 6-24 month cooldown."));

children.push(heading("6-Tier Ascension Model", HeadingLevel.HEADING_2));
children.push(makeTable(["Tier", "Offer", "Price Range", "Key Differentiator"],
  [
    ["0a", "DIY Credit Optimization", "$47-97/mo or $997", "Credit cleanup prerequisite. Build last."],
    ["0b", "DFY Funding ONLY", "$0-2K + 10% fees", "No education. No community. SLOWER (sequential steps, 10% per step before next). 9-12+ mo delay on extended phase."],
    ["1", "Trial", "~$750", "Strategy overview, eligibility assessment, roadmap preview. CL1 access only. No execution tools."],
    ["2", "DWY Program (THE course)", "$5K-$15K (test ladder)", "Full education, curriculum, group coaching. Students execute with guidance."],
    ["3", "DWY + DFY Ascended", "$10K-$30K", "DWY + custom A-Z strategy, bank lists, data points, DFY BRM handoffs, DFY research."],
    ["4", "Full White Glove", "$15K-$35K", "Everything + DFY credit optimization (hard inquiries, negative data, POA, certified mail)."],
  ], [500, 2200, 1800, 4860]));
children.push(para("DFY ONLY (0b) is SLOWER than DFY+DWY: each step sequential, 4+ weeks M1 delay, 9-12+ months extended phase. Teaching point: learning = faster + cheaper.", { bold: true }));

children.push(heading("Competitor Landscape", HeadingLevel.HEADING_2));
children.push(boldPara("Most DFY companies: ", "$0 upfront + 10% fees. Only 6 national banks. Outsource. Bait-and-switch."));
children.push(boldPara("Only 2 A-Z competitors: ", "One $15-30K (scam). One $15K (flakes)."));
children.push(boldPara("APW differentiators: ", "Founder-delivered, damaged-credit-proven ($300K+), 40+ competitor experiences, current data, self-sufficiency, double guarantee, transparent."));

children.push(heading("Case Studies", HeadingLevel.HEADING_2));
children.push(bullet("Jasmine: 500s -> 800+ in 2 months, approvals after others failed"));
children.push(bullet("Hung: 600s -> 800+, late payment removed, optimized in months"));
children.push(bullet("Medical accident: 500 -> 800+, hundreds of thousands funded"));
children.push(bullet("Laura: $140K+ unsecured debt eliminated"));
children.push(bullet("Denise: credit optimization education to remove negative items"));
children.push(bullet("Damon: consumer law education for 3rd-party collections"));

children.push(heading("Client Avatar + Wants", HeadingLevel.HEADING_2));
children.push(boldPara("Who: ", "Business owners, aspiring entrepreneurs. Must afford $5K-$25K. Action-takers, accountable, growth-oriented."));
children.push(boldPara("Want: ", "Clear roadmap, exact data, told what to do, DFY option, guarantee, actual results, clarity, ease, system/structure, high support, precision, integrity."));
children.push(boldPara("Platform: ", "Skool (classrooms -> modules -> lessons). DFY via Slack."));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION H: OPTIMIZATION CYCLE ============
children.push(heading("SECTION H: CONFIRM -> SUGGEST -> OPTIMIZE CYCLE", HeadingLevel.HEADING_1));
children.push(para("Mandatory closing protocol for EVERY step. No exceptions.", { bold: true, color: "CC0000" }));

children.push(heading("The Protocol", HeadingLevel.HEADING_2));
children.push(numItem("Alan confirms any deliverable"));
children.push(numItem("Builder provides optimization suggestions with specific reasoning"));
children.push(numItem("Alan reviews - confirms, adjusts, or rejects each"));
children.push(numItem("Builder incorporates changes and presents updated version"));
children.push(numItem("Repeat 2-4 until Alan confirms no more improvements"));
children.push(numItem("ONLY THEN move to next step. Builder presents options, Alan picks."));

children.push(heading("Applies To", HeadingLevel.HEADING_2));
children.push(para("Everything: classroom map, module lists, lesson lists, roadmaps, templates, checklists, architecture maps, outlines, audits. No exceptions."));

children.push(heading("Label", HeadingLevel.HEADING_2));
children.push(para("OPTIMIZATION CYCLE - Round [#]", { bold: true }));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION I: SARAH TURNER IMPROVEMENTS ============
children.push(heading("SECTION I: IMPROVEMENTS FROM SARAH TURNER (8-FIGURE COURSE AGENCY)", HeadingLevel.HEADING_1));
children.push(makeTable(["#", "Improvement", "Why It Matters", "Status"],
  [
    ["I1", "Pre-program survey (goals, experience, expectations)", "Personalizes Day 1. Go/No-Go captures credit but NOT goals.", { status: "Locked" }],
    ["I2", "Wednesday Wins (weekly win-sharing)", "Compounding social proof. Reconnects to progress. Retention.", { status: "Locked" }],
    ["I3", "Challenges (30-Day Credit Cleanup, 7DFS Sprint)", "Massively increases completion. Group accountability.", { status: "Locked" }],
    ["I4", "Weekly digest pulling students back", "Combats #1 problem: not logging in.", { status: "Locked" }],
    ["I5", "Learning objective per lesson: By end, you will have [done X]", "Measurable completion = satisfaction.", { status: "Locked" }],
    ["I6", "Multiple learning styles (video + PDF + workbook + community)", "All 4 styles = max retention.", { status: "Locked" }],
    ["I7", "Reconnect to WHY at multiple points", "Students drift. Prompts reactivate motivation. Foundation end, 7DFS midpoint, Graduation.", { status: "Locked" }],
    ["I8", "Goal-setting at start with first level of success (CRITICAL)", "Prevents disappointment from mismatched expectations.", { status: "Locked" }],
    ["I9", "Giveaways/prizes for engagement", "Gamification. Low cost, high engagement.", { status: "Locked" }],
    ["I10", "Track and share student data obsessively", "Marketing material, validation, stuck-point identification, testimonials.", { status: "Locked" }],
  ],
  [400, 2800, 4160, 2000]));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION J: MASTER PROMPT AUDIT CHECKLIST ============
children.push(heading("SECTION J: MASTER PROMPT AUDIT CHECKLIST", HeadingLevel.HEADING_1));
children.push(para("Every user prompt from the entire thread. Builder must verify against this BEFORE every output (see POVP, Section L).", { bold: true }));

// Message 1
children.push(heading("Message 1 - Opening Prompt (37 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["1.1", "Create course framework perfected in detail based on documents", { status: "In Progress" }],
    ["1.2", "Without missing any nuanced point", { status: "Ongoing" }],
    ["1.3", "Aligning with getting clients results as fast as possible", { status: "Locked" }],
    ["1.4", "Maximizing user experience and satisfaction", { status: "Locked" }],
    ["1.5", "With respect to time and effort/sacrifice", { status: "Locked" }],
    ["1.6", "With clarity, ease, simplicity", { status: "Locked" }],
    ["1.7", "Clear roadmap all the way through", { status: "Locked" }],
    ["1.8", "Roadmaps/timelines for entire program", { status: "Locked" }],
    ["1.9", "Roadmaps/timelines for each classroom", { status: "Locked" }],
    ["1.10", "Roadmaps/timelines for each module", { status: "Locked" }],
    ["1.11", "Standard format: WHY/WHAT/HOW/DO NOT/ACTION", { status: "Locked" }],
    ["1.12", "Step 1: Brain dump - internalize all docs, group organized", { status: "Done" }],
    ["1.13", "Max 10 classrooms", { status: "Locked" }],
    ["1.14", "Step 2: Build wireframe - classrooms, modules, lessons + 7DFS = 80%", { status: "In Progress" }],
    ["1.15", "Simplicity is king", { status: "Locked" }],
    ["1.16", "3rd-5th grade language", { status: "Locked" }],
    ["1.17", "Optimize for quick wins", { status: "Locked" }],
    ["1.18", "Video game addiction model (consistent happiness, max retention)", { status: "Locked" }],
    ["1.19", "Checklists + completion tasks", { status: "Locked" }],
    ["1.20", "Optimize for clarity", { status: "Locked" }],
    ["1.21", "Step 3: SOP checklist before framework", { status: "Done" }],
    ["1.22", "Step 4: Suggestions/insights to improve", { status: "Done" }],
    ["1.23", "Step 5: Propose prompt/process alterations", { status: "Ongoing" }],
    ["1.24", "Quick wins (repeated)", { status: "Locked" }],
    ["1.25", "Highest probabilities of success", { status: "Locked" }],
    ["1.26", "Maximum clarity (repeated)", { status: "Locked" }],
    ["1.27", "Simplicity (repeated)", { status: "Locked" }],
    ["1.28", "Ease / effortlessness", { status: "Locked" }],
    ["1.29", "Remove thinking, heavy lifting for clients", { status: "Locked" }],
    ["1.30", "Maximize happiness, satisfaction, fulfillment", { status: "Locked" }],
    ["1.31", "Goals clearly identified and documented at beginning", { status: "Locked" }],
    ["1.32", "Tangible roadmap, checklist, action plan", { status: "Locked" }],
    ["1.33", "Monthly, weekly, daily completion tasks", { status: "Locked" }],
    ["1.34", "Unreasonable not to succeed if completed", { status: "Locked" }],
    ["1.35", "Step 6: Client shoes walkthrough", { status: "Pending" }],
    ["1.36", "Step 7: Review everything, ensure alignment", { status: "Pending" }],
    ["1.37", "Step 8: Always ask to clarify, never assume", { status: "Ongoing" }],
  ], [600, 6760, 2000]));

// Message 2
children.push(heading("Message 2 - Clarifying Answers (16 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["2.1", "Business entity = module within Foundation", { status: "Locked" }],
    ["2.2", "Credit optimization = its own classroom with Foundation routing", { status: "Locked" }],
    ["2.3", "DFY needs more detail (resolved Msg 3)", { status: "Done" }],
    ["2.4", "Bank lists locked behind guarantee waiver", { status: "Locked" }],
    ["2.5", "Pricing ascension = internal primarily", { status: "Locked" }],
    ["2.6", "Graduation (updated to own classroom Msg 4)", { status: "Locked" }],
    ["2.7", "5-7 classrooms if makes sense", { status: "Locked" }],
    ["2.8", "Step by step: bird's eye -> classrooms -> 7DFS -> modules -> lessons", { status: "Locked" }],
    ["2.9", "Start with 7DFS ONLY once classrooms established", { status: "Locked" }],
    ["2.10", "After each part, ask what next with options", { status: "Locked" }],
    ["2.11", "Lesson length: 1-10 min, outliers 20, rare 40", { status: "Locked" }],
    ["2.12", "Checklists embedded in Skool = yes", { status: "Locked" }],
    ["2.13", "Readiness checks as text = yes", { status: "Locked" }],
    ["2.14", "User-facing AND builder-facing checklists", { status: "Locked" }],
    ["2.15", "Master generalized + per-lesson pull-in", { status: "Locked" }],
    ["2.16", "SOP checklist please", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 3
children.push(heading("Message 3 - DFY + Process (10 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["3.1", "DFY = Option C (embedded callouts + locked classroom)", { status: "Locked" }],
    ["3.2", "Callouts create intrigue for DWY clients", { status: "Locked" }],
    ["3.3", "Callout refers to DFY classroom AND/OR DFY Slack", { status: "Locked" }],
    ["3.4", "Build process steps 1-3 confirmed", { status: "Locked" }],
    ["3.5", "My suggestions after every confirm", { status: "Locked" }],
    ["3.6", "Yes with suggestions", { status: "Locked" }],
    ["3.7", "After every confirm -> insights -> explain why/why not -> recycle -> repeat", { status: "Locked" }],
    ["3.8", "Step 0 needs SOP", { status: "Done" }],
    ["3.9", "SOP = standard operating procedure + checklist", { status: "Done" }],
    ["3.10", "SOP lists: everything prompted + understanding + how/why", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 4
children.push(heading("Message 4 - SOP v2 Requests (11 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["4.1", "Graduation = own classroom", { status: "Locked" }],
    ["4.2", "B10 needs roadmap/timeline integration", { status: "Locked" }],
    ["4.3", "SOP needs section showing what I know (context + gaps)", { status: "Done" }],
    ["4.4", "Incorporate confirm -> suggest -> improve cycle. Label + locate in SOP.", { status: "Done" }],
    ["4.5", "Yes to all 3 suggestions (filming, content source, ascension triggers)", { status: "Done" }],
    ["4.6", "Review Sarah Turner for improvements - 8-figure, take seriously", { status: "Done" }],
    ["4.7", "Extra context attached (3 transcripts)", { status: "Done" }],
    ["4.8", "Do not miss anything", { status: "Done" }],
    ["4.9", "List improvements separately at end", { status: "Done" }],
    ["4.10", "Express what each upload contains", { status: "Done" }],
    ["4.11", "Express how they synergize", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 5
children.push(heading("Message 5 - Audit + Screenshots (4 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["5.1", "Yes add 3 suggestions (goal-setting, rapid repeat, keep Black Box)", { status: "Locked" }],
    ["5.2", "Black Box is secret - hidden strategies, grey area. Keep name.", { status: "Locked" }],
    ["5.3", "Create separate checklist of every user prompt", { status: "Done" }],
    ["5.4", "Explanation of screenshots (resolved Msg 6)", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 6
children.push(heading("Message 6 - Images (1 item)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [["6.1", "2 is good. Here are the uploads (5 images)", { status: "Done" }]],
  [600, 6760, 2000]));

// Message 7
children.push(heading("Message 7 - SOP Violation Correction (7 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["7.1", "Classroom 3: REQUIRED for all. Intro lessons with checklist determine skip/proceed for remaining content. Videos referenced within for each item.", { status: "Locked" }],
    ["7.2", "Classrooms 1-5 required. 6-7-8 optional/ascension.", { status: "Locked" }],
    ["7.3", "Classroom 6 = Bank Intel & Data Points", { status: "Locked" }],
    ["7.4", "Black Box includes secret info, methods, etc.", { status: "Locked" }],
    ["7.5", "Output FINAL updated SOP as single source of truth", { status: "Done" }],
    ["7.6", "SOP should confirm all user prompts PLUS most up-to-date SOP", { status: "Done" }],
    ["7.7", "Every output must go through SOP + prompt checklist explicitly", { status: "Locked" }],
  ], [600, 6760, 2000]));

// Message 8 (NEW)
children.push(heading("Message 8 - v3.1 Requirements (5 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["8.1", "Add to SOP a check that resolves the mistakes (Classroom 3 misread, skipping prompt verification). Name and label it.", { status: "Done" }],
    ["8.2", "Make SOP v3.1", { status: "Done" }],
    ["8.3", "Outputs must START or END with user prompt checklist + SOP checklist checked off in real time", { status: "Locked" }],
    ["8.4", "Bonus: list check completions as you go in addition to bulk list", { status: "Locked" }],
    ["8.5", "What does Locked mean in the SOP? (Define status labels)", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 9 (NEW in v3.2)
children.push(heading("Message 9 - PFV Requirement (4 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["9.1", "After delivering SOP, should have entered optimization cycle with suggestions. Skipping it broke the process.", { status: "Locked" }],
    ["9.2", "Is this in the SOP? Yes - Section H, D3, D13. Applies to everything including the SOP itself.", { status: "Done" }],
    ["9.3", "How to ensure resolution and compliance? Add a process flow check (PFV) as companion to POVP.", { status: "Done" }],
    ["9.4", "Yes proceed with fix (make SOP v3.2 with D21/PFV)", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 10 (NEW in v3.5)
children.push(heading("Message 10 - Optimization Round 1 Confirmations (3 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["10.1", "Confirm suggestion 1: Add Error Log section (Section N)", { status: "Done" }],
    ["10.2", "Confirm suggestion 2: Add Current Build Position tracker", { status: "Done" }],
    ["10.3", "Confirm suggestion 3: Add D22 (SOP is a deliverable, explicit rule)", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 11 (NEW in v3.5)
children.push(heading("Message 11 - Optimization Round 2 Confirmations (2 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["11.1", "Confirm suggestion 1: Add Quick Reference Card as last page", { status: "Done" }],
    ["11.2", "Confirm suggestion 2: Add 6 Credit Tier ETAs to Section G", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 12 (NEW in v3.5)
children.push(heading("Message 12 - Classroom Map Round 1 + Version Rule (4 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["12.1", "Confirm: Add DFY callout markers to classroom map", { status: "Done" }],
    ["12.2", "Confirm: Add unlock conditions visually distinct on map", { status: "Done" }],
    ["12.3", "Confirm: Add weight/density per classroom (not module detail)", { status: "Done" }],
    ["12.4", "Every update and optimization must create new SOP version number, explicitly stated", { status: "Locked" }],
  ], [600, 6760, 2000]));

// Message 13 (NEW in v3.6)
children.push(heading("Message 13 - Classroom Map Round 2 Confirmations (3 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["13.1", "Confirm: Add Reassurance Checkpoint (RC) markers at classroom level", { status: "Done" }],
    ["13.2", "Confirm: Add WHY Reconnection touchpoints at classroom level", { status: "Done" }],
    ["13.3", "Confirm: Classroom map complete after this round, move to next step", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 15 (NEW in v3.8)
children.push(heading("Message 15 - 7DFS Restructure + Realistic Timelines (6 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["15.1", "Account opening Week 1, then every week following. Research concurrent with seasoning.", { status: "Locked" }],
    ["15.2", "Week 3-4: research complete, get reviewed. Week 5 (speed) or Week 9 (leverage) begin applications.", { status: "Locked" }],
    ["15.3", "Quick Win path: LightStream 48hrs, Chase funded 10 days after open, Navy pledge loan seed -> personal/auto M2-3, BOA seed 2mo apps M3, AMEX also", { status: "Locked" }],
    ["15.4", "People have clearly defined separate paths — communicate clearly, simply, intuitively", { status: "Locked" }],
    ["15.5", "V1 = The Blitz (speed, personal+business, one-time). V1b = business only sub-option for future eligibility.", { status: "Locked" }],
    ["15.6", "V2 = The Prime Protocol (recommended, 90-120 day, business only, multi-round, repeatable 1wk-1mo)", { status: "Locked" }],
  ], [600, 6760, 2000]));

// Message 16 (NEW in v3.8)
children.push(heading("Message 16 - Clint Response Doc + Naming Confirmation (4 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["16.1", "New source document uploaded: Clarity & Simplification - Clint Response 03.11.2026 (Doc #20)", { status: "Done" }],
    ["16.2", "Install into SOP + Data + User Prompt Checklists", { status: "Done" }],
    ["16.3", "Confirm naming: Blitz (V1) and Prime Protocol (V2)", { status: "Locked" }],
    ["16.4", "6-tier ascension model, DFY ONLY delay insight, trial structure — all confirmed from Doc #20", { status: "Done" }],
  ], [600, 6760, 2000]));

// Message 14 (NEW in v3.7)
children.push(heading("Message 14 - SOP Perfection Check + Version Numbering (2 items)", HeadingLevel.HEADING_2));
children.push(makeTable(["#", "Prompt", "Status"],
  [
    ["14.1", "Is SOP perfected? No significant improvements? → Yes, confirmed. C1 status sync is only fix.", { status: "Done" }],
    ["14.2", "SOP outputs must state current SOP version and new proposed SOP version number", { status: "Locked" }],
  ], [600, 6760, 2000]));

children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ AUDIT SUMMARY ============
children.push(heading("PROMPT AUDIT SUMMARY", HeadingLevel.HEADING_2));
children.push(makeTable(["Message", "Total", "Done/Locked", "In Progress", "Ongoing", "Pending"],
  [
    ["Message 1", "37", "30", "2", "3", "2"],
    ["Message 2", "16", "16", "0", "0", "0"],
    ["Message 3", "10", "10", "0", "0", "0"],
    ["Message 4", "11", "11", "0", "0", "0"],
    ["Message 5", "4", "4", "0", "0", "0"],
    ["Message 6", "1", "1", "0", "0", "0"],
    ["Message 7", "7", "7", "0", "0", "0"],
    ["Message 8", "5", "5", "0", "0", "0"],
    ["Message 9", "4", "4", "0", "0", "0"],
    ["Message 10", "3", "3", "0", "0", "0"],
    ["Message 11", "2", "2", "0", "0", "0"],
    ["Message 12", "4", "4", "0", "0", "0"],
    ["Message 13", "3", "3", "0", "0", "0"],
    ["Message 14", "2", "2", "0", "0", "0"],
    ["Message 15", "6", "6", "0", "0", "0"],
    ["Message 16", "4", "4", "0", "0", "0"],
    ["TOTAL", "119", "113", "3", "3", "0"],
  ], [1600, 1200, 2000, 1600, 1360, 1600]));

children.push(para(""));
children.push(boldPara("3 In Progress: ", "1.1 (framework build), 1.14 (wireframe build), A53/15.1 (7DFS restructure)"));
children.push(boldPara("3 Ongoing: ", "1.2 (no nuanced point missed), 1.23 (prompt alterations), 1.37 (never assume)"));
children.push(boldPara("0 Pending: ", "All pending items now tracked in Current Build Position (Steps 11-12)."));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION K: VERSION HISTORY ============
children.push(heading("SECTION K: VERSION HISTORY", HeadingLevel.HEADING_1));
children.push(makeTable(["Version", "Changes"],
  [
    ["v1.0", "Initial SOP. Sections A-F."],
    ["v2.0", "Added Sections 0, G, H, I. Updated B6, B10. Added A19-A27, D13-D17, E11-E16, C15. Filming + content source columns."],
    ["v3.0", "Full consolidation. Added A28-A35, B11, D18. Added Section J (86-item audit). Added Section K. Removed cross-references."],
    ["v3.1", "Added Status Label Definitions. Fixed B2/A29 (Classroom 3 REQUIRED, internal skip). Fixed D11. Added D19 (POVP), D20 (real-time checklist). Added A36-A39. Added Msg 8 (5 items). Section L (POVP protocol). Total: 91 items."],
    ["v3.2", "Added D21 (PFV). Section M (PFV protocol). A40. Message 9 (4 items). Total: 95 items."],
    ["v3.3", "Added D22 (SOP = deliverable). Current Build Position. Section N (Error Log). A41-A43. Msg 10 (3 items). Total: 98."],
    ["v3.4", "Quick Reference Card. 6 Credit Tier ETAs in Section G. A44-A45. Msg 11 (2 items). Total: 100."],
    ["v3.5", "Added D23 (version increment on every SOP update). Added A46-A48 (version rule, DFY callouts on map, density per classroom). Message 12 (4 items). Total: 104 prompt items across 12 messages."],
    ["v3.6", "Added A49-A51 (RC markers, WHY reconnection touchpoints, classroom map confirmed complete). Message 13 (3 items). Step 2a marked Done. Fixed header to v3.6. Total: 107 prompt items across 13 messages."],
    ["v3.7", "C1 status synced to Done. Added D24 (state current + proposed version numbers). Added A52 (version numbering in outputs). Message 14 (2 items). Total: 109 prompt items across 14 messages. SOP confirmed ready — no significant structural improvements remaining."],
    ["v3.8 (CURRENT)", "Major data install: Doc #20 (Clint Response) added. B12-B16 (Blitz/Prime Protocol naming, 6-tier ascension, DFY ONLY delay, trial structure). A53-A60 (7DFS restructure, paths, timelines, doc install). Execution Paths + 6-Tier Ascension tables in Section G. Messages 15-16 (10 items). Total: 119 prompt items across 16 messages."],
  ], [1200, 8160]));

children.push(para(""));
children.push(para("This is the ONLY SOP document. There are no prior versions to reference. Everything is here.", { bold: true, color: "CC0000" }));
children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION L: PRE-OUTPUT VERIFICATION PROTOCOL (NEW in v3.1) ============
children.push(heading("SECTION L: PRE-OUTPUT VERIFICATION PROTOCOL (POVP)", HeadingLevel.HEADING_1));
children.push(para("Named protocol created in response to the Classroom 3 misread error. This protocol exists because rubber-stamp compliance checks failed. The builder stated D18 compliance but delivered output that contradicted prompt 7.1.", { italic: true }));

children.push(heading("What Went Wrong (Root Cause)", HeadingLevel.HEADING_2));
children.push(para("Builder listed Classroom 3 as CONDITIONAL (skippable classroom) when prompt 7.1 explicitly stated: intro lessons with checklist determine skip/proceed for remaining content within Classroom 3. The classroom itself is REQUIRED. The builder checked D18 as compliant without actually reading each prompt item against the output word-by-word."));

children.push(heading("The POVP Protocol (Mandatory Before Every Output)", HeadingLevel.HEADING_2));
children.push(para("Before delivering ANY framework output (classroom map, module list, lesson list, roadmap, etc.), the builder must execute ALL of the following steps:"));
children.push(numItem("STEP 1 - IDENTIFY RELEVANT PROMPTS: List every prompt item from Section J that is relevant to the current output being delivered."));
children.push(numItem("STEP 2 - WORD-BY-WORD READ: Read each relevant prompt item word-by-word. Do not skim. Do not paraphrase from memory. Read the actual words."));
children.push(numItem("STEP 3 - COMPARE TO OUTPUT: For each prompt item, compare the exact wording to what the output says. Ask: does my output honor the EXACT meaning of this prompt?"));
children.push(numItem("STEP 4 - FLAG MISMATCHES: If any mismatch exists between what the prompt says and what the output says, flag it. Do not deliver."));
children.push(numItem("STEP 5 - CORRECT BEFORE DELIVERY: Fix every flagged mismatch. Then re-run Steps 2-4 on the corrected output."));
children.push(numItem("STEP 6 - DISPLAY THE CHECKLIST: Include the checked-off prompt list + SOP rule list in the output itself (at start or end). This is not optional."));

children.push(heading("What Gets Checked (Two Lists)", HeadingLevel.HEADING_2));
children.push(boldPara("List 1 - Prompt Audit: ", "Every item from Section J that is relevant to this specific output. Check each one. Show pass/fail."));
children.push(boldPara("List 2 - SOP Rules: ", "Every rule from Section D that applies to this output type. Check each one. Show pass/fail."));

children.push(heading("Display Format", HeadingLevel.HEADING_2));
children.push(para("Every output must START or END with both lists checked off in real time. Example:"));
children.push(para("POVP CHECK - [Output Name]", { bold: true }));
children.push(bullet("7.1 Classroom 3 REQUIRED for all, internal skip logic: PASS"));
children.push(bullet("7.2 Classrooms 1-5 required, 6-7-8 optional: PASS"));
children.push(bullet("A22 Bird's eye only, no modules: PASS"));
children.push(bullet("D1 No level-jumping: PASS"));
children.push(bullet("D7 Simplicity filter: PASS"));
children.push(para("...etc."));

children.push(para(""));
children.push(para("Bonus: Builder may also list checks inline as they complete during the output, in addition to the bulk list.", { italic: true }));

children.push(para(""));
children.push(para("If any check shows FAIL, the output must not be delivered until corrected.", { bold: true, color: "CC0000" }));

children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION M: PROCESS FLOW VERIFICATION (NEW in v3.2) ============
children.push(heading("SECTION M: PROCESS FLOW VERIFICATION (PFV)", HeadingLevel.HEADING_1));
children.push(para("Named protocol created in response to the optimization cycle skip error. Builder delivered SOP v3.1 and immediately asked to move to classroom map without entering the optimization cycle. Section H says the cycle applies to everything — including the SOP itself.", { italic: true }));

children.push(heading("What Went Wrong (Root Cause)", HeadingLevel.HEADING_2));
children.push(para("POVP (Section L) verifies content accuracy — does the output match the prompts? But nothing verified process compliance — did the builder follow the correct sequence of steps? The builder skipped Section H (optimization cycle) entirely after delivering SOP v3.1. The cycle was documented but not enforced."));

children.push(heading("POVP vs PFV", HeadingLevel.HEADING_2));
children.push(makeTable(["Protocol", "What It Checks", "When It Runs"],
  [
    ["POVP (Section L)", "Content accuracy: Does the output match what the prompts say?", "BEFORE delivering any output"],
    ["PFV (Section M)", "Process compliance: Did the builder follow the correct sequence?", "BEFORE ending any response that delivers output"],
  ], [2000, 4180, 3180]));

children.push(heading("The PFV Protocol (Mandatory Before Ending Any Response)", HeadingLevel.HEADING_2));
children.push(para("After delivering any framework output and before ending the response, verify ALL of the following:"));
children.push(numItem("OPTIMIZATION CYCLE CHECK: Did I enter the optimization cycle with suggestions? (D3/D13/Section H) If NO -> enter it now before ending response."));
children.push(numItem("CYCLE LABEL CHECK: Did I label it OPTIMIZATION CYCLE - Round [#]? (Section H) If NO -> label it now."));
children.push(numItem("STEP SEQUENCE CHECK: Did I skip any build steps per D1? (bird's eye -> confirm -> modules -> confirm -> lessons) If YES -> stop and go back to correct step."));
children.push(numItem("NEXT STEP OPTIONS CHECK: After the cycle completes (Alan confirms no more improvements), did I present logical next options for Alan to pick? (D4) If NO -> present them."));
children.push(numItem("DISPLAY CHECK: Is the POVP checklist displayed in this response? (D20) If NO -> add it."));

children.push(heading("When PFV Applies", HeadingLevel.HEADING_2));
children.push(para("Every response that delivers a framework deliverable. This includes: SOP versions, classroom maps, module lists, lesson lists, roadmaps, templates, checklists, architecture maps, outlines, audits. No exceptions. The SOP itself is a deliverable."));

children.push(para(""));
children.push(para("If any PFV check fails, the response must not end until the missing step is executed.", { bold: true, color: "CC0000" }));

children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ SECTION N: ERROR LOG (NEW in v3.5) ============
children.push(heading("SECTION N: ERROR LOG", HeadingLevel.HEADING_1));
children.push(para("Centralized log of every builder mistake during this project. Documents what happened, the root cause, and what protocol was created to prevent recurrence.", { italic: true }));

children.push(makeTable(["#", "Error", "Root Cause", "Protocol Created", "SOP Version"],
  [
    ["ERR-1", "Classroom 3 listed as CONDITIONAL (skippable classroom) when prompt 7.1 explicitly stated it is REQUIRED for all with internal skip logic", "Builder skimmed prompt 7.1 instead of reading word-by-word. D18 compliance check was rubber-stamped without actual verification.", "POVP - Pre-Output Verification Protocol (D19, Section L): 6-step word-by-word verification before any output", "v3.1"],
    ["ERR-2", "SOP output jumped ahead: brain dump + classroom map + module detail delivered in one output instead of step-by-step", "Builder violated D1 (no skipping). Multiple deliverables combined when SOP mandates one at a time with confirmation between each.", "Already covered by D1, but ERR-1 POVP now enforces checking D1 compliance before delivery", "v3.0 (caught), v3.1 (enforced)"],
    ["ERR-3", "Optimization cycle skipped after SOP v3.1 delivery. Builder asked to move to next step without entering cycle.", "No enforcement mechanism for process flow. POVP checks content accuracy but not process compliance. Section H existed but was not automatically enforced.", "PFV - Process Flow Verification (D21, Section M): 5-step process check before ending any response", "v3.2"],
  ],
  [500, 2400, 2400, 2400, 1660]));

children.push(para(""));
children.push(para("Pattern: Every error so far has been a compliance gap — the rule existed but nothing enforced it. Each error generated a named enforcement protocol. If a fourth error occurs, check this log first to see if the pattern is the same.", { bold: true }));

children.push(new Paragraph({ children: [new PageBreak()] }));

// ============ QUICK REFERENCE CARD (NEW in v3.5) ============
children.push(heading("QUICK REFERENCE CARD", HeadingLevel.HEADING_1));
children.push(para("One-page cheat sheet. Check this BEFORE and AFTER every output.", { bold: true, color: "CC0000" }));

children.push(heading("Before Delivering ANY Output (POVP - D19)", HeadingLevel.HEADING_2));
children.push(numItem("Identify relevant prompts from Section J"));
children.push(numItem("Read each one WORD-BY-WORD (do not skim)"));
children.push(numItem("Compare to your output for exact match"));
children.push(numItem("Flag mismatches. Fix before delivering."));
children.push(numItem("Display the checked-off list in the output (D20)"));

children.push(heading("Before Ending ANY Response (PFV - D21)", HeadingLevel.HEADING_2));
children.push(numItem("Did I enter the optimization cycle with suggestions?"));
children.push(numItem("Did I label it OPTIMIZATION CYCLE - Round [#]?"));
children.push(numItem("Did I skip any build steps? (check Current Build Position)"));
children.push(numItem("After cycle completes: did I present next step options?"));

children.push(heading("Content Rules (Every Output)", HeadingLevel.HEADING_2));
children.push(bullet("D1: One step at a time. Never combine deliverables."));
children.push(bullet("D6: Never assume. If unclear, ask."));
children.push(bullet("D7: 5th grader simplicity filter."));
children.push(bullet("D22: The SOP itself is a deliverable. Full treatment."));
children.push(bullet("A29: Classroom 3 = REQUIRED for all. Internal skip logic only."));
children.push(bullet("A30: Classrooms 1-5 required. 6-7-8 optional/ascension."));
children.push(bullet("A38: Output must START or END with real-time checklist."));
children.push(bullet("D23: Every SOP update = new version number, explicitly stated."));
children.push(bullet("D24: State BOTH current and proposed version numbers before updating."));

children.push(heading("The Cycle (Section H - Every Deliverable)", HeadingLevel.HEADING_2));
children.push(para("Alan confirms -> Suggestions with reasoning -> Alan reviews -> Incorporate -> Repeat until no improvements -> Present next options -> Alan picks."));

children.push(heading("Current Position", HeadingLevel.HEADING_2));
children.push(para("See CURRENT BUILD POSITION page for exact step. Always know where you are.", { bold: true }));

// ============ ASSEMBLE DOCUMENT ============
const doc = new Document({
  numbering,
  styles: {
    default: { document: { run: { font: "Arial", size: 20 } } },
    paragraphStyles: [
      { id: "Heading1", name: "Heading 1", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 32, bold: true, font: "Arial", color: "5B2D8E" },
        paragraph: { spacing: { before: 360, after: 240 }, outlineLevel: 0 } },
      { id: "Heading2", name: "Heading 2", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 26, bold: true, font: "Arial", color: "333333" },
        paragraph: { spacing: { before: 240, after: 120 }, outlineLevel: 1 } },
    ]
  },
  sections: [{
    properties: {
      page: { size: { width: 12240, height: 15840 }, margin: { top: 1080, right: 1080, bottom: 1080, left: 1080 } }
    },
    headers: {
      default: new Header({ children: [new Paragraph({ alignment: AlignmentType.RIGHT, children: [new TextRun({ text: "APW Course Framework Build - Master SOP v3.7", font: "Arial", size: 16, color: "999999", italics: true })] })] })
    },
    footers: {
      default: new Footer({ children: [new Paragraph({ alignment: AlignmentType.CENTER, children: [new TextRun({ text: "Page ", font: "Arial", size: 16, color: "999999" }), new TextRun({ children: [PageNumber.CURRENT], font: "Arial", size: 16, color: "999999" })] })] })
    },
    children
  }]
});

Packer.toBuffer(doc).then(buffer => {
  fs.writeFileSync("/sessions/sleepy-zealous-volta/mnt/Claude CoWork/APW_Master_SOP_v3.8.docx", buffer);
  console.log("SOP v3.8 created successfully");
});
