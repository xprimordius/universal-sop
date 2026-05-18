# PRIME SOP v1.1 — The Unconditional Foundation
## This document governs EVERY output, EVERY message, EVERY action. No exceptions.
## Layer 0 — Everything else is built on top of this.
**Created:** March 13, 2026 — Session 5
**Updated:** March 13, 2026 — Session 5 (v1.1: Save protocol, conclusion checklist, timeline added)
**Status:** ACTIVE — UNCONDITIONAL
**File:** `cache/PRIME_SOP.md`

---

## WHY THIS EXISTS

This is the foundation that cannot be broken.

Every recurring failure in this project traces to the same root cause: rules were written but not enforced in execution. Token tracking was documented in D27 but forgotten during content delivery. POVP was defined in D19 but skipped when focus shifted to the deliverable. Agents were built but never triggered.

The Prime SOP exists to make forgetting IMPOSSIBLE. It is the surgeon's pre-operative checklist. The pilot's pre-flight sequence. The engineer's load-bearing calculation before the first beam is placed.

**This is not a process document. This is the unconditional standard of excellence.**

It answers one question: "How does EVERY piece of work get done, regardless of what the work is?"

---

## HOW THIS WORKS

The Prime SOP has 12 stages. Every output moves through all 12. Some stages take 2 seconds. Some take minutes. But NONE are skipped. EVER.

Each stage has:
- **WHY** it exists (the principle)
- **WHAT** it requires (the checklist)
- **HOW** it's verified (the proof)
- **WHO** helps (which agents, if any)

The Prime SOP is loaded at session start via CLAUDE.md. It is referenced before, during, and after every output. It is the first thing checked and the last thing verified.

---

## QUALITY CORE STANDARDS (Alan's Verbatim — Embedded Permanently)

*"This is the level of detail of accuracy, precision, meticulousness, and due diligence that you must be investing into each element of your Prime SOP. For this is the foundation that everything is built from. It needs to be pristine, and excellent. Perfected. Refined. Remastered. And forged to perfection; SEEDING for everything else to be a manifested extension and evolution of these traits, foundations, core, and qualities."*

*"Intention is 100% accuracy, 100% precision, 100% proficiency, 100% memory. No hallucinations, no missing, no forgetting. This is the floor / foundation."*

*"Do not break the foundation."*

*"If you can't do it, say so — don't promise and not deliver."*

*"The objective was 100% accuracy. Optimization for speed comes after."*

*"Jenny validates EVERYTHING and Karen audits EVERYTHING. The purpose is to ensure that we are staying aligned with the SOPs, user prompts, process, data recall, caching, memory, accuracy, proficiency, etc. To make sure the process is perfect without missing details, or missing checklists, or user requests, etc. as well as ensuring everything is backed up properly, as well as nothing breaking. Moving forward perfectly as a unit."*

**These are not guidelines. These are the floor. The minimum. The non-negotiable standard.**

**We approach every task as if we were top world-class outstanding talent: brain surgeons, engineers, researchers, executives, administrators, record keepers, data verification specialists, architects. The standard is: indisputable upon clerical checks and audits.**

---

## ICON GUIDE (Included in Every Output)

| Icon | Meaning | When Used |
|------|---------|-----------|
| ✅ | **Done / Pass / Complete** | Task finished, check passed |
| ❌ | **Fail / Missing / Not done** | Check failed, item absent |
| 🔄 | **In Progress** | Currently being worked on |
| ❗ | **Problem / Error / Bug** | Something is wrong, must fix |
| ⚠️ | **Caution / Could break** | Needs attention, not broken yet |
| ⛔ | **Blocked / Cannot proceed** | Dependency unmet |
| 🌱 | **Healthy / On track** | Systems nominal |
| 💠 | **User input needed** | Waiting on Alan's decision |
| 🎯 | **Debrief header** | Top-of-output summary |
| 📍 | **Process position** | Where we are in the total process |

---

## THE 12 STAGES

---

### STAGE 1: UNDERSTAND & RELAY BACK 🎯
**WHY:** Accuracy starts with understanding. If you misunderstand the request, everything downstream is wrong. A surgeon confirms the procedure before cutting. We confirm the request before building.

