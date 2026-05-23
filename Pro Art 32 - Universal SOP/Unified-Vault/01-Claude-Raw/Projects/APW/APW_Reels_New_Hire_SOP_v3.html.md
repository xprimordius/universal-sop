---
title: APW_Reels_New_Hire_SOP_v3.html
source: claude
type: project-doc
project: APW
person: alan
created: "2026-04-16T01:32:30.478143+00:00"
uuid: 7d06f4ac-a63c-4c44-81c3-b9b5a79e8667
tags:
  - claude
  - alan
  - apw
  - marketing
---
# APW_Reels_New_Hire_SOP_v3.html

> [!info] From project: [[_Project Info|APW]]

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>APW Reels — New Hire Operating Manual v3</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght,SOFT@9..144,300..900,0..100&family=Sora:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
<style>
  :root{
    /* Backgrounds */
    --bg:#080B1F;
    --bg-card:#121838;
    --bg-card-2:#1A2148;

    /* TEXT — high contrast for readability */
    --ink:#FFFFFF;            /* main body text — pure white */
    --ink-soft:#E4E8FF;       /* secondary body text */
    --ink-mute:#B8C0E8;       /* muted/secondary only */

    /* Accent / brand */
    --cyan:#3DDDFF;
    --teal:#5FF0E2;
    --purple:#C268F0;
    --gold:#F0C24A;
    --pink:#FF8FCF;
    --good:#7FF2B5;
    --warn:#FFC166;
    --bad:#FF8B8B;

    --line:rgba(184,192,232,.22);
    --line-strong:rgba(184,192,232,.4);

    --display:"Fraunces", ui-serif, Georgia, serif;
    --body:"Sora", ui-sans-serif, system-ui, sans-serif;
    --mono:"JetBrains Mono", ui-monospace, SFMono-Regular, Menlo, monospace;
  }

  *{box-sizing:border-box}
  html,body{
    margin:0;padding:0;background:var(--bg);color:var(--ink);
    font-family:var(--body);font-weight:400;
    font-size:17px;line-height:1.7;
    -webkit-font-smoothing:antialiased;
  }
  body{
    background:
      radial-gradient(1200px 700px at 85% -10%, rgba(194,104,240,.18), transparent 60%),
      radial-gradient(900px 600px at -10% 20%, rgba(61,221,255,.14), transparent 55%),
      radial-gradient(1100px 800px at 50% 120%, rgba(95,240,226,.10), transparent 60%),
      var(--bg);
    background-attachment: fixed;
  }
  .stars{
    position:fixed;inset:0;z-index:0;pointer-events:none;opacity:.22;
    background-image:
      radial-gradient(1px 1px at 12% 18%, #fff, transparent),
      radial-gradient(1px 1px at 28% 72%, #fff, transparent),
      radial-gradient(1.2px 1.2px at 64% 22%, #fff, transparent),
      radial-gradient(1px 1px at 82% 64%, #fff, transparent),
      radial-gradient(.8px .8px at 47% 47%, #fff, transparent),
      radial-gradient(1.4px 1.4px at 92% 12%, #fff, transparent),
      radial-gradient(1px 1px at 8% 88%, #fff, transparent);
  }
  .wrap{position:relative;z-index:1;max-width:1100px;margin:0 auto;padding:64px 36px 120px;}

  /* Color helpers — used SPARINGLY, accents only */
  .gold{color:var(--gold)} .teal{color:var(--teal)} .cyan{color:var(--cyan)}
  .purple{color:var(--purple)} .pink{color:var(--pink)} .good{color:var(--good)}
  .warn{color:var(--warn)} .bad{color:var(--bad)}
  .mute{color:var(--ink-mute)}
  strong, b{color:var(--ink);font-weight:600}

  .eyebrow{
    font-family:var(--mono);font-size:12px;letter-spacing:.22em;
    text-transform:uppercase;color:var(--cyan);font-weight:500;
  }

  /* Cover */
  .cover{
    border:1px solid var(--line-strong);border-radius:24px;padding:56px 48px;
    background:
      linear-gradient(135deg, rgba(61,221,255,.06), rgba(194,104,240,.06) 60%, rgba(240,194,74,.04)),
      var(--bg-card);
    position:relative;overflow:hidden;
  }
  .cover::after{
    content:"";position:absolute;inset:auto -20% -50% auto;width:520px;height:520px;
    background:radial-gradient(closest-side, rgba(240,194,74,.18), transparent 70%);filter:blur(20px);
  }
  .cover h1{
    font-family:var(--display);font-weight:400;
    font-size:clamp(44px,6vw,76px);line-height:1.04;letter-spacing:-.02em;
    margin:18px 0 16px;color:var(--ink);
  }
  .cover h1 em{font-style:italic;color:var(--gold);font-weight:300}
  .cover p.lede{font-size:19px;color:var(--ink-soft);max-width:780px;margin:0;line-height:1.6}
  .cover .meta{
    font-family:var(--mono);font-size:12px;color:var(--ink-mute);font-weight:500;
    display:flex;flex-wrap:wrap;gap:24px;margin-top:32px;
    border-top:1px dashed var(--line);padding-top:20px;
  }

  /* TOC */
  .toc{margin-top:32px;border:1px solid var(--line);border-radius:18px;padding:24px 28px;background:var(--bg-card);}
  .toc h4{font-family:var(--mono);font-size:12px;letter-spacing:.22em;text-transform:uppercase;color:var(--teal);margin:0 0 16px;font-weight:500;}
  .toc ol{margin:0;padding:0;list-style:none;display:grid;grid-template-columns:repeat(2,1fr);gap:8px 28px}
  .toc ol li{
    font-family:var(--mono);font-size:13px;color:var(--ink-soft);
    display:flex;gap:14px;border-bottom:1px dashed var(--line);padding:8px 0;
  }
  .toc ol li b{color:var(--gold);min-width:36px;font-weight:600}
  @media(max-width:760px){.toc ol{grid-template-columns:1fr}}

  /* Sections */
  section{margin-top:88px;scroll-margin-top:24px}
  .sec-head{display:flex;align-items:baseline;gap:20px;margin-bottom:20px;border-bottom:1px solid var(--line-strong);padding-bottom:16px}
  .sec-num{font-family:var(--mono);font-size:13px;color:var(--gold);letter-spacing:.2em;font-weight:600}
  .sec-title{
    font-family:var(--display);font-weight:400;
    font-size:clamp(30px,3.6vw,44px);letter-spacing:-.01em;margin:0;color:var(--ink);
  }
  .sec-title em{font-style:italic;color:var(--cyan);font-weight:300}
  .sec-sub{color:var(--ink-soft);max-width:840px;margin:0 0 28px;font-size:17px;line-height:1.65}

  /* Cards */
  .card{
    border:1px solid var(--line);border-radius:18px;padding:28px 30px;
    background:var(--bg-card);
  }
  .card + .card{margin-top:20px}
  .grid-2{display:grid;grid-template-columns:1fr 1fr;gap:20px}
  .grid-3{display:grid;grid-template-columns:repeat(3,1fr);gap:20px}
  @media (max-width:880px){.grid-2,.grid-3{grid-template-columns:1fr}}

  h3{font-family:var(--display);font-weight:500;font-size:24px;margin:0 0 12px;letter-spacing:-.005em;color:var(--ink)}
  h4{
    font-family:var(--mono);font-size:12px;letter-spacing:.22em;text-transform:uppercase;
    color:var(--teal);margin:0 0 14px;font-weight:600;
  }
  p{margin:0 0 12px;color:var(--ink-soft)}
  ul,ol{margin:0 0 12px 22px;padding:0;color:var(--ink-soft)}
  li{margin:6px 0;line-height:1.65}
  li::marker{color:var(--gold)}

  /* Glossary */
  .glossary{display:grid;grid-template-columns:1fr 1fr;gap:0 32px}
  @media(max-width:760px){.glossary{grid-template-columns:1fr}}
  .glossary dt{
    font-family:var(--display);font-weight:600;font-size:18px;
    color:var(--gold);margin-top:18px;
  }
  .glossary dd{margin:6px 0 0 0;color:var(--ink-soft);font-size:15px;line-height:1.6}

  /* Pillars */
  .pillar{
    border-radius:14px;padding:22px;border:1px solid var(--line);
    background:var(--bg-card);
  }
  .pillar.value{border-color:rgba(61,221,255,.4)}
  .pillar.share{border-color:rgba(255,143,207,.4)}
  .pillar.show{border-color:rgba(127,242,181,.4)}
  .pillar.action{border-color:rgba(240,194,74,.5)}
  .pillar .tag{
    font-family:var(--mono);font-size:11px;letter-spacing:.2em;
    text-transform:uppercase;font-weight:600;
  }
  .pillar.value .tag{color:var(--cyan)} .pillar.share .tag{color:var(--pink)}
  .pillar.show .tag{color:var(--good)} .pillar.action .tag{color:var(--gold)}
  .pillar h3{margin-top:8px}

  /* Ribbon */
  .ribbon{display:flex;flex-wrap:wrap;gap:10px;margin:0 0 28px}
  .ribbon .step{
    border:1px solid var(--line-strong);border-radius:999px;padding:10px 16px;
    font-family:var(--mono);font-size:11px;letter-spacing:.18em;
    color:var(--ink-soft);text-transform:uppercase;background:var(--bg-card);font-weight:500;
  }
  .ribbon .step b{color:var(--gold);font-weight:700;margin-right:8px}

  /* Tables */
  table{width:100%;border-collapse:collapse;font-size:15px;color:var(--ink-soft)}
  th,td{border-bottom:1px solid var(--line);padding:12px 14px;text-align:left;vertical-align:top}
  th{
    font-family:var(--mono);font-size:11px;letter-spacing:.18em;text-transform:uppercase;
    color:var(--teal);font-weight:600;
  }
  td b{color:var(--ink)}
  tr:hover td{background:rgba(255,255,255,.03)}

  /* Checklist */
  .check{list-style:none;margin:0;padding:0;color:var(--ink-soft)}
  .check li{display:flex;gap:14px;padding:10px 0;border-bottom:1px dashed var(--line);line-height:1.6}
  .check li:last-child{border-bottom:none}
  .check li::before{
    content:"";flex:0 0 20px;height:20px;margin-top:2px;
    border:1.5px solid var(--gold);border-radius:5px;display:block;
    background:rgba(240,194,74,.1);
  }

  /* Code block */
  .code{
    font-family:var(--mono);font-size:13.5px;line-height:1.65;color:#E4E8FF;
    background:#05081A;border:1px solid var(--line-strong);border-radius:14px;
    padding:20px 22px;white-space:pre-wrap;font-weight:400;
  }
  .code .key{color:var(--gold);font-weight:600}
  .code .var{color:var(--teal)}
  .code .com{color:#8C95C6;font-style:italic}

  /* Verbatim */
  .verbatim{
    border-left:3px solid var(--cyan);padding:16px 20px;background:rgba(61,221,255,.06);
    border-radius:0 12px 12px 0;font-size:15px;color:var(--ink-soft);
  }
  .verbatim small{
    display:block;font-family:var(--mono);font-size:11px;letter-spacing:.2em;
    color:var(--cyan);margin-bottom:8px;text-transform:uppercase;font-weight:600;
  }

  /* Callouts */
  .callout{border:1px solid rgba(240,194,74,.4);background:rgba(240,194,74,.08);border-radius:14px;padding:20px 22px}
  .callout h4{color:var(--gold)}
  .callout p, .callout li{color:var(--ink)}
  .callout.warn{border-color:rgba(255,193,102,.45);background:rgba(255,193,102,.08)}
  .callout.warn h4{color:var(--warn)}
  .callout.bad{border-color:rgba(255,139,139,.45);background:rgba(255,139,139,.08)}
  .callout.bad h4{color:var(--bad)}
  .callout.good{border-color:rgba(127,242,181,.45);background:rgba(127,242,181,.08)}
  .callout.good h4{color:var(--good)}

  /* Worked example */
  .example{
    border:1px dashed rgba(61,221,255,.45);border-radius:14px;
    padding:20px 22px;background:rgba(61,221,255,.05);margin-top:16px;
  }
  .example h4{color:var(--cyan)}

  /* Day pills */
  .days{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:20px}
  .days .day{
    border:1px solid var(--line-strong);border-radius:10px;padding:8px 14px;
    font-family:var(--mono);font-size:11px;letter-spacing:.18em;text-transform:uppercase;
    color:var(--gold);font-weight:600;background:var(--bg-card);
  }

  /* === PROFICIENCY CHECKS === */
  .quiz{
    border:2px solid rgba(194,104,240,.5);border-radius:16px;padding:24px 26px;
    background:linear-gradient(160deg, rgba(194,104,240,.08), rgba(61,221,255,.04));
    margin-top:18px;
  }
  .quiz h4{color:var(--purple);margin-bottom:12px}
  .quiz .qlabel{
    display:inline-block;font-family:var(--mono);font-size:10px;letter-spacing:.22em;
    background:var(--purple);color:#fff;padding:4px 10px;border-radius:6px;
    text-transform:uppercase;font-weight:700;margin-bottom:8px;
  }
  .quiz ol{margin:8px 0 0 22px;color:var(--ink)}
  .quiz ol li{margin:10px 0;font-size:15.5px;line-height:1.6}
  .quiz .answer{
    margin-top:14px;padding:12px 16px;border-left:3px solid var(--good);
    background:rgba(127,242,181,.06);border-radius:0 10px 10px 0;
    font-size:14px;color:var(--ink-soft);
  }
  .quiz .answer b{color:var(--good)}

  .gate{
    border:2px solid var(--gold);border-radius:14px;padding:18px 22px;
    background:rgba(240,194,74,.1);margin-top:16px;
    display:flex;gap:16px;align-items:flex-start;
  }
  .gate .gate-icon{
    flex:0 0 44px;height:44px;border-radius:50%;background:var(--gold);
    color:#1A1300;display:flex;align-items:center;justify-content:center;
    font-family:var(--display);font-weight:700;font-size:22px;
  }
  .gate h4{color:var(--gold);margin-bottom:6px}
  .gate p{color:var(--ink);margin:0}

  hr.div{border:none;height:1px;background:linear-gradient(90deg,transparent,var(--line-strong),transparent);margin:40px 0}

  footer{
    margin-top:88px;border-top:1px solid var(--line-strong);padding-top:24px;
    color:var(--ink-mute);font-family:var(--mono);font-size:11px;letter-spacing:.16em;
    text-transform:uppercase;display:flex;justify-content:space-between;flex-wrap:wrap;gap:10px;font-weight:500;
  }

  @media print{
    body{background:#fff;color:#000;font-size:13px}
    .stars{display:none}
    .cover, .card, .pillar, .verbatim, .callout, .code, .example, .toc, .quiz, .gate{
      background:#fff !important;color:#000 !important;border-color:#222 !important;
    }
    .mute,.cyan,.teal,.gold,.purple,.pink,.good,.warn,.bad{color:#000 !important}
    .check li::before{border-color:#000;background:#fff}
    .wrap{padding:24px}
    section{break-inside:avoid}
    .quiz, .gate{page-break-inside:avoid}
  }
</style>
</head>
<body>
<div class="stars"></div>
<div class="wrap">

  <!-- COVER -->
  <header class="cover">
    <div class="eyebrow">Ascend Prime Wealth · New Hire Operating Manual · v3.0</div>
    <h1>Reels Master <em>SOP</em><br>+ Proficiency System</h1>
    <p class="lede">A complete operating manual for a brand-new generalist with zero background in marketing, video, or business funding. Read this once. Verify your learning at every gate. Reference it forever.</p>
    <div class="meta">
      <span>OWNER · ALAN NGUYEN</span>
      <span>BRAND · APW</span>
      <span>TOOLS · CHATGPT / CLAUDE + GOOGLE DOCS</span>
      <span>YOUR ROLE · GENERALIST</span>
    </div>

    <div class="toc">
      <h4>Table of Contents</h4>
      <ol>
        <li><b>00</b><span>Read Me First</span></li>
        <li><b>01</b><span>Glossary — Every Term Defined</span></li>
        <li><b>02</b><span>APW Context — What We Sell, Who We Serve</span></li>
        <li><b>03</b><span>The Goal — 4 Outcomes, 2 Destinations</span></li>
        <li><b>04</b><span>The Four Pillars</span></li>
        <li><b>05</b><span>Master Workflow — 8 Phases</span></li>
        <li><b>P1</b><span>Concept (worked example)</span></li>
        <li><b>P2</b><span>Framework</span></li>
        <li><b>P3</b><span>Hooks — AI prompt + curation</span></li>
        <li><b>P4</b><span>Body Script — PAS + retention</span></li>
        <li><b>P5</b><span>Caption</span></li>
        <li><b>P6</b><span>Recording Notes for Alan</span></li>
        <li><b>P7</b><span>Pipeline &amp; File Management</span></li>
        <li><b>P8</b><span>Publish &amp; Repurpose</span></li>
        <li><b>10</b><span>How to Talk to Alan</span></li>
        <li><b>11</b><span>Compliance — Words to Never Use</span></li>
        <li><b>12</b><span>Common Mistakes &amp; Fixes</span></li>
        <li><b>13</b><span>Day 1 → Week 1 Onboarding Path</span></li>
        <li><b>14</b><span>Self-Check Before Sending</span></li>
        <li><b>15</b><span>★ Proficiency Verification System</span></li>
        <li><b>★</b><span>Master Per-Reel Checklist</span></li>
      </ol>
    </div>
  </header>

  <!-- 00 READ ME FIRST -->
  <section>
    <div class="sec-head"><div class="sec-num">00</div><h2 class="sec-title">Read Me <em>First</em></h2></div>
    <p class="sec-sub">Welcome. You were hired because Alan trusts you to figure things out. This manual is designed so you never have to guess. After every major section, there is a <b class="purple">Proficiency Check</b> you must pass before moving on.</p>

    <div class="grid-2">
      <div class="card">
        <h4>How to use this manual</h4>
        <ol>
          <li>Read sections 00 → 04 today.</li>
          <li>Pass each Proficiency Check before advancing.</li>
          <li>Read P1 → P8 tomorrow with checks.</li>
          <li>Read 10 → 14 in your first week.</li>
          <li>Bookmark the Master Checklist.</li>
          <li>Re-read Compliance (Section 11) every Monday.</li>
        </ol>
      </div>
      <div class="card">
        <h4>The 3 rules that override everything</h4>
        <ol>
          <li><b class="gold">Verify before you state.</b> Never invent a number, stat, or claim. If unsure, say "verifying."</li>
          <li><b class="gold">Always present options + a recommendation.</b> Alan picks; you execute. Never make creative decisions alone after Phase 1.</li>
          <li><b class="gold">Lead with the answer.</b> First sentence = the answer. Context after.</li>
        </ol>
      </div>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Section 00</span>
      <h4>Before moving on, answer out loud:</h4>
      <ol>
        <li>What are the 3 rules that override everything?</li>
        <li>What do you do if you are not sure about a fact?</li>
        <li>Who picks the creative direction after Phase 1 — you or Alan?</li>
      </ol>
      <div class="answer">
        <b>Pass criteria:</b> You can answer all three from memory without re-reading. If you can't, read this section again.
      </div>
    </div>
  </section>

  <!-- 01 GLOSSARY -->
  <section>
    <div class="sec-head"><div class="sec-num">01</div><h2 class="sec-title"><em>Glossary</em> — every term defined</h2></div>
    <p class="sec-sub">Read this section straight through once. If a word in this manual confuses you later, it lives here.</p>

    <div class="card">
      <dl class="glossary">
        <dt>Reel</dt>
        <dd>A short vertical video on Instagram, 15–90 seconds. Format: 9:16 (tall, like a phone screen). The most important content format on the platform right now.</dd>

        <dt>Hook</dt>
        <dd>The first 1–2 seconds of a Reel. Its only job is to stop someone from scrolling. If the hook fails, nothing else matters.</dd>

        <dt>Body / Script</dt>
        <dd>Everything between the hook and the CTA. The teaching, story, or proof that earns the viewer's trust.</dd>

        <dt>CTA (Call to Action)</dt>
        <dd>The single instruction at the end. "Comment FUND." "Watch the free training." One ask. One next step.</dd>

        <dt>Caption</dt>
        <dd>The written text under the Reel on Instagram. Has its own structure: Hook → Value → CTA.</dd>

        <dt>Avatar</dt>
        <dd>The exact person we are talking to. For APW: a medical practice owner doing $25K–$100K/month, OR a service-business operator looking for funding. Not a beginner. Not a credit-repair lead.</dd>

        <dt>Pillar</dt>
        <dd>One of four content categories: Value, Share, Show, Action. Every Reel is exactly one pillar.</dd>

        <dt>VSL (Video Sales Letter)</dt>
        <dd>A long-form video on a landing page that sells the APW program. The primary destination we send Reel viewers to.</dd>

        <dt>Lead Magnet / Free Resource</dt>
        <dd>A free PDF, checklist, or training we give away in exchange for a DM keyword. The secondary destination.</dd>

        <dt>DM Keyword</dt>
        <dd>A short word (e.g., "FUND," "CHECKLIST") viewers comment or DM. An automation then sends them the lead magnet. Triples engagement vs. a plain link.</dd>

        <dt>PAS</dt>
        <dd>Problem · Agitate · Solution. A copywriting structure. State the problem → make it sting → reveal the fix. We loop it twice in most scripts.</dd>

        <dt>Pattern Interrupt</dt>
        <dd>A surprise that breaks the viewer's autopilot. A contrarian statement, a shocking number, a sudden cut.</dd>

        <dt>Retention</dt>
        <dd>The percentage of viewers who stay watching. Instagram boosts videos with high retention. Our rule: something must change every 2 seconds.</dd>

        <dt>Headline</dt>
        <dd>A sentence written so it could stand alone on a billboard. Punchy, clear, lead with the point. Opposite of "let me tell you a story about…"</dd>

        <dt>B-roll</dt>
        <dd>Supporting footage cut into the main video — screen recordings, lifestyle clips. Hides edits and adds visual variety.</dd>

        <dt>Underwriting</dt>
        <dd>A bank's process for deciding whether to approve a loan or credit line. Knowing what banks score on is APW's core IP.</dd>

        <dt>Unsecured Funding</dt>
        <dd>Credit or loans that do not require collateral (no house, no car at risk). What APW helps clients get.</dd>

        <dt>Personal Guarantee (PG)</dt>
        <dd>A promise that you personally will repay a business loan if the business can't. Most operators don't realize how much PG exposure they carry.</dd>

        <dt>Pipeline</dt>
        <dd>The status board where every Reel moves from idea to posted.</dd>

        <dt>Cycle</dt>
        <dd>One batch of content. Right now: 9 Reels per cycle.</dd>
      </dl>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Section 01</span>
      <h4>Match these terms to their meanings without looking:</h4>
      <ol>
        <li><b>Hook</b> — what is its only job?</li>
        <li><b>PAS</b> — what do the three letters stand for?</li>
        <li><b>Avatar</b> — name two people who are NOT our avatar.</li>
        <li><b>VSL vs. Lead Magnet</b> — which one is the primary destination?</li>
        <li><b>Retention</b> — how often must something change in our scripts?</li>
        <li><b>Unsecured Funding</b> — what does "unsecured" mean?</li>
      </ol>
      <div class="answer">
        <b>Pass criteria:</b> 6/6 correct. Below 6, re-read the glossary. These terms appear in every conversation with Alan.
      </div>
    </div>
  </section>

  <!-- 02 APW CONTEXT -->
  <section>
    <div class="sec-head"><div class="sec-num">02</div><h2 class="sec-title">APW <em>Context</em> — what we sell, who we serve</h2></div>
    <p class="sec-sub">You cannot write good content if you don't understand the business. Read this twice if anything is fuzzy.</p>

    <div class="grid-2">
      <div class="card">
        <h4>What APW does (in plain English)</h4>
        <p>Ascend Prime Wealth teaches business owners how to access $100,000 to $500,000+ in <b>unsecured business funding</b> — meaning loans and credit lines that don't require putting their house or car at risk.</p>
        <p>Most banks make this confusing on purpose. APW reverse-engineered the underwriting rules and turned them into a step-by-step process.</p>
        <p>We sell <b>education and coaching</b>. Clients do the applications themselves. We are not a lender. We are not a broker. We are the playbook.</p>
      </div>
      <div class="card">
        <h4>Who we sell to (the avatar)</h4>
        <p><b class="cyan">Primary:</b> Owner of a medical practice or clinic doing $25K–$100K/month. They want capital to expand, hire, buy equipment, or open another location.</p>
        <p><b class="teal">Secondary:</b> Service-business operator (agency, contractor, coach, consultant) looking for growth capital without giving up equity.</p>
        <p><b class="bad">Not for:</b> People with no business yet. People who need credit repair. People looking for free money. People wanting personal loans.</p>
      </div>
    </div>

    <div class="grid-2" style="margin-top:20px">
      <div class="card">
        <h4>The two offers</h4>
        <table>
          <thead><tr><th>Offer</th><th>What it is</th><th>Speed</th></tr></thead>
          <tbody>
            <tr><td><b>Blitz Path</b></td><td>$50K–$200K+ in unsecured funding fast</td><td>30–60 days</td></tr>
            <tr><td><b>Prime Protocol</b></td><td>$300K–$500K+ via a longer optimization path</td><td>3–10 months</td></tr>
          </tbody>
        </table>
        <p class="mute" style="margin-top:10px">You don't need to sell these. Just know they exist so your content lines up.</p>
      </div>
      <div class="card">
        <h4>The brand tone</h4>
        <ul>
          <li><b class="gold">Direct</b> — say the thing.</li>
          <li><b class="gold">Warm</b> — never cold or corporate.</li>
          <li><b class="gold">Grounded</b> — no hype, no guarantees.</li>
          <li><b class="gold">Spiritually aligned</b> — abundance, not scarcity.</li>
          <li><b class="gold">Execution-first</b> — every Reel ends with something the viewer can do.</li>
        </ul>
      </div>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Section 02</span>
      <h4>Test your understanding:</h4>
      <ol>
        <li>In one sentence — what does APW actually sell? (Hint: it's not loans.)</li>
        <li>Name three types of people who are NOT our avatar.</li>
        <li>Which offer takes 3–10 months and targets $300K–$500K+?</li>
        <li>What's the difference between APW and a lender or broker?</li>
        <li>Pick one brand tone trait and explain how you'd apply it in a caption.</li>
      </ol>
      <div class="answer">
        <b>Pass criteria:</b> All five answered confidently in your own words. If you guessed any, re-read the section. This context is the foundation under every Reel.
      </div>
    </div>
  </section>

  <!-- 03 GOAL -->
  <section>
    <div class="sec-head"><div class="sec-num">03</div><h2 class="sec-title">The <em>Goal</em></h2></div>
    <p class="sec-sub">Every Reel exists to do four things. If a Reel does not do all four, it does not get posted.</p>

    <div class="grid-2">
      <div class="card">
        <h3>The 4 outcomes (memorize)</h3>
        <ol>
          <li><b class="cyan">Trust</b> — the viewer believes us.</li>
          <li><b class="pink">Likability</b> — the viewer enjoys watching us.</li>
          <li><b class="gold">Authority</b> — the viewer thinks "this person knows what they're talking about."</li>
          <li><b class="good">Conversion</b> — the viewer takes the next step.</li>
        </ol>
      </div>
      <div class="card">
        <h3>The 2 destinations</h3>
        <p><b class="gold">Primary:</b> APW VSL.</p>
        <p><b class="gold">Secondary:</b> A free resource delivered via DM keyword.</p>
        <p>Every Reel ends with one of these. Never both. Never zero.</p>
      </div>
    </div>
  </section>

  <!-- 04 PILLARS -->
  <section>
    <div class="sec-head"><div class="sec-num">04</div><h2 class="sec-title">The Four <em>Pillars</em></h2></div>
    <p class="sec-sub">Every Reel is exactly one pillar. The pillar determines the structure. Across each cycle of 9, we use the 5/2/1/1 mix below.</p>

    <div class="grid-2">
      <div class="pillar value">
        <span class="tag">Value · 5 of 9</span>
        <h3>Authority &amp; Education</h3>
        <p>You teach something the avatar doesn't know. Topics: objections, common questions, misconceptions, biggest challenges.</p>
        <p class="mute"><b>Example:</b> "The 3 data points every bank pulls before saying yes."</p>
      </div>
      <div class="pillar share">
        <span class="tag">Share · 2 of 9</span>
        <h3>Likability &amp; Story</h3>
        <p>Alan tells a personal story that teaches a lesson. Builds the human bond.</p>
        <p class="mute"><b>Example:</b> "I got denied for $15K. Then approved for $300K 90 days later."</p>
      </div>
      <div class="pillar show">
        <span class="tag">Show · 1 of 9</span>
        <h3>Proof &amp; Results</h3>
        <p>A client win. Screenshots, testimonials, before/after numbers.</p>
        <p class="mute"><b>Example:</b> "Client just closed $180K in 38 days."</p>
      </div>
      <div class="pillar action">
        <span class="tag">Action · 1 of 9</span>
        <h3>Conversion &amp; Invite</h3>
        <p>Direct invitation to take the next step. Heavier CTA. The bottom-funnel play.</p>
        <p class="mute"><b>Example:</b> "Stop personally guaranteeing everything. Do this instead."</p>
      </div>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Sections 03 + 04</span>
      <h4>Classify these (no peeking):</h4>
      <ol>
        <li>"3 mistakes that kill funding applications" — which pillar?</li>
        <li>"How my client got $250K in 45 days" — which pillar?</li>
        <li>"Watch my free training to learn the full system" — which pillar?</li>
        <li>"When I lost $40K to a bad funding partner" — which pillar?</li>
        <li>What's the 9-Reel pillar mix (the ratio)?</li>
        <li>Name the 4 outcomes every Reel must hit.</li>
      </ol>
      <div class="answer">
        <b>Answers:</b> 1=Value, 2=Show, 3=Action, 4=Share. Mix = 5/2/1/1. Outcomes = Trust, Likability, Authority, Conversion. <br><b>Pass:</b> 6/6.
      </div>
    </div>

    <div class="gate">
      <div class="gate-icon">★</div>
      <div>
        <h4>Foundation Gate — must pass before continuing</h4>
        <p>If you scored less than 6/6 on the last check, do NOT advance to Phase 1. Re-read Sections 00–04. Every workflow phase that follows assumes you can name the pillars and recite the goal in your sleep.</p>
      </div>
    </div>
  </section>

  <!-- 05 WORKFLOW -->
  <section>
    <div class="sec-head"><div class="sec-num">05</div><h2 class="sec-title">Master <em>Workflow</em> — the 8 phases</h2></div>
    <p class="sec-sub">Every Reel moves through these in order. Finish a phase, get Alan's approval, start the next phase. <b class="gold">Never skip a gate.</b></p>

    <div class="ribbon">
      <span class="step"><b>P1</b> Concept</span>
      <span class="step"><b>P2</b> Framework</span>
      <span class="step"><b>P3</b> Hook</span>
      <span class="step"><b>P4</b> Body Script</span>
      <span class="step"><b>P5</b> Caption</span>
      <span class="step"><b>P6</b> Recording</span>
      <span class="step"><b>P7</b> Edit &amp; Pipeline</span>
      <span class="step"><b>P8</b> Publish &amp; Repurpose</span>
    </div>

    <div class="callout">
      <h4>The gate rule</h4>
      <p>You cannot start Phase X+1 until Alan has approved Phase X. This protects everyone's time. If a hook is weak, fixing it costs 5 minutes. Fixing a finished video costs hours.</p>
    </div>
  </section>

  <!-- P1 CONCEPT -->
  <section>
    <div class="sec-head"><div class="sec-num">P1</div><h2 class="sec-title">Phase 1 — <em>Concept</em></h2></div>
    <p class="sec-sub">A "concept" is the one-sentence idea for a Reel. Generate 12–15 candidates, distill to the final set. Each must pass 5 tests.</p>

    <div class="card">
      <h4>The 5 concept tests — every concept must pass all 5</h4>
      <ol>
        <li><b>Avatar fit</b> — Speaks to a medical operator or qualified entrepreneur. If it speaks to a beginner, cut it.</li>
        <li><b>Pillar clarity</b> — Can you label it Value, Share, Show, or Action without hesitation?</li>
        <li><b>Pattern interrupt</b> — Is there something contrarian, surprising, or unspoken inside?</li>
        <li><b>Mechanism reveal</b> — Does it teach or show something tactical?</li>
        <li><b>CTA pathway</b> — Is there an obvious bridge to the VSL or a free resource?</li>
      </ol>
    </div>

    <div class="example">
      <h4>The exact AI prompt for concept generation</h4>
      <div class="code"><span class="com"># Role</span>
You are a content strategist for Ascend Prime Wealth (APW),
a business funding education company.

<span class="com"># Audience</span>
Medical practice owners ($25K–$100K/month) AND service business operators
who want $100K–$500K+ in unsecured business funding without giving up
equity or income docs.

<span class="com"># Task</span>
Generate <span class="key">15 Instagram Reel concepts</span> for the Value pillar.

Each concept must:
- Speak directly to the avatar above
- Contain a contrarian, surprising, or unspoken truth
- Teach a tactical mechanism (not motivation)
- Have an obvious bridge to a VSL or free resource

<span class="com"># Output</span>
For each concept, give:
1. Concept title (≤ 8 words)
2. One-sentence angle
3. Sub-pillar (objection / question / misconception / challenge)
4. Suggested CTA (VSL or free resource)

Number them 1–15.</div>
    </div>

    <div class="callout good" style="margin-top:16px">
      <h4>What a great concept looks like</h4>
      <p><b>Title:</b> "The $250K Lie Banks Tell You"<br>
      <b>Angle:</b> Banks pretend you need 2 years of tax returns and strong revenue, but the real underwriting logic is different.<br>
      <b>Sub-pillar:</b> Misconception · <b>CTA:</b> VSL</p>
    </div>

    <div class="callout bad" style="margin-top:14px">
      <h4>What a bad concept looks like (and why)</h4>
      <p><b>Title:</b> "How to Build Business Credit"<br>
      <b>Why it fails:</b> No pattern interrupt. Generic. Could appear on any finance account. No avatar callout. No surprise.</p>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Phase 1</span>
      <h4>Try it yourself:</h4>
      <ol>
        <li>Take the concept "Why most CPAs sabotage your funding" — score it against all 5 concept tests. Pass or fail?</li>
        <li>Take the concept "Top 10 productivity tips" — does it pass? Why not?</li>
        <li>Write one of your own. Run all 5 tests against it. Pass it to Alan only if all 5 pass.</li>
      </ol>
      <div class="answer">
        <b>Pass:</b> #1 passes (avatar fit, clear pillar, pattern interrupt, mechanism, VSL bridge). #2 fails (no avatar fit, no pattern interrupt, no mechanism). For #3, you should be able to defend each test out loud.
      </div>
    </div>
  </section>

  <!-- P2 FRAMEWORK -->
  <section>
    <div class="sec-head"><div class="sec-num">P2</div><h2 class="sec-title">Phase 2 — <em>Framework</em></h2></div>
    <p class="sec-sub">A framework is the skeleton of the script. Pick one after the concept is approved.</p>

    <div class="card">
      <table>
        <thead><tr><th>Framework</th><th>Use when…</th><th>Example concept</th></tr></thead>
        <tbody>
          <tr><td><b>PAS Loop</b></td><td>Most Value Reels. Default choice.</td><td>"$250K Lie Banks Tell You"</td></tr>
          <tr><td><b>What / Why / How / Now</b></td><td>Pure teaching. Free-resource CTA.</td><td>"3 Data Points Every Bank Pulls"</td></tr>
          <tr><td><b>Before / After / Bridge</b></td><td>Showing transformation or results.</td><td>"Client Closed $180K in 38 Days"</td></tr>
          <tr><td><b>Hero's Mistake</b></td><td>Personal story / origin story.</td><td>"Denied $15K → Approved $300K"</td></tr>
          <tr><td><b>Contrarian Reveal</b></td><td>Hot take. Industry exposé.</td><td>"DFY Funders Charge $25K"</td></tr>
          <tr><td><b>Diagnostic Checklist</b></td><td>Save-bait. Self-test.</td><td>"Are You Fundable Right Now?"</td></tr>
          <tr><td><b>If-I-Had-To Playbook</b></td><td>Hypothetical reset.</td><td>"What I'd Do for $100K in 30 Days"</td></tr>
        </tbody>
      </table>
    </div>

    <div class="callout">
      <h4>How to choose</h4>
      <p>Read the concept. Ask: "Is this teaching, story, proof, or invitation?" Match it to the framework that fits. If you're stuck, default to <b>PAS Loop</b> — it works for almost everything.</p>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Phase 2</span>
      <h4>Match the right framework:</h4>
      <ol>
        <li>"5 things I wish I knew before applying for my first business loan" → ?</li>
        <li>"Score yourself: are you ready for $100K in funding?" → ?</li>
        <li>"How my client went from $0 funding to $200K in 60 days" → ?</li>
        <li>"The lie everyone believes about credit utilization" → ?</li>
      </ol>
      <div class="answer">
        <b>Answers:</b> 1=Hero's Mistake, 2=Diagnostic Checklist, 3=Before/After/Bridge, 4=Contrarian Reveal. <b>Pass:</b> 4/4.
      </div>
    </div>
  </section>

  <!-- P3 HOOKS -->
  <section>
    <div class="sec-head"><div class="sec-num">P3</div><h2 class="sec-title">Phase 3 — <em>Hooks</em></h2></div>
    <p class="sec-sub">The hook is the first 1–2 seconds — the entire game. Generate ~40 per Reel via AI, score every one, surface the top 10–20 for Alan.</p>

    <div class="card">
      <h4>Hook rules — non-negotiable</h4>
      <ol>
        <li><b>≤ 12 words.</b> Reads in 2 seconds or less.</li>
        <li><b>One of four formats:</b> bold question, controversial statement, surprising fact, biggest-mistake callout.</li>
        <li><b>Specific.</b> Real numbers and named pains beat abstractions.</li>
        <li><b>No fluff:</b> just, really, kind of, maybe, basically.</li>
        <li><b>Conversational.</b> Sounds like a person, not a brand.</li>
      </ol>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Hook scoring rubric — 6 axes /10</h4>
      <table>
        <thead><tr><th>Axis</th><th>What 10/10 looks like</th></tr></thead>
        <tbody>
          <tr><td>Attention</td><td>Stops the thumb in &lt; 1 second.</td></tr>
          <tr><td>Specificity</td><td>Concrete numbers, names, callouts.</td></tr>
          <tr><td>Avatar Fit</td><td>The right person feels addressed.</td></tr>
          <tr><td>Curiosity</td><td>Creates an open loop the brain must close.</td></tr>
          <tr><td>Clarity</td><td>Understood instantly, even with sound off.</td></tr>
          <tr><td>Brevity</td><td>≤ 12 words. Punchy rhythm.</td></tr>
        </tbody>
      </table>
      <p class="mute" style="margin-top:10px">Minimum to surface to Alan: <b class="gold">8.0 average</b>, no single axis below 7.</p>
    </div>

    <div class="example">
      <h4>The exact AI prompt for hook generation</h4>
      <div class="code"><span class="com"># Role</span>
You are a direct-response copywriter for Ascend Prime Wealth.
The audience is medical practice owners and service operators
who want $100K–$500K+ in unsecured business funding (no income docs).

<span class="com"># Task</span>
Generate <span class="key">40 short-form video hooks</span> for the concept below.

<span class="com"># Concept</span>
<span class="var">[paste concept title + one-sentence angle here]</span>

<span class="com"># Hard rules</span>
- Each hook ≤ 12 words.
- Reads aloud in ≤ 2 seconds.
- One of four formats: bold question, controversial statement,
  surprising fact, biggest-mistake callout.
- Specific. Numbers and named pains beat abstractions.
- No filler: no "just", "really", "kind of", "maybe", "basically".
- Conversational. Human voice, not brand voice.

<span class="com"># Output</span>
Return a numbered list of 40 hooks. After each, append a 6-axis score:
[Attention/Specificity/Avatar/Curiosity/Clarity/Brevity = X/10 each, AVG=X.X]
Then list the top 15 by average, keeping only hooks with AVG ≥ 8 and
no single axis below 7.</div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Your manual curation pass</h4>
      <ul class="check">
        <li>Read every shortlisted hook out loud. If you stumble, cut it.</li>
        <li>Cut near-duplicates. Keep the strongest of each pair.</li>
        <li>Verify any factual claim. If a number sounds invented, ask Alan or cut it.</li>
        <li>Check compliance (Section 11). No guarantees, no income promises.</li>
        <li>Build a clean table: # · Hook · Format · Score · Your Note.</li>
        <li>Mark your top 3 with a star + one sentence why.</li>
      </ul>
    </div>

    <div class="example">
      <h4>How to send hooks to Alan (exact format)</h4>
      <div class="code"><span class="key">REEL #1 — "The $250K Lie Banks Tell You"</span>
<span class="var">Pillar:</span> Value · Misconception
<span class="var">Framework:</span> Contrarian Reveal → PAS Loop

<span class="com"># Top 3 picks (my recommendation)</span>
★ 1. "Banks lied to you about $250K." — 9.2 avg
★ 2. "You don't need 2 years of tax returns." — 9.0 avg
★ 3. "Your CPA is killing your funding." — 8.8 avg

<span class="com"># Full top 15</span>
1.  Banks lied to you about $250K.            [10/9/9/9/9/9 = 9.2]
...

<span class="com"># Pick a number. I'll write the body script around it.</span></div>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Phase 3</span>
      <h4>Score these hooks honestly. Pass or fail?</h4>
      <ol>
        <li>"Most business owners are basically just kind of stuck because they don't really know what to do about funding." — Pass or fail? Why?</li>
        <li>"Banks reject 73% of medical practice loans. Here's why." — Score it on all 6 axes.</li>
        <li>"Three things every doctor needs to fund their next clinic." — Pass or fail? Why?</li>
        <li>What's the minimum average score for a hook to be sent to Alan?</li>
      </ol>
      <div class="answer">
        <b>Answers:</b> #1 = FAIL (over 12 words, fluff words "basically/just/kind of/really"). #2 = strong, likely 8.5–9.0 (specific number, avatar fit, curiosity). #3 = borderline (no pattern interrupt, generic). #4 = 8.0 average, no axis below 7.
      </div>
    </div>
  </section>

  <!-- P4 BODY -->
  <section>
    <div class="sec-head"><div class="sec-num">P4</div><h2 class="sec-title">Phase 4 — <em>Body Script</em></h2></div>
    <p class="sec-sub">After Alan picks the hook, build the body. Default: PAS in a loop, retention beat every 2 seconds, headlines over sentences, one CTA.</p>

    <div class="grid-2">
      <div class="card">
        <h4>The 60-second script architecture</h4>
        <table>
          <thead><tr><th>Time</th><th>Beat</th></tr></thead>
          <tbody>
            <tr><td>0:00–0:02</td><td>HOOK — approved, word-for-word</td></tr>
            <tr><td>0:02–0:05</td><td>PROBLEM — name the pain</td></tr>
            <tr><td>0:05–0:10</td><td>AGITATE — the cost of doing nothing</td></tr>
            <tr><td>0:10–0:25</td><td>SOLUTION 1 — mechanism in 2–4 beats</td></tr>
            <tr><td>0:25–0:40</td><td>PAS LOOP 2 — deeper objection → solution</td></tr>
            <tr><td>0:40–0:50</td><td>STACK VALUE — concrete proof point</td></tr>
            <tr><td>0:50–0:60</td><td>CTA — one ask, one keyword, one destination</td></tr>
          </tbody>
        </table>
      </div>
      <div class="card">
        <h4>Retention rules — every 2 seconds</h4>
        <ul class="check">
          <li><b>Visual change:</b> cut, zoom, B-roll, text pop.</li>
          <li><b>Verbal change:</b> new headline, new beat.</li>
          <li><b>Pace change:</b> mix short/long lines.</li>
          <li><b>Pattern interrupt every 7–10s:</b> contrarian flip, callout.</li>
          <li><b>Speak in headlines.</b> No "let me explain."</li>
          <li><b>Read aloud.</b> If you stumble, the viewer scrolls.</li>
        </ul>
      </div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Body script scoring rubric — must average <span class="gold">9+/10</span> before recording</h4>
      <table>
        <thead><tr><th>Variable</th><th>What 10/10 looks like</th></tr></thead>
        <tbody>
          <tr><td>Hook strength</td><td>Stops scroll &lt; 1s.</td></tr>
          <tr><td>Retention</td><td>Visual or verbal change every 2s.</td></tr>
          <tr><td>PAS execution</td><td>Two full loops; second deeper than first.</td></tr>
          <tr><td>Headline density</td><td>Every line could be a billboard.</td></tr>
          <tr><td>Specificity</td><td>Real numbers, names, timelines.</td></tr>
          <tr><td>Avatar resonance</td><td>Avatar nods 3+ times in 60s.</td></tr>
          <tr><td>Mechanism clarity</td><td>Viewer can repeat the core idea.</td></tr>
          <tr><td>Authority</td><td>One concrete proof element baked in.</td></tr>
          <tr><td>Likability</td><td>One human moment — laugh, vulnerability, warmth.</td></tr>
          <tr><td>CTA strength</td><td>One ask. One keyword. One destination.</td></tr>
        </tbody>
      </table>
    </div>

    <div class="example">
      <h4>Exact format you send the script to Alan</h4>
      <div class="code"><span class="key">REEL #1 — "The $250K Lie Banks Tell You"</span>
<span class="var">Pillar:</span>      Value · Misconception
<span class="var">Framework:</span>   Contrarian Reveal → PAS Loop
<span class="var">Hook:</span>        "Banks lied to you about $250K."
<span class="var">CTA:</span>         VSL — "Watch the free training, link in bio."

<span class="com">--- SCRIPT ---</span>
[0:00] HOOK         "Banks lied to you about $250K."
[0:03] PROBLEM      "They told you you need 2 years of tax returns."
[0:06] AGITATE      "So you stopped applying. You stayed stuck."
[0:10] SOLUTION 1   "Real underwriting runs on 3 things, not income."
[0:18] HEADLINE     "Personal credit profile. Bank intelligence. Timing."
[0:25] LOOP 2 — P   "But your CPA told you to wait."
[0:30] LOOP 2 — A   "Every month you wait, your stack ages backward."
[0:35] LOOP 2 — S   "Build the profile first. Apply in waves."
[0:42] PROOF        "One client closed $180K in 38 days using this."
[0:50] CTA          "Watch the free training. Link in bio."

<span class="com">--- VISUAL CUES ---</span>
[0:00] face-on, direct camera, hard cut
[0:03] text overlay: "2 YEARS OF TAX RETURNS = LIE"
[0:06] B-roll: empty bank lobby
[0:18] 3 text bullets pop one at a time
[0:42] screenshot of approval
[0:50] cut back to face, point at camera

<span class="com">--- SCORE ---</span>
Hook 10 · Retention 10 · PAS 10 · Headlines 10 · Specificity 10
Avatar 10 · Mechanism 10 · Authority 10 · Likability 9 · CTA 10
AVERAGE: 9.9 / 10</div>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Phase 4</span>
      <h4>Diagnose this script:</h4>
      <ol>
        <li>A script has the same camera angle for 9 seconds straight. Which rubric axis is failing?</li>
        <li>A script's CTA says "Comment FUND, click my bio link, and DM me." What rule is broken?</li>
        <li>A script teaches the mechanism but never gives a number, name, or timeline. Which two axes are weak?</li>
        <li>What is the minimum average score before a script can be recorded?</li>
      </ol>
      <div class="answer">
        <b>Answers:</b> #1 = Retention (no visual change for 9s). #2 = "One ask, one keyword, one destination" — three CTAs is wrong. #3 = Specificity + Authority. #4 = 9.0 average.
      </div>
    </div>
  </section>

  <!-- P5 CAPTION -->
  <section>
    <div class="sec-head"><div class="sec-num">P5</div><h2 class="sec-title">Phase 5 — <em>Caption</em></h2></div>
    <p class="sec-sub">Caption follows Hook → Value → CTA. Sentences ≤ 1–2 lines. Emojis sparingly. Read aloud before sending.</p>

    <div class="grid-2">
      <div class="card">
        <h4>Caption template</h4>
        <div class="code"><span class="key">[HOOK LINE]</span>
Bold question / contrarian / surprising fact / biggest mistake.

<span class="key">[VALUE — 2–4 lines]</span>
1-line problem framing.
Then a tight bullet list:
✅ Point 1
✅ Point 2
✅ Point 3

<span class="key">[CTA — 1–2 lines]</span>
Comment "<span class="var">KEYWORD</span>" and I'll send it over.</div>
      </div>
      <div class="card">
        <h4>Caption review checklist</h4>
        <ul class="check">
          <li>Hook is one of the four formats.</li>
          <li>Every sentence earns its place.</li>
          <li>Read aloud — no stumbles.</li>
          <li>One CTA. One keyword. One destination.</li>
          <li>Spacing breaks long blocks.</li>
          <li>Compliance scan passed.</li>
          <li>Brand voice: direct, warm, intelligent.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- P6 RECORDING -->
  <section>
    <div class="sec-head"><div class="sec-num">P6</div><h2 class="sec-title">Phase 6 — <em>Recording Notes for Alan</em></h2></div>
    <p class="sec-sub">You don't record. Alan does. Your job is to hand him a script he can perform without thinking.</p>

    <div class="grid-2">
      <div class="card">
        <h4>What you give Alan before recording</h4>
        <ul class="check">
          <li>Approved final script with timestamps.</li>
          <li>Visual cues mapped to each timestamp.</li>
          <li>B-roll list (supporting clips needed).</li>
          <li>Wardrobe note (brand color accent).</li>
          <li>Energy note ("open high, lean in at 0:10").</li>
        </ul>
      </div>
      <div class="card">
        <h4>What Alan handles</h4>
        <ul>
          <li>Lighting, camera, audio.</li>
          <li>Wardrobe + framing.</li>
          <li>Multiple takes.</li>
          <li>Uploading raw footage.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- P7 PIPELINE -->
  <section>
    <div class="sec-head"><div class="sec-num">P7</div><h2 class="sec-title">Phase 7 — <em>Pipeline &amp; Files</em></h2></div>
    <p class="sec-sub">In Google Docs, the pipeline is a single tracker doc with one row per Reel. Update status the moment you move forward.</p>

    <div class="card">
      <h4>The Google Docs tracker</h4>
      <table>
        <thead><tr><th>Column</th><th>What goes here</th></tr></thead>
        <tbody>
          <tr><td>Reel #</td><td>1, 2, 3…</td></tr>
          <tr><td>Concept Title</td><td>"$250K Lie"</td></tr>
          <tr><td>Pillar</td><td>Value / Share / Show / Action</td></tr>
          <tr><td>Status</td><td>See list below</td></tr>
          <tr><td>Hook (approved)</td><td>The exact hook line</td></tr>
          <tr><td>Script Doc Link</td><td>Google Doc URL</td></tr>
          <tr><td>Caption Doc Link</td><td>Google Doc URL</td></tr>
          <tr><td>CTA</td><td>VSL or DM keyword</td></tr>
          <tr><td>Posted Date</td><td>YYYY-MM-DD</td></tr>
          <tr><td>Notes</td><td>Anything Alan needs to know</td></tr>
        </tbody>
      </table>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Status list</h4>
      <table>
        <tbody>
          <tr><td>IDEA</td><td>Concept logged, not yet approved.</td></tr>
          <tr><td>CONCEPT APPROVED</td><td>Alan greenlit the concept.</td></tr>
          <tr><td>HOOKS SENT</td><td>Top 10–20 hooks delivered.</td></tr>
          <tr><td>HOOK APPROVED</td><td>Alan picked.</td></tr>
          <tr><td>SCRIPT SENT</td><td>Body script delivered.</td></tr>
          <tr><td>SCRIPT APPROVED</td><td>Ready to record.</td></tr>
          <tr><td>RECORDED</td><td>Footage uploaded.</td></tr>
          <tr><td>EDIT IN PROGRESS</td><td>Editor working.</td></tr>
          <tr><td>READY FOR REVIEW</td><td>First cut delivered.</td></tr>
          <tr><td>REVISION</td><td>Comments returned.</td></tr>
          <tr><td>FINAL APPROVED</td><td>Locked.</td></tr>
          <tr><td>POSTED — IG</td><td>Live on Instagram.</td></tr>
          <tr><td>POSTED — ALL</td><td>Live on FB, TikTok, LinkedIn, X.</td></tr>
        </tbody>
      </table>
    </div>

    <div class="callout">
      <h4>Folder structure inside Google Drive</h4>
      <div class="code"><span class="key">/APW Reels/</span>
  /00 Tracker
  /01 Concepts/
  /02 Hooks/
  /03 Scripts/
  /04 Captions/
  /05 Raw Footage/   (Alan uploads here)
  /06 Edited/        (Editor delivers here)
  /07 Posted/        (Final files archived)</div>
    </div>
  </section>

  <!-- P8 PUBLISH -->
  <section>
    <div class="sec-head"><div class="sec-num">P8</div><h2 class="sec-title">Phase 8 — <em>Publish &amp; Repurpose</em></h2></div>

    <div class="grid-2">
      <div class="card">
        <h4>Publish protocol</h4>
        <ul class="check">
          <li>Confirm DM-keyword automation is armed BEFORE posting.</li>
          <li>Post during avatar-active windows (test 7–9am CT and 6–9pm CT).</li>
          <li>First 60 minutes: reply to every comment with a question back.</li>
          <li>Re-share to Stories within 1 hour with poll/question sticker.</li>
          <li>Log views, watch %, saves, shares, DMs, link clicks at 24h, 72h, 7d.</li>
        </ul>
      </div>
      <div class="card">
        <h4>Repurpose path</h4>
        <ul>
          <li>IG Reel → FB Reel → TikTok → YouTube Short → LinkedIn → X.</li>
          <li>Caption → email blurb / newsletter snippet.</li>
          <li>Top performers (≥ 5x baseline views) → flag for paid boost.</li>
          <li>Top hooks → carousel post variant.</li>
          <li>Top hooks → ad creative test pool.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- 10 TALK TO ALAN -->
  <section>
    <div class="sec-head"><div class="sec-num">10</div><h2 class="sec-title">How to <em>Talk to Alan</em></h2></div>
    <p class="sec-sub">Alan is fast, direct, busy. The way you communicate determines how much trust you earn.</p>

    <div class="grid-2">
      <div class="card">
        <h4>The 7 communication rules</h4>
        <ol>
          <li><b>Lead with the answer.</b> First sentence = the answer.</li>
          <li><b>Headline format.</b> Bold lines, tables, bullets.</li>
          <li><b>Brevity, complete.</b> Short, but include everything he needs.</li>
          <li><b>Always present options + a recommendation.</b></li>
          <li><b>Verify before stating.</b> Label uncertainty.</li>
          <li><b>Copy-paste-ready.</b> No edits Alan must make.</li>
          <li><b>One clear next step.</b></li>
        </ol>
      </div>
      <div class="card">
        <h4>What NOT to do</h4>
        <ul>
          <li>No paragraphs. Use lines and bullets.</li>
          <li>No filler ("just," "kind of," "maybe").</li>
          <li>No asking permission to start something in your scope.</li>
          <li>No five clarifying questions. Ask the one that unlocks the rest.</li>
          <li>No invented stats or numbers.</li>
          <li>No raw AI output without your curation pass.</li>
          <li>No cold or corporate tone.</li>
        </ul>
      </div>
    </div>

    <div class="example">
      <h4>Message template — sending hooks for review</h4>
      <div class="code"><span class="key">REEL #1 — Hooks ready for your pick</span>

Top 3 (my rec):
★ "Banks lied to you about $250K."
★ "You don't need 2 years of tax returns."
★ "Your CPA is killing your funding."

Full top 15 below. Pick a number and I'll write the body script.

[paste full table]

Next: body script within 24h of your pick.</div>
    </div>

    <div class="example">
      <h4>Message template — sending the script for review</h4>
      <div class="code"><span class="key">REEL #1 — Script ready for your sign-off</span>

Hook locked: "Banks lied to you about $250K."
Framework: Contrarian Reveal → PAS Loop
Score: 9.9/10 average

[paste full script in Phase 4 format]

Next: green-light → I move it to Recorded status the moment you upload footage.</div>
    </div>
  </section>

  <!-- 11 COMPLIANCE -->
  <section>
    <div class="sec-head"><div class="sec-num">11</div><h2 class="sec-title"><em>Compliance</em> — words to never use</h2></div>
    <p class="sec-sub">APW operates in a regulated space. Saying the wrong thing can trigger ad bans, account suspensions, or legal exposure.</p>

    <div class="callout bad">
      <h4>NEVER write these phrases (or anything close)</h4>
      <ul>
        <li>"Guaranteed approval"</li>
        <li>"Guaranteed funding"</li>
        <li>"You will get $X"</li>
        <li>"Free money"</li>
        <li>"No risk"</li>
        <li>"Erase your debt"</li>
        <li>"Wipe your credit"</li>
        <li>"Get rich quick"</li>
        <li>"Make $X in X days" (as a promise to the viewer)</li>
        <li>Any specific income claim about what a viewer will earn</li>
      </ul>
    </div>

    <div class="callout good" style="margin-top:14px">
      <h4>Use these instead</h4>
      <ul>
        <li>"Clients have accessed up to…" (factual, past tense)</li>
        <li>"The path most operators use…"</li>
        <li>"The strategy our clients follow…"</li>
        <li>"Results vary based on profile and execution."</li>
        <li>"Here's what's possible when…"</li>
      </ul>
    </div>

    <div class="callout warn" style="margin-top:14px">
      <h4>When in doubt</h4>
      <p>Send the line to Alan with: "Compliance check — is this OK to say?" Better to ask once than rebuild a Reel.</p>
    </div>

    <div class="quiz">
      <span class="qlabel">Proficiency Check · Compliance</span>
      <h4>Rewrite each compliant version:</h4>
      <ol>
        <li>"You're guaranteed to get $250K with this method."</li>
        <li>"Make $50K in 30 days."</li>
        <li>"This will erase your debt."</li>
        <li>"No risk, no downside."</li>
      </ol>
      <div class="answer">
        <b>Sample answers:</b> 1 → "Clients have accessed up to $250K using this path." 2 → "Here's what's possible when operators follow this." 3 → "How clients restructured to free up cash flow." 4 → "Results vary; here's the strategy clients use." <b>Pass:</b> All four rewritten without using any banned phrases.
      </div>
    </div>
  </section>

  <!-- 12 COMMON MISTAKES -->
  <section>
    <div class="sec-head"><div class="sec-num">12</div><h2 class="sec-title">Common Mistakes &amp; <em>Fixes</em></h2></div>
    <p class="sec-sub">The 12 things new hires get wrong. Re-read weekly for the first month.</p>

    <div class="card">
      <table>
        <thead><tr><th>Mistake</th><th>Fix</th></tr></thead>
        <tbody>
          <tr><td>Sending Alan raw AI output</td><td>Manual curation pass first. Cut, score, recommend.</td></tr>
          <tr><td>Writing for a beginner audience</td><td>Re-read Section 02. Avatar already has $25K+/mo business.</td></tr>
          <tr><td>Vague claims ("a lot of people…")</td><td>Replace with a real number or cut the line.</td></tr>
          <tr><td>Multiple CTAs in one Reel</td><td>One ask. One keyword. One destination.</td></tr>
          <tr><td>Skipping the gate</td><td>Never start Phase X+1 until Alan approves Phase X.</td></tr>
          <tr><td>Long paragraphs in messages</td><td>Headlines + bullets + tables.</td></tr>
          <tr><td>Asking 5 clarifying questions</td><td>Ask the 1 that unlocks the rest.</td></tr>
          <tr><td>Hooks &gt; 12 words</td><td>Cut. Then cut again.</td></tr>
          <tr><td>No retention beat for 4+ seconds</td><td>Add visual cut, text overlay, or new headline.</td></tr>
          <tr><td>Compliance violations</td><td>Re-read Section 11 before sending any script.</td></tr>
          <tr><td>Forgetting to update tracker</td><td>Update status the moment a phase changes.</td></tr>
          <tr><td>Inventing facts to sound smart</td><td>Verify everything. "I'm not sure" is always better than fabrication.</td></tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- 13 ONBOARDING -->
  <section>
    <div class="sec-head"><div class="sec-num">13</div><h2 class="sec-title">Day 1 → Week 1 <em>Onboarding</em></h2></div>
    <p class="sec-sub">Follow this exact sequence. Don't skip ahead. By end of Week 1 you'll be shipping at Alan's standard.</p>

    <div class="days">
      <span class="day">Day 1</span><span class="day">Day 2</span><span class="day">Day 3</span><span class="day">Day 4</span><span class="day">Day 5</span><span class="day">Day 6–7</span>
    </div>

    <div class="grid-2">
      <div class="card">
        <h3>Day 1 — Read &amp; absorb</h3>
        <ul class="check">
          <li>Read manual sections 00–04 (twice).</li>
          <li>Pass all Proficiency Checks for those sections.</li>
          <li>Watch the APW VSL end to end. Take notes on the offer.</li>
          <li>Watch 20 successful Reels in the funding/business niche.</li>
          <li>Set up the Google Drive folder structure.</li>
          <li>Send Alan a 3-line summary of what you learned.</li>
        </ul>
      </div>
      <div class="card">
        <h3>Day 2 — Practice concepts</h3>
        <ul class="check">
          <li>Read Sections P1 + P2.</li>
          <li>Pass both Proficiency Checks.</li>
          <li>Use the AI prompt to generate 15 Value-pillar concepts.</li>
          <li>Curate to 5 finalists using the 5-test rubric.</li>
          <li>Send Alan: 5 concepts + your top 1 recommendation.</li>
        </ul>
      </div>
    </div>

    <div class="grid-2" style="margin-top:18px">
      <div class="card">
        <h3>Day 3 — Practice hooks</h3>
        <ul class="check">
          <li>Read Section P3. Pass the Proficiency Check.</li>
          <li>Take Alan's approved concept; run the hook prompt.</li>
          <li>Curate to top 10–20. Score each on 6 axes.</li>
          <li>Send Alan: top 10–20 + your top 3.</li>
        </ul>
      </div>
      <div class="card">
        <h3>Day 4 — Practice scripts</h3>
        <ul class="check">
          <li>Read Section P4. Pass the Proficiency Check.</li>
          <li>Write a 60-second script using the time-block architecture.</li>
          <li>Self-score on the 10-axis rubric.</li>
          <li>Iterate until you hit ≥ 9.0 average.</li>
          <li>Send Alan: full script + score + visual cues.</li>
        </ul>
      </div>
    </div>

    <div class="grid-2" style="margin-top:18px">
      <div class="card">
        <h3>Day 5 — Captions + tracker</h3>
        <ul class="check">
          <li>Read Section P5 + P7.</li>
          <li>Write the caption for Reel #1.</li>
          <li>Set up the tracker doc with all 9 Reels.</li>
          <li>Practice Section 10 message format on a real send.</li>
        </ul>
      </div>
      <div class="card">
        <h3>Day 6–7 — Ship</h3>
        <ul class="check">
          <li>Run the full pipeline on Reel #2 and #3 in parallel.</li>
          <li>Re-read Sections 11 (Compliance) + 12 (Mistakes).</li>
          <li>Run a self-check before every send.</li>
          <li>End-of-week note to Alan: what shipped, what's next.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- 14 SELF-CHECK -->
  <section>
    <div class="sec-head"><div class="sec-num">14</div><h2 class="sec-title"><em>Self-Check</em> Before Sending</h2></div>
    <p class="sec-sub">Run this 10-question gate on every deliverable before it hits Alan's inbox.</p>

    <div class="card">
      <ul class="check">
        <li>Does the first sentence contain the answer?</li>
        <li>Are options + a recommendation included?</li>
        <li>Are scores attached where applicable?</li>
        <li>Is every claim verified or labeled "verifying"?</li>
        <li>Are there zero filler words?</li>
        <li>Is it copy-paste-ready?</li>
        <li>Did you read it aloud without stumbling?</li>
        <li>Did you check Section 11 (Compliance)?</li>
        <li>Is the tracker updated to the new status?</li>
        <li>Is there a clear "next step" at the end?</li>
      </ul>
      <p class="mute" style="margin-top:10px">All ten checked? Send. Any unchecked? Fix it first.</p>
    </div>
  </section>

  <!-- 15 PROFICIENCY VERIFICATION SYSTEM -->
  <section>
    <div class="sec-head"><div class="sec-num">15</div><h2 class="sec-title">★ <em>Proficiency Verification</em> System</h2></div>
    <p class="sec-sub">This is the master verification layer for your learning. Pass each tier in order. Do NOT skip ahead. Each tier has a real-world deliverable Alan reviews.</p>

    <div class="card">
      <h4>Tier 1 — Foundation (Day 1)</h4>
      <ul class="check">
        <li>Recite the 4 outcomes from memory: Trust, Likability, Authority, Conversion.</li>
        <li>Recite the 4 pillars and the 9-Reel mix (5/2/1/1).</li>
        <li>Define avatar in one sentence.</li>
        <li>Name 3 things APW is NOT (not a lender, not a broker, not credit repair).</li>
        <li>State the 3 override rules from Section 00.</li>
      </ul>
      <div class="gate">
        <div class="gate-icon">1</div>
        <div>
          <h4>Tier 1 Deliverable</h4>
          <p>Send Alan a 5-line summary: "What APW does, who we serve, what we're not, what every Reel must achieve, and the 3 rules I'll never break."</p>
        </div>
      </div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Tier 2 — Concept &amp; Framework (Day 2)</h4>
      <ul class="check">
        <li>Generate 15 concepts using the AI prompt.</li>
        <li>Score each against the 5 concept tests.</li>
        <li>Cull to 5 finalists.</li>
        <li>Match each finalist to the right framework.</li>
        <li>Defend each match in one sentence.</li>
      </ul>
      <div class="gate">
        <div class="gate-icon">2</div>
        <div>
          <h4>Tier 2 Deliverable</h4>
          <p>Send Alan: 5 concepts, each with assigned framework + one-sentence defense + your top 1 pick. Alan must be able to approve in one read.</p>
        </div>
      </div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Tier 3 — Hook Mastery (Day 3)</h4>
      <ul class="check">
        <li>Run the hook prompt for the approved concept.</li>
        <li>Score every hook on all 6 axes.</li>
        <li>Curate to top 10–20 (avg ≥ 8, no axis &lt; 7).</li>
        <li>Mark your top 3 with one-sentence reasoning each.</li>
        <li>Format the delivery exactly per the Phase 3 example.</li>
      </ul>
      <div class="gate">
        <div class="gate-icon">3</div>
        <div>
          <h4>Tier 3 Deliverable</h4>
          <p>Send Alan: top 10–20 hooks + top 3 stars + scores. Alan must be able to pick a number and reply in 30 seconds.</p>
        </div>
      </div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Tier 4 — Script Mastery (Day 4)</h4>
      <ul class="check">
        <li>Write the body script using the time-block architecture.</li>
        <li>Verify every 2-second beat has a visual or verbal change.</li>
        <li>Score on all 10 axes; iterate until avg ≥ 9.0.</li>
        <li>Add visual cues + B-roll list.</li>
        <li>Compliance scan (Section 11).</li>
        <li>Read aloud — no stumbles.</li>
      </ul>
      <div class="gate">
        <div class="gate-icon">4</div>
        <div>
          <h4>Tier 4 Deliverable</h4>
          <p>Send Alan: full script in Phase 4 format with score line at bottom. Alan should be able to record from it without asking a single question.</p>
        </div>
      </div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Tier 5 — Full Pipeline (Day 5–7)</h4>
      <ul class="check">
        <li>Caption written and reviewed.</li>
        <li>Tracker doc set up with all 9 Reels.</li>
        <li>Folder structure live in Google Drive.</li>
        <li>One Reel posted to IG with DM keyword armed.</li>
        <li>Story re-share within 1 hour.</li>
        <li>Comments answered in first 60 minutes.</li>
        <li>Cross-posted to FB, TikTok, LinkedIn, X.</li>
        <li>Performance logged at 24h.</li>
      </ul>
      <div class="gate">
        <div class="gate-icon">5</div>
        <div>
          <h4>Tier 5 Deliverable</h4>
          <p>One Reel live, with a Friday EOD note to Alan: what shipped, performance numbers, what's queued for next week.</p>
        </div>
      </div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Tier 6 — Ultimate Proficiency (Week 2+)</h4>
      <p>You reach this when:</p>
      <ul>
        <li>Alan approves 8 out of 10 of your concepts on the first send.</li>
        <li>Alan picks one of your top 3 hook recommendations every time.</li>
        <li>Your scripts score ≥ 9.5 average without coaching.</li>
        <li>You ship a full Reel from concept to posted in &lt; 48 hours.</li>
        <li>You've never violated compliance.</li>
        <li>Alan mentions in passing: "Just run with it."</li>
      </ul>
      <div class="gate">
        <div class="gate-icon">★</div>
        <div>
          <h4>Tier 6 — Mastery</h4>
          <p>You are now a content operator at Alan's standard. Your role expands. You start coaching the next hire.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- MASTER CHECKLIST -->
  <section>
    <div class="sec-head"><div class="sec-num">★</div><h2 class="sec-title">Master Per-Reel <em>Checklist</em></h2></div>
    <p class="sec-sub">Print this. Use it for every Reel, every time.</p>

    <div class="card">
      <ul class="check">
        <li>Concept logged in tracker · pillar tagged · 1-line angle written.</li>
        <li>Concept passes all 5 concept tests.</li>
        <li>Concept approved by Alan.</li>
        <li>Framework selected from approved list.</li>
        <li>40 hooks generated with AI prompt template.</li>
        <li>Hooks scored on 6-axis rubric · ≥ 8 avg · no axis &lt; 7.</li>
        <li>Top 10–20 hooks curated · operator's top 3 starred.</li>
        <li>Hook approved by Alan.</li>
        <li>Body script written using framework + PAS loop.</li>
        <li>Retention beat present every 2 seconds.</li>
        <li>Script scored on 10-axis rubric · avg ≥ 9/10.</li>
        <li>Script approved by Alan.</li>
        <li>Caption drafted: Hook → Value → CTA.</li>
        <li>Caption read aloud · fluff stripped · one CTA only.</li>
        <li>Compliance scan passed.</li>
        <li>Script + visual cues delivered to Alan for recording.</li>
        <li>Footage uploaded · tracker updated.</li>
        <li>Edit reviewed · revisions returned with timestamps.</li>
        <li>Final approved by Alan.</li>
        <li>Posted to IG · DM keyword automation armed.</li>
        <li>Story re-share within 1 hour.</li>
        <li>Comments answered in first 60 minutes.</li>
        <li>Cross-posted to FB, TikTok, LinkedIn, X.</li>
        <li>Performance logged at 24h, 72h, 7d.</li>
        <li>Top performers flagged for boost / repurpose / ad-test.</li>
      </ul>
    </div>

    <div class="callout" style="margin-top:18px">
      <h4>Operator's promise to Alan</h4>
      <p>Every deliverable arrives with: <b>(a)</b> options to choose from, <b>(b)</b> a recommended pick with one-line reasoning, <b>(c)</b> scores against the rubric, <b>(d)</b> a clear next step. Alan decides. You execute.</p>
    </div>
  </section>

  <hr class="div" />

  <footer>
    <span>APW · New Hire Operating Manual · v3.0</span>
    <span>Owner · Alan Nguyen</span>
    <span>High-contrast · Mobile-ready · Print-friendly</span>
  </footer>

</div>
</body>
</html>
