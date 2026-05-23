---
title: HTML_SOP_v3_1.md
source: claude
type: project-doc
project: APW
person: alan
created: "2026-04-16T01:28:12.962961+00:00"
uuid: 5ad9d176-83bd-412a-9052-af7b36d03ff4
tags:
  - claude
  - alan
  - apw
---
# HTML_SOP_v3_1.md

> [!info] From project: [[_Project Info|APW]]

# HTML SOP v3.1 — Unified APW Interactive Document Framework

**Supersedes:** HTML SOP v1 (design system) + HTML SOP v2 (comparison blueprint)
**Purpose:** One reusable system prompt for producing premium, branded, mobile-first interactive HTML documents in the Ascend Prime Wealth (APW) design language — covering both standalone interactive docs (v1's domain) and side-by-side comparison blueprints (v2's domain) under a single, auditable process.

---

## SECTION 1 — HOW TO INVOKE

Paste at the top of a new chat, then attach source materials:

```
Use HTML SOP v3.1 for this build.

DOC TYPE: [standalone | comparison | hybrid]
INPUTS:
- Source content: [PDF / text / images]
- (Comparison only) Original vs Proposed sources
- Framework / checklist (if any): [name + items]
- Section structure: [section names in order]
- Q-questions (if any): [Q1–Q6 with text]
- Brand override: [default APW palette | custom hex codes]
- Output filename: [APW_<DocName>.html]

DELIVERABLE: Single-file HTML, mobile-optimized, ready to open in browser.
Run AUDIT PROTOCOL (Section 14) before claiming done.
```

**Doc type definitions:**
- **Standalone** — single interactive document (course outline, SOP, application, playbook). v1's native domain.
- **Comparison** — side-by-side original vs proposed, framework-mapped. v2's native domain.
- **Hybrid** — standalone doc that contains one or more comparison sub-blocks.

---

## SECTION 2 — REQUIRED INPUTS (CONFIRM BEFORE BUILDING)

| Input | Required for | Why |
|---|---|---|
| Source content | All | Cannot recreate without exact wording |
| Original + Proposed sources | Comparison / Hybrid | Both sides of the comparison |
| Framework checklist | Comparison / Hybrid | C# IDs map per slide per side |
| Section structure | All | Determines collapsible spine |
| Q-questions | Optional | Strategic question legend |
| Brand colors | Default = APW | Only override if explicitly requested |
| Mechanism / proprietary process name | Comparison | Used in framework bar |
| Output filename | All | `APW_<DocName>.html` convention |

**If any required input is missing → ask before building.** Never invent framework items, section names, or source content from memory.

---

## SECTION 3 — CORE DESIGN PHILOSOPHY (UNIVERSAL)

- **Light, warm, premium, inviting.** Never dark shells. Cream/off-white background with subtle purple/cyan/gold cosmic aurora.
- **Maximum readability.** Dark navy text on cream. Never light text on light backgrounds.
- **Cosmic/celestial brand essence preserved through subtle gradients and gold accents — NOT through dark backgrounds.**
- **Tactile and alive.** Every interactive element changes color, lifts, glows, or animates on hover and tap.
- **Mobile-first.** Layouts collapse cleanly to single-column. Tap targets thumb-sized. No tiny hit areas.

**Exception for comparison mode:** Slide *mockup* tiles inside comparison blocks use dark backgrounds with large centered white text (so they look like actual slides). The shell around them stays light/cream.

---

## SECTION 4 — DESIGN TOKENS (USE EXACTLY)

### 4.1 APW Brand Palette (universal shell)

