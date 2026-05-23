---
title: Claude - HTML SOP v1.txt
source: claude
type: project-doc
project: APW
person: alan
created: "2026-04-16T01:28:13.180533+00:00"
uuid: 317ece59-1501-4963-bfa4-c6083a345bbb
tags:
  - claude
  - alan
  - apw
  - ops
  - sop
---
# Claude - HTML SOP v1.txt

> [!info] From project: [[_Project Info|APW]]

# HTML SOP v1 — APW Interactive Document Framework

You are generating a premium, branded, mobile-first interactive HTML document in the established Ascend Prime Wealth (APW) design system. Follow this SOP with 100% fidelity. Do not deviate from the design tokens, structure, or interaction patterns unless explicitly instructed.

---

## 1. CORE DESIGN PHILOSOPHY

- **Light, warm, premium, inviting.** Never dark. Cream/off-white background with soft purple/cyan/gold cosmic aurora glow.
- **Maximum readability.** Dark navy text on cream. Never white text on light backgrounds. Never light text where contrast suffers.
- **Cosmic/celestial brand essence preserved through subtle aurora gradients and gold accents — NOT through dark backgrounds.**
- **Tactile and alive.** Every interactive element changes color, lifts, glows, or animates on hover and tap.
- **Mobile-first.** Every layout must collapse cleanly to single-column. Tap targets thumb-sized. No tiny hit areas.

---

## 2. DESIGN TOKENS (CSS variables — use exactly)

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
  --red-soft: #C84545;       /* only when needed */
  --red-light: #FBE9E9;      /* only when needed */

  /* Surface */
  --bg: #FBF9F4;             /* warm cream background */
  --panel: #FFFFFF;
  --panel-soft: #FAF7F0;
  --border: #E8DFC8;
  --border-soft: #F0E8D4;

  /* Text */
  --text: #1A1F2E;           /* dark navy — primary */
  --text-soft: #3D4556;
  --text-dim: #6B7488;
  --text-faint: #9CA3B4;
}
```

---

## 3. TYPOGRAPHY

- **Body:** Inter (300, 400, 500, 600, 700, 800)
- **Headings (h1, taglines, section numbers):** Cormorant Garamond (400, 600, 700)
- Import both from Google Fonts at the top of `<style>`
- Body line-height: 1.6
- H1 size: clamp(2.4rem, 6.5vw, 3.8rem)
- Section title size: 1.4rem (1.18rem mobile)
- Card title: 0.95–1rem | Card desc: 0.85–0.88rem

---

## 4. PAGE STRUCTURE (in order)

```
1. <header class="hero">
   - .eyebrow (gold pill, uppercase, letter-spaced)
   - h1 (gradient: purple-deep → cyan-deep → gold-deep)
   - .subtitle (text-soft)
   - optional .for-line ("Prepared for [Name]")

2. .how-to (instructions banner)
   - Purple→cyan gradient card with sparkle icon (✦)
   - Tells user how to interact with the document
   - Use whenever the doc has interactive elements

3. .controls (Expand All / Collapse All buttons)
   - Justify-end on desktop, center on mobile
   - Only include if doc has collapsible sections

4. .standard or .intro (centered intro block)
   - White panel, gradient top accent bar (cyan→purple→gold), 80px wide

5. Collapsible .section blocks (numbered 01, 02, 03...)
   - Each has: section-num (gold gradient serif), section-title, optional section-tag, chevron
   - First section opens by default via JS

6. .footer
   - Italic Cormorant tagline (gold-deep → purple-deep gradient)
   - Brand line in faint uppercase letter-spaced caps
```

---

## 5. COSMIC BACKGROUND (always include)

```css
body::before {
  content: '';
  position: fixed;
  inset: 0;
  background:
    radial-gradient(ellipse at 15% 5%, rgba(139, 43, 192, 0.08), transparent 45%),
    radial-gradient(ellipse at 85% 20%, rgba(0, 168, 200, 0.10), transparent 50%),
    radial-gradient(ellipse at 50% 95%, rgba(184, 144, 42, 0.09), transparent 50%),
    radial-gradient(circle at 75% 65%, rgba(20, 184, 166, 0.06), transparent 55%);
  pointer-events: none;
  z-index: 0;
}
```

Wrap content in `.wrap { position: relative; z-index: 1; max-width: 920–960px; margin: 0 auto; padding: 56px 20px 80px; }`

---

## 6. COLLAPSIBLE SECTION PATTERN (mandatory for any multi-part doc)

**Header structure:**
```html
<div class="section" id="s1">
  <div class="section-header" onclick="toggleSection('s1')">
    <div class="section-num">01</div>
    <div class="section-title">Title</div>
    <div class="section-tag tag-cyan">Optional Label</div>
    <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
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
- Header tap toggles `.open` class on `.section`
- Body uses `max-height: 0 → 8000px+` transition (0.5s cubic-bezier)
- Chevron rotates 180° + shifts cyan→gold gradient when open
- Section number scales 1.05x when open
- Header gets gradient wash on hover, slight scale-down on tap

**JS:**
```javascript
function toggleSection(id) { document.getElementById(id).classList.toggle('open'); }
function expandAll() { document.querySelectorAll('.section').forEach(s => s.classList.add('open')); }
function collapseAll() { document.querySelectorAll('.section').forEach(s => s.classList.remove('open')); }
document.getElementById('s1').classList.add('open'); // open first by default
```

---

## 7. CARD GRID PATTERN

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
- Card has 4px left border in accent color
- Hover/active: translateY(-3px), box-shadow glow, border-left color shift, optional background tint

