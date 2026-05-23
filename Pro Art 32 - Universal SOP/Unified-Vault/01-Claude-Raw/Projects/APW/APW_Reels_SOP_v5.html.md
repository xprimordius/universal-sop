---
title: APW_Reels_SOP_v5.html
source: claude
type: project-doc
project: APW
person: alan
created: "2026-04-16T01:28:12.559844+00:00"
uuid: a2101496-db4b-475c-9101-a9006f65918c
tags:
  - claude
  - alan
  - apw
  - marketing
---
# APW_Reels_SOP_v5.html

> [!info] From project: [[_Project Info|APW]]

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>APW Reels &mdash; New Hire Operating Manual v5</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;0,700;1,400;1,600&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
:root{
  --cyan:#00A8C8;--cyan-deep:#007A94;--cyan-light:#E6F7FB;
  --teal:#14B8A6;
  --purple:#8B2BC0;--purple-deep:#6B1F94;--purple-light:#F4EAFB;
  --violet:#A855C8;
  --gold:#B8902A;--gold-deep:#8B6B1F;--gold-light:#FAF1D9;--gold-bright:#E8C860;
  --red-soft:#C84545;--red-light:#FBE9E9;
  --bg:#FBF9F4;--panel:#FFFFFF;--panel-soft:#FAF7F0;
  --border:#E8DFC8;--border-soft:#F0E8D4;
  --text:#1A1F2E;--text-soft:#3D4556;--text-dim:#6B7488;--text-faint:#9CA3B4;
}
*{box-sizing:border-box;-webkit-tap-highlight-color:transparent}
html{scroll-behavior:smooth}
body{
  margin:0;padding:0;background:var(--bg);color:var(--text);
  font-family:'Inter',system-ui,sans-serif;font-weight:400;
  font-size:16px;line-height:1.6;-webkit-font-smoothing:antialiased;
}
body::before{
  content:'';position:fixed;inset:0;z-index:0;pointer-events:none;
  background:
    radial-gradient(ellipse at 15% 5%, rgba(139,43,192,0.08), transparent 45%),
    radial-gradient(ellipse at 85% 20%, rgba(0,168,200,0.10), transparent 50%),
    radial-gradient(ellipse at 50% 95%, rgba(184,144,42,0.09), transparent 50%),
    radial-gradient(circle at 75% 65%, rgba(20,184,166,0.06), transparent 55%);
}
.wrap{position:relative;z-index:1;max-width:940px;margin:0 auto;padding:56px 20px 80px}

/* --- TYPOGRAPHY --- */
h1,h2,.section-num,.footer-tagline{font-family:'Cormorant Garamond',Georgia,serif}
strong,b{font-weight:600;color:var(--text)}

/* --- HERO --- */
.hero{text-align:center;margin-bottom:12px}
.eyebrow{
  display:inline-block;font-family:'Inter';font-size:11px;font-weight:600;
  letter-spacing:2.5px;text-transform:uppercase;
  color:var(--gold-deep);background:var(--gold-light);
  border:1.5px solid rgba(184,144,42,0.35);border-radius:100px;
  padding:6px 18px;margin-bottom:18px;
}
.hero h1{
  font-weight:700;font-size:clamp(2.4rem,6.5vw,3.8rem);line-height:1.08;
  margin:0 0 14px;letter-spacing:-0.02em;
  background:linear-gradient(135deg,var(--purple-deep),var(--cyan-deep),var(--gold-deep));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;
  background-clip:text;
}
.hero .subtitle{font-size:17px;color:var(--text-soft);max-width:720px;margin:0 auto;line-height:1.55}
.hero .meta{
  font-family:'Inter';font-size:11px;font-weight:500;letter-spacing:2px;text-transform:uppercase;
  color:var(--text-faint);display:flex;flex-wrap:wrap;justify-content:center;gap:20px;
  margin-top:24px;border-top:1px solid var(--border-soft);padding-top:16px;
}

/* --- HOW-TO BANNER --- */
.how-to{
  background:linear-gradient(135deg, rgba(139,43,192,0.07), rgba(0,168,200,0.07));
  border:1px solid var(--border);border-radius:14px;padding:18px 22px;
  margin-bottom:18px;
}
.how-to h3{font-family:'Inter';font-size:12px;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--purple-deep);margin:0 0 8px}
.how-to p{margin:0;color:var(--text-soft);font-size:14.5px;line-height:1.55}
.how-to ul{margin:6px 0 0 18px;color:var(--text-soft);font-size:14px}
.how-to li{margin:3px 0}

/* --- CONTROLS --- */
.controls{display:flex;gap:10px;justify-content:flex-end;margin-bottom:18px;flex-wrap:wrap}
.controls button{
  font-family:'Inter';font-size:11px;font-weight:600;letter-spacing:1.5px;text-transform:uppercase;
  background:var(--panel);color:var(--text-soft);border:1px solid var(--border);
  border-radius:8px;padding:9px 16px;cursor:pointer;transition:all .2s ease;
}
.controls button:hover{background:var(--gold-light);color:var(--gold-deep);border-color:rgba(184,144,42,0.4);transform:translateY(-1px);box-shadow:0 4px 12px rgba(184,144,42,0.12)}
.controls button:active{transform:scale(0.97)}

/* --- JUMP NAV --- */
.jump-nav{
  position:sticky;top:0;z-index:50;
  background:rgba(251,249,244,0.92);backdrop-filter:blur(12px) saturate(140%);
  border:1px solid var(--border);border-radius:12px;padding:10px 14px;
  margin:0 0 20px;display:flex;gap:10px;align-items:center;flex-wrap:wrap;
  box-shadow:0 4px 18px rgba(0,0,0,0.06);
}
.jump-nav .label{font-family:'Inter';font-size:10px;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--gold-deep)}
.jump-nav select{
  background:var(--panel);color:var(--text);border:1px solid var(--border);border-radius:8px;
  padding:8px 12px;font-family:'Inter';font-size:13px;cursor:pointer;flex:1;min-width:200px;
}
.jump-nav select:focus{outline:2px solid var(--cyan);outline-offset:1px}

/* --- FLOATING NAV --- */
.float-nav{position:fixed;right:20px;bottom:20px;z-index:60;display:flex;flex-direction:column;gap:8px}
.float-nav button{
  width:42px;height:42px;border-radius:50%;
  background:var(--panel);border:1px solid var(--border);color:var(--gold-deep);
  font-size:17px;font-weight:700;cursor:pointer;
  box-shadow:0 4px 14px rgba(0,0,0,0.1);transition:all .2s ease;
}
.float-nav button:hover{background:var(--gold-light);border-color:var(--gold);transform:translateY(-2px);box-shadow:0 6px 20px rgba(184,144,42,0.2)}
.float-nav button:active{transform:scale(0.93)}

/* === COLLAPSIBLE SECTIONS (v3 pattern) === */
.section{
  border:1px solid var(--border);border-radius:14px;
  background:var(--panel);margin-bottom:14px;
  overflow:hidden;transition:border-color .2s ease, box-shadow .2s ease;
  scroll-margin-top:70px;
}
.section:hover{border-color:rgba(184,144,42,0.3)}
.section.open{border-color:var(--border);box-shadow:0 4px 20px rgba(0,0,0,0.05)}

.section-header{
  display:flex;align-items:center;gap:16px;
  padding:20px 24px;cursor:pointer;user-select:none;
  transition:background .15s ease;
}
.section-header:hover{background:linear-gradient(135deg, rgba(139,43,192,0.03), rgba(0,168,200,0.03))}
.section-header:active{transform:scale(0.995)}

.section-num{
  font-family:'Cormorant Garamond';font-weight:700;font-size:2rem;
  min-width:44px;text-align:center;
  background:linear-gradient(135deg,var(--gold),var(--gold-deep));
  -webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;
  transition:transform .25s ease;
}
.section.open .section-num{transform:scale(1.05)}

.section-title{
  flex:1;font-family:'Inter';font-weight:600;font-size:1.15rem;color:var(--text);
  letter-spacing:-0.005em;
}
.section-title em{font-style:italic;color:var(--cyan-deep);font-weight:400;font-family:'Cormorant Garamond';font-size:1.3rem}