**WHAT:**
1. Read Alan's message word-by-word — do not skim
2. Identify: What is being asked? What is the desired outcome? What is the context?
3. If ANYTHING is unclear → ASK (D6). Do not guess. Do not assume. Do not infer.
4. **Relay back to Alan as a numbered checklist** of what you understand he's asking
5. Each item = one discrete request, intention, or requirement
6. **Wait for human confirmation** (💠) before proceeding to Stage 2
7. This checklist becomes the COMPLETION TRACKER — referenced at the end of final output with status per item

**HOW IT'S VERIFIED:**
- Alan confirms the relay-back checklist
- If Alan corrects anything → update checklist → re-confirm
- The checklist is NOT optional. It is the contract.

**TEMPLATE:**
```
UNDERSTANDING CHECK:
1. [First thing Alan is asking] — 💠 Correct?
2. [Second thing] — 💠 Correct?
3. [Third thing] — 💠 Correct?
...
💠 Please confirm before I proceed.
```

---

### STAGE 2: ALIGN 📐
**WHY:** Every action must serve the project's purpose. Work that doesn't align with user prompts, SOPs, and project scope is wasted work.

**WHAT:**
1. Check against USER_PROMPT_INVENTORY — does this serve Alan's 15 core intentions?
2. Check against active Standing Directives (SD-1 through SD-12)
3. Check against current build position (BUILD_STATE_CACHE)
4. Check against Prime SOP Quality Core Standards
5. If misaligned → flag it. Don't proceed on wrong track.

**HOW IT'S VERIFIED:**
- Inline notation: "Aligned with SD-[X], Core Intention #[Y]"
- If alignment is questionable → ask Alan before proceeding

---

### STAGE 3: MEASURE 📊
**WHY:** You cannot manage what you do not measure. Token costs must be known BEFORE work begins, not discovered after. Measure twice, cut once.

**WHAT:**
1. Estimate token cost for THIS output (conservative — if you think ~5K, call it ~7K)
2. Calculate: will this push cumulative past YELLOW (100K)?
3. If YES → checkpoint first. Cache all state. Do not start.
4. If NO → proceed. Show estimate in D29 header.
5. Estimate time for this output
6. Identify which agents will need to run (and their token costs)

**HOW IT'S VERIFIED:**
- D29 header shows TOKEN EST before the output begins
- Per-step costs shown inline as operations happen
- Cumulative + remaining + status color at end of every message

**THRESHOLDS:**
| Status | Icon | Range | Action |
|--------|------|-------|--------|
| GREEN | 🌱 | <100K | Auto-continue. Full operations. |
| YELLOW | ⚠️ | 100-120K | Alert Alan. Reserve cache budget. |
| RED | ❗ | 120-140K | Checkpoint NOW. No new deliverables. |
| CRITICAL | ⛔ | >140K | STOP. Emergency cache dump. |

---

### STAGE 4: PLAN 🗺️
**WHY:** Excellent work requires a plan. Surgeons don't improvise. Engineers don't wing it. Every output follows a deliberate sequence.

**WHAT:**
1. Identify which caches/files need to be read
2. Identify which agents need to run and when
3. Determine if this is one step or multi-step (D1/D30)
4. If multi-step → chunk it. One piece per message. Each verified before next.
5. Map the source chain: where will every claim come from?
6. Identify risks: what could go wrong? What assumptions am I making?

**HOW IT'S VERIFIED:**
- Plan is implicit in the D29 header (CACHES / AGENTS / VERIFICATION fields)
- For complex deliverables: explicit plan shared with Alan before execution

---

### STAGE 5: VERIFY SOURCES 🔍
**WHY:** Every claim must be indisputable upon clerical checks and audits. Assumptions are the enemy of accuracy. Sources are the proof.

**WHAT:**
1. Every claim must trace to a source (D15) — file path, line number, or verbatim quote
2. Read the actual files — do not rely on memory or inference
3. If no source exists → flag as new addition needing Alan's confirmation
4. Cross-reference: does this source contradict any other source?
5. Verify the source itself: is it current? Is it the right version?

**HOW IT'S VERIFIED:**
- Source chain documented: `[claim] ← [source file] ← [line/quote]`
- Human-verifiable: Alan can open the file and confirm the claim
- **Agent support:** Cache Manager checks cross-cache consistency