```css
:root {
  /* APW Brand */
  --cyan: #00A8C8;
  --cyan-deep: #007A94;
  --cyan-light: #E6F7FB;
  --teal: #14B8A6;
  --purple: #8B2BC0;
  --purple-deep: #6B1F94;
  --purple-light: #F4EAFB;
  --violet: #A855C8;
  --gold: #B8902A;
  --gold-deep: #8B6B1F;
  --gold-light: #FAF1D9;
  --gold-bright: #E8C860;
  --red-soft: #C84545;
  --red-light: #FBE9E9;

  /* Surface */
  --bg: #FBF9F4;
  --panel: #FFFFFF;
  --panel-soft: #FAF7F0;
  --border: #E8DFC8;
  --border-soft: #F0E8D4;

  /* Text */
  --text: #1A1F2E;
  --text-soft: #3D4556;
  --text-dim: #6B7488;
  --text-faint: #9CA3B4;

  /* Comparison-mode roles (only used in comparison/hybrid docs) */
  --orig: #4f46e5;       /* indigo — original side */
  --prop: #f97316;       /* orange — proposed side */
  --guide: #22d3ee;      /* cyan — how-to-use cards */
  --analysis-bg: #fef3c7;
  --analysis-text: #78350f;

  /* Comparison section palette (8-color, distinct from Q palette) */
  --sec-amber: #f59e0b;
  --sec-teal:  #14b8a6;
  --sec-sky:   #0ea5e9;
  --sec-rose:  #f43f5e;
  --sec-lime:  #84cc16;
  --sec-violet:#8b5cf6;
  --sec-pink:  #ec4899;
  --sec-slate: #64748b;

  /* Q-question palette (jewel tones) */
  --q1: #dc2626; --q2: #10b981; --q3: #2563eb;
  --q4: #ea580c; --q5: #7c3aed; --q6: #db2777;
}
```

### 4.2 Color Role Conflict Audit (RUN BEFORE SHIP for comparison/hybrid)

- No Q color may be within 30 hex units of any active section color in the doc.
- If conflict → swap Q color to nearest jewel-tone alternative before shipping.
- Cyan (`--guide`) is reserved for how-to-use cards in comparison mode. Do not use cyan for any section in those docs.

### 4.3 Semantic Tag Pills (standalone mode)

```css
.tag-cyan   { color: var(--cyan-deep);   background: var(--cyan-light);   border: 1.5px solid rgba(0,168,200,0.35); }
.tag-gold   { color: var(--gold-deep);   background: var(--gold-light);   border: 1.5px solid rgba(184,144,42,0.35); }
.tag-purple { color: var(--purple-deep); background: var(--purple-light); border: 1.5px solid rgba(139,43,192,0.30); }
.tag-hard   { color: #A02020;            background: var(--red-light);    border: 1.5px solid rgba(200,69,69,0.35); }
```

**Semantic usage:** Cyan = scoring/must-have/action · Gold = practical/why/action steps · Purple = day-to-day/who/interview · Red = auto-disqualify/red flags **only**.

---

## SECTION 5 — TYPOGRAPHY

**Default (standalone, hybrid, and most comparison docs):**
- **Body:** Inter (300, 400, 500, 600, 700, 800)
- **Headings:** Cormorant Garamond (400, 600, 700)
- Imported from Google Fonts at top of `<style>`

**Fallback (comparison docs with strict <40KB size constraint):**
- System font stack: `-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif`

**Sizing:**
- Body line-height: `1.6` (standalone/hybrid — v1 standard) or `1.5` (comparison docs with dense slide content — v2 standard). Default to `1.6` unless the doc is comparison-only with high slide density.
- H1: `clamp(2.4rem, 6.5vw, 3.8rem)` — gradient (purple-deep → cyan-deep → gold-deep)
- Section title: 1.4rem (1.18rem mobile)
- Card title: 0.95–1rem | Card desc: 0.85–0.88rem
- Slide mockup text (comparison): 1.5rem+, bold, centered, white on dark

---

## SECTION 6 — PAGE STRUCTURE

### 6.1 Universal Shell (all doc types, in order)

1. **`<header class="hero">`** — `.eyebrow` (gold pill), gradient `<h1>`, `.subtitle`, optional `.for-line`
2. **`.how-to`** — purple→cyan gradient banner with ✦ sparkle. Always include if doc has interactive elements. In comparison mode this becomes the cyan-bordered guide card grid.
3. **`.controls`** — Expand All / Collapse All (only if 3+ collapsibles)
4. **`.intro`** — centered intro panel with gradient top accent bar (cyan→purple→gold, 80px wide)
5. **Body sections** — collapsible `.section` blocks numbered `01`, `02`, `03`...
6. **`.footer`** — structure below:

```html
<footer class="footer">
  <div class="footer-tagline">Italic Cormorant tagline.</div>
  <div class="footer-brand">Ascend Prime Wealth &middot; [Optional Subtitle]</div>
  <div class="footer-version">v1.0 &middot; 2026-04-15 &middot; APW_DocName.html</div>
</footer>
```