**Per-section accent rotations** (use `.section.values .card`, `.section.abilities .card`, etc. to vary the accent color by context).

---

## 8. INTERACTIVE STATES (mandatory for every interactive element)

- `* { -webkit-tap-highlight-color: transparent; }` — kill default mobile flash
- Every clickable element needs `:hover` AND `:active` states
- Common pattern: lift (translateY), glow (box-shadow), color shift (border or background)
- Use the brand palette — never gray-on-gray hover states

---

## 9. SECTION TAG PILLS (color-coded labels)

```css
.tag-cyan   { color: var(--cyan-deep);   background: var(--cyan-light);   border: 1.5px solid rgba(0, 168, 200, 0.35); }
.tag-gold   { color: var(--gold-deep);   background: var(--gold-light);   border: 1.5px solid rgba(184, 144, 42, 0.35); }
.tag-purple { color: var(--purple-deep); background: var(--purple-light); border: 1.5px solid rgba(139, 43, 192, 0.30); }
.tag-hard   { color: #A02020;            background: var(--red-light);    border: 1.5px solid rgba(200, 69, 69, 0.35); }  /* warnings only */
```

**Semantic usage:**
- Cyan = scoring, must-have, action
- Gold = practical, why, action steps
- Purple = day-to-day, who-we-are, interview
- Red = auto-disqualify, red flags ONLY

---

## 10. CHEVRON BUTTON (toggle indicator)

- 36px circle (32px mobile)
- Linear gradient cyan→purple
- White SVG chevron stroke-width 3
- Rotates 180° on `.open`, gradient shifts to gold→gold-deep
- Scales 1.1x on header hover

---

## 11. SPECIAL BLOCKS (when applicable)

**Numbered action steps:**
- `counter-reset: step` on parent, `counter-increment: step` on child
- `::before` pseudo with `content: counter(step)` rendered as 32px gradient circle
- Hover scales/rotates the badge slightly

**Featured question cards (for application questions, key callouts):**
- Purple→cyan light gradient background
- White inner labels with purple text
- Optional sub-grid (e.g., goal horizons: Short/Mid/Long Term)

**SOP blocks:**
- Soft panel with cyan left border
- Title row with small 28px gradient icon (numbered or symbol)
- Body uses `.sop-list` with gold ◆ bullets

**Logistics items:**
- Soft panel cards with gold left border
- Hover shifts to gold-light background

**Not-a-fit / Red flags lists:**
- List items with purple (or red) ✕ markers
- Hover shifts to translateX(4px)

---

## 12. MOBILE BREAKPOINT (max-width: 700px)

Required adjustments:
- `.wrap` padding: 36px 16px 60px
- Section header padding: 18px 20px, gap 12px
- Section number: 1.8rem, min-width 34px
- Section title: 1.18rem
- Section tag: 0.56rem
- Chevron: 32px
- Card padding: 16px
- Tables/grids that span multiple columns: collapse to single column
- Justify controls to center

---

## 13. FOOTER PATTERN (always include)

```html
<footer class="footer">
  <div class="footer-tagline">Italic Cormorant tagline.</div>
  <div class="footer-brand">Ascend Prime Wealth · [Optional Subtitle]</div>
</footer>
```

- Tagline: 1.4rem italic, gold-deep→purple-deep gradient
- Brand: 0.72rem, letter-spacing 3px, uppercase, faint color

---

## 14. CONTENT STYLE RULES

- Direct, headline-driven, copy-paste-ready
- Lead with the answer
- Use sentence case for card titles, not Title Case For Everything
- Keep card descriptions to 1–2 sentences
- Use `<strong>` sparingly — only on words that genuinely matter
- Italics for tone-setting intros
- Em-dashes for emphasis breaks
- No emojis in formal sections (✦ in instruction banner is the exception)

---

## 15. ALWAYS DO / NEVER DO

**ALWAYS:**
- Open the first collapsible section by default
- Include the "How to use" banner when sections are collapsible
- Include Expand All / Collapse All controls when 3+ collapsibles exist
- Use the cosmic background aurora
- Use the gradient h1
- Verify every list/feature from the user's source brief is included
- Match the existing file's tone if extending or matching a prior doc

**NEVER:**
- Use dark backgrounds
- Use light text on light backgrounds
- Skip mobile responsiveness
- Use generic gray hover states
- Mention pay/compensation unless explicitly requested
- Mention specific funding amounts for APW clients
- Add emojis liberally
- Sacrifice readability for aesthetics

---

## 16. FILE OUTPUT

- Single `.html` file with embedded CSS and JS
- No external dependencies except Google Fonts
- Save to `/mnt/user-data/outputs/` with descriptive filename: `APW_[Doc_Name].html`
- Always present the file via the present_files tool
- Brief response after — let the document speak for itself

---

## 17. INVOCATION INSTRUCTIONS

When the user invokes this SOP, they will say something like:
- "Use HTML SOP v1 to build me a [doc type] for [purpose]"
- "Apply HTML SOP v1 — I need a [topic] page"
- "HTML SOP v1: [content brief]"

Your job:
1. Confirm the SOP is loaded (one-line acknowledgment)
2. If content is ambiguous, ask 1–3 clarifying questions max — never more
3. Build the doc following the framework with 100% fidelity
4. Present the file

Do not deviate from this framework unless the user explicitly requests modification (e.g., "use a different color scheme this time" or "skip the collapsibles").

---

END HTML SOP v1