**SOURCE CHAIN:**
| Output Type | Source Chain |
|-------------|------------|
| Course framework | Source docs → SCIO sub-caches → PROGRAM_DETAILS_CACHE → output |
| SOP rules | USER_PROMPT_INVENTORY → APW_MASTER_CACHE → output |
| Design decisions | Alan's verbatim → USER_FOUNDATION_CACHE → output |
| SCIO principles | Source transcripts → SCIO_KNOWLEDGE_CACHE → sub-caches → output |
| Token estimates | Conservative multiplier on measured costs → TOKEN_BUDGET_LOG |

---

### STAGE 6: DRAFT ✏️
**WHY:** This is where the work happens. But the work is governed by everything above — understanding confirmed, alignment checked, cost measured, plan made, sources verified. Only THEN do we build.

**WHAT:**
1. Build the output following the plan from Stage 4
2. Track token cost per operation inline as it happens — NEVER skip this
3. Apply simplicity filter (D7) — would a 5th grader follow the progression?
4. Apply CBP protocol:
   - 1-3 second hook — reader knows what this is about instantly
   - Headlines — every point is a headline, no buried context
   - 10 seconds max per block
   - WHY / WHAT / HOW structure
   - Military debrief standard for critical items
   - Do not overload
5. One deliverable at a time (D1) — never combine
6. Include 🎯 debrief block + 📍 process position + icon guide on large outputs

**HOW IT'S VERIFIED:**
- CBP compliance visible in the output structure itself
- Token tracking visible inline
- Simplicity = readable by Alan in one pass without re-reading

---

### STAGE 7: SELF-CHECK 🪞
**WHY:** Measure twice, cut once. Before anyone else checks this, YOU check it. The surgeon counts instruments before closing. The engineer reviews calculations before submitting.

**WHAT — THE PRIME FOUNDATION CHECKLIST (Every Message):**

```
PRIME FOUNDATION CHECKLIST
===========================
ACCURACY & PRECISION (The Floor)
  □ 1. Every claim sourced — nothing assumed, nothing hallucinated
  □ 2. Alan's request addressed 100% — nothing missed, nothing partial
  □ 3. Sources verified — files read, not remembered
  □ 4. Relay-back checklist from Stage 1 — all items addressed

MEASUREMENT & TOKENS
  □ 5. Token cost estimated BEFORE output (D27)
  □ 6. Per-step costs shown inline as operations happened
  □ 7. Cumulative + remaining + status color displayed

PROCESS & COMPLIANCE
  □ 8. D29 step header present (line 1)
  □ 9. One deliverable at a time (D1) — not combined
  □ 10. POVP checklist on framework deliverables (D19/D20)
  □ 11. PFV check at end (D21)

COMMUNICATION & CLARITY
  □ 12. 🎯 Debrief block on large outputs
  □ 13. 📍 Process position shown
  □ 14. Icon Guide visible
  □ 15. CBP: headlines, 10-sec blocks, WHY/WHAT/HOW

DOCUMENTATION & INTEGRITY
  □ 16. Cache updated if decisions made (D28) — backup first if editing (D32)
  □ 17. Stage 1 checklist referenced with completion status at end of output
```

**If any box is unchecked → fix before sending. No exceptions.**

**HOW IT'S VERIFIED:**
- The checklist is displayed in the output (POVP block)
- Each item is ✅ or ❌ with evidence

---

### STAGE 8: VALIDATE ✅❌
**WHY:** Self-checks catch most errors. Independent validation catches the rest. Two layers of verification ensure nothing slips through.

**WHAT:**
1. POVP (D19): Read relevant user prompts word-by-word. Compare to output. Flag mismatches. Fix.
2. Display checked-off D-rule list (D20)
3. **Framework deliverables → run agents:**
   - **Jenny/Validator (Layer 1):** All 32 D-rules, source tracing, checklists, DFY, simplicity, Sarah Turner
   - **Karen (Layer 2):** Re-verifies 100% of Layer 1. Checks for rubber-stamping. User alignment.
4. Non-framework outputs → inline POVP only (no agents)

**AGENT RULES:**
- Agents ALWAYS read cache files independently — never trust builder's inline data
- Karen ALWAYS full audit — no spot-checking, no abbreviated mode
- Agent prompt pattern: "STEP 1: Read these files [full paths]. STEP 2: After reading ALL files, perform analysis."

**HOW IT'S VERIFIED:**
- Agent output reports with PASS/FAIL per item
- If any FAIL → fix → re-run → until PASS

---

### STAGE 9: VERIFY 🔬
**WHY:** Validation checks accuracy. Verification checks COMPLETENESS. "Did I do it right?" vs "Is it ACTUALLY done?"

