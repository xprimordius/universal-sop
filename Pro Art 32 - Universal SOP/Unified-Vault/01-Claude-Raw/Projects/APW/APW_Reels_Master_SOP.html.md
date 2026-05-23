---
title: APW_Reels_Master_SOP.html
source: claude
type: project-doc
project: APW
person: alan
created: "2026-04-16T01:32:30.836013+00:00"
uuid: 61648dc5-9587-424a-9689-b1e2cd5b47b4
tags:
  - claude
  - alan
  - apw
  - marketing
---
# APW_Reels_Master_SOP.html

> [!info] From project: [[_Project Info|APW]]

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>APW Reels — Master SOP & Checklist</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght,SOFT@9..144,300..900,0..100&family=Sora:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;700&display=swap" rel="stylesheet">
<style>
  :root{
    --bg:#06091A;
    --bg-2:#0A1030;
    --ink:#EDEFFF;
    --ink-dim:#A6ADD6;
    --line:rgba(155,165,220,.18);
    --cyan:#00C6E8;
    --teal:#1AD4C8;
    --purple:#9B30D0;
    --gold:#C9A030;
    --pink:#FF7AC6;
    --warn:#FFB347;
    --bad:#FF6E6E;
    --good:#5EE6A8;
    --display:"Fraunces", ui-serif, Georgia, serif;
    --body:"Sora", ui-sans-serif, system-ui, sans-serif;
    --mono:"JetBrains Mono", ui-monospace, SFMono-Regular, Menlo, monospace;
  }

  *{box-sizing:border-box}
  html,body{margin:0;padding:0;background:var(--bg);color:var(--ink);font-family:var(--body);font-weight:400;line-height:1.55;-webkit-font-smoothing:antialiased;}
  body{
    background:
      radial-gradient(1200px 700px at 85% -10%, rgba(155,48,208,.22), transparent 60%),
      radial-gradient(900px 600px at -10% 20%, rgba(0,198,232,.18), transparent 55%),
      radial-gradient(1100px 800px at 50% 120%, rgba(26,212,200,.15), transparent 60%),
      var(--bg);
    background-attachment: fixed;
  }
  .stars{
    position:fixed;inset:0;z-index:0;pointer-events:none;opacity:.35;
    background-image:
      radial-gradient(1px 1px at 12% 18%, #fff, transparent),
      radial-gradient(1px 1px at 28% 72%, #fff, transparent),
      radial-gradient(1.2px 1.2px at 64% 22%, #fff, transparent),
      radial-gradient(1px 1px at 82% 64%, #fff, transparent),
      radial-gradient(.8px .8px at 47% 47%, #fff, transparent),
      radial-gradient(1.4px 1.4px at 92% 12%, #fff, transparent),
      radial-gradient(1px 1px at 8% 88%, #fff, transparent),
      radial-gradient(1px 1px at 36% 30%, #fff, transparent);
  }
  .wrap{position:relative;z-index:1;max-width:1180px;margin:0 auto;padding:64px 40px 120px;}
  .eyebrow{font-family:var(--mono);font-size:11px;letter-spacing:.22em;text-transform:uppercase;color:var(--cyan);}
  .gold{color:var(--gold)}
  .teal{color:var(--teal)}
  .cyan{color:var(--cyan)}
  .purple{color:var(--purple)}
  .pink{color:var(--pink)}
  .dim{color:var(--ink-dim)}

  /* Cover */
  .cover{
    border:1px solid var(--line);
    border-radius:24px;
    padding:56px 48px;
    background:
      linear-gradient(135deg, rgba(0,198,232,.08), rgba(155,48,208,.08) 60%, rgba(201,160,48,.06)),
      rgba(10,16,48,.55);
    backdrop-filter: blur(8px);
    position:relative;overflow:hidden;
  }
  .cover::after{
    content:"";position:absolute;inset:auto -20% -50% auto;width:520px;height:520px;
    background:radial-gradient(closest-side, rgba(201,160,48,.25), transparent 70%);
    filter:blur(20px);
  }
  .cover h1{
    font-family:var(--display);font-weight:400;font-size:clamp(40px,6vw,76px);
    line-height:1.02;letter-spacing:-.02em;margin:18px 0 12px;
  }
  .cover h1 em{font-style:italic;color:var(--gold);font-weight:300}
  .cover .meta{font-family:var(--mono);font-size:12px;color:var(--ink-dim);display:flex;flex-wrap:wrap;gap:24px;margin-top:28px;border-top:1px dashed var(--line);padding-top:20px}
  .cover p.lede{font-size:18px;color:var(--ink-dim);max-width:760px;margin:8px 0 0}

  /* Sections */
  section{margin-top:72px}
  .sec-head{display:flex;align-items:baseline;gap:18px;margin-bottom:18px;border-bottom:1px solid var(--line);padding-bottom:14px}
  .sec-num{font-family:var(--mono);font-size:12px;color:var(--gold);letter-spacing:.2em}
  .sec-title{font-family:var(--display);font-weight:400;font-size:clamp(28px,3.4vw,42px);letter-spacing:-.01em;margin:0}
  .sec-title em{font-style:italic;color:var(--cyan);font-weight:300}
  .sec-sub{color:var(--ink-dim);max-width:780px;margin:0 0 24px}

  /* Cards */
  .card{
    border:1px solid var(--line);border-radius:18px;padding:28px;background:rgba(10,16,48,.55);backdrop-filter:blur(6px);
  }
  .card + .card{margin-top:18px}
  .grid-2{display:grid;grid-template-columns:1fr 1fr;gap:18px}
  .grid-3{display:grid;grid-template-columns:repeat(3,1fr);gap:18px}
  .grid-4{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}
  @media (max-width:880px){.grid-2,.grid-3,.grid-4{grid-template-columns:1fr}}

  h3{font-family:var(--display);font-weight:500;font-size:22px;margin:0 0 10px;letter-spacing:-.005em}
  h4{font-family:var(--mono);font-size:11px;letter-spacing:.22em;text-transform:uppercase;color:var(--teal);margin:0 0 8px}
  p{margin:0 0 10px}

  /* Pillar tiles */
  .pillar{border-radius:14px;padding:18px;border:1px solid var(--line);background:linear-gradient(160deg, rgba(255,255,255,.02), rgba(255,255,255,0));}
  .pillar.value{border-color:rgba(0,198,232,.35)}
  .pillar.share{border-color:rgba(255,122,198,.35)}
  .pillar.show{border-color:rgba(94,230,168,.35)}
  .pillar.action{border-color:rgba(201,160,48,.45)}
  .pillar .tag{font-family:var(--mono);font-size:10px;letter-spacing:.2em;text-transform:uppercase}
  .pillar.value .tag{color:var(--cyan)} .pillar.share .tag{color:var(--pink)}
  .pillar.show .tag{color:var(--good)} .pillar.action .tag{color:var(--gold)}
  .pillar h3{margin-top:6px}

  /* Phase ribbon */
  .ribbon{display:flex;flex-wrap:wrap;gap:10px;margin:0 0 28px}
  .ribbon .step{
    border:1px solid var(--line);border-radius:999px;padding:8px 14px;font-family:var(--mono);
    font-size:11px;letter-spacing:.18em;color:var(--ink-dim);text-transform:uppercase;
  }
  .ribbon .step b{color:var(--gold);font-weight:700;margin-right:8px}

  /* Tables */
  table{width:100%;border-collapse:collapse;font-size:14px}
  th,td{border-bottom:1px solid var(--line);padding:10px 12px;text-align:left;vertical-align:top}
  th{font-family:var(--mono);font-size:11px;letter-spacing:.18em;text-transform:uppercase;color:var(--teal);font-weight:500}
  tr:hover td{background:rgba(255,255,255,.02)}

  /* Checklist */
  .check{list-style:none;margin:0;padding:0}
  .check li{display:flex;gap:12px;padding:8px 0;border-bottom:1px dashed var(--line)}
  .check li:last-child{border-bottom:none}
  .check li::before{
    content:"";flex:0 0 18px;height:18px;margin-top:3px;border:1.5px solid var(--gold);border-radius:5px;display:block;background:rgba(201,160,48,.08);
  }

  /* Code / template */
  .code{
    font-family:var(--mono);font-size:13px;line-height:1.55;color:#cfd6ff;
    background:rgba(0,0,0,.35);border:1px solid var(--line);border-radius:14px;padding:18px 20px;white-space:pre-wrap;
  }
  .code .key{color:var(--gold)}
  .code .var{color:var(--teal)}
  .code .com{color:#7e88c2}

  /* Score badges */
  .score{display:inline-flex;align-items:center;gap:6px;font-family:var(--mono);font-size:11px;letter-spacing:.16em;
    border:1px solid var(--line);border-radius:999px;padding:4px 10px;color:var(--gold);text-transform:uppercase}

  /* Quote / verbatim block */
  .verbatim{
    border-left:3px solid var(--cyan);padding:14px 18px;background:rgba(0,198,232,.05);
    border-radius:0 12px 12px 0;font-size:14px;color:#dbe1ff;
  }
  .verbatim small{display:block;font-family:var(--mono);font-size:10px;letter-spacing:.2em;color:var(--cyan);margin-bottom:6px;text-transform:uppercase}

  /* Callouts */
  .callout{border:1px solid rgba(201,160,48,.4);background:rgba(201,160,48,.06);border-radius:14px;padding:18px 20px}
  .callout h4{color:var(--gold)}

  hr.div{border:none;height:1px;background:linear-gradient(90deg,transparent,var(--line),transparent);margin:36px 0}

  /* Footer */
  footer{margin-top:80px;border-top:1px solid var(--line);padding-top:24px;color:var(--ink-dim);font-family:var(--mono);font-size:11px;letter-spacing:.16em;text-transform:uppercase;display:flex;justify-content:space-between;flex-wrap:wrap;gap:10px}

  /* Print-friendly */
  @media print{
    body{background:#fff;color:#000}
    .stars{display:none}
    .cover, .card, .pillar, .verbatim, .callout, .code{background:#fff !important;color:#000 !important;border-color:#222 !important;backdrop-filter:none}
    .dim,.cyan,.teal,.gold,.purple,.pink{color:#000 !important}
    .check li::before{border-color:#000;background:#fff}
    .wrap{padding:24px}
    section{break-inside:avoid}
  }
</style>
</head>
<body>
<div class="stars"></div>
<div class="wrap">

  <!-- COVER -->
  <header class="cover">
    <div class="eyebrow">Ascend Prime Wealth · Operator Playbook · v1.0</div>
    <h1>Reels Master <em>SOP</em> &amp; Checklist</h1>
    <p class="lede">A complete operating system for producing 9 Instagram Reels — and every reel after — engineered for trust, likability, and authority that converts to VSL views and lead-magnet opt-ins.</p>
    <div class="meta">
      <span>OWNER · ALAN NGUYEN</span>
      <span>BRAND · APW</span>
      <span>OUTPUT TARGET · VSL + FREE RESOURCES</span>
      <span>AUDIENCE · MEDICAL OPERATORS + BROADER ENTREPRENEURS</span>
    </div>
  </header>

  <!-- SECTION 0: SOURCE FIDELITY -->
  <section>
    <div class="sec-head">
      <div class="sec-num">00</div>
      <h2 class="sec-title">Source <em>Fidelity</em> — verbatim inputs preserved</h2>
    </div>
    <p class="sec-sub">Every directive from the original briefs is preserved below as a non-negotiable input. Nothing has been dropped, summarized away, or paraphrased loosely. This is the source of truth the rest of the SOP honors.</p>

    <div class="card">
      <h4>From the original request</h4>
      <div class="verbatim">
        <small>Goals — quoted</small>
        "Help me create the best IG reels for trust, and value, and like ability, and outstanding significant authority that people love deeply and fully." · "Brainstorm video reel ideas. I need to make 9 posts." · "We will start with the concepts first." · "Once approved we will move into frameworks." · "Then explore hooks for each one one at a time." · "And then the body / script — with a score rating 10/10 on all variables each." · "And then continue + any feedback and suggestions."
      </div>
      <div class="verbatim" style="margin-top:12px">
        <small>SOP Build — quoted</small>
        "How [to] work with AI to generate hooks, using our criteria, then manually selecting the best top 10–20 viable hooks that meet our criteria, and present those." · "After the hooks have been decided, we work on the framework of the body script, meeting our criteria, optimizing for retention every 2 seconds, speaking in headlines, and using Problem Agitate Solution, Call to Action repeatedly." · "Anything else a new hire would need to know to work with me, take care of this, and present to me the best options and having me select from them, for them to execute."
      </div>
    </div>

    <div class="grid-2" style="margin-top:18px">
      <div class="card">
        <h4>Caption rules — preserved verbatim</h4>
        <ul class="check">
          <li>Structure every caption: <b>Hook → Value → CTA</b>.</li>
          <li>Hook line: bold question, controversial statement, surprising fact, or biggest mistake.</li>
          <li>Lines 2–4: short problem explanation + bullet/numbered list of actionable steps.</li>
          <li>Final lines: tie back to offer; CTA 1–2 lines max; conversational and natural.</li>
          <li>Sentences ≤ 1–2 lines. Break up text with spacing. Emojis sparingly.</li>
          <li>Remove "just," "kind of," and weak hedges. Read it aloud before posting.</li>
        </ul>
      </div>
      <div class="card">
        <h4>Content idea taxonomy — preserved verbatim</h4>
        <ul class="check">
          <li><b>Value:</b> objections · questions · misconceptions · biggest challenges (speak only to the dream avatar).</li>
          <li><b>Share:</b> what you've learned (life + lesson) · a challenge you overcame.</li>
          <li><b>Show:</b> behind the scenes with clients · client results, screenshots, interviews.</li>
          <li><b>Action:</b> resources (what/why/how/now) · invite to work with you (especially during cash campaigns).</li>
        </ul>
      </div>
    </div>

    <div class="grid-2" style="margin-top:18px">
      <div class="card">
        <h4>Stories rules — preserved verbatim</h4>
        <ul class="check">
          <li>Treat Stories as a personal reality TV show. Be authentic, bold, fun, interesting.</li>
          <li>Post 1–3+ Stories every day for consistency. Don't overthink it.</li>
          <li>Touch all 4 pillars (value, share, show, action) across the week.</li>
          <li>Most days include a CTA; OK to skip 1–2 days for a breather.</li>
          <li>Use Stories as fast A/B testing ground for messaging angles.</li>
          <li>Story formats: Education CTA (what/why/how/now), Results 2-step CTA, Day in the life, Testimonials, Polls.</li>
          <li>Hack: if Story views are low — let stories clear, wait a few hours, drop a poll to reset the algo.</li>
        </ul>
      </div>
      <div class="card">
        <h4>Pipeline rules — preserved verbatim</h4>
        <ul class="check">
          <li>Batch creation. Follow the creator flow: <b>Prepare → Create → Recharge.</b></li>
          <li>Have content ready 1–4 weeks ahead, especially around launches/travel.</li>
          <li>Pipeline statuses: Ideas → Script ✅ → Recorded → To Do → In Progress → Ready → Revision → Ready → Approved → Posted IG → Posted ALL (FB, TikTok, LinkedIn, Twitter).</li>
          <li>Ideas come from: sales-call objections, client questions, content I love, content I disagree with, my own mistakes/lessons.</li>
          <li>Schedule via IG app, Meta Business Suite, or VA.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- SECTION 1: AUDIENCE & DESTINATION -->
  <section>
    <div class="sec-head">
      <div class="sec-num">01</div>
      <h2 class="sec-title">Audience &amp; <em>Destination</em></h2>
    </div>
    <p class="sec-sub">All creative decisions ladder back to these two anchors. If a reel does not serve the avatar or move them toward the destination, it does not get made.</p>

    <div class="grid-2">
      <div class="card">
        <h4>Avatar (Hybrid)</h4>
        <p><b class="cyan">Primary:</b> Medical practice / clinic owners, $25K–$100K/mo, who need $100K–$500K+ in unsecured business funding without giving up equity or income docs.</p>
        <p><b class="teal">Secondary:</b> Service-based operators &amp; founders curious about leveraging credit + funding for growth, equipment, or runway.</p>
        <p class="dim">Speak only to people <b>at this stage</b>. Do not address credit-repair beginners. Do not address pre-revenue dreamers.</p>
      </div>
      <div class="card">
        <h4>Destinations</h4>
        <p><b class="gold">Primary CTA:</b> APW VSL.</p>
        <p><b class="gold">Secondary CTA:</b> Free resource → DM keyword (e.g., "FUND," "CHECKLIST," "28") → lead magnet delivery via DM automation.</p>
        <p class="dim">Every reel ends with one — and only one — clear next step.</p>
      </div>
    </div>
  </section>

  <!-- SECTION 2: 4 PILLARS -->
  <section>
    <div class="sec-head">
      <div class="sec-num">02</div>
      <h2 class="sec-title">The Four <em>Pillars</em></h2>
    </div>
    <p class="sec-sub">Every reel is classified into one pillar. Across any 7-reel cycle we touch all four. The 9-reel set is weighted 5 Value / 2 Share / 1 Show / 1 Action — heavy on authority build, anchored by proof and one direct conversion play.</p>

    <div class="grid-4">
      <div class="pillar value">
        <span class="tag">Value · Cyan</span>
        <h3>Authority</h3>
        <p class="dim">Objections, FAQs, misconceptions, biggest challenges. Speak only to the dream avatar at the right stage.</p>
      </div>
      <div class="pillar share">
        <span class="tag">Share · Pink</span>
        <h3>Likability</h3>
        <p class="dim">Stories from your life, lessons learned, challenges overcome. Builds the human bond.</p>
      </div>
      <div class="pillar show">
        <span class="tag">Show · Green</span>
        <h3>Proof</h3>
        <p class="dim">Behind-the-scenes with clients, results, screenshots, testimonials, interviews.</p>
      </div>
      <div class="pillar action">
        <span class="tag">Action · Gold</span>
        <h3>Conversion</h3>
        <p class="dim">Direct invitations: VSL, free resource, work with us. What/Why/How/Now structure.</p>
      </div>
    </div>
  </section>

  <!-- SECTION 3: MASTER WORKFLOW -->
  <section>
    <div class="sec-head">
      <div class="sec-num">03</div>
      <h2 class="sec-title">Master <em>Workflow</em></h2>
    </div>
    <p class="sec-sub">Every reel moves through these phases in order. Phase 1 must be approved before Phase 2 begins. Alan selects from options at every gate. The team executes after approval.</p>

    <div class="ribbon">
      <span class="step"><b>P1</b> Concepts (9)</span>
      <span class="step"><b>P2</b> Frameworks</span>
      <span class="step"><b>P3</b> Hooks</span>
      <span class="step"><b>P4</b> Body Script</span>
      <span class="step"><b>P5</b> Caption</span>
      <span class="step"><b>P6</b> Recording</span>
      <span class="step"><b>P7</b> Editing &amp; Pipeline</span>
      <span class="step"><b>P8</b> Publish &amp; Repurpose</span>
    </div>
  </section>

  <!-- PHASE 1: CONCEPTS -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P1</div>
      <h2 class="sec-title">Phase 1 — <em>Concepts</em></h2>
    </div>
    <p class="sec-sub">Generate 12–15 concept candidates. Distill to a final 9 covering all four pillars. Each concept gets one sentence: angle + why it converts.</p>

    <div class="card">
      <h4>Concept criteria — every concept must pass all 5</h4>
      <ul class="check">
        <li><b>Avatar fit:</b> speaks directly to a medical operator or qualified entrepreneur. No off-stage audiences.</li>
        <li><b>Pillar clarity:</b> clearly classifiable as Value, Share, Show, or Action. No mush.</li>
        <li><b>Pattern interrupt:</b> contains a contrarian, surprising, or unspoken truth.</li>
        <li><b>Mechanism reveal:</b> teaches or shows something tactical — not vibes.</li>
        <li><b>CTA pathway:</b> has an obvious bridge to the VSL or a lead magnet.</li>
      </ul>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Approved 9-concept set (current cycle)</h4>
      <table>
        <thead><tr><th>#</th><th>Concept</th><th>Pillar</th><th>CTA</th></tr></thead>
        <tbody>
          <tr><td>1</td><td>The $250K Lie Banks Tell You</td><td class="cyan">Value · Misconception</td><td>VSL</td></tr>
          <tr><td>2</td><td>Denied $15K → Approved $300K 90 Days Later</td><td class="pink">Share · Origin Story</td><td>Soft / no CTA</td></tr>
          <tr><td>3</td><td>The 3 Data Points Every Bank Pulls Before Yes</td><td class="cyan">Value · Teaching</td><td>Free Resource</td></tr>
          <tr><td>4</td><td>Why Your Doctor Friend Can't Get Funded</td><td class="cyan">Value · Avatar Callout</td><td>VSL</td></tr>
          <tr><td>5</td><td>DFY Funders Charge $25K — Here's What They Actually Do</td><td class="cyan">Value · Industry Exposé</td><td>VSL</td></tr>
          <tr><td>6</td><td>Client Closed $180K in 38 Days — Exact Sequence</td><td class="good">Show · Result</td><td>Soft / no CTA</td></tr>
          <tr><td>7</td><td>The 2-Minute Test: Are You Fundable Right Now?</td><td class="cyan">Value · Diagnostic</td><td>Free Resource</td></tr>
          <tr><td>8</td><td>What I'd Do To Get $100K in 30 Days From Scratch</td><td class="pink">Share · Hypothetical Playbook</td><td>Free Resource</td></tr>
          <tr><td>9</td><td>Stop Personally Guaranteeing Everything — Do This Instead</td><td class="gold">Action · Bold Reframe</td><td>VSL</td></tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- PHASE 2: FRAMEWORKS -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P2</div>
      <h2 class="sec-title">Phase 2 — <em>Frameworks</em></h2>
    </div>
    <p class="sec-sub">Each concept gets exactly one body framework. Frameworks are how the script is built. Default is PAS-loop with retention beats every two seconds.</p>

    <div class="grid-2">
      <div class="card">
        <h3>Primary frameworks (pick one per reel)</h3>
        <table>
          <thead><tr><th>Framework</th><th>Best for</th></tr></thead>
          <tbody>
            <tr><td><b>PAS Loop</b> — Problem · Agitate · Solution · CTA, repeated</td><td>Most Value reels; default</td></tr>
            <tr><td><b>What / Why / How / Now</b></td><td>Education, teaching, free-resource CTAs</td></tr>
            <tr><td><b>Before / After / Bridge</b></td><td>Show, transformation, results</td></tr>
            <tr><td><b>Hero's Mistake</b></td><td>Share / origin stories</td></tr>
            <tr><td><b>Contrarian Reveal</b></td><td>Misconception, exposé, hot take</td></tr>
            <tr><td><b>Diagnostic Checklist</b></td><td>Save-bait, lead magnets, quizzes</td></tr>
            <tr><td><b>If-I-Had-To Playbook</b></td><td>Hormozi-style hypothetical</td></tr>
          </tbody>
        </table>
      </div>
      <div class="card">
        <h3>Framework assignments (current 9)</h3>
        <table>
          <thead><tr><th>#</th><th>Framework</th></tr></thead>
          <tbody>
            <tr><td>1</td><td>Contrarian Reveal → PAS Loop</td></tr>
            <tr><td>2</td><td>Hero's Mistake (Before/After/Bridge)</td></tr>
            <tr><td>3</td><td>What / Why / How / Now</td></tr>
            <tr><td>4</td><td>PAS Loop (avatar callout open)</td></tr>
            <tr><td>5</td><td>Contrarian Reveal → PAS Loop</td></tr>
            <tr><td>6</td><td>Before / After / Bridge</td></tr>
            <tr><td>7</td><td>Diagnostic Checklist</td></tr>
            <tr><td>8</td><td>If-I-Had-To Playbook</td></tr>
            <tr><td>9</td><td>Contrarian Reveal → CTA</td></tr>
          </tbody>
        </table>
      </div>
    </div>
  </section>

  <!-- PHASE 3: HOOKS -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P3</div>
      <h2 class="sec-title">Phase 3 — <em>Hooks</em> (AI-generated, human-curated)</h2>
    </div>
    <p class="sec-sub">For each concept we generate 30–50 hooks via AI, score each against the criteria, and surface the top 10–20 viable hooks for Alan to choose from.</p>

    <div class="card">
      <h4>Hook criteria — non-negotiable</h4>
      <ul class="check">
        <li><b>≤ 12 words.</b> Reads in 2 seconds or less.</li>
        <li><b>Pattern interrupt.</b> Contrarian, shocking, specific, or visceral.</li>
        <li><b>One of four formats:</b> bold question · controversial statement · surprising fact · biggest-mistake callout.</li>
        <li><b>Avatar resonance.</b> Names the avatar's pain, identity, or stage explicitly or implicitly.</li>
        <li><b>Curiosity gap.</b> Promises an answer they cannot guess.</li>
        <li><b>No fluff words:</b> just, really, kind of, maybe, basically.</li>
        <li><b>Conversational.</b> Sounds like a person, not a brand.</li>
      </ul>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Hook scoring rubric — score every candidate /10 across all six</h4>
      <table>
        <thead><tr><th>Variable</th><th>What 10/10 looks like</th></tr></thead>
        <tbody>
          <tr><td>Attention</td><td>Stops the thumb in &lt;1 second; visceral or contrarian opener.</td></tr>
          <tr><td>Specificity</td><td>Concrete numbers, names, or callouts. No vague claims.</td></tr>
          <tr><td>Avatar Fit</td><td>The right person feels personally addressed.</td></tr>
          <tr><td>Curiosity</td><td>Creates an open loop the brain must close.</td></tr>
          <tr><td>Clarity</td><td>Understood instantly, even with sound off.</td></tr>
          <tr><td>Brevity</td><td>≤ 12 words; no fluff; punchy rhythm.</td></tr>
        </tbody>
      </table>
      <p class="dim" style="margin-top:10px">Minimum to advance to Alan's review: <b class="gold">8/10 average</b>, no single variable below 7.</p>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>AI hook-generation prompt template (paste into Claude / GPT)</h4>
      <div class="code"><span class="com"># Role</span>
You are a direct-response copywriter for Ascend Prime Wealth, a business-funding
education company. The audience is medical practice owners and service operators
who need $100K–$500K+ in unsecured business funding without income docs.

<span class="com"># Task</span>
Generate <span class="key">40 short-form video hooks</span> for the concept below.

<span class="com"># Concept</span>
<span class="var">[paste concept name + 1-line angle here]</span>

<span class="com"># Hard rules</span>
- Each hook ≤ 12 words.
- Reads aloud in ≤ 2 seconds.
- One of four formats: bold question, controversial statement,
  surprising fact, biggest-mistake callout.
- Specific. Numbers and named pains beat abstractions.
- No filler: no "just", "really", "kind of", "maybe", "basically".
- Conversational. Human voice, not brand voice.

<span class="com"># Output</span>
Return a numbered list of 40 hooks. After each, append a 6-axis score
in the form [Att/Spc/Avt/Cur/Clr/Brv = X/10 each, AVG=X.X].
Then list the top 15 by average, keeping only hooks with avg ≥ 8 and
no axis below 7.</div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Manual curation pass — operator does this before sending to Alan</h4>
      <ul class="check">
        <li>Read every AI-shortlisted hook aloud. Cut anything that sounds robotic.</li>
        <li>Cull near-duplicates. Keep the strongest of any pair.</li>
        <li>Verify every factual claim. No invented numbers, no hallucinated stats.</li>
        <li>Confirm none violate APW compliance (no income guarantees, no "approval guaranteed" language).</li>
        <li>Surface 10–20 finalists in a single table for Alan: # · Hook · Format · Score · Notes.</li>
        <li>Highlight the operator's top 3 picks with reasoning.</li>
      </ul>
    </div>
  </section>

  <!-- PHASE 4: BODY SCRIPT -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P4</div>
      <h2 class="sec-title">Phase 4 — <em>Body Script</em></h2>
    </div>
    <p class="sec-sub">Once a hook is approved, build the body. Default structure is PAS in a loop, with a retention beat every 2 seconds, headlines over sentences, and a single clear CTA.</p>

    <div class="grid-2">
      <div class="card">
        <h4>Script architecture</h4>
        <ul class="check">
          <li><b>0:00–0:02 — Hook.</b> Approved from Phase 3. On-screen text matches verbatim.</li>
          <li><b>0:02–0:05 — Problem.</b> Name the pain in the avatar's exact words.</li>
          <li><b>0:05–0:10 — Agitate.</b> Show the cost of doing nothing — money, time, ego, opportunity.</li>
          <li><b>0:10–0:25 — Solution.</b> Mechanism reveal in 2–4 headline beats.</li>
          <li><b>0:25–0:40 — PAS Loop 2.</b> Mini objection → mini solution → micro-proof.</li>
          <li><b>0:40–0:50 — Stack value.</b> Specific numbers, names, or process detail.</li>
          <li><b>0:50–0:60 — CTA.</b> One ask. One keyword. One destination.</li>
        </ul>
      </div>
      <div class="card">
        <h4>Retention rules — every 2 seconds something changes</h4>
        <ul class="check">
          <li><b>Visual change:</b> cut, zoom, B-roll, overlay, or text pop.</li>
          <li><b>Verbal change:</b> new headline, new beat, new question.</li>
          <li><b>Pace change:</b> vary sentence length to break monotony.</li>
          <li><b>Pattern interrupt every 7–10s:</b> contrarian flip, callout, or proof drop.</li>
          <li><b>Speak in headlines.</b> No throat-clearing. No connectors. Lead with the answer.</li>
          <li><b>Read it aloud.</b> If you stumble, the viewer scrolls.</li>
        </ul>
      </div>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Body-script scoring rubric — every script must average <span class="gold">9+/10</span> before recording</h4>
      <table>
        <thead><tr><th>Variable</th><th>What 10/10 looks like</th><th>Self-test</th></tr></thead>
        <tbody>
          <tr><td>Hook strength</td><td>Stops scroll &lt; 1s, scored ≥ 9 in Phase 3.</td><td>Mute it. Still grab? Yes.</td></tr>
          <tr><td>Retention</td><td>Visual or verbal change every 2s; never two flat seconds in a row.</td><td>Mark each second on a timeline; gaps = rewrite.</td></tr>
          <tr><td>PAS execution</td><td>Problem→Agitate→Solution loops twice; second loop deeper than first.</td><td>Can you draw the loop on paper? Yes.</td></tr>
          <tr><td>Headline density</td><td>Every line could stand alone as a thumb-stopping caption.</td><td>Strip line numbers; each still hits.</td></tr>
          <tr><td>Specificity</td><td>Real numbers, real names, real timelines.</td><td>Zero vague claims; zero "many people".</td></tr>
          <tr><td>Avatar resonance</td><td>The avatar nods three times in 60s.</td><td>Read to a sample avatar; track nods.</td></tr>
          <tr><td>Mechanism clarity</td><td>Viewer can repeat the core idea after one watch.</td><td>Test on a non-expert.</td></tr>
          <tr><td>Trust / authority</td><td>One proof element baked into the body (number, screenshot, named source).</td><td>If you removed it, would credibility drop? Yes.</td></tr>
          <tr><td>Likability</td><td>One human moment — laugh, vulnerability, warmth — within the 60s.</td><td>If pure lecture, rewrite.</td></tr>
          <tr><td>CTA strength</td><td>One ask, one keyword, one destination, frictionless.</td><td>Could a 10-year-old execute it? Yes.</td></tr>
        </tbody>
      </table>
    </div>

    <div class="card" style="margin-top:18px">
      <h4>Script delivery format — what the operator sends Alan</h4>
      <div class="code"><span class="key">REEL #__ — [Concept Name]</span>
<span class="var">Pillar:</span>      Value / Share / Show / Action
<span class="var">Framework:</span>   PAS Loop · WWHN · BAB · Hero's Mistake · Contrarian · Diagnostic · If-I-Had-To
<span class="var">Hook:</span>        [approved Phase 3 hook]
<span class="var">CTA:</span>         [VSL / DM keyword / lead magnet]

<span class="com">--- SCRIPT ---</span>
[0:00] HOOK         "..."
[0:03] PROBLEM      "..."
[0:06] AGITATE      "..."
[0:10] SOLUTION 1   "..."
[0:18] HEADLINE     "..."
[0:25] LOOP 2 — P   "..."
[0:30] LOOP 2 — A   "..."
[0:35] LOOP 2 — S   "..."
[0:42] PROOF        "..." (number / name / screenshot)
[0:50] CTA          "..."

<span class="com">--- B-ROLL / VISUAL CUES ---</span>
[0:00] face-on, direct camera
[0:03] cut to text overlay: "..."
[0:06] B-roll: ...
...

<span class="com">--- SCORE ---</span>
Hook 10 · Retention 10 · PAS 10 · Headlines 10 · Specificity 10
Avatar 10 · Mechanism 10 · Authority 10 · Likability 10 · CTA 10
AVERAGE: __ / 10</div>
    </div>
  </section>

  <!-- PHASE 5: CAPTION -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P5</div>
      <h2 class="sec-title">Phase 5 — <em>Caption</em></h2>
    </div>
    <p class="sec-sub">Caption follows the documented Hook → Value → CTA structure. Sentences ≤ 1–2 lines. Emojis sparingly. Read aloud before posting.</p>

    <div class="grid-2">
      <div class="card">
        <h4>Caption template</h4>
        <div class="code"><span class="key">[HOOK LINE]</span>
Bold question / contrarian / surprising fact / biggest mistake.

<span class="key">[VALUE — 2–4 lines]</span>
1-line problem framing.
Then a tight bullet or numbered list:
✅ Point 1
✅ Point 2
✅ Point 3

<span class="key">[CTA — 1–2 lines]</span>
Comment "<span class="var">KEYWORD</span>" and I'll send it over.</div>
      </div>
      <div class="card">
        <h4>Caption review checklist</h4>
        <ul class="check">
          <li>Hook is one of the four approved formats.</li>
          <li>Every sentence earns its place. No filler.</li>
          <li>Read aloud — no stumbles, no fluff words.</li>
          <li>One CTA. One keyword. One destination.</li>
          <li>Spacing breaks long blocks. Mobile-readable.</li>
          <li>Compliance scan: no income promises, no guarantees.</li>
          <li>Brand voice: direct, warm, intelligent. No corporate stiffness.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- PHASE 6: RECORDING -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P6</div>
      <h2 class="sec-title">Phase 6 — <em>Recording</em></h2>
    </div>
    <p class="sec-sub">Batch record. One day per batch. Approved scripts only. No improvising new scripts on camera.</p>

    <div class="grid-2">
      <div class="card">
        <h4>Pre-roll checklist</h4>
        <ul class="check">
          <li>Script is approved and printed/teleprompter-loaded.</li>
          <li>Wardrobe matches brand: dark/clean palette; brand color accent (cyan, teal, purple, gold) where natural.</li>
          <li>Background framed: clean, on-brand, depth — no clutter.</li>
          <li>Lighting: key light at 45°, no harsh shadows; eyes catchlight visible.</li>
          <li>Audio: SM7dB or equivalent; gain set; backup recording on phone.</li>
          <li>Camera at eye level; vertical 9:16; 4K if possible.</li>
          <li>Energy check: stand up, breathe, smile reset before take.</li>
        </ul>
      </div>
      <div class="card">
        <h4>On-camera direction</h4>
        <ul class="check">
          <li>First 2 seconds: high energy, direct eye contact, hook word-for-word.</li>
          <li>Speak in headlines. Pause between beats. Let lines land.</li>
          <li>Vary pace: punchy → slower → punchy. Avoid monotone.</li>
          <li>Hand gestures within frame. Avoid covering face.</li>
          <li>Re-do takes ruthlessly. Two clean takes per beat minimum.</li>
          <li>Capture B-roll list immediately after main take.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- PHASE 7: PIPELINE -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P7</div>
      <h2 class="sec-title">Phase 7 — <em>Editing &amp; Pipeline</em></h2>
    </div>
    <p class="sec-sub">Mirrors the documented Shorts Pipeline. Statuses are tracked on the content board. Never skip a status — it breaks the chain of custody.</p>

    <div class="card">
      <h4>Pipeline statuses (in order)</h4>
      <table>
        <thead><tr><th>#</th><th>Status</th><th>Owner</th><th>Definition of done</th></tr></thead>
        <tbody>
          <tr><td>1</td><td>IDEAS</td><td>Alan / Operator</td><td>Concept logged with 1-line angle and pillar.</td></tr>
          <tr><td>2</td><td>SCRIPT ✅</td><td>Operator</td><td>Hook approved, body scored ≥ 9/10 avg, signed off by Alan.</td></tr>
          <tr><td>3</td><td>RECORDED</td><td>Alan</td><td>Raw footage uploaded to content folder.</td></tr>
          <tr><td>4</td><td>TO DO</td><td>Editor</td><td>File auto-routed; editor assigned.</td></tr>
          <tr><td>5</td><td>IN PROGRESS</td><td>Editor</td><td>Editor actively working; file in "Editing" folder.</td></tr>
          <tr><td>6</td><td>READY</td><td>Editor</td><td>First cut delivered for review.</td></tr>
          <tr><td>7</td><td>REVISION</td><td>Alan / Operator</td><td>Comments + screenshots returned with timestamps.</td></tr>
          <tr><td>8</td><td>READY (v2)</td><td>Editor</td><td>Revisions applied; back for review.</td></tr>
          <tr><td>9</td><td>APPROVED</td><td>Alan</td><td>Final lock. No more changes.</td></tr>
          <tr><td>10</td><td>POSTED — IG</td><td>Alan / Operator</td><td>Live on Instagram with final caption.</td></tr>
          <tr><td>11</td><td>POSTED — ALL</td><td>VA</td><td>Live on FB, TikTok, LinkedIn, Twitter/X.</td></tr>
        </tbody>
      </table>
    </div>
  </section>

  <!-- PHASE 8: PUBLISH & REPURPOSE -->
  <section>
    <div class="sec-head">
      <div class="sec-num">P8</div>
      <h2 class="sec-title">Phase 8 — <em>Publish &amp; Repurpose</em></h2>
    </div>
    <div class="grid-2">
      <div class="card">
        <h4>Publish protocol</h4>
        <ul class="check">
          <li>Post during avatar-active windows (test 7–9am CT and 6–9pm CT first).</li>
          <li>First 60 minutes: reply to every comment with personality + a question back.</li>
          <li>DM-keyword automation pre-armed before posting.</li>
          <li>Story re-share within 1 hour with a poll or question sticker.</li>
          <li>Track: views, watch-time %, saves, shares, DMs, link clicks.</li>
        </ul>
      </div>
      <div class="card">
        <h4>Repurpose tree</h4>
        <ul class="check">
          <li>IG Reel → FB Reel → TikTok → YouTube Short → LinkedIn → X.</li>
          <li>Caption → email blurb / newsletter snippet.</li>
          <li>Top performers (≥ 5x baseline views) → boost with paid for cold reach.</li>
          <li>Top hooks → carousel post variant.</li>
          <li>Top hooks → ad creative test pool.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- HOW TO WORK WITH ALAN -->
  <section>
    <div class="sec-head">
      <div class="sec-num">10</div>
      <h2 class="sec-title">How to <em>Work with Alan</em> — operator handbook</h2>
    </div>
    <p class="sec-sub">If you are new on the team, read this section twice. It will save you days of rework.</p>

    <div class="grid-2">
      <div class="card">
        <h4>Communication standard</h4>
        <ul class="check">
          <li><b>Lead with the answer.</b> Headlines first, context second.</li>
          <li><b>Brevity, but complete.</b> No filler. No throat-clearing.</li>
          <li><b>Tables for comparisons.</b> Side-by-side wherever possible.</li>
          <li><b>Copy-paste-ready.</b> If Alan can't paste it into IG/email/SMS as-is, it's not done.</li>
          <li><b>Verify before stating.</b> Separate fact from inference. Label uncertainty.</li>
          <li><b>Never assume context.</b> Ask once, then proceed.</li>
          <li><b>Direct, warm, intelligent.</b> No bureaucratic tone, no false hype.</li>
        </ul>
      </div>
      <div class="card">
        <h4>Decision protocol</h4>
        <ul class="check">
          <li><b>Always present options.</b> Alan selects; team executes.</li>
          <li><b>Recommend a top pick.</b> With one-line reasoning.</li>
          <li><b>Score every variable.</b> 10/10 rubric on hooks and scripts.</li>
          <li><b>Flag tradeoffs.</b> Speed vs polish, reach vs depth, etc.</li>
          <li><b>One clear next step.</b> Every deliverable ends with "what's next."</li>
        </ul>
      </div>
    </div>

    <div class="grid-2" style="margin-top:18px">
      <div class="card">
        <h4>Brand standards</h4>
        <ul class="check">
          <li>Colors: cyan <span class="cyan">#00C6E8</span>, teal <span class="teal">#1AD4C8</span>, purple <span class="purple">#9B30D0</span>, gold <span class="gold">#C9A030</span>.</li>
          <li>Theme: cosmic / celestial / golden pathway on dark navy.</li>
          <li>Voice: direct · warm · grounded · spiritually aligned · execution-first.</li>
          <li>Avatar: medical operators + qualified entrepreneurs only.</li>
          <li>Compliance: no income promises, no "guaranteed approval," no debt-erasure language.</li>
        </ul>
      </div>
      <div class="card">
        <h4>Failure modes — avoid these at all costs</h4>
        <ul class="check">
          <li>Word-vomit responses with no headline.</li>
          <li>Missing details Alan already provided.</li>
          <li>Hallucinated stats, statutes, or claims.</li>
          <li>Generic motivational language.</li>
          <li>Repeated clarifying questions when context is sufficient.</li>
          <li>Content aimed at the wrong stage of avatar.</li>
          <li>CTAs with more than one ask.</li>
        </ul>
      </div>
    </div>
  </section>

  <!-- MASTER CHECKLIST -->
  <section>
    <div class="sec-head">
      <div class="sec-num">★</div>
      <h2 class="sec-title">Master <em>Checklist</em> — print this</h2>
    </div>
    <p class="sec-sub">One reel from idea to "Posted — ALL." Use this as the single source of truth on the content board.</p>

    <div class="card">
      <h4>Per-reel checklist</h4>
      <ul class="check">
        <li>Concept logged · pillar assigned · 1-line angle written.</li>
        <li>Concept passes all 5 concept criteria.</li>
        <li>Framework selected from approved list.</li>
        <li>40 hooks generated via AI prompt template.</li>
        <li>Hooks scored on 6-axis rubric; ≥ 8 avg, no axis &lt; 7.</li>
        <li>Top 10–20 hooks curated and presented to Alan with operator's top 3.</li>
        <li>Hook approved by Alan.</li>
        <li>Body script written using assigned framework + PAS loop.</li>
        <li>Retention beat present every 2 seconds (timeline-checked).</li>
        <li>Script scored on 10-axis rubric; avg ≥ 9/10.</li>
        <li>Script approved by Alan.</li>
        <li>Caption drafted: Hook → Value → CTA, sentences ≤ 2 lines.</li>
        <li>Caption read aloud; fluff stripped; one CTA only.</li>
        <li>Compliance scan complete (no guarantees, no income promises).</li>
        <li>Recorded in batch session; B-roll captured.</li>
        <li>Footage uploaded to content folder; pipeline status updated.</li>
        <li>Edit reviewed; revisions returned with timestamps.</li>
        <li>Final approved by Alan.</li>
        <li>Posted to IG; DM keyword automation armed.</li>
        <li>Story re-share within 1 hour with engagement sticker.</li>
        <li>Comments answered in first 60 minutes.</li>
        <li>Posted across FB, TikTok, LinkedIn, X by VA.</li>
        <li>Performance logged at 24h, 72h, and 7d.</li>
        <li>Top performers flagged for boost / repurpose / ad-test.</li>
      </ul>
    </div>

    <div class="callout" style="margin-top:18px">
      <h4>Operator promise to Alan</h4>
      <p>Every deliverable arrives with: <b>(a)</b> options to choose from, <b>(b)</b> a recommended pick with one-line reasoning, <b>(c)</b> scores against the rubric, and <b>(d)</b> a clear next step. Alan decides. Team executes.</p>
    </div>
  </section>

  <hr class="div" />

  <footer>
    <span>APW · Reels Master SOP · v1.0</span>
    <span>Owner · Alan Nguyen</span>
    <span>Print-friendly · Mobile-ready</span>
  </footer>

</div>
</body>
</html>