.section-tag{
  font-family:'Inter';font-size:10px;font-weight:600;letter-spacing:1.5px;text-transform:uppercase;
  padding:4px 10px;border-radius:100px;
}
.tag-cyan{color:var(--cyan-deep);background:var(--cyan-light);border:1.5px solid rgba(0,168,200,0.35)}
.tag-gold{color:var(--gold-deep);background:var(--gold-light);border:1.5px solid rgba(184,144,42,0.35)}
.tag-purple{color:var(--purple-deep);background:var(--purple-light);border:1.5px solid rgba(139,43,192,0.30)}
.tag-hard{color:#A02020;background:var(--red-light);border:1.5px solid rgba(200,69,69,0.35)}

/* Chevron */
.chevron{
  width:36px;height:36px;border-radius:50%;flex-shrink:0;
  background:linear-gradient(135deg,var(--cyan),var(--purple));
  display:flex;align-items:center;justify-content:center;
  transition:all .3s cubic-bezier(0.4,0,0.2,1);
}
.chevron svg{width:18px;height:18px;stroke:#fff;stroke-width:3;fill:none;stroke-linecap:round;stroke-linejoin:round;transition:transform .3s cubic-bezier(0.4,0,0.2,1)}
.section.open .chevron{background:linear-gradient(135deg,var(--gold),var(--gold-deep))}
.section.open .chevron svg{transform:rotate(180deg)}
.section-header:hover .chevron{transform:scale(1.1)}

/* Section body */
.section-body{max-height:0;overflow:hidden;transition:max-height .5s cubic-bezier(0.4,0,0.2,1)}
.section.open .section-body{max-height:12000px}
.section-body-inner{padding:0 24px 28px}
.section-intro{font-style:italic;color:var(--text-dim);margin:0 0 18px;font-size:15px;line-height:1.55}

/* --- CARDS --- */
.card{
  border:1px solid var(--border);border-radius:12px;padding:22px 24px;
  background:var(--panel-soft);border-left:4px solid var(--gold);
  transition:all .2s ease;
}
.card:hover{transform:translateY(-2px);box-shadow:0 6px 20px rgba(0,0,0,0.06);border-left-color:var(--cyan)}
.card:active{transform:translateY(0)}
.card + .card{margin-top:14px}
.grid-2{display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:14px}
.grid-3{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:14px}

h3{font-family:'Cormorant Garamond';font-weight:700;font-size:1.35rem;margin:0 0 10px;color:var(--text)}
h4{font-family:'Inter';font-size:11px;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--purple-deep);margin:0 0 12px}
p{margin:0 0 10px;color:var(--text-soft)}
ul,ol{margin:0 0 10px 20px;padding:0;color:var(--text-soft)}
li{margin:5px 0;line-height:1.6}
li::marker{color:var(--gold)}

/* --- Glossary --- */
.gloss-item{padding:16px 0;border-bottom:1px solid var(--border-soft)}
.gloss-item:last-child{border-bottom:none}
.gloss-item dt{font-family:'Cormorant Garamond';font-weight:700;font-size:1.15rem;color:var(--purple-deep);margin:0 0 6px}
.gloss-item dd{margin:0;color:var(--text-soft);font-size:14.5px;line-height:1.6}
.glossary{display:grid;grid-template-columns:1fr 1fr;gap:0 32px}
@media(max-width:700px){.glossary{grid-template-columns:1fr}}

/* --- Pillars --- */
.pillar{border-radius:12px;padding:20px;border:1px solid var(--border);border-left:4px solid var(--border);background:var(--panel);transition:all .2s ease}
.pillar:hover{transform:translateY(-2px);box-shadow:0 4px 16px rgba(0,0,0,0.06)}
.pillar.value{border-left-color:var(--cyan)}
.pillar.share{border-left-color:#E87DA0}
.pillar.show{border-left-color:var(--teal)}
.pillar.action{border-left-color:var(--gold)}
.pillar .tag{font-family:'Inter';font-size:10px;font-weight:600;letter-spacing:2px;text-transform:uppercase}
.pillar.value .tag{color:var(--cyan-deep)} .pillar.share .tag{color:#C04070}
.pillar.show .tag{color:#0D7A6D} .pillar.action .tag{color:var(--gold-deep)}

/* --- Tables --- */
table{width:100%;border-collapse:collapse;font-size:14.5px;color:var(--text-soft)}
th,td{border-bottom:1px solid var(--border-soft);padding:10px 12px;text-align:left;vertical-align:top}
th{font-family:'Inter';font-size:10px;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--purple-deep)}
td b{color:var(--text)}
tr:hover td{background:rgba(0,168,200,0.03)}

/* --- Checklist --- */
.check{list-style:none;margin:0;padding:0;color:var(--text-soft)}
.check li{display:flex;gap:12px;padding:10px 0;border-bottom:1px dashed var(--border-soft);line-height:1.6}
.check li:last-child{border-bottom:none}
.check li::before{
  content:'';flex:0 0 20px;height:20px;margin-top:2px;
  border:2px solid var(--gold);border-radius:5px;display:block;background:var(--gold-light);
}

/* --- Code --- */
.code{
  font-family:'Courier New',monospace;font-size:13px;line-height:1.6;
  color:var(--text);background:var(--panel-soft);border:1px solid var(--border);
  border-radius:12px;padding:18px 20px;white-space:pre-wrap;
}
.code .key{color:var(--gold-deep);font-weight:700}
.code .var{color:var(--cyan-deep)}
.code .com{color:var(--text-faint);font-style:italic}

/* --- Callouts --- */
.callout{border:1px solid rgba(184,144,42,0.4);background:var(--gold-light);border-radius:12px;padding:18px 20px;border-left:4px solid var(--gold)}
.callout h4{color:var(--gold-deep)}
.callout p,.callout li{color:var(--text)}
.callout.warn{border-color:rgba(200,120,0,0.4);background:#FFF8ED;border-left-color:#D4850A}
.callout.warn h4{color:#A06000}
.callout.bad{border-color:rgba(200,69,69,0.4);background:var(--red-light);border-left-color:var(--red-soft)}
.callout.bad h4{color:#A02020}
.callout.good{border-color:rgba(20,184,166,0.4);background:#ECFDF5;border-left-color:var(--teal)}
.callout.good h4{color:#0D7A6D}

.example{border:1px dashed rgba(0,168,200,0.4);border-radius:12px;padding:18px 20px;background:var(--cyan-light);margin-top:14px;border-left:4px solid var(--cyan)}
.example h4{color:var(--cyan-deep)}

/* --- Quiz --- */
.quiz{border:2px solid rgba(139,43,192,0.35);border-radius:14px;padding:20px 22px;background:var(--purple-light);margin-top:16px;border-left:4px solid var(--purple)}
.quiz h4{color:var(--purple-deep);margin-bottom:8px}
.quiz .qlabel{display:inline-block;font-family:'Inter';font-size:10px;font-weight:700;letter-spacing:2px;background:var(--purple);color:#fff;padding:4px 10px;border-radius:6px;text-transform:uppercase;margin-bottom:8px}
.quiz ol{margin:8px 0 0 20px;color:var(--text)}
.quiz ol li{margin:6px 0;font-size:14.5px;line-height:1.6}
.quiz .answer{margin-top:12px;padding:12px 16px;border-left:3px solid var(--teal);background:#ECFDF5;border-radius:0 10px 10px 0;font-size:13.5px;color:var(--text-soft)}
.quiz .answer b{color:#0D7A6D}

.gate{border:2px solid var(--gold);border-radius:12px;padding:16px 20px;background:var(--gold-light);margin-top:14px;display:flex;gap:14px;align-items:flex-start}
.gate .gate-icon{flex:0 0 42px;height:42px;border-radius:50%;background:linear-gradient(135deg,var(--gold),var(--gold-deep));color:#fff;display:flex;align-items:center;justify-content:center;font-family:'Cormorant Garamond';font-weight:700;font-size:20px}
.gate h4{color:var(--gold-deep);margin-bottom:4px}
.gate p{color:var(--text);margin:0}

.ribbon{display:flex;flex-wrap:wrap;gap:10px;margin:0 0 22px}
.ribbon .step{border:1px solid var(--border);border-radius:100px;padding:9px 16px;font-family:'Inter';font-size:11px;font-weight:600;letter-spacing:1.5px;color:var(--text-soft);text-transform:uppercase;background:var(--panel);transition:all .15s ease}
.ribbon .step b{color:var(--gold-deep);margin-right:6px}
.ribbon .step:hover{background:var(--gold-light);border-color:rgba(184,144,42,0.35);transform:translateY(-1px)}

.days{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:16px}
.days .day{border:1px solid var(--border);border-radius:8px;padding:7px 14px;font-family:'Inter';font-size:10px;font-weight:700;letter-spacing:2px;text-transform:uppercase;color:var(--gold-deep);background:var(--gold-light)}

/* --- Footer --- */
.footer{margin-top:48px;text-align:center;padding-top:28px;border-top:1px solid var(--border)}
.footer-tagline{font-family:'Cormorant Garamond';font-size:1.4rem;font-style:italic;background:linear-gradient(135deg,var(--gold-deep),var(--purple-deep));-webkit-background-clip:text;-webkit-text-fill-color:transparent;background-clip:text;margin-bottom:8px}
.footer-brand{font-family:'Inter';font-size:11px;font-weight:500;letter-spacing:3px;text-transform:uppercase;color:var(--text-faint)}
.footer-version{font-family:'Inter';font-size:10px;color:var(--text-faint);margin-top:6px;letter-spacing:1px}

/* --- MOBILE (700px) --- */
@media(max-width:700px){
  .wrap{padding:36px 16px 60px}
  .section-header{padding:18px 20px;gap:12px}
  .section-num{font-size:1.8rem;min-width:34px}
  .section-title{font-size:1.05rem}
  .section-title em{font-size:1.15rem}
  .section-tag{font-size:9px;padding:3px 8px}
  .chevron{width:32px;height:32px}
  .chevron svg{width:15px;height:15px}
  .section-body-inner{padding:0 20px 24px}
  .card{padding:16px 18px}
  .grid-2,.grid-3{grid-template-columns:1fr}
  .controls{justify-content:center}
  .hero h1{font-size:clamp(2rem,8vw,2.8rem)}
  .jump-nav{flex-direction:column;gap:8px}
  .jump-nav select{min-width:100%}
}

@media print{
  body::before{display:none}
  .jump-nav,.float-nav,.controls{display:none}
  .section{border:1px solid #ccc !important;page-break-inside:avoid}
  .section-body{max-height:none !important;overflow:visible !important}
  .section.open .section-body,.section-body{max-height:none !important}
  .chevron{display:none}
}
</style>
</head>
<body>
<div class="wrap" id="top">

<!-- HERO -->
<header class="hero">
  <div class="eyebrow">New Hire Operating Manual &middot; v5.0</div>
  <h1>Reels Master SOP<br>+ Proficiency System</h1>
  <p class="subtitle">A complete operating manual for a brand-new generalist with zero background in marketing, video, or business funding. Read once. Verify at every gate. Reference forever.</p>
  <div class="meta">
    <span>Owner &middot; Alan Nguyen</span>
    <span>Brand &middot; Ascend Prime Wealth</span>
    <span>Tools &middot; ChatGPT / Claude + Google Docs</span>
    <span>Role &middot; Generalist</span>
  </div>
</header>

<!-- HOW-TO -->
<div class="how-to">
  <h3>&starf; How to navigate this document</h3>
  <p>Sections are <strong>collapsible</strong> &mdash; click any header to expand or collapse. Use the <strong>jump menu</strong> below to skip to any section. Use the <strong>&uarr; / &darr; buttons</strong> at bottom-right to move fast.</p>
  <ul>
    <li>Day 1: Read &amp; pass Sections 00&ndash;04.</li>
    <li>Day 2&ndash;4: Work through Phases P1&ndash;P4 with checks.</li>
    <li>Week 1+: Bookmark Compliance (11) and Proficiency Tiers (15).</li>
    <li>Print mode expands all sections automatically.</li>
  </ul>
</div>

<!-- JUMP NAV -->
<nav class="jump-nav">
  <span class="label">Jump to</span>
  <select id="jumpSelect" onchange="jumpTo(this.value)">
    <option value="">&mdash; Choose a section &mdash;</option>
    <option value="s00">00 &middot; Read Me First</option>
    <option value="s01">01 &middot; Glossary</option>
    <option value="s02">02 &middot; APW Context</option>
    <option value="s03">03 &middot; The Goal</option>
    <option value="s04">04 &middot; The Four Pillars</option>
    <option value="s05">05 &middot; Master Workflow</option>
    <option value="sP1">P1 &middot; Concept</option>
    <option value="sP2">P2 &middot; Framework</option>
    <option value="sP3">P3 &middot; Hooks</option>
    <option value="sP4">P4 &middot; Body Script</option>
    <option value="sP5">P5 &middot; Caption</option>
    <option value="sP6">P6 &middot; Recording Notes</option>
    <option value="sP7">P7 &middot; Pipeline &amp; Files</option>
    <option value="sP8">P8 &middot; Publish &amp; Repurpose</option>
    <option value="s10">10 &middot; How to Talk to Alan</option>
    <option value="s11">11 &middot; Compliance</option>
    <option value="s12">12 &middot; Common Mistakes</option>
    <option value="s13">13 &middot; Onboarding Path</option>
    <option value="s14">14 &middot; Self-Check</option>
    <option value="s15">15 &middot; Proficiency Tiers</option>
    <option value="sCL">&starf; Master Checklist</option>
  </select>
</nav>

<!-- CONTROLS -->
<div class="controls">
  <button onclick="expandAll()">Expand All</button>
  <button onclick="collapseAll()">Collapse All</button>
</div>

<!-- ======== SECTIONS ======== -->

<!-- 00 -->
<div class="section" id="s00">
  <div class="section-header" onclick="toggleSection('s00')">
    <div class="section-num">00</div>
    <div class="section-title">Read Me <em>First</em></div>
    <div class="section-tag tag-gold">Start Here</div>
    <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
  </div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">Welcome. You were hired because Alan trusts you to figure things out. This manual is designed so you never have to guess.</p>
    <div class="grid-2">
      <div class="card"><h4>Reading order</h4><ol><li>Sections 00&ndash;04 today.</li><li>Pass each Proficiency Check before advancing.</li><li>Phases P1&ndash;P8 tomorrow.</li><li>Sections 10&ndash;14 in your first week.</li><li>Bookmark the Master Checklist.</li><li>Re-read Compliance (Section 11) every Monday.</li></ol></div>
      <div class="card"><h4>The 3 rules that override everything</h4><ol><li><strong>Verify before you state.</strong> Never invent a number or claim. If unsure, say &ldquo;verifying.&rdquo;</li><li><strong>Always present options + a recommendation.</strong> Alan picks; you execute.</li><li><strong>Lead with the answer.</strong> First sentence = the answer. Context after.</li></ol></div>
    </div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; 00</span><h4>Answer out loud:</h4><ol><li>What are the 3 rules?</li><li>What do you do if unsure about a fact?</li><li>Who picks the creative direction &mdash; you or Alan?</li></ol><div class="answer"><b>Pass:</b> All three from memory.</div></div>
  </div></div>
</div>

<!-- 01 GLOSSARY -->
<div class="section" id="s01">
  <div class="section-header" onclick="toggleSection('s01')">
    <div class="section-num">01</div>
    <div class="section-title"><em>Glossary</em> &mdash; every term defined</div>
    <div class="section-tag tag-purple">Reference</div>
    <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
  </div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">Read straight through once. Every term is separated by a soft divider.</p>
    <div class="card"><dl class="glossary">
      <div class="gloss-item"><dt>Reel</dt><dd>A short vertical video on Instagram, 15&ndash;90 seconds. Format: 9:16 (tall, like a phone screen).</dd></div>
      <div class="gloss-item"><dt>Hook</dt><dd>The first 1&ndash;2 seconds. Its only job is to stop someone from scrolling.</dd></div>
      <div class="gloss-item"><dt>Body / Script</dt><dd>Everything between the hook and the CTA. The teaching, story, or proof.</dd></div>
      <div class="gloss-item"><dt>CTA (Call to Action)</dt><dd>The single instruction at the end. &ldquo;Comment FUND.&rdquo; One ask. One next step.</dd></div>
      <div class="gloss-item"><dt>Caption</dt><dd>The written text under the Reel. Structure: Hook &rarr; Value &rarr; CTA.</dd></div>
      <div class="gloss-item"><dt>Avatar</dt><dd>The exact person we talk to. Medical practice owner ($25K&ndash;$100K/mo) OR service-business operator. Not a beginner.</dd></div>
      <div class="gloss-item"><dt>Pillar</dt><dd>One of four content categories: Value, Share, Show, Action. Every Reel is exactly one.</dd></div>
      <div class="gloss-item"><dt>VSL (Video Sales Letter)</dt><dd>Long-form video on a landing page that sells the APW program. Primary destination.</dd></div>
      <div class="gloss-item"><dt>Lead Magnet</dt><dd>A free PDF, checklist, or training given in exchange for a DM keyword. Secondary destination.</dd></div>
      <div class="gloss-item"><dt>DM Keyword</dt><dd>A short word (e.g., &ldquo;FUND&rdquo;) viewers comment or DM. Automation sends the magnet.</dd></div>
      <div class="gloss-item"><dt>PAS</dt><dd>Problem &middot; Agitate &middot; Solution. State the problem &rarr; make it sting &rarr; reveal the fix. We loop it twice.</dd></div>
      <div class="gloss-item"><dt>Pattern Interrupt</dt><dd>A surprise that breaks autopilot. Contrarian statement, shocking number, sudden cut.</dd></div>
      <div class="gloss-item"><dt>Retention</dt><dd>% of viewers who stay watching. Our rule: something changes every 2 seconds.</dd></div>
      <div class="gloss-item"><dt>Headline</dt><dd>A sentence that could stand alone on a billboard. Punchy, clear, lead with the point.</dd></div>
      <div class="gloss-item"><dt>B-roll</dt><dd>Supporting footage cut into the main video. Hides edits, adds visual variety.</dd></div>
      <div class="gloss-item"><dt>Underwriting</dt><dd>A bank&rsquo;s process for deciding approval. Knowing what banks score on is APW&rsquo;s core IP.</dd></div>
      <div class="gloss-item"><dt>Unsecured Funding</dt><dd>Credit or loans without collateral. What APW helps clients get.</dd></div>
      <div class="gloss-item"><dt>Personal Guarantee (PG)</dt><dd>A promise that you personally repay a business loan if the business can&rsquo;t.</dd></div>
      <div class="gloss-item"><dt>Cool-Down Period</dt><dd>The 6&ndash;24+ month wait some paths force before you can apply for more. Quick Funding triggers it; Max Funding avoids it.</dd></div>
      <div class="gloss-item"><dt>Pipeline</dt><dd>The status board where every Reel moves from idea to posted.</dd></div>
      <div class="gloss-item"><dt>Cycle</dt><dd>One batch of content. Currently: 9 Reels per cycle.</dd></div>
    </dl></div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; 01</span><h4>Match without looking:</h4><ol><li><strong>Hook</strong> &mdash; what is its only job?</li><li><strong>PAS</strong> &mdash; three letters stand for?</li><li><strong>Avatar</strong> &mdash; name two people who are NOT our avatar.</li><li><strong>VSL vs. Lead Magnet</strong> &mdash; which is primary?</li><li><strong>Retention</strong> &mdash; how often must something change?</li><li><strong>Cool-down</strong> &mdash; which offer triggers it?</li></ol><div class="answer"><b>Pass:</b> 6/6 from memory.</div></div>
  </div></div>
</div>

<!-- 02 APW CONTEXT -->
<div class="section" id="s02">
  <div class="section-header" onclick="toggleSection('s02')">
    <div class="section-num">02</div>
    <div class="section-title">APW <em>Context</em> &mdash; what we sell, who we serve</div>
    <div class="section-tag tag-cyan">Know This</div>
    <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
  </div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">You cannot write good content if you don&rsquo;t understand the business.</p>
    <div class="grid-2">
      <div class="card"><h4>What APW does</h4><p>Ascend Prime Wealth teaches business owners how to access $100K&ndash;$500K+ in <strong>unsecured business funding</strong> &mdash; loans and credit lines without risking their house or car.</p><p>We sell <strong>education and coaching</strong>. Clients do applications themselves. We are not a lender. Not a broker. We are the playbook.</p></div>
      <div class="card"><h4>Who we sell to (the avatar)</h4><p><strong>Primary:</strong> Medical practice / clinic owner doing $25K&ndash;$100K/mo.</p><p><strong>Secondary:</strong> Service-business operator wanting growth capital without giving up equity.</p><p style="color:var(--red-soft)"><strong>Not for:</strong> No business yet. Credit repair. Free money seekers. Personal loan seekers.</p></div>
    </div>
    <h3 style="margin:24px 0 12px">The two funding paths (memorize)</h3>
    <div class="grid-2">
      <div class="pillar value"><span class="tag">Option 1 &middot; Quick Funding</span><h3>Speed-first</h3><ul><li>Up to <strong>$30K&ndash;$100K+</strong> in <strong>1&ndash;7 days</strong>.</li><li>Up to <strong>$300K+</strong> in <strong>30 days</strong>.</li></ul><p style="color:var(--text-dim)"><strong>Trade-off:</strong> Forces a 6&ndash;24+ month cool-down. Freezes optimal fundability.</p></div>
      <div class="pillar action"><span class="tag">Option 2 &middot; Max Funding</span><h3>Compounding path</h3><ul><li>Up to <strong>$50K&ndash;$100K+</strong> in <strong>10&ndash;45 days</strong>.</li><li>Up to <strong>$500K+</strong> in <strong>90&ndash;120 days</strong>.</li></ul><p style="color:var(--text-dim)"><strong>Advantage:</strong> Repeated funding without cool-down. Repeatable across multiple businesses back-to-back. Path to millions.</p></div>
    </div>
    <div class="callout" style="margin-top:14px"><h4>Content framing</h4><p><strong>Quick Funding</strong> = urgency, cash-flow pain. <strong>Max Funding</strong> = scale, sophisticated operators. Most Reels lean Max Funding (bigger transformation). Use Quick Funding when the avatar is in pain now.</p></div>
    <div class="card" style="margin-top:14px"><h4>Brand tone</h4><ul><li><strong>Direct</strong> &mdash; say the thing.</li><li><strong>Warm</strong> &mdash; never cold or corporate.</li><li><strong>Grounded</strong> &mdash; no hype, no guarantees.</li><li><strong>Spiritually aligned</strong> &mdash; abundance, not scarcity.</li><li><strong>Execution-first</strong> &mdash; every Reel ends with something the viewer can do.</li></ul></div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; 02</span><h4>Test yourself:</h4><ol><li>What does APW sell? (Not loans.)</li><li>Name three types NOT our avatar.</li><li>Which offer triggers the cool-down?</li><li>Quick Funding range + timeline?</li><li>Max Funding range + timeline?</li><li>Which can be stacked across multiple businesses?</li></ol><div class="answer"><b>Pass:</b> All six in your own words.</div></div>
  </div></div>
</div>

<!-- 03 GOAL -->
<div class="section" id="s03">
  <div class="section-header" onclick="toggleSection('s03')">
    <div class="section-num">03</div><div class="section-title">The <em>Goal</em></div>
    <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
  </div>
  <div class="section-body"><div class="section-body-inner">
    <div class="grid-2">
      <div class="card"><h4>4 outcomes (memorize)</h4><ol><li><strong>Trust</strong> &mdash; the viewer believes us.</li><li><strong>Likability</strong> &mdash; the viewer enjoys watching.</li><li><strong>Authority</strong> &mdash; &ldquo;this person knows what they&rsquo;re talking about.&rdquo;</li><li><strong>Conversion</strong> &mdash; the viewer takes the next step.</li></ol></div>
      <div class="card"><h4>2 destinations</h4><p><strong>Primary:</strong> APW VSL.</p><p><strong>Secondary:</strong> Free resource via DM keyword.</p><p>Every Reel ends with one. Never both. Never zero.</p></div>
    </div>
  </div></div>
</div>

<!-- 04 PILLARS -->
<div class="section" id="s04">
  <div class="section-header" onclick="toggleSection('s04')">
    <div class="section-num">04</div><div class="section-title">The Four <em>Pillars</em></div>
    <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
  </div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">Every Reel is exactly one pillar. 9-Reel mix: 5 / 2 / 1 / 1.</p>
    <div class="grid-2">
      <div class="pillar value"><span class="tag">Value &middot; 5 of 9</span><h3>Authority &amp; Education</h3><p>Teach something. Objections, FAQs, misconceptions, challenges.</p></div>
      <div class="pillar share"><span class="tag">Share &middot; 2 of 9</span><h3>Likability &amp; Story</h3><p>Personal story that teaches a lesson. Builds the human bond.</p></div>
      <div class="pillar show"><span class="tag">Show &middot; 1 of 9</span><h3>Proof &amp; Results</h3><p>Client win. Screenshots, testimonials, before/after numbers.</p></div>
      <div class="pillar action"><span class="tag">Action &middot; 1 of 9</span><h3>Conversion &amp; Invite</h3><p>Direct invitation. Heavier CTA. Bottom-funnel play.</p></div>
    </div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; 03 + 04</span><h4>Classify:</h4><ol><li>&ldquo;3 mistakes that kill funding applications&rdquo; &rarr; ?</li><li>&ldquo;How my client got $250K in 45 days&rdquo; &rarr; ?</li><li>&ldquo;Watch my free training&rdquo; &rarr; ?</li><li>&ldquo;When I lost $40K to a bad partner&rdquo; &rarr; ?</li><li>What is the 9-Reel pillar mix?</li><li>Name the 4 outcomes.</li></ol><div class="answer"><b>Answers:</b> 1=Value, 2=Show, 3=Action, 4=Share. Mix=5/2/1/1. Outcomes=Trust, Likability, Authority, Conversion. <b>Pass:</b> 6/6.</div></div>
    <div class="gate"><div class="gate-icon">&starf;</div><div><h4>Foundation Gate</h4><p>Less than 6/6? Re-read 00&ndash;04. Every phase that follows assumes you know the pillars and goal in your sleep.</p></div></div>
  </div></div>
</div>

<!-- 05 WORKFLOW -->
<div class="section" id="s05">
  <div class="section-header" onclick="toggleSection('s05')"><div class="section-num">05</div><div class="section-title">Master <em>Workflow</em> &mdash; the 8 phases</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">Every Reel moves through these in order. <strong>Never skip a gate.</strong></p>
    <div class="ribbon">
      <span class="step"><b>P1</b> Concept</span><span class="step"><b>P2</b> Framework</span><span class="step"><b>P3</b> Hook</span><span class="step"><b>P4</b> Body Script</span><span class="step"><b>P5</b> Caption</span><span class="step"><b>P6</b> Recording</span><span class="step"><b>P7</b> Edit &amp; Pipeline</span><span class="step"><b>P8</b> Publish</span>
    </div>
    <div class="callout"><h4>The gate rule</h4><p>Phase X+1 cannot begin until Alan approves Phase X. Fixing a weak hook costs 5 minutes. Fixing a finished video costs hours.</p></div>
  </div></div>
</div>

<!-- P1 CONCEPT -->
<div class="section" id="sP1">
  <div class="section-header" onclick="toggleSection('sP1')"><div class="section-num">P1</div><div class="section-title">Phase 1 &mdash; <em>Concept</em></div><div class="section-tag tag-cyan">Create</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">A &ldquo;concept&rdquo; is the one-sentence idea for a Reel. Generate 12&ndash;15, distill to the final set.</p>
    <div class="card"><h4>The 5 concept tests</h4><ol><li><strong>Avatar fit</strong> &mdash; speaks to a medical operator or qualified entrepreneur.</li><li><strong>Pillar clarity</strong> &mdash; Value, Share, Show, or Action without hesitation.</li><li><strong>Pattern interrupt</strong> &mdash; contrarian, surprising, or unspoken truth.</li><li><strong>Mechanism reveal</strong> &mdash; teaches or shows something tactical.</li><li><strong>CTA pathway</strong> &mdash; obvious bridge to the VSL or a free resource.</li></ol></div>
    <div class="example"><h4>AI prompt for concept generation</h4><div class="code"><span class="com"># Role</span>
Content strategist for Ascend Prime Wealth (APW).

<span class="com"># Audience</span>
Medical practice owners ($25K&ndash;$100K/mo) AND service operators
who want $100K&ndash;$500K+ in unsecured funding without giving up equity.
Two paths: Quick Funding ($30K&ndash;$300K+ in 1&ndash;30 days, triggers cool-down)
and Max Funding ($50K&ndash;$500K+ in 10&ndash;120 days, repeatable).

<span class="com"># Task</span>
Generate <span class="key">15 Instagram Reel concepts</span> for the Value pillar.
Each must: speak to the avatar, contain a contrarian truth,
teach a mechanism, bridge to VSL or free resource.

<span class="com"># Output</span>
For each: 1) title (&le;8 words) 2) one-sentence angle
3) sub-pillar (objection/question/misconception/challenge)
4) suggested CTA. Number 1&ndash;15.</div></div>
    <div class="callout good" style="margin-top:12px"><h4>Great concept</h4><p><strong>Title:</strong> &ldquo;The $250K Lie Banks Tell You&rdquo; &middot; <strong>Angle:</strong> Real underwriting logic vs. what banks pretend &middot; <strong>Sub-pillar:</strong> Misconception &middot; <strong>CTA:</strong> VSL.</p></div>
    <div class="callout bad" style="margin-top:10px"><h4>Bad concept</h4><p>&ldquo;How to Build Business Credit.&rdquo; Generic. No pattern interrupt. No avatar callout.</p></div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; P1</span><h4>Try it:</h4><ol><li>&ldquo;Why most CPAs sabotage your funding&rdquo; &mdash; passes all 5?</li><li>&ldquo;Top 10 productivity tips&rdquo; &mdash; passes? Why not?</li><li>Write one. Defend each test.</li></ol><div class="answer"><b>Answers:</b> #1 passes. #2 fails (no avatar, no interrupt, no mechanism).</div></div>
  </div></div>
</div>

<!-- P2 FRAMEWORK -->
<div class="section" id="sP2">
  <div class="section-header" onclick="toggleSection('sP2')"><div class="section-num">P2</div><div class="section-title">Phase 2 &mdash; <em>Framework</em></div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">The script&rsquo;s skeleton. Pick one after the concept is approved.</p>
    <div class="card"><table><thead><tr><th>Framework</th><th>Use when&hellip;</th><th>Example</th></tr></thead><tbody>
      <tr><td><strong>PAS Loop</strong></td><td>Most Value Reels. Default.</td><td>&ldquo;$250K Lie&rdquo;</td></tr>
      <tr><td><strong>What / Why / How / Now</strong></td><td>Pure teaching. Free-resource CTA.</td><td>&ldquo;3 Data Points&rdquo;</td></tr>
      <tr><td><strong>Before / After / Bridge</strong></td><td>Transformation. Results.</td><td>&ldquo;$180K in 38 days&rdquo;</td></tr>
      <tr><td><strong>Hero&rsquo;s Mistake</strong></td><td>Personal / origin story.</td><td>&ldquo;Denied $15K &rarr; $300K&rdquo;</td></tr>
      <tr><td><strong>Contrarian Reveal</strong></td><td>Hot take. Industry expos&eacute;.</td><td>&ldquo;DFY Funders charge $25K&rdquo;</td></tr>
      <tr><td><strong>Diagnostic Checklist</strong></td><td>Save-bait. Self-test.</td><td>&ldquo;Are You Fundable?&rdquo;</td></tr>
      <tr><td><strong>If-I-Had-To Playbook</strong></td><td>Hypothetical reset.</td><td>&ldquo;$100K in 30 days from scratch&rdquo;</td></tr>
    </tbody></table></div>
    <div class="callout"><h4>How to choose</h4><p>Teaching, story, proof, or invitation? Match the framework. Stuck? Default to <strong>PAS Loop</strong>.</p></div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; P2</span><h4>Match:</h4><ol><li>&ldquo;5 things I wish I knew before applying&rdquo; &rarr; ?</li><li>&ldquo;Score yourself: ready for $100K?&rdquo; &rarr; ?</li><li>&ldquo;Client went $0 &rarr; $200K in 60 days&rdquo; &rarr; ?</li><li>&ldquo;The lie about credit utilization&rdquo; &rarr; ?</li></ol><div class="answer"><b>Answers:</b> 1=Hero&rsquo;s Mistake &middot; 2=Diagnostic Checklist &middot; 3=Before/After/Bridge &middot; 4=Contrarian Reveal.</div></div>
  </div></div>
</div>

<!-- P3 HOOKS -->
<div class="section" id="sP3">
  <div class="section-header" onclick="toggleSection('sP3')"><div class="section-num">P3</div><div class="section-title">Phase 3 &mdash; <em>Hooks</em></div><div class="section-tag tag-cyan">AI + Curation</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">The hook is the first 1&ndash;2 seconds &mdash; the entire game.</p>
    <div class="card"><h4>Hook rules &mdash; non-negotiable</h4><ol><li><strong>&le; 12 words.</strong> Reads in 2 seconds.</li><li><strong>Four formats:</strong> bold question &middot; controversial statement &middot; surprising fact &middot; biggest-mistake callout.</li><li><strong>Specific.</strong> Numbers and named pains beat abstractions.</li><li><strong>No fluff:</strong> just / really / kind of / maybe / basically.</li><li><strong>Conversational.</strong> Person, not brand.</li></ol></div>
    <div class="card" style="margin-top:14px"><h4>Scoring rubric &mdash; 6 axes /10</h4><table><tbody><tr><td>Attention</td><td>Stops thumb &lt; 1 second.</td></tr><tr><td>Specificity</td><td>Concrete numbers, names, callouts.</td></tr><tr><td>Avatar Fit</td><td>The right person feels addressed.</td></tr><tr><td>Curiosity</td><td>Open loop the brain must close.</td></tr><tr><td>Clarity</td><td>Understood instantly, sound off.</td></tr><tr><td>Brevity</td><td>&le; 12 words, punchy rhythm.</td></tr></tbody></table><p style="color:var(--text-dim);margin-top:8px">Minimum to surface to Alan: <strong>8.0 avg</strong>, no axis below 7.</p></div>
    <div class="example"><h4>AI prompt for hooks</h4><div class="code"><span class="com"># Role</span>
Direct-response copywriter for Ascend Prime Wealth.
Audience: medical practice owners and service operators
who want $100K&ndash;$500K+ in unsecured funding (no income docs).

<span class="com"># Task</span>
Generate <span class="key">40 short-form video hooks</span> for the concept below.

<span class="com"># Concept</span>
<span class="var">[paste concept title + one-sentence angle]</span>

<span class="com"># Hard rules</span>
- Each hook &le; 12 words. Reads in &le; 2 seconds.
- Four formats: bold question, controversial statement,
  surprising fact, biggest-mistake callout.
- Specific. Numbers beat abstractions.
- No filler: no &ldquo;just&rdquo;, &ldquo;really&rdquo;, &ldquo;kind of&rdquo;, &ldquo;maybe&rdquo;, &ldquo;basically&rdquo;.
- Conversational. Human voice, not brand voice.

<span class="com"># Output</span>
Numbered list of 40 hooks. After each, append:
[Att/Spc/Avt/Cur/Clr/Brv = X/10 each, AVG=X.X]
Then list top 15 by avg. Keep only AVG &ge; 8, no axis &lt; 7.</div></div>
    <div class="card" style="margin-top:14px"><h4>Manual curation pass</h4><ul class="check"><li>Read every shortlisted hook out loud. Stumble = cut.</li><li>Cut near-duplicates. Keep the strongest.</li><li>Verify any factual claim. Invented = cut.</li><li>Compliance scan (Section 11).</li><li>Build a clean table for Alan: # &middot; Hook &middot; Format &middot; Score &middot; Note.</li><li>Mark your top 3 with a star + one-sentence reason.</li></ul></div>
    <div class="example"><h4>How to send hooks to Alan</h4><div class="code"><span class="key">REEL #1 &mdash; &ldquo;The $250K Lie Banks Tell You&rdquo;</span>
<span class="var">Pillar:</span> Value &middot; Misconception
<span class="var">Framework:</span> Contrarian Reveal &rarr; PAS Loop

<span class="com"># Top 3 (my rec)</span>
&starf; 1. &ldquo;Banks lied to you about $250K.&rdquo; &mdash; 9.2 avg
&starf; 2. &ldquo;You don&rsquo;t need 2 years of tax returns.&rdquo; &mdash; 9.0 avg
&starf; 3. &ldquo;Your CPA is killing your funding.&rdquo; &mdash; 8.8 avg

<span class="com"># Pick a number. I&rsquo;ll write the body script.</span></div></div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; P3</span><h4>Score these:</h4><ol><li>&ldquo;Most business owners are basically just kind of stuck&hellip;&rdquo; &mdash; pass or fail?</li><li>&ldquo;Banks reject 73% of medical practice loans. Here&rsquo;s why.&rdquo; &mdash; score it.</li><li>&ldquo;Three things every doctor needs.&rdquo; &mdash; pass or fail?</li><li>Minimum avg to send to Alan?</li></ol><div class="answer"><b>Answers:</b> #1=FAIL (over 12 words, 4 fluff words). #2=strong, ~9.0. #3=borderline (no interrupt). #4=8.0 avg, no axis &lt; 7.</div></div>
  </div></div>
</div>

<!-- P4 BODY SCRIPT -->
<div class="section" id="sP4">
  <div class="section-header" onclick="toggleSection('sP4')"><div class="section-num">P4</div><div class="section-title">Phase 4 &mdash; <em>Body Script</em></div><div class="section-tag tag-gold">Core Build</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">After Alan picks the hook, build the body. Default: PAS in a loop, retention beat every 2 seconds, headlines over sentences, one CTA.</p>
    <div class="grid-2">
      <div class="card"><h4>60-second architecture</h4><table><tbody><tr><td>0:00&ndash;0:02</td><td>HOOK</td></tr><tr><td>0:02&ndash;0:05</td><td>PROBLEM</td></tr><tr><td>0:05&ndash;0:10</td><td>AGITATE</td></tr><tr><td>0:10&ndash;0:25</td><td>SOLUTION 1</td></tr><tr><td>0:25&ndash;0:40</td><td>PAS LOOP 2 (deeper)</td></tr><tr><td>0:40&ndash;0:50</td><td>STACK VALUE / proof</td></tr><tr><td>0:50&ndash;0:60</td><td>CTA</td></tr></tbody></table></div>
      <div class="card"><h4>Retention rules</h4><ul class="check"><li>Visual change every 2s: cut, zoom, B-roll, text pop.</li><li>Verbal change every 2s: new headline, new beat.</li><li>Pace change: mix short/long lines.</li><li>Pattern interrupt every 7&ndash;10s.</li><li>Speak in headlines. No &ldquo;let me explain.&rdquo;</li><li>Read aloud. Stumble = viewer scrolls.</li></ul></div>
    </div>
    <div class="card" style="margin-top:14px"><h4>Scoring rubric &mdash; must avg <strong>9+/10</strong> before recording</h4><table><tbody><tr><td>Hook strength</td><td>Stops scroll &lt; 1s.</td></tr><tr><td>Retention</td><td>Change every 2s.</td></tr><tr><td>PAS execution</td><td>Two loops, second deeper.</td></tr><tr><td>Headline density</td><td>Every line a billboard.</td></tr><tr><td>Specificity</td><td>Real numbers, names, timelines.</td></tr><tr><td>Avatar resonance</td><td>Avatar nods 3+ times.</td></tr><tr><td>Mechanism clarity</td><td>Viewer can repeat the idea.</td></tr><tr><td>Authority</td><td>One concrete proof element.</td></tr><tr><td>Likability</td><td>One human moment.</td></tr><tr><td>CTA strength</td><td>One ask &middot; one keyword &middot; one destination.</td></tr></tbody></table></div>
    <div class="example"><h4>Exact format you send to Alan</h4><div class="code"><span class="key">REEL #1 &mdash; &ldquo;The $250K Lie Banks Tell You&rdquo;</span>
<span class="var">Pillar:</span>      Value &middot; Misconception
<span class="var">Framework:</span>   Contrarian Reveal &rarr; PAS Loop
<span class="var">Hook:</span>        &ldquo;Banks lied to you about $250K.&rdquo;
<span class="var">CTA:</span>         VSL &mdash; &ldquo;Watch the free training, link in bio.&rdquo;

<span class="com">--- SCRIPT ---</span>
[0:00] HOOK         &ldquo;Banks lied to you about $250K.&rdquo;
[0:03] PROBLEM      &ldquo;They told you you need 2 years of tax returns.&rdquo;
[0:06] AGITATE      &ldquo;So you stopped applying. You stayed stuck.&rdquo;
[0:10] SOLUTION 1   &ldquo;Real underwriting runs on 3 things, not income.&rdquo;
[0:18] HEADLINE     &ldquo;Personal credit profile. Bank intelligence. Timing.&rdquo;
[0:25] LOOP 2 &mdash; P   &ldquo;But your CPA told you to wait.&rdquo;
[0:30] LOOP 2 &mdash; A   &ldquo;Every month you wait, your stack ages backward.&rdquo;
[0:35] LOOP 2 &mdash; S   &ldquo;Build the profile first. Apply in waves.&rdquo;
[0:42] PROOF        &ldquo;One client closed $180K in 38 days using this.&rdquo;
[0:50] CTA          &ldquo;Watch the free training. Link in bio.&rdquo;

<span class="com">--- VISUAL CUES ---</span>
[0:00] face-on, direct camera, hard cut
[0:03] text overlay: &ldquo;2 YEARS OF TAX RETURNS = LIE&rdquo;
[0:06] B-roll: empty bank lobby
[0:18] 3 text bullets pop one at a time
[0:42] screenshot of approval
[0:50] cut back to face, point at camera

<span class="com">--- SCORE ---</span>
Hook 10 &middot; Retention 10 &middot; PAS 10 &middot; Headlines 10 &middot; Specificity 10
Avatar 10 &middot; Mechanism 10 &middot; Authority 10 &middot; Likability 9 &middot; CTA 10
AVERAGE: 9.9 / 10</div></div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; P4</span><h4>Diagnose:</h4><ol><li>Same camera angle for 9 seconds. Which axis fails?</li><li>CTA says &ldquo;Comment FUND, click bio, DM me.&rdquo; What rule is broken?</li><li>Script teaches mechanism but no numbers. Which axes are weak?</li><li>Minimum avg before recording?</li></ol><div class="answer"><b>Answers:</b> 1=Retention. 2=One ask/keyword/destination. 3=Specificity + Authority. 4=9.0.</div></div>
  </div></div>
</div>

<!-- P5 CAPTION -->
<div class="section" id="sP5">
  <div class="section-header" onclick="toggleSection('sP5')"><div class="section-num">P5</div><div class="section-title">Phase 5 &mdash; <em>Caption</em></div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <div class="grid-2">
      <div class="card"><h4>Caption template</h4><div class="code"><span class="key">[HOOK LINE]</span>
Bold question / contrarian / surprising fact.

<span class="key">[VALUE &mdash; 2&ndash;4 lines]</span>
1-line problem framing.
&check; Point 1
&check; Point 2
&check; Point 3

<span class="key">[CTA &mdash; 1&ndash;2 lines]</span>
Comment &ldquo;<span class="var">KEYWORD</span>&rdquo; and I&rsquo;ll send it over.</div></div>
      <div class="card"><h4>Review checklist</h4><ul class="check"><li>Hook is one of four formats.</li><li>Every sentence earns its place.</li><li>Read aloud &mdash; no stumbles.</li><li>One CTA. One keyword. One destination.</li><li>Spacing breaks long blocks.</li><li>Compliance scan passed.</li><li>Brand voice: direct, warm, intelligent.</li></ul></div>
    </div>
  </div></div>
</div>

<!-- P6 RECORDING -->
<div class="section" id="sP6">
  <div class="section-header" onclick="toggleSection('sP6')"><div class="section-num">P6</div><div class="section-title">Phase 6 &mdash; <em>Recording Notes</em></div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">You don&rsquo;t record. Alan does. Hand him a script he can perform without thinking.</p>
    <div class="grid-2">
      <div class="card"><h4>What you give Alan</h4><ul class="check"><li>Approved final script with timestamps.</li><li>Visual cues mapped to each timestamp.</li><li>B-roll list.</li><li>Wardrobe note (brand color accent).</li><li>Energy note (&ldquo;open high, lean in at 0:10&rdquo;).</li></ul></div>
      <div class="card"><h4>What Alan handles</h4><ul><li>Lighting, camera, audio.</li><li>Wardrobe + framing.</li><li>Multiple takes.</li><li>Uploading raw footage.</li></ul></div>
    </div>
  </div></div>
</div>

<!-- P7 PIPELINE -->
<div class="section" id="sP7">
  <div class="section-header" onclick="toggleSection('sP7')"><div class="section-num">P7</div><div class="section-title">Phase 7 &mdash; <em>Pipeline &amp; Files</em></div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">Google Docs tracker with one row per Reel. Update status the moment you move forward.</p>
    <div class="card"><h4>Tracker columns</h4><table><tbody><tr><td>Reel #</td><td>1, 2, 3&hellip;</td></tr><tr><td>Concept Title</td><td>&ldquo;$250K Lie&rdquo;</td></tr><tr><td>Pillar</td><td>Value / Share / Show / Action</td></tr><tr><td>Status</td><td>See list</td></tr><tr><td>Hook (approved)</td><td>Exact line</td></tr><tr><td>Script Doc Link</td><td>URL</td></tr><tr><td>Caption Doc Link</td><td>URL</td></tr><tr><td>CTA</td><td>VSL or DM keyword</td></tr><tr><td>Posted Date</td><td>YYYY-MM-DD</td></tr><tr><td>Notes</td><td>Anything Alan needs</td></tr></tbody></table></div>
    <div class="card" style="margin-top:14px"><h4>Status list</h4><table><tbody><tr><td>IDEA</td><td>Logged, not yet approved.</td></tr><tr><td>CONCEPT APPROVED</td><td>Greenlit.</td></tr><tr><td>HOOKS SENT</td><td>Top 10&ndash;20 delivered.</td></tr><tr><td>HOOK APPROVED</td><td>Picked.</td></tr><tr><td>SCRIPT SENT</td><td>Body delivered.</td></tr><tr><td>SCRIPT APPROVED</td><td>Ready to record.</td></tr><tr><td>RECORDED</td><td>Footage uploaded.</td></tr><tr><td>EDIT IN PROGRESS</td><td>Editor working.</td></tr><tr><td>READY FOR REVIEW</td><td>First cut delivered.</td></tr><tr><td>REVISION</td><td>Comments returned.</td></tr><tr><td>FINAL APPROVED</td><td>Locked.</td></tr><tr><td>POSTED &mdash; IG</td><td>Live on Instagram.</td></tr><tr><td>POSTED &mdash; ALL</td><td>Live everywhere.</td></tr></tbody></table></div>
    <div class="callout"><h4>Folder structure</h4><div class="code"><span class="key">/APW Reels/</span>
  /00 Tracker
  /01 Concepts/
  /02 Hooks/
  /03 Scripts/
  /04 Captions/
  /05 Raw Footage/
  /06 Edited/
  /07 Posted/</div></div>
  </div></div>
</div>

<!-- P8 PUBLISH -->
<div class="section" id="sP8">
  <div class="section-header" onclick="toggleSection('sP8')"><div class="section-num">P8</div><div class="section-title">Phase 8 &mdash; <em>Publish &amp; Repurpose</em></div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <div class="grid-2">
      <div class="card"><h4>Publish protocol</h4><ul class="check"><li>DM-keyword automation armed BEFORE posting.</li><li>Post 7&ndash;9am CT or 6&ndash;9pm CT.</li><li>First 60 min: reply to every comment with a question.</li><li>Story re-share within 1 hour.</li><li>Log views, watch %, saves, shares, DMs at 24h, 72h, 7d.</li></ul></div>
      <div class="card"><h4>Repurpose path</h4><ul><li>IG Reel &rarr; FB &rarr; TikTok &rarr; YouTube Short &rarr; LinkedIn &rarr; X.</li><li>Caption &rarr; email blurb / newsletter.</li><li>Top performers (&ge; 5x baseline) &rarr; paid boost.</li><li>Top hooks &rarr; carousel post variant.</li><li>Top hooks &rarr; ad creative test pool.</li></ul></div>
    </div>
  </div></div>
</div>

<!-- 10 HOW TO TALK TO ALAN -->
<div class="section" id="s10">
  <div class="section-header" onclick="toggleSection('s10')"><div class="section-num">10</div><div class="section-title">How to <em>Talk to Alan</em></div><div class="section-tag tag-gold">Critical</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">The way you communicate determines how much trust you earn.</p>
    <div class="grid-2">
      <div class="card"><h4>7 communication rules</h4><ol><li><strong>Lead with the answer.</strong></li><li><strong>Headline format.</strong> Bold lines, tables, bullets.</li><li><strong>Brevity, complete.</strong></li><li><strong>Always present options + a recommendation.</strong></li><li><strong>Verify before stating.</strong></li><li><strong>Copy-paste-ready.</strong></li><li><strong>One clear next step.</strong></li></ol></div>
      <div class="card"><h4>What NOT to do</h4><ul><li>No paragraphs. Use lines and bullets.</li><li>No filler (&ldquo;just,&rdquo; &ldquo;kind of,&rdquo; &ldquo;maybe&rdquo;).</li><li>No asking permission for things in scope.</li><li>No five clarifying questions.</li><li>No invented stats.</li><li>No raw AI output.</li><li>No cold or corporate tone.</li></ul></div>
    </div>
    <div class="example"><h4>Sending hooks for review</h4><div class="code"><span class="key">REEL #1 &mdash; Hooks ready for your pick</span>

Top 3 (my rec):
&starf; &ldquo;Banks lied to you about $250K.&rdquo;
&starf; &ldquo;You don&rsquo;t need 2 years of tax returns.&rdquo;
&starf; &ldquo;Your CPA is killing your funding.&rdquo;

Full top 15 below. Pick a number.

Next: body script within 24h of your pick.</div></div>
  </div></div>
</div>

<!-- 11 COMPLIANCE -->
<div class="section" id="s11">
  <div class="section-header" onclick="toggleSection('s11')"><div class="section-num">11</div><div class="section-title"><em>Compliance</em> &mdash; words to never use</div><div class="section-tag tag-hard">Read Weekly</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <div class="callout bad"><h4>NEVER write these (or anything close)</h4><ul><li>&ldquo;Guaranteed approval&rdquo;</li><li>&ldquo;Guaranteed funding&rdquo;</li><li>&ldquo;You will get $X&rdquo;</li><li>&ldquo;Free money&rdquo;</li><li>&ldquo;No risk&rdquo;</li><li>&ldquo;Erase your debt&rdquo;</li><li>&ldquo;Wipe your credit&rdquo;</li><li>&ldquo;Get rich quick&rdquo;</li><li>&ldquo;Make $X in X days&rdquo; (as a promise)</li><li>Any specific income claim about what a viewer will earn</li></ul></div>
    <div class="callout good" style="margin-top:12px"><h4>Use these instead</h4><ul><li>&ldquo;Clients have accessed up to&hellip;&rdquo;</li><li>&ldquo;The path most operators use&hellip;&rdquo;</li><li>&ldquo;The strategy our clients follow&hellip;&rdquo;</li><li>&ldquo;Results vary based on profile and execution.&rdquo;</li><li>&ldquo;Here&rsquo;s what&rsquo;s possible when&hellip;&rdquo;</li></ul></div>
    <div class="callout warn" style="margin-top:12px"><h4>When in doubt</h4><p>Send the line to Alan: &ldquo;Compliance check &mdash; OK to say?&rdquo; Better to ask once than rebuild a Reel.</p></div>
    <div class="quiz"><span class="qlabel">Proficiency Check &middot; Compliance</span><h4>Rewrite compliantly:</h4><ol><li>&ldquo;You&rsquo;re guaranteed to get $250K.&rdquo;</li><li>&ldquo;Make $50K in 30 days.&rdquo;</li><li>&ldquo;This will erase your debt.&rdquo;</li><li>&ldquo;No risk, no downside.&rdquo;</li></ol><div class="answer"><b>Sample:</b> 1 &rarr; &ldquo;Clients have accessed up to $250K using this path.&rdquo; 2 &rarr; &ldquo;Here&rsquo;s what&rsquo;s possible when operators follow this.&rdquo; 3 &rarr; &ldquo;How clients restructured to free up cash flow.&rdquo; 4 &rarr; &ldquo;Results vary; here&rsquo;s the strategy clients use.&rdquo;</div></div>
  </div></div>
</div>

<!-- 12 COMMON MISTAKES -->
<div class="section" id="s12">
  <div class="section-header" onclick="toggleSection('s12')"><div class="section-num">12</div><div class="section-title">Common Mistakes &amp; <em>Fixes</em></div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">The 12 things new hires get wrong. Re-read weekly for the first month.</p>
    <div class="card"><table><thead><tr><th>Mistake</th><th>Fix</th></tr></thead><tbody>
      <tr><td>Sending raw AI output</td><td>Manual curation first. Cut, score, recommend.</td></tr>
      <tr><td>Writing for beginners</td><td>Avatar already has $25K+/mo business.</td></tr>
      <tr><td>Vague claims</td><td>Real number or cut.</td></tr>
      <tr><td>Multiple CTAs</td><td>One ask. One keyword. One destination.</td></tr>
      <tr><td>Skipping the gate</td><td>Never start P+1 until P is approved.</td></tr>
      <tr><td>Long paragraphs</td><td>Headlines + bullets + tables.</td></tr>
      <tr><td>5 clarifying questions</td><td>Ask the 1 that unlocks the rest.</td></tr>
      <tr><td>Hooks &gt; 12 words</td><td>Cut. Then cut again.</td></tr>
      <tr><td>No retention beat 4+ sec</td><td>Add visual cut or new headline.</td></tr>
      <tr><td>Compliance violations</td><td>Re-read Section 11.</td></tr>
      <tr><td>Forgetting tracker</td><td>Update the moment a phase changes.</td></tr>
      <tr><td>Inventing facts</td><td>&ldquo;I&rsquo;m not sure&rdquo; beats fabrication.</td></tr>
    </tbody></table></div>
  </div></div>
</div>

<!-- 13 ONBOARDING -->
<div class="section" id="s13">
  <div class="section-header" onclick="toggleSection('s13')"><div class="section-num">13</div><div class="section-title">Day 1 &rarr; Week 1 <em>Onboarding</em></div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <div class="days"><span class="day">Day 1</span><span class="day">Day 2</span><span class="day">Day 3</span><span class="day">Day 4</span><span class="day">Day 5</span><span class="day">Day 6&ndash;7</span></div>
    <div class="grid-2">
      <div class="card"><h3>Day 1 &mdash; Read &amp; absorb</h3><ul class="check"><li>Read 00&ndash;04 twice. Pass all checks.</li><li>Watch the APW VSL end to end.</li><li>Watch 20 successful funding/biz Reels.</li><li>Set up Drive folder structure.</li><li>Send Alan a 3-line summary.</li></ul></div>
      <div class="card"><h3>Day 2 &mdash; Concepts</h3><ul class="check"><li>Read P1 + P2. Pass checks.</li><li>Generate 15 Value concepts.</li><li>Curate to 5 finalists.</li><li>Send Alan: 5 + your top 1.</li></ul></div>
    </div>
    <div class="grid-2" style="margin-top:14px">
      <div class="card"><h3>Day 3 &mdash; Hooks</h3><ul class="check"><li>Read P3. Pass check.</li><li>Run hook prompt.</li><li>Curate top 10&ndash;20 with scores.</li><li>Send: top 10&ndash;20 + your top 3.</li></ul></div>
      <div class="card"><h3>Day 4 &mdash; Script</h3><ul class="check"><li>Read P4. Pass check.</li><li>Write 60-second script.</li><li>Self-score; iterate to &ge; 9.0.</li><li>Send full script + cues.</li></ul></div>
    </div>
    <div class="grid-2" style="margin-top:14px">
      <div class="card"><h3>Day 5 &mdash; Caption + tracker</h3><ul class="check"><li>Read P5 + P7.</li><li>Write caption for Reel #1.</li><li>Set up tracker for all 9.</li><li>Practice Section 10 format.</li></ul></div>
      <div class="card"><h3>Day 6&ndash;7 &mdash; Ship</h3><ul class="check"><li>Run pipeline on Reel #2 + #3.</li><li>Re-read Sections 11 + 12.</li><li>Self-check before every send.</li><li>EOD note to Alan.</li></ul></div>
    </div>
  </div></div>
</div>

<!-- 14 SELF-CHECK -->
<div class="section" id="s14">
  <div class="section-header" onclick="toggleSection('s14')"><div class="section-num">14</div><div class="section-title"><em>Self-Check</em> Before Sending</div><div class="section-tag tag-gold">Every Time</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <div class="card"><ul class="check"><li>First sentence contains the answer?</li><li>Options + recommendation included?</li><li>Scores attached where applicable?</li><li>Every claim verified or labeled &ldquo;verifying&rdquo;?</li><li>Zero filler words?</li><li>Copy-paste-ready?</li><li>Read aloud without stumbling?</li><li>Compliance scan (Section 11)?</li><li>Tracker updated?</li><li>Clear next step at the end?</li></ul><p style="color:var(--text-dim);margin-top:8px">All ten? Send. Any unchecked? Fix first.</p></div>
  </div></div>
</div>

<!-- 15 PROFICIENCY TIERS -->
<div class="section" id="s15">
  <div class="section-header" onclick="toggleSection('s15')"><div class="section-num">&starf;</div><div class="section-title"><em>Proficiency Verification</em> Tiers</div><div class="section-tag tag-purple">Mastery Path</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <p class="section-intro">Pass each tier in order. Each has a real deliverable Alan reviews.</p>
    <div class="card"><h4>Tier 1 &mdash; Foundation (Day 1)</h4><ul class="check"><li>Recite 4 outcomes from memory.</li><li>Recite 4 pillars + 9-Reel mix.</li><li>Define avatar in one sentence.</li><li>Name 3 things APW is NOT.</li><li>State the 3 override rules.</li><li>Recite Quick vs. Max ranges + cool-down rule.</li></ul><div class="gate"><div class="gate-icon">1</div><div><h4>Deliverable</h4><p>5-line summary to Alan: what APW does, who we serve, what we&rsquo;re not, every-Reel goal, the 3 rules.</p></div></div></div>
    <div class="card" style="margin-top:14px"><h4>Tier 2 &mdash; Concept &amp; Framework (Day 2)</h4><ul class="check"><li>Generate 15 concepts.</li><li>Score against 5 tests.</li><li>Cull to 5 finalists.</li><li>Match each to the right framework.</li><li>Defend each match in one sentence.</li></ul><div class="gate"><div class="gate-icon">2</div><div><h4>Deliverable</h4><p>5 concepts + frameworks + defense + top 1 pick.</p></div></div></div>
    <div class="card" style="margin-top:14px"><h4>Tier 3 &mdash; Hook Mastery (Day 3)</h4><ul class="check"><li>Run hook prompt.</li><li>Score on 6 axes.</li><li>Curate top 10&ndash;20 (avg &ge; 8, no axis &lt; 7).</li><li>Mark top 3 + reasoning.</li><li>Format per Phase 3 example.</li></ul><div class="gate"><div class="gate-icon">3</div><div><h4>Deliverable</h4><p>Top 10&ndash;20 hooks + top 3 stars + scores.</p></div></div></div>
    <div class="card" style="margin-top:14px"><h4>Tier 4 &mdash; Script Mastery (Day 4)</h4><ul class="check"><li>Write body script with time-blocks.</li><li>Every 2-second beat has a change.</li><li>Score 10 axes; iterate to avg &ge; 9.0.</li><li>Visual cues + B-roll list.</li><li>Compliance scan. Read aloud.</li></ul><div class="gate"><div class="gate-icon">4</div><div><h4>Deliverable</h4><p>Full script in Phase 4 format + score.</p></div></div></div>
    <div class="card" style="margin-top:14px"><h4>Tier 5 &mdash; Full Pipeline (Day 5&ndash;7)</h4><ul class="check"><li>Caption written + reviewed.</li><li>Tracker set up for all 9 Reels.</li><li>Folders live.</li><li>One Reel posted with DM keyword.</li><li>Story re-share within 1 hour.</li><li>Comments answered in 60 min.</li><li>Cross-posted everywhere.</li><li>Performance logged at 24h.</li></ul><div class="gate"><div class="gate-icon">5</div><div><h4>Deliverable</h4><p>One Reel live + Friday EOD note.</p></div></div></div>
    <div class="card" style="margin-top:14px"><h4>Tier 6 &mdash; Ultimate Proficiency (Week 2+)</h4><p>You reach this when:</p><ul><li>Alan approves 8/10 concepts on first send.</li><li>Alan picks your top-3 hook every time.</li><li>Scripts score &ge; 9.5 without coaching.</li><li>Concept &rarr; posted in &lt; 48 hours.</li><li>Zero compliance violations. Ever.</li><li>Alan says: &ldquo;Just run with it.&rdquo;</li></ul><div class="gate"><div class="gate-icon">&starf;</div><div><h4>Mastery</h4><p>You operate at Alan&rsquo;s standard. Your role expands. You start coaching the next hire.</p></div></div></div>
  </div></div>
</div>

<!-- MASTER CHECKLIST -->
<div class="section" id="sCL">
  <div class="section-header" onclick="toggleSection('sCL')"><div class="section-num">&starf;</div><div class="section-title">Master Per-Reel <em>Checklist</em></div><div class="section-tag tag-gold">Print This</div><div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div></div>
  <div class="section-body"><div class="section-body-inner">
    <div class="card"><ul class="check">
      <li>Concept logged &middot; pillar tagged &middot; 1-line angle.</li>
      <li>Concept passes all 5 tests.</li>
      <li>Concept approved by Alan.</li>
      <li>Framework selected.</li>
      <li>40 hooks generated.</li>
      <li>Hooks scored &middot; &ge; 8 avg &middot; no axis &lt; 7.</li>
      <li>Top 10&ndash;20 curated &middot; top 3 starred.</li>
      <li>Hook approved by Alan.</li>
      <li>Body script written using framework + PAS.</li>
      <li>Retention beat every 2 seconds.</li>
      <li>Script scored &middot; avg &ge; 9/10.</li>
      <li>Script approved by Alan.</li>
      <li>Caption: Hook &rarr; Value &rarr; CTA.</li>
      <li>Caption read aloud &middot; one CTA only.</li>
      <li>Compliance scan passed.</li>
      <li>Script + cues delivered to Alan.</li>
      <li>Footage uploaded &middot; tracker updated.</li>
      <li>Edit reviewed &middot; revisions returned.</li>
      <li>Final approved by Alan.</li>
      <li>Posted IG &middot; DM automation armed.</li>
      <li>Story re-share within 1 hour.</li>
      <li>Comments answered in 60 min.</li>
      <li>Cross-posted FB, TikTok, LinkedIn, X.</li>
      <li>Performance logged at 24h, 72h, 7d.</li>
      <li>Top performers flagged for boost / repurpose / ad-test.</li>
    </ul></div>
    <div class="callout" style="margin-top:14px"><h4>Operator&rsquo;s promise to Alan</h4><p>Every deliverable arrives with: <strong>(a)</strong> options, <strong>(b)</strong> a recommended pick + reasoning, <strong>(c)</strong> scores against the rubric, <strong>(d)</strong> a clear next step. Alan decides. You execute.</p></div>
  </div></div>
</div>

<!-- FOOTER -->
<footer class="footer">
  <div class="footer-tagline">Built for mastery. Designed for execution.</div>
  <div class="footer-brand">Ascend Prime Wealth &middot; New Hire Operating Manual</div>
  <div class="footer-version">v5.0 &middot; 2026-04-15 &middot; APW_Reels_SOP_v5.html</div>
</footer>

<div id="bottom"></div>
</div>

<!-- FLOATING NAV -->
<div class="float-nav">
  <button onclick="document.getElementById('top').scrollIntoView({behavior:'smooth'})" title="Top">&uarr;</button>
  <button onclick="document.getElementById('bottom').scrollIntoView({behavior:'smooth'})" title="Bottom">&darr;</button>
</div>

<script>
function toggleSection(id){document.getElementById(id).classList.toggle('open')}
function expandAll(){document.querySelectorAll('.section').forEach(s=>s.classList.add('open'))}
function collapseAll(){document.querySelectorAll('.section').forEach(s=>s.classList.remove('open'))}
function jumpTo(id){if(!id)return;var el=document.getElementById(id);if(el){el.classList.add('open');el.scrollIntoView({behavior:'smooth'});document.getElementById('jumpSelect').value=''}}
document.getElementById('s00').classList.add('open');
</script>
</body>
</html>