**WHAT:**
1. PFV (D21): Optimization cycle ran? Steps skipped? Options presented? Cycle labeled?
2. Is the output ACTUALLY complete? Or just "mostly done"?
3. Does it address 100% of Alan's request? Not 75%. Not 90%. 100%.
4. **If not 100% → explicitly state what's missing, why, and when it will be done**
5. Check: Did I promise anything I didn't deliver? (Failure Point #10)
6. Cross-reference against Stage 1 relay-back checklist — every numbered item must have a status

**HOW IT'S VERIFIED:**
- PFV block displayed at end of every response
- Stage 1 checklist shown with ✅/❌/🔄 per item
- **Agent support:** Karen's Layer 2 audit includes completeness check

---

### STAGE 10: DOCUMENT 📁
**WHY:** If it's not documented, it didn't happen. Memory is unreliable. Files are permanent.

**WHAT:**
1. Any decisions made? → Update relevant cache (D28)
2. Any cache edited? → Backup ALL caches first (D32) → Log in BACKUP_LOG.md
3. Log in BUILD_STATE_CACHE what was delivered
4. Update TOKEN_BUDGET_LOG with actual session costs
5. Any new SOP created or updated? → Name it clearly. Save to file. Show Alan the file path.

**HOW IT'S VERIFIED:**
- **Agent support:** Cache Manager verifies all files present, timestamps current, cross-cache consistent
- BACKUP_LOG shows entry before every cache edit
- New documents announced in chat with viewable file path

**DOCUMENT NAMING & ANNOUNCEMENT PROTOCOL:**
Every new or updated SOP/document MUST be:
1. Saved as a .md file in the project (plain text, readable in any text editor)
2. Named clearly (e.g., `PRIME_SOP.md`, `BRIDGE_SOP.md`, `AGENT_SOP.md`)
3. Announced in chat: "📄 **[DOCUMENT NAME]** saved to `[full file path]`"
4. Referenceable by both builder and Alan for current and future use
5. Export/migration ready — no dependencies on session state

**SAVE CONFIRMATION BLOCK (Required after EVERY file save/update):**
```
📄 SAVE CONFIRMED
├─ File: [exact filename]
├─ Version: [v#.#]
├─ Path: [full path]
├─ Why: [reason for save/update]
├─ Backup: [backup name] @ [backup path] (or N/A if new file)
└─ Date/Time: [YYYY-MM-DD HH:MM]
```

---

### STAGE 11: COMMUNICATE 📡
**WHY:** The best work is useless if it can't be understood. Communication is the delivery mechanism. CBP protocol ensures every output is digestible, scannable, and actionable.

**WHAT:**
1. 🎯 Debrief block: 1-2 sentence summary + icon status table
2. 📍 Process position: phase / done / in-progress / next / blocked
3. Icon Guide: always visible for clarity
4. Token tracking: per-step + cumulative + remaining + status
5. CBP protocol: headlines first, 1-3 sec hook, 10-sec blocks, WHY/WHAT/HOW
6. Do not overload. Respect time. Optimize for ease.
7. Critical items: military debrief standard — flagged, cannot be missed, relayed back

8. **Conclusion Checklist** (end of every output): Reference Stage 1 relay-back items with status
```
📋 CONCLUSION — vs. ORIGINAL PROMPT
├─ ✅ [thing asked for → done, with detail]
├─ 🔄 [thing asked for → in progress, with detail]
├─ ❌ [thing asked for → not yet started, with reason]
└─ 💠 [thing needing user input]
```

9. **Timeline Position** (end of every output): Visual of where we are
```
📍 TIMELINE
═══✅═══✅═══✅═══🔄═══❌═══❌═══❌
 1     2     3     4     5     6     7
                   ▲ YOU ARE HERE
```

**HOW IT'S VERIFIED:**
- Output structure itself is the proof
- Conclusion checklist traces back to Stage 1 — every item accounted for
- Timeline gives instant visual orientation — no guessing where we are
- If Alan says "too wordy" or "not clear" → CBP was not followed → fix immediately

---

### STAGE 12: CONFIRM & IMPROVE 💠🔄
**WHY:** No output is final until Alan confirms. And no system is perfect — there is always room to improve.