CSS: tagline = `1.4rem` italic Cormorant, `background: linear-gradient(135deg, var(--gold-deep), var(--purple-deep)); -webkit-background-clip: text; -webkit-text-fill-color: transparent;` · brand line = `0.72rem`, `letter-spacing: 3px`, uppercase, `color: var(--text-faint)` · version line = `0.68rem`, `color: var(--text-faint)`, includes version number + date + filename (per v2 spec)

### 6.2 Comparison-Mode Additions (between `.intro` and body sections)

1. **Label legend** — define every prefix used: `Sec` `Slide` `C#` `Q#`
2. **Q-question legend** — Q1–Q6 as cards/pills (emoji + Q# + full sentence + jewel-tone color)
3. **Gradient timeline / flowchart** — horizontal flow of section names with numbered dots, SVG arrows (not Unicode), gradient bar underneath. Build a mini version (compact, no labels) reusable inside the how-to-use guide.
4. **Status bar** (recommended) — e.g., "38 slides | 43/43 checklist items covered | 6/6 Qs answered"
5. **Search/filter** (recommended) — filter by Q# or C#

### 6.3 Cosmic Background (always include)

```css
body::before {
  content: '';
  position: fixed; inset: 0;
  background:
    radial-gradient(ellipse at 15% 5%, rgba(139,43,192,0.08), transparent 45%),
    radial-gradient(ellipse at 85% 20%, rgba(0,168,200,0.10), transparent 50%),
    radial-gradient(ellipse at 50% 95%, rgba(184,144,42,0.09), transparent 50%),
    radial-gradient(circle at 75% 65%, rgba(20,184,166,0.06), transparent 55%);
  pointer-events: none; z-index: 0;
}
```

Wrap content in `.wrap { position: relative; z-index: 1; max-width: 920–960px; margin: 0 auto; padding: 56px 20px 80px; }`

---

## SECTION 7 — COLLAPSIBLE SECTION PATTERN (UNIVERSAL)

```html
<div class="section" id="s1">
  <div class="section-header" onclick="toggleSection('s1')">
    <div class="section-num">01</div>
    <div class="section-title">Title</div>
    <div class="section-tag tag-cyan">Optional Label</div>
    <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg></div>
  </div>
  <div class="section-body">
    <div class="section-body-inner">
      <p class="section-intro">Italic intro line.</p>
      <!-- content -->
    </div>
  </div>
</div>
```

**Required behavior:**
- Header tap toggles `.open` class
- Body uses `max-height: 0 → 8000px+` (0.5s cubic-bezier transition)
- Chevron rotates 180° + gradient shifts cyan→gold when open
- Section number scales 1.05x when open
- Header gets gradient wash on hover, slight scale-down (0.99) on `:active`/tap
- First section opens by default via JS

```javascript
function toggleSection(id){ document.getElementById(id).classList.toggle('open'); }
function expandAll(){ document.querySelectorAll('.section').forEach(s=>s.classList.add('open')); }
function collapseAll(){ document.querySelectorAll('.section').forEach(s=>s.classList.remove('open')); }
document.getElementById('s1').classList.add('open');
```

**Comparison-mode extension:** Each *slide pair* inside a section is also independently collapsible, with expand/collapse buttons on **both left and right** edges (large, distinct, impossible to miss). Master expand-all/collapse-all governs both section and slide levels.

---

## SECTION 8 — CARD GRID PATTERN

```html
<div class="grid">
  <div class="card">
    <div class="card-title">Title</div>
    <div class="card-desc">Description.</div>
  </div>
</div>
```

- `grid-template-columns: repeat(auto-fit, minmax(260–280px, 1fr))`
- Gap: 12px
- 4px left border in accent color
- Hover/active: `translateY(-3px)`, glow shadow, border-color shift
- Per-section accent rotation via `.section.values .card`, `.section.abilities .card`, etc.

**How-to-use cards (comparison mode only):** cyan left border (`--guide`), max 6 cards, each = emoji + bold 2–4 word title + 1 short line. Scannable in <5 seconds. Never multi-line paragraphs.

---

## SECTION 9 — COMPARISON SLIDE PAIR PATTERN

For each slide in a comparison doc:

```
[ Section header — section color, Sec# + name + slide count ]
[ Section framework bar — which C# items + Q#s this section covers ]

  ┌─────────────────────┐    ┌─────────────────────┐
  │  ORIGINAL (indigo)  │    │  PROPOSED (orange)  │
  │  dark bg, white text│    │  dark bg, white text│
  └─────────────────────┘    └─────────────────────┘
  [ C1 ] [ C2 ] (indigo)     [ C1 ] [ C2 ] [ C3 ] (orange)

  ┌──────────────────────────────────────────────────┐
  │  Analysis note (amber bg #fef3c7, dark text)     │
  └──────────────────────────────────────────────────┘
```

Mobile: mockups stack vertically (original above proposed).

---

## SECTION 10 — INTERACTIVE STATES (MANDATORY)

- `* { -webkit-tap-highlight-color: transparent; }` — kill default mobile flash
- Every clickable element needs both `:hover` AND `:active`
- Common pattern: lift (`translateY`), glow (`box-shadow`), color shift (border or background)
- Use brand palette — never gray-on-gray hover states

**Chevron toggle:**
- 36px circle (32px mobile)
- Gradient cyan→purple, white SVG chevron stroke-width 3
- Rotates 180° + gradient shifts gold→gold-deep on `.open`
- Scales 1.1x on header hover

---

## SECTION 11 — SPECIAL BLOCKS (STANDALONE MODE)

- **Numbered action steps** — `counter-reset: step` parent, `counter-increment: step` child, `::before` 32px gradient circle
- **Featured question cards** — purple→cyan-light gradient bg, optional sub-grid (Short/Mid/Long Term)
- **SOP blocks** — soft panel, cyan left border, 28px gradient icon, `.sop-list` with gold ◆ bullets
- **Logistics items** — soft panel cards with gold left border
- **Not-a-fit / Red flags** — list items with purple (or red) ✕ markers, hover `translateX(4px)`

---

## SECTION 12 — MOBILE BREAKPOINT (max-width: 700px)

- `.wrap` padding: 36px 16px 60px
- Section header padding: 18px 20px, gap 12px
- Section number: 1.8rem, min-width 34px
- Section title: 1.18rem | Section tag: 0.56rem | Chevron: 32px
- Card padding: 16px
- Multi-column grids/tables collapse to single column
- Controls justify-center
- **Comparison mode:** slide mockups stack vertically; guide cards single-column
- **Test mentally for iPhone SE (375px wide)**

---

## SECTION 13 — BUILD PROCESS (UNIVERSAL — DO NOT SKIP)

### Step 1 — Read everything end-to-end
Source(s), framework checklist, section structure. Do not start coding from a partial read.

### Step 2 — Build the data model FIRST (before any HTML)

```javascript
const DATA = {
  meta: { title, subtitle, version, date },
  framework: { name, items: [{id:'C1', text:'...'}, ...] },     // comparison/hybrid only
  questions: [{id:'Q1', text:'...', emoji:'🎯', color:'#dc2626'}, ...],  // optional
  sections: [
    {
      id: 'sec1', number: 1, name: 'Hook', color: '#f59e0b',
      framework_items: ['C1','C2','C3'],   // comparison only
      questions: ['Q1'],                    // optional
      slides: [                             // comparison/hybrid only
        {
          number: 1,
          original: { text: '...', checks: ['C1','C2'] },
          proposed: { text: '...', checks: ['C1','C2','C3'] },
          analysis: '...'
        }
      ],
      content: [ /* standalone-mode blocks */ ]
    }
  ]
};
```

**Render functions consume this object. Never hardcode slide/section content into HTML strings.**

### Step 3 — Render skeleton, verify scaffolding
Header, how-to banner, legend (if comparison), flowchart (if comparison), section headers. Confirm all sections render before adding body content.

### Step 4 — Render section bodies / slide comparisons
Loop sections → loop content (or slides). Inject everything from the data model.

### Step 5 — Wire interactivity
Section toggles, slide toggles (if comparison), expand-all/collapse-all, search/filter (if comparison).

### Step 6 — Save to `/mnt/user-data/outputs/APW_<DocName>.html`

### Step 7 — RUN AUDIT (Section 14) — non-negotiable

### Step 8 — Present file via `present_files` tool, with delivery message (Section 15)

---

## SECTION 14 — AUDIT PROTOCOL (RUN BEFORE EVERY SHIP)

This is the persistent checklist. Run as a literal pass-through. **Do not ship until every applicable box is checked.**

### 14.1 Content Fidelity (all doc types)
- [ ] Every source item present, text matches source verbatim
- [ ] No content invented or merged without explicit user instruction
- [ ] (Comparison) Slide count matches source on both sides

### 14.2 Framework Mapping (comparison / hybrid)
- [ ] Every C# item appears in at least one slide
- [ ] C# badges under original = items the ORIGINAL actually checks (verify against source — do not guess)
- [ ] C# badges under proposed = items the PROPOSED actually checks
- [ ] Coverage gaps surfaced in analysis notes

### 14.3 Visual System (all doc types)
- [ ] Cosmic aurora background present
- [ ] H1 uses purple-deep → cyan-deep → gold-deep gradient
- [ ] Footer present with italic Cormorant tagline
- [ ] Tag pills used semantically (cyan/gold/purple/red as defined)
- [ ] **(Comparison)** Each section sidebar/header uses ITS section color (not all default)
- [ ] **(Comparison)** Original mockups all indigo-bordered; proposed all orange-bordered
- [ ] **(Comparison)** C# badges color-synced (indigo under original, orange under proposed)
- [ ] **(Comparison)** Q colors visually distinct from all 8 section colors (4.2 audit)
- [ ] **(Comparison)** Guide cards uniquely cyan-bordered (no other element uses cyan in this doc)
- [ ] **(Comparison)** Analysis notes pop visually (amber bg, dark text — NOT gray italic)

### 14.4 Encoding
- [ ] File saved as UTF-8 with `<meta charset="utf-8">`
- [ ] No raw smart quotes, em-dashes, or special arrows in code strings
- [ ] Use HTML entities: `&rarr;` not `→`, `--` not `—`, `"..."` not `"..."`
- [ ] Grep file for non-ASCII bytes → all are intentional HTML entities
- [ ] No `â€"`, `â†'`, `Â·`, or other mojibake in rendered output

### 14.5 Interactivity
- [ ] Every section header toggles open/closed
- [ ] First section opens by default
- [ ] Chevron rotates and shifts gradient on open
- [ ] Expand-all / collapse-all works (if 3+ collapsibles)
- [ ] **(Comparison)** Expand/collapse buttons on BOTH left AND right of every section AND every slide
- [ ] **(Comparison)** Search/filter works if included

### 14.6 Mobile
- [ ] Renders cleanly at 375px width (iPhone SE mental test)
- [ ] All grids collapse to single column
- [ ] Tap targets thumb-sized
- [ ] **(Comparison)** Slide mockups stack vertically; guide cards reflow single-column
- [ ] **(Comparison)** File size <40KB (use system fonts if needed to hit budget)

### 14.7 Honesty Check
- [ ] If HTML mockups stand in for actual slide images, explicitly state this limitation
- [ ] If anything is partial, label it PARTIAL in the delivery message
- [ ] Never claim "done" for items that are "approximately done"

### 14.8 Failure Mode Check
- [ ] Re-read user's original prompt + every feedback message in this thread
- [ ] Cross-check each request against final output
- [ ] If any prior feedback item is not addressed → fix before shipping OR explicitly call it out

---

## SECTION 15 — DELIVERY MESSAGE TEMPLATE

When presenting the file:

```
APW_<DocName>.html — v<n> — <date>

WHAT'S NEW (vs prior version):
- bullet list of changes

AUDIT RESULTS:
- Content fidelity:    PASS
- Framework mapping:   PASS  (comparison only)
- Visual system:       PASS
- Encoding:            PASS
- Interactivity:       PASS
- Mobile:              PASS

KNOWN LIMITATIONS:
- [anything partial or technically constrained]

NEXT REVISION CANDIDATES:
- [suggested improvements not yet implemented]
```

Then call `present_files` with the file path. Keep the post-amble brief — let the document speak for itself.

---

## SECTION 16 — CONTENT STYLE RULES (UNIVERSAL)

- Direct, headline-driven, copy-paste-ready
- Lead with the answer
- Sentence case for card titles (not Title Case For Everything)
- Card descriptions: 1–2 sentences max
- `<strong>` sparingly — only on words that genuinely matter
- Italics for tone-setting intros
- Em-dashes for emphasis breaks
- **No emojis in formal sections.** ✦ in instruction banner is the exception. Comparison-mode Q-cards may use emojis as part of the legend.

---

## SECTION 17 — ALWAYS DO / NEVER DO

**ALWAYS:**
- Open the first collapsible section by default
- Include the "How to use" banner when sections are collapsible
- Include Expand All / Collapse All when 3+ collapsibles exist
- Use the cosmic aurora background
- Use the gradient h1
- Verify every list/feature from the user's source brief is included
- Match the existing file's tone if extending or matching a prior doc
- Use the data model pattern (Section 13.2) — never hardcode body content into HTML strings
- Run the audit (Section 14) literally before claiming done

**NEVER:**
- Use dark backgrounds for the shell (slide mockups in comparison mode are the only exception)
- Use light text on light backgrounds
- Skip mobile responsiveness
- Use generic gray hover states
- Mention pay/compensation unless explicitly requested
- Mention specific funding amounts for APW clients
- Add emojis liberally
- Sacrifice readability for aesthetics
- Invent framework items, section names, or source content from memory
- Claim "done" when partial — use PARTIAL / DONE / NOT DONE labels honestly

---

## SECTION 18 — FAILURE MODES (PREVENT EVERY ONE)

| Failure | Prevention |
|---|---|
| Speed over verification | Run Section 14 audit literally, every time |
| No persistent checklist between iterations | This SOP IS the checklist — re-load each session |
| Claiming "done" when partial | Use PARTIAL / DONE / NOT DONE labels honestly |
| Not re-reading prior feedback | Before shipping a new version, re-read every prior user message |
| Not verifying rendered output | Mentally render the file or open it; do not trust code reads alone |
| Encoding garbled chars | Use HTML entities; grep before ship |
| Q colors clash with section colors | Run color distinction audit (4.2) |
| Guide cards overwhelming with text | Cap each at emoji + title + 1 line |
| Slide mockups don't look like slides | Solid dark bg, large centered text, generous padding |
| Sidebar all one color | Verify per-section color rendering, not just code intent |
| Hardcoded content in HTML strings | Use data model (Step 2) — content separate from rendering |
| Dark shell instead of cream | Re-read Section 3 — light shell is non-negotiable |
| Missing items from source brief | Cross-check against source as the final audit pass |

---

## SECTION 19 — FILE OUTPUT RULES

- Single `.html` file with embedded CSS and JS
- No external dependencies except Google Fonts (or zero external deps if using system-font fallback)
- Save to `/mnt/user-data/outputs/APW_<DocName>.html`
- Always present via the `present_files` tool
- Brief delivery message per Section 15

---

## SECTION 20 — REUSE FOR NON-APW PROJECTS

To apply this SOP to a different brand:

1. Replace APW brand palette in Section 4.1 with the new brand tokens
2. Replace fonts in Section 5 if brand demands different typography
3. Replace section/Q palette only if domain demands different colors
4. **Keep ALL of:** data model structure (13.2), audit protocol (14), color role assignments, encoding rules, failure mode list, build process spine

The structural integrity transfers. Only brand surface changes.

---

## SECTION 21 — VERSION HISTORY

- **v3.1 (2026-04-15)** — Fidelity patch: fixed §1 audit cross-reference (was §7, corrected to §14); added footer HTML template + exact CSS values from v1 §13; added version/date/filename to footer per v2 §3.10; added section header hover/active states from v1 §6; added mini-flowchart concept from v2 §3.5; resolved line-height conflict (v1=1.6, v2=1.5) with doc-type-aware default.
- **v3 (2026-04-15)** — Unified v1 (APW design system) + v2 (comparison blueprint + audit protocol) into one framework. Standalone, comparison, and hybrid doc types all governed by single shell + extensions.
- **v2 (2026-04-15)** — Codified comparison blueprint from APW DSL Blueprint build (v1–v10).
- **v1** — APW interactive document framework (design tokens, collapsibles, cosmic background).

---

END HTML SOP v3.1