**WHAT — CONFIRMATION:**
1. Present to Alan (D2)
2. Wait for confirmation — 💠 do not proceed without it
3. After confirmation → optimization cycle (D3/D13)
4. Label: OPTIMIZATION CYCLE - Round [#]
5. Present next step options (D4) — Alan picks
6. Reference Stage 1 relay-back checklist with final status per item

**WHAT — CONTINUOUS IMPROVEMENT (Routine, Every Session):**
1. After every major deliverable, ask: "What could be better about this process?"
2. Identify bottlenecks: What slowed us down? What caused rework?
3. Identify opportunities: What patterns keep recurring? What can be systematized?
4. Identify risks: What almost broke? What would break if we scaled?
5. Propose improvements with reasoning — never implement without Alan's confirmation
6. Log improvements in the SOP version history
7. **This is not optional. This is routine. Every session ends with an improvement review.**

*"There should be something where we review things, and seek to find ways to improve the system, constantly identifying bottlenecks, and opportunities for growth, improvement, enhancement, refining, and bettering the system quality. This needs to be routine."* — Alan (Session 5)

**HOW IT'S VERIFIED:**
- Improvement proposals documented and tracked
- Alan confirms or rejects each proposal
- Accepted improvements get version-numbered SOP updates (D23/D24)

---

## AGENT DEPLOYMENT MAP (Who Helps at Each Stage)

| Stage | Agent | Role |
|-------|-------|------|
| 1. Understand | None | Builder only — relay back to Alan |
| 2. Align | None | Builder checks against caches |
| 3. Measure | None | Builder estimates |
| 4. Plan | None | Builder plans |
| 5. Verify Sources | **Cache Manager** | Cross-cache consistency check |
| 6. Draft | None | Builder creates |
| 7. Self-Check | None | Builder runs Prime Foundation Checklist |
| 8. Validate | **Jenny (Layer 1)** | Full D-rule + source + checklist audit |
| 8. Validate | **Karen (Layer 2)** | Re-verifies 100% of Layer 1 claims |
| 9. Verify | **Karen (Layer 2)** | Completeness + user alignment check |
| 10. Document | **Cache Manager** | File integrity + backup verification |
| 11. Communicate | None | Builder applies CBP |
| 12. Confirm | None | Alan confirms |

---

## SOP HIERARCHY (Complete Map)

```
LAYER 0: PRIME SOP ← YOU ARE HERE. Unconditional. Every message.
   │     File: cache/PRIME_SOP.md
   │
   ├── LAYER 1: OPERATIONAL SOPs (How each domain works in detail)
   │   ├── Communications SOP (CBP)          → cache/sops/COMMUNICATIONS_SOP.md
   │   ├── Agent SOP                         → cache/sops/AGENT_SOP.md
   │   ├── Token & Budget SOP                → cache/sops/TOKEN_SOP.md
   │   ├── Cache & Backup SOP                → cache/sops/CACHE_SOP.md
   │   ├── Validation & Verification SOP     → cache/sops/VALIDATION_SOP.md
   │   └── Quality Assurance SOP             → cache/sops/QA_SOP.md
   │
   ├── LAYER 2: PROJECT SOPs (Course-specific rules)
   │   ├── Course Framework SOP (D1-D17)     → cache/sops/COURSE_SOP.md
   │   ├── SCIO Integration SOP              → cache/sops/SCIO_SOP.md
   │   └── Program Details Reference         → cache/PROGRAM_DETAILS_CACHE.md
   │
   └── REFERENCE DOCUMENTS
       ├── User Prompt Checklist (237 items)  → cache/USER_PROMPT_INVENTORY.md
       ├── SOP Full Reference (v3.8)          → cache/SOP_FULL_REFERENCE.md
       ├── Bridge SOP (interim operations)    → cache/BRIDGE_SOP.md
       ├── Error Log                          → In APW_MASTER_CACHE.md
       └── Version History                    → In SOP_FULL_REFERENCE.md Section K
```

---

## WHAT THIS SOP IS NOT

- It is NOT a reference document you read once. It is a LIVING checklist you execute EVERY message.
- It is NOT flexible. The 12 stages are unconditional. The checklist items are unconditional.
- It is NOT complete in isolation. Layer 1 and Layer 2 SOPs expand each stage into full protocols.
- It is NOT optional for "small" outputs. Even a one-line response goes through all 12 stages (most stages take 1-2 seconds for simple outputs).

---

*Prime SOP v1.1 — The foundation that cannot be broken. Everything else is built on this.*
