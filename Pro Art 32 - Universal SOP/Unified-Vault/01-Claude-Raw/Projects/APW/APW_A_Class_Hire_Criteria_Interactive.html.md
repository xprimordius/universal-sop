---
title: APW_A_Class_Hire_Criteria_Interactive.html
source: claude
type: project-doc
project: APW
person: alan
created: "2026-04-16T01:32:30.250321+00:00"
uuid: 0c6caec8-fe2f-4880-9307-69f753e3ba2b
tags:
  - claude
  - alan
  - apw
---
# APW_A_Class_Hire_Criteria_Interactive.html

> [!info] From project: [[_Project Info|APW]]

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>A-Class Growth Partner — Ascend Prime Wealth</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;600;700&family=Inter:wght@300;400;500;600;700;800&display=swap');

  :root {
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

    --bg: #FBF9F4;
    --panel: #FFFFFF;
    --panel-soft: #FAF7F0;
    --border: #E8DFC8;
    --border-soft: #F0E8D4;

    --text: #1A1F2E;
    --text-soft: #3D4556;
    --text-dim: #6B7488;
    --text-faint: #9CA3B4;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; -webkit-tap-highlight-color: transparent; }

  body {
    font-family: 'Inter', -apple-system, sans-serif;
    background: var(--bg);
    color: var(--text);
    line-height: 1.6;
    min-height: 100vh;
    overflow-x: hidden;
    position: relative;
  }

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

  .wrap {
    position: relative;
    z-index: 1;
    max-width: 920px;
    margin: 0 auto;
    padding: 56px 20px 80px;
  }

  /* HERO */
  .hero { text-align: center; margin-bottom: 36px; padding: 16px 8px; }

  .eyebrow {
    display: inline-block;
    font-size: 0.7rem;
    font-weight: 700;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--gold-deep);
    padding: 8px 18px;
    border: 1.5px solid var(--gold);
    border-radius: 100px;
    background: rgba(184, 144, 42, 0.08);
    margin-bottom: 28px;
  }

  h1 {
    font-family: 'Cormorant Garamond', serif;
    font-size: clamp(2.6rem, 7vw, 4rem);
    font-weight: 700;
    line-height: 1.05;
    margin-bottom: 20px;
    background: linear-gradient(135deg, var(--purple-deep) 0%, var(--cyan-deep) 60%, var(--gold-deep) 100%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    letter-spacing: -0.01em;
  }

  .subtitle {
    font-size: clamp(1.05rem, 2.5vw, 1.18rem);
    color: var(--text-soft);
    max-width: 640px;
    margin: 0 auto;
    font-weight: 400;
  }

  /* HOW TO USE BANNER */
  .how-to {
    background: linear-gradient(135deg, var(--purple-light), var(--cyan-light));
    border: 1.5px solid rgba(139, 43, 192, 0.20);
    border-radius: 14px;
    padding: 18px 22px;
    margin-bottom: 32px;
    display: flex;
    align-items: center;
    gap: 14px;
    box-shadow: 0 4px 16px rgba(139, 43, 192, 0.06);
  }

  .how-to-icon {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--purple), var(--cyan));
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.3rem;
    flex-shrink: 0;
    box-shadow: 0 4px 12px rgba(139, 43, 192, 0.25);
  }

  .how-to-text { font-size: 0.92rem; color: var(--text-soft); line-height: 1.5; }
  .how-to-text strong { color: var(--purple-deep); font-weight: 700; }

  /* CONTROLS */
  .controls {
    display: flex;
    gap: 10px;
    margin-bottom: 24px;
    justify-content: flex-end;
  }

  .ctrl-btn {
    font-family: 'Inter', sans-serif;
    font-size: 0.72rem;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding: 8px 16px;
    border-radius: 100px;
    border: 1.5px solid var(--border);
    background: var(--panel);
    color: var(--text-soft);
    cursor: pointer;
    transition: all 0.2s ease;
  }

  .ctrl-btn:hover, .ctrl-btn:active {
    border-color: var(--purple);
    color: var(--purple-deep);
    background: var(--purple-light);
    transform: translateY(-1px);
  }

  /* STANDARD INTRO BLOCK */
  .standard {
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 18px;
    padding: 32px 28px;
    margin-bottom: 32px;
    text-align: center;
    position: relative;
    box-shadow: 0 4px 24px rgba(139, 43, 192, 0.06), 0 1px 3px rgba(0, 0, 0, 0.04);
  }

  .standard::before {
    content: '';
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 4px;
    background: linear-gradient(90deg, var(--cyan), var(--purple), var(--gold));
    border-radius: 0 0 4px 4px;
  }

  .standard p {
    font-size: 1.06rem;
    color: var(--text-soft);
    font-weight: 400;
    line-height: 1.7;
  }
  .standard p + p { margin-top: 12px; }
  .standard strong { color: var(--purple-deep); font-weight: 700; }

  /* COLLAPSIBLE SECTION */
  .section {
    background: var(--panel);
    border: 1.5px solid var(--border);
    border-radius: 16px;
    margin-bottom: 18px;
    overflow: hidden;
    box-shadow: 0 2px 12px rgba(26, 31, 46, 0.04);
    transition: all 0.25s ease;
  }

  .section:hover {
    box-shadow: 0 6px 24px rgba(139, 43, 192, 0.08);
    border-color: rgba(139, 43, 192, 0.25);
  }

  .section.open { box-shadow: 0 8px 32px rgba(139, 43, 192, 0.10); }

  .section-header {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 22px 26px;
    cursor: pointer;
    user-select: none;
    transition: background 0.2s ease;
    flex-wrap: wrap;
  }

  .section-header:hover {
    background: linear-gradient(135deg, rgba(139, 43, 192, 0.04), rgba(0, 168, 200, 0.03));
  }

  .section-header:active {
    background: linear-gradient(135deg, rgba(139, 43, 192, 0.10), rgba(0, 168, 200, 0.08));
    transform: scale(0.998);
  }

  .section.open .section-header {
    background: linear-gradient(135deg, rgba(139, 43, 192, 0.06), rgba(0, 168, 200, 0.04));
    border-bottom: 1px solid var(--border-soft);
  }

  .section-num {
    font-family: 'Cormorant Garamond', serif;
    font-size: 2.2rem;
    font-weight: 700;
    line-height: 1;
    min-width: 44px;
    background: linear-gradient(135deg, var(--gold) 0%, var(--gold-deep) 100%);
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    transition: transform 0.3s ease;
  }

  .section.open .section-num { transform: scale(1.05); }

  .section-title {
    font-size: 1.4rem;
    font-weight: 800;
    color: var(--text);
    letter-spacing: -0.015em;
    flex: 1;
    min-width: 0;
  }

  .section-tag {
    display: inline-block;
    font-size: 0.62rem;
    font-weight: 800;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    padding: 5px 12px;
    border-radius: 100px;
  }
  .tag-cyan { color: var(--cyan-deep); background: var(--cyan-light); border: 1.5px solid rgba(0, 168, 200, 0.35); }
  .tag-gold { color: var(--gold-deep); background: var(--gold-light); border: 1.5px solid rgba(184, 144, 42, 0.35); }
  .tag-purple { color: var(--purple-deep); background: var(--purple-light); border: 1.5px solid rgba(139, 43, 192, 0.30); }

  /* CHEVRON */
  .chevron {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--cyan), var(--purple));
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
    flex-shrink: 0;
    box-shadow: 0 3px 10px rgba(139, 43, 192, 0.25);
  }

  .section-header:hover .chevron {
    transform: scale(1.1);
    box-shadow: 0 5px 16px rgba(139, 43, 192, 0.4);
  }

  .section.open .chevron {
    transform: rotate(180deg);
    background: linear-gradient(135deg, var(--gold), var(--gold-deep));
    box-shadow: 0 3px 10px rgba(184, 144, 42, 0.35);
  }

  .section.open .section-header:hover .chevron {
    transform: rotate(180deg) scale(1.1);
  }

  .chevron svg {
    width: 18px;
    height: 18px;
    stroke: white;
    stroke-width: 3;
    fill: none;
    stroke-linecap: round;
    stroke-linejoin: round;
  }

  /* COLLAPSIBLE BODY */
  .section-body {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.5s cubic-bezier(0.4, 0, 0.2, 1);
  }

  .section.open .section-body { max-height: 12000px; }

  .section-body-inner { padding: 26px 28px 30px; }

  .section-intro {
    font-size: 0.96rem;
    color: var(--text-dim);
    margin-bottom: 22px;
    font-style: italic;
    padding-bottom: 16px;
    border-bottom: 1px dashed var(--border);
  }

  /* CARD GRID */
  .grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 12px;
  }

  .card {
    background: var(--panel-soft);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 18px 18px 18px 22px;
    transition: all 0.2s ease;
    border-left: 4px solid var(--cyan);
    cursor: default;
  }

  .card:hover, .card:active {
    transform: translateY(-3px);
    box-shadow: 0 8px 24px rgba(139, 43, 192, 0.10);
    border-left-color: var(--gold);
  }

  .section.values .card { border-left-color: var(--gold); }
  .section.values .card:hover, .section.values .card:active {
    background: var(--gold-light);
    border-left-color: var(--purple);
    box-shadow: 0 8px 24px rgba(184, 144, 42, 0.15);
  }

  .section.abilities .card { border-left-color: var(--cyan); }
  .section.abilities .card:hover, .section.abilities .card:active {
    background: var(--cyan-light);
    border-left-color: var(--purple);
    box-shadow: 0 8px 24px rgba(0, 168, 200, 0.15);
  }

  .section.own .card { border-left-color: var(--purple); }
  .section.own .card:hover, .section.own .card:active {
    background: var(--purple-light);
    border-left-color: var(--gold);
    box-shadow: 0 8px 24px rgba(139, 43, 192, 0.15);
  }

  .section.get .card { border-left-color: var(--gold); }
  .section.get .card:hover, .section.get .card:active {
    background: var(--gold-light);
    border-left-color: var(--cyan);
    box-shadow: 0 8px 24px rgba(184, 144, 42, 0.15);
  }

  .card-title { font-size: 0.98rem; font-weight: 700; color: var(--text); margin-bottom: 5px; }
  .card-desc { font-size: 0.86rem; color: var(--text-soft); line-height: 1.55; }

  /* PROSE */
  .prose { font-size: 0.96rem; color: var(--text-soft); line-height: 1.7; }
  .prose p + p { margin-top: 12px; }
  .prose strong { color: var(--purple-deep); font-weight: 700; }

  /* LOGISTICS */
  .logistics {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 14px;
  }

  .logistics-item {
    background: var(--panel-soft);
    border: 1px solid var(--border);
    border-left: 4px solid var(--gold);
    border-radius: 10px;
    padding: 14px 18px 14px 22px;
    font-size: 0.93rem;
    color: var(--text-soft);
    font-weight: 500;
    transition: all 0.2s ease;
  }

  .logistics-item:hover, .logistics-item:active {
    background: var(--gold-light);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(184, 144, 42, 0.15);
  }

  /* NOT A FIT */
  .not-fit-list { list-style: none; display: grid; gap: 10px; }

  .not-fit-list li {
    background: var(--panel-soft);
    border: 1px solid var(--border);
    border-left: 4px solid var(--purple);
    border-radius: 10px;
    padding: 14px 18px 14px 44px;
    font-size: 0.94rem;
    color: var(--text-soft);
    position: relative;
    font-weight: 500;
    transition: all 0.2s ease;
    cursor: default;
  }

  .not-fit-list li:hover, .not-fit-list li:active {
    background: var(--purple-light);
    transform: translateX(4px);
    box-shadow: 0 4px 14px rgba(139, 43, 192, 0.12);
  }

  .not-fit-list li::before {
    content: '✕';
    position: absolute;
    left: 18px;
    top: 50%;
    transform: translateY(-50%);
    color: var(--purple);
    font-weight: 800;
    font-size: 1rem;
  }

  /* APPLICATION STEPS */
  .apply-steps { display: grid; gap: 14px; counter-reset: step; }

  .apply-step {
    background: var(--panel-soft);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 20px 22px 20px 64px;
    position: relative;
    counter-increment: step;
    transition: all 0.2s ease;
  }

  .apply-step:hover, .apply-step:active {
    background: var(--cyan-light);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0, 168, 200, 0.15);
  }

  .apply-step::before {
    content: counter(step);
    position: absolute;
    left: 18px;
    top: 18px;
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--cyan), var(--purple));
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 800;
    font-size: 0.95rem;
    box-shadow: 0 3px 10px rgba(139, 43, 192, 0.3);
    transition: transform 0.2s ease;
  }

  .apply-step:hover::before { transform: scale(1.1) rotate(-5deg); }

  .apply-step-title { font-size: 1rem; font-weight: 700; color: var(--text); margin-bottom: 6px; }
  .apply-step-desc { font-size: 0.9rem; color: var(--text-soft); line-height: 1.55; }
  .apply-step-desc strong { color: var(--purple-deep); font-weight: 700; }

  /* APPLICATION QUESTION CARDS (highlighted) */
  .question-feature {
    background: linear-gradient(135deg, var(--purple-light), var(--cyan-light));
    border: 1.5px solid rgba(139, 43, 192, 0.25);
    border-radius: 14px;
    padding: 22px 24px;
    margin-top: 14px;
    box-shadow: 0 4px 16px rgba(139, 43, 192, 0.08);
  }

  .question-feature-label {
    display: inline-block;
    font-size: 0.6rem;
    font-weight: 800;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    color: var(--purple-deep);
    background: white;
    padding: 4px 10px;
    border-radius: 6px;
    margin-bottom: 12px;
    border: 1px solid rgba(139, 43, 192, 0.25);
  }

  .question-feature-q {
    font-size: 1.02rem;
    font-weight: 700;
    color: var(--text);
    margin-bottom: 10px;
    line-height: 1.5;
  }

  .question-feature-desc {
    font-size: 0.88rem;
    color: var(--text-soft);
    line-height: 1.55;
    font-style: italic;
  }

  .goal-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 12px;
    margin-top: 14px;
  }

  .goal-card {
    background: white;
    border: 1.5px solid rgba(139, 43, 192, 0.20);
    border-radius: 10px;
    padding: 14px 16px;
    transition: all 0.2s ease;
  }

  .goal-card:hover, .goal-card:active {
    transform: translateY(-2px);
    border-color: var(--purple);
    box-shadow: 0 6px 16px rgba(139, 43, 192, 0.15);
  }

  .goal-horizon {
    font-size: 0.62rem;
    font-weight: 800;
    letter-spacing: 1.2px;
    text-transform: uppercase;
    color: var(--cyan-deep);
    margin-bottom: 4px;
  }

  .goal-label {
    font-size: 0.94rem;
    font-weight: 700;
    color: var(--text);
    margin-bottom: 4px;
  }

  .goal-prompt {
    font-size: 0.82rem;
    color: var(--text-dim);
    line-height: 1.5;
  }

  /* SOP STYLES */
  .sop-block {
    background: var(--panel-soft);
    border: 1px solid var(--border);
    border-left: 4px solid var(--cyan);
    border-radius: 12px;
    padding: 20px 22px;
    margin-bottom: 14px;
    transition: all 0.2s ease;
  }

  .sop-block:hover, .sop-block:active {
    background: var(--cyan-light);
    border-left-color: var(--purple);
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(0, 168, 200, 0.12);
  }

  .sop-block-title {
    font-size: 1.02rem;
    font-weight: 800;
    color: var(--text);
    margin-bottom: 8px;
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .sop-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    border-radius: 8px;
    background: linear-gradient(135deg, var(--cyan), var(--purple));
    color: white;
    font-size: 0.85rem;
    font-weight: 800;
    flex-shrink: 0;
  }

  .sop-block-desc {
    font-size: 0.9rem;
    color: var(--text-soft);
    line-height: 1.6;
  }
  .sop-block-desc strong { color: var(--purple-deep); font-weight: 700; }
  .sop-block-desc em { color: var(--gold-deep); font-style: italic; font-weight: 600; }

  .sop-list {
    margin-top: 10px;
    list-style: none;
    display: grid;
    gap: 6px;
  }

  .sop-list li {
    font-size: 0.86rem;
    color: var(--text-soft);
    padding-left: 22px;
    position: relative;
    line-height: 1.55;
  }

  .sop-list li::before {
    content: '◆';
    position: absolute;
    left: 4px;
    top: 0;
    color: var(--gold);
    font-size: 0.65rem;
    top: 6px;
  }

  .kpi-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
    gap: 8px;
    margin-top: 12px;
  }

  .kpi-cell {
    background: white;
    border: 1px solid var(--border);
    border-radius: 8px;
    padding: 10px 12px;
    text-align: center;
    transition: all 0.2s ease;
  }

  .kpi-cell:hover, .kpi-cell:active {
    background: var(--gold-light);
    border-color: var(--gold);
    transform: translateY(-2px);
  }

  .kpi-cell-label {
    font-size: 0.6rem;
    font-weight: 800;
    letter-spacing: 1px;
    text-transform: uppercase;
    color: var(--gold-deep);
  }

  /* FOOTER */
  .footer {
    text-align: center;
    margin-top: 56px;
    padding-top: 36px;
    border-top: 1px solid var(--border);
  }

  .footer-tagline {
    font-family: 'Cormorant Garamond', serif;
    font-style: italic;
    font-size: 1.4rem;
    background: linear-gradient(135deg, var(--gold-deep), var(--purple-deep));
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    margin-bottom: 10px;
    font-weight: 600;
  }

  .footer-brand {
    font-size: 0.72rem;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--text-faint);
    font-weight: 600;
  }

  /* MOBILE */
  @media (max-width: 700px) {
    .wrap { padding: 36px 16px 60px; }
    .hero { margin-bottom: 28px; padding: 8px 4px; }
    .how-to { padding: 14px 16px; gap: 12px; }
    .how-to-icon { width: 36px; height: 36px; font-size: 1.1rem; }
    .how-to-text { font-size: 0.85rem; }
    .controls { justify-content: center; }
    .ctrl-btn { font-size: 0.66rem; padding: 7px 14px; }
    .standard { padding: 24px 20px; margin-bottom: 28px; }
    .standard p { font-size: 1rem; }
    .section-header { padding: 18px 20px; gap: 12px; }
    .section-num { font-size: 1.8rem; min-width: 34px; }
    .section-title { font-size: 1.18rem; }
    .section-tag { font-size: 0.56rem; padding: 4px 9px; }
    .chevron { width: 32px; height: 32px; }
    .chevron svg { width: 16px; height: 16px; }
    .section-body-inner { padding: 22px 20px 24px; }
    .section-intro { font-size: 0.9rem; margin-bottom: 18px; }
    .card { padding: 16px 16px 16px 20px; }
    .apply-step { padding: 18px 20px 18px 60px; }
    .question-feature { padding: 18px 20px; }
    .sop-block { padding: 18px 20px; }
  }
</style>
</head>
<body>
  <div class="wrap">

    <header class="hero">
      <div class="eyebrow">Ascend Prime Wealth</div>
      <h1>A-Class Growth Partner</h1>
      <p class="subtitle">We're hiring someone exceptional. Not average. Not "good enough." Someone who treats their work as a craft and their role as a mission.</p>
    </header>

    <!-- HOW TO USE -->
    <div class="how-to">
      <div class="how-to-icon">✦</div>
      <div class="how-to-text">
        <strong>How this works:</strong> Tap any section header below to expand or collapse it. Tap or hover over cards to see them light up. Read carefully — if this resonates, you might be exactly who we're looking for.
      </div>
    </div>

    <div class="controls">
      <button class="ctrl-btn" onclick="expandAll()">Expand All</button>
      <button class="ctrl-btn" onclick="collapseAll()">Collapse All</button>
    </div>

    <div class="standard">
      <p>You go above and beyond by default. You're <strong>sharp, organized, emotionally intelligent, and proactive</strong>. You catch problems before they happen. You communicate clearly. You take ownership without ego. You're a joy to work with — and you make everyone around you better.</p>
    </div>

    <!-- 01: ABOUT APW -->
    <div class="section" id="s1">
      <div class="section-header" onclick="toggleSection('s1')">
        <div class="section-num">01</div>
        <div class="section-title">About APW</div>
        <div class="section-tag tag-purple">Who We Are</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <div class="prose">
            <p><strong>Ascend Prime Wealth (APW)</strong> is a business funding education and coaching company based in Minneapolis, MN. We help medical practice owners and entrepreneurs unlock significant unsecured business capital through credit optimization, entity setup, and sequenced application execution. We're not a "done-for-you" funder — we teach our clients to fund themselves, repeatedly and independently, for life.</p>
            <p>Founded and led by <strong>Alan Nguyen</strong>, an entrepreneur, strategist, and lifelong student of mastery. Alan moves fast, thinks in systems, and holds an extremely high bar for quality, integrity, and execution. Working directly with him means working at the source — close to every decision, every offer, every move. It's intense, high-trust, and high-growth.</p>
            <p>We're building something that genuinely changes lives — and we're looking for someone who wants to be part of that mission, not just collect a paycheck.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- 02: VALUES -->
    <div class="section values" id="s2">
      <div class="section-header" onclick="toggleSection('s2')">
        <div class="section-num">02</div>
        <div class="section-title">Values</div>
        <div class="section-tag tag-cyan">Non-Negotiable</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">Who you are at your core — before any skill, tool, or task.</p>
          <div class="grid">
            <div class="card"><div class="card-title">Outstanding Worker</div><div class="card-desc">Top-of-class. Always goes above and beyond what's expected.</div></div>
            <div class="card"><div class="card-title">Self-Driven Excellence</div><div class="card-desc">Constantly striving to do more than what's asked. Internal standards higher than external ones.</div></div>
            <div class="card"><div class="card-title">Heart in Everything</div><div class="card-desc">Puts genuine care into the work — it's craft, not just output.</div></div>
            <div class="card"><div class="card-title">Values Quality</div><div class="card-desc">Cares deeply about the quality of their work, not just completion.</div></div>
            <div class="card"><div class="card-title">Positive Impact</div><div class="card-desc">Motivated by the difference they create for others.</div></div>
            <div class="card"><div class="card-title">Positive Attitude</div><div class="card-desc">Sees the light in everything and inspires that light in others.</div></div>
            <div class="card"><div class="card-title">Loving & Kind</div><div class="card-desc">Joy to be around. Radiates warm, uplifting energy to the team.</div></div>
            <div class="card"><div class="card-title">Sharp & Wise</div><div class="card-desc">Quick, smart, intelligent — without ego or arrogance.</div></div>
            <div class="card"><div class="card-title">Team Player</div><div class="card-desc">Focused on contribution and service. Quality customer support spirit.</div></div>
            <div class="card"><div class="card-title">Detail Oriented</div><div class="card-desc">Catches what others miss. Precision is a default, not an effort.</div></div>
            <div class="card"><div class="card-title">Organized & Structured</div><div class="card-desc">Systems-minded. Clean workflows, clean files, clean thinking.</div></div>
            <div class="card"><div class="card-title">Honest & Upfront</div><div class="card-desc">Tells the truth all the time — especially when it's hard.</div></div>
            <div class="card"><div class="card-title">Critical Thinker</div><div class="card-desc">Excellent problem-solving and reasoning skills.</div></div>
            <div class="card"><div class="card-title">Natural Leader</div><div class="card-desc">Steps up. Sets tone. Brings others with them.</div></div>
            <div class="card"><div class="card-title">Inspired & Inspirational</div><div class="card-desc">Lit up by the work — and lights others up too.</div></div>
            <div class="card"><div class="card-title">Emotionally Intelligent</div><div class="card-desc">Empathetic, mindful, thoughtful, and conscientious in every interaction.</div></div>
            <div class="card"><div class="card-title">Discretion</div><div class="card-desc">Trustworthy with sensitive financial, legal, and client information.</div></div>
            <div class="card"><div class="card-title">Coachable</div><div class="card-desc">Takes feedback without ego. Integrates it immediately.</div></div>
          </div>
        </div>
      </div>
    </div>

    <!-- 03: ABILITIES -->
    <div class="section abilities" id="s3">
      <div class="section-header" onclick="toggleSection('s3')">
        <div class="section-num">03</div>
        <div class="section-title">Abilities</div>
        <div class="section-tag tag-cyan">Must Have</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">What you can actually do — proven, in motion, under pressure.</p>
          <div class="grid">
            <div class="card"><div class="card-title">Time Management</div><div class="card-desc">Calendar, priorities, deadlines, follow-through. EA / growth-partner-grade time mastery.</div></div>
            <div class="card"><div class="card-title">Multi-Source Processing</div><div class="card-desc">Proficiently processes multiple sources of information, data, and variables.</div></div>
            <div class="card"><div class="card-title">In-Flow Processing</div><div class="card-desc">Handles multi-variable data simultaneously and on the fly without dropping balls.</div></div>
            <div class="card"><div class="card-title">Lab-Grade Precision</div><div class="card-desc">Operates with mental clarity and surgical accuracy.</div></div>
            <div class="card"><div class="card-title">Self-Aware</div><div class="card-desc">Deep, honest awareness of self, strengths, and blind spots.</div></div>
            <div class="card"><div class="card-title">Owns Mistakes Fast</div><div class="card-desc">Quick to identify and bring own mistakes to light — humbly, directly, shamelessly.</div></div>
            <div class="card"><div class="card-title">Course-Corrects Cleanly</div><div class="card-desc">Adjusts effectively without drama or delay.</div></div>
            <div class="card"><div class="card-title">Constant Improvement</div><div class="card-desc">Always refining self, systems, outputs, and growth across the board.</div></div>
            <div class="card"><div class="card-title">Clear Communicator</div><div class="card-desc">Simple, sharp, excellent — written and verbal. No fluff.</div></div>
            <div class="card"><div class="card-title">Priority Triage</div><div class="card-desc">Identifies priority levels of new and existing tasks. Updates the priority list on the fly.</div></div>
            <div class="card"><div class="card-title">Realistic Time Estimation</div><div class="card-desc">Assigns reasonable durations to tasks for quickest proficient completion at ~50% probability of success — like the Musk method. Aggressive but honest.</div></div>
            <div class="card"><div class="card-title">Constraint Solver</div><div class="card-desc">Identifies business constraints and creates effective solutions for each as they arise.</div></div>
            <div class="card"><div class="card-title">Anticipates Needs</div><div class="card-desc">Reads what team and clients need before they ask.</div></div>
            <div class="card"><div class="card-title">Proactive, Not Reactive</div><div class="card-desc">Identifies problems BEFORE they happen and resolves them — so we're never firefighting.</div></div>
            <div class="card"><div class="card-title">Fast Learner</div><div class="card-desc">Picks up new tools, systems, and concepts quickly and proficiently.</div></div>
            <div class="card"><div class="card-title">Resourceful & Self-Sufficient</div><div class="card-desc">Finds answers themselves for self, system, and clients. Asks great questions when needed. Doesn't need babysitting.</div></div>
            <div class="card"><div class="card-title">Closes the Loop</div><div class="card-desc">Nothing falls through the cracks. Always reports back when complete.</div></div>
            <div class="card"><div class="card-title">Bias to Action</div><div class="card-desc">Moves without needing permission for low-stakes decisions.</div></div>
            <div class="card"><div class="card-title">Tech-Fluent</div><div class="card-desc">Comfortable with GoHighLevel, Slack, Notion, Google Workspace, ChatGPT/Claude, Loom, Zoom.</div></div>
          </div>
        </div>
      </div>
    </div>

    <!-- 04: WHAT YOU'LL OWN -->
    <div class="section own" id="s4">
      <div class="section-header" onclick="toggleSection('s4')">
        <div class="section-num">04</div>
        <div class="section-title">What You'll Own</div>
        <div class="section-tag tag-purple">Day-to-Day</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">You'll be Alan's right hand. Part Executive Assistant, part Growth Partner, part Operations Coordinator — and 100% mission-critical.</p>
          <div class="grid">
            <div class="card"><div class="card-title">Calendar & Inbox</div><div class="card-desc">Own Alan's schedule, protect his deep-work time, triage messages, draft replies.</div></div>
            <div class="card"><div class="card-title">Task & Project Coordination</div><div class="card-desc">Track every open loop across business, legal, marketing, and personal projects. Nothing falls through.</div></div>
            <div class="card"><div class="card-title">Client & Vendor Communication</div><div class="card-desc">Professional, warm, on-brand correspondence with clients, contractors, partners, and team.</div></div>
            <div class="card"><div class="card-title">Meeting Prep & Follow-Up</div><div class="card-desc">Agendas, notes, action items, accountability. Every meeting closes a loop.</div></div>
            <div class="card"><div class="card-title">Research & Briefings</div><div class="card-desc">Fast, accurate, well-organized briefs on people, tools, vendors, and opportunities.</div></div>
            <div class="card"><div class="card-title">Document & File Organization</div><div class="card-desc">Clean systems in Google Drive, Notion, GoHighLevel. Find anything in 10 seconds.</div></div>
            <div class="card"><div class="card-title">Light Project Management</div><div class="card-desc">Coordinating with contractors, designers, copywriters, and the broader APW team.</div></div>
            <div class="card"><div class="card-title">Personal Logistics</div><div class="card-desc">Travel, appointments, errands, life admin as needed.</div></div>
            <div class="card"><div class="card-title">Systems Improvement</div><div class="card-desc">Proactively identify inefficiencies and propose better workflows.</div></div>
            <div class="card"><div class="card-title">Growth Path</div><div class="card-desc">Evolves into higher-leverage work over time — content, marketing, client onboarding, team leadership.</div></div>
          </div>
        </div>
      </div>
    </div>

    <!-- 05: WHAT YOU GET -->
    <div class="section get" id="s5">
      <div class="section-header" onclick="toggleSection('s5')">
        <div class="section-num">05</div>
        <div class="section-title">What You Get</div>
        <div class="section-tag tag-gold">Why This Role</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">This isn't just a job — it's a front-row seat to building something extraordinary.</p>
          <div class="grid">
            <div class="card"><div class="card-title">Direct Mentorship</div><div class="card-desc">Exposure to high-level business strategy, offer building, marketing, sales, legal, and entrepreneurship at a level most pay tens of thousands to access.</div></div>
            <div class="card"><div class="card-title">Real Growth Path</div><div class="card-desc">Start as Growth Partner / EA. Grow into Chief of Staff, Operations Lead, or wherever your strengths take you.</div></div>
            <div class="card"><div class="card-title">Mission-Driven Work</div><div class="card-desc">Every client we help unlocks real freedom and possibility in their lives. Your work matters.</div></div>
            <div class="card"><div class="card-title">High-Trust Environment</div><div class="card-desc">Trusted with real responsibility from day one. No micromanagement, no politics, no nonsense.</div></div>
            <div class="card"><div class="card-title">Skill Development</div><div class="card-desc">Work with cutting-edge tools (AI, automation, CRM, marketing systems). Develop skills that compound for life.</div></div>
            <div class="card"><div class="card-title">Flexibility</div><div class="card-desc">Fully remote, results-focused, no clock-watching.</div></div>
            <div class="card"><div class="card-title">Culture of Excellence</div><div class="card-desc">Surrounded by people who care deeply about quality, growth, integrity, and impact.</div></div>
            <div class="card"><div class="card-title">Long-Term Opportunity</div><div class="card-desc">We're hiring for the long haul. If you're A-class, this can be your home for years.</div></div>
          </div>
        </div>
      </div>
    </div>

    <!-- 06: LOGISTICS -->
    <div class="section" id="s6">
      <div class="section-header" onclick="toggleSection('s6')">
        <div class="section-num">06</div>
        <div class="section-title">Logistics</div>
        <div class="section-tag tag-gold">Practical Details</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">Make sure these line up before applying.</p>
          <div class="logistics">
            <div class="logistics-item">Fully remote — work from anywhere</div>
            <div class="logistics-item">Reliable overlap with CST business hours</div>
            <div class="logistics-item">High-speed internet + quiet workspace</div>
            <div class="logistics-item">Fluent English (written + spoken)</div>
            <div class="logistics-item">Working camera + microphone</div>
            <div class="logistics-item">Modern computer + reliable equipment</div>
            <div class="logistics-item">Start date: ASAP for the right person</div>
          </div>
        </div>
      </div>
    </div>

    <!-- 07: NOT A FIT -->
    <div class="section" id="s7">
      <div class="section-header" onclick="toggleSection('s7')">
        <div class="section-num">07</div>
        <div class="section-title">Not a Fit If…</div>
        <div class="section-tag tag-purple">Save Us Both Time</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">If any of these sound like you, this isn't the right role.</p>
          <ul class="not-fit-list">
            <li>You need to be micromanaged</li>
            <li>You take feedback personally</li>
            <li>You wait to be told what to do</li>
            <li>You're looking for "just a job"</li>
            <li>You drop balls or leave loops open</li>
            <li>You're vague when specifics are required</li>
            <li>You're not genuinely excited by what we're building</li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 08: HOW TO APPLY -->
    <div class="section" id="s8">
      <div class="section-header" onclick="toggleSection('s8')">
        <div class="section-num">08</div>
        <div class="section-title">How to Apply</div>
        <div class="section-tag tag-cyan">Take Action</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">If everything you've read so far resonates — and you genuinely see yourself in this role — here's exactly how to apply.</p>

          <div class="apply-steps">
            <div class="apply-step">
              <div class="apply-step-title">Send Your Application</div>
              <div class="apply-step-desc">Email your full application to the address provided by our hiring manager. Subject line: <strong>A-Class Growth Partner Application — [Your Full Name]</strong></div>
            </div>

            <div class="apply-step">
              <div class="apply-step-title">Include a Short Cover Letter</div>
              <div class="apply-step-desc">No more than 300 words. Tell us why this role specifically pulled you in. What about it made you stop scrolling and apply?</div>
            </div>

            <div class="apply-step">
              <div class="apply-step-title">Record a 60–90 Second Loom Video</div>
              <div class="apply-step-desc">Introduce yourself. Be real. Be warm. Show us your energy, your presence, and your voice. <strong>Required — applications without it won't be reviewed.</strong></div>
            </div>

            <div class="apply-step">
              <div class="apply-step-title">Attach Your Resume or LinkedIn</div>
              <div class="apply-step-desc">Recent and relevant. We want to see real work history, not buzzwords.</div>
            </div>

            <div class="apply-step">
              <div class="apply-step-title">Answer the Two Big Questions Below</div>
              <div class="apply-step-desc">These are the questions we care about most. Take your time. Be honest. Be specific. Your answers matter more than your resume.</div>
            </div>

            <div class="apply-step">
              <div class="apply-step-title">Share Your Timezone & Earliest Start Date</div>
              <div class="apply-step-desc">Quick line at the bottom of your email. Helps us plan.</div>
            </div>
          </div>

          <!-- BIG QUESTION 1: GOALS -->
          <div class="question-feature">
            <div class="question-feature-label">Application Question 1 · Required</div>
            <div class="question-feature-q">What are your goals — financial AND non-financial — across the following horizons?</div>
            <div class="question-feature-desc">Be honest and specific. We want to understand who you are, what you're building toward, and whether this role aligns with your real life direction. Vague answers tell us this isn't the right fit. Clear, thoughtful answers tell us you've actually examined your life.</div>
            <div class="goal-grid">
              <div class="goal-card">
                <div class="goal-horizon">Short Term</div>
                <div class="goal-label">1–3 Months</div>
                <div class="goal-prompt">What do you want to achieve, build, change, or experience in the next quarter?</div>
              </div>
              <div class="goal-card">
                <div class="goal-horizon">Mid Term</div>
                <div class="goal-label">6–12 Months</div>
                <div class="goal-prompt">Where do you want to be by this time next year — financially, personally, professionally?</div>
              </div>
              <div class="goal-card">
                <div class="goal-horizon">Long Term</div>
                <div class="goal-label">2–5 Years</div>
                <div class="goal-prompt">What's the bigger life vision? What are you ultimately building toward?</div>
              </div>
            </div>
          </div>

          <!-- BIG QUESTION 2: CHALLENGE -->
          <div class="question-feature">
            <div class="question-feature-label">Application Question 2 · Required</div>
            <div class="question-feature-q">What's the greatest challenge you've ever experienced in your life — and how did you overcome it?</div>
            <div class="question-feature-desc">This can be personal. It does NOT have to be work-related. We want to understand who you are at your core, what you've walked through, and how you handle hardship. The honesty and depth of your answer matters more than what the challenge was. There are no wrong answers — only real ones.</div>
          </div>

          <div class="prose" style="margin-top:24px">
            <p><strong>What happens next:</strong></p>
          </div>

          <div class="apply-steps" style="counter-reset: step;">
            <div class="apply-step">
              <div class="apply-step-title">Application Review</div>
              <div class="apply-step-desc">Reviewed within 5 business days by our hiring manager.</div>
            </div>
            <div class="apply-step">
              <div class="apply-step-title">First Interview</div>
              <div class="apply-step-desc">Top candidates invited to a 30-minute video conversation.</div>
            </div>
            <div class="apply-step">
              <div class="apply-step-title">Paid Trial Task</div>
              <div class="apply-step-desc">Finalists invited to a real, scoped trial task. Paid.</div>
            </div>
            <div class="apply-step">
              <div class="apply-step-title">Final Conversation with Alan</div>
              <div class="apply-step-desc">A real conversation. Vibe check + alignment check.</div>
            </div>
            <div class="apply-step">
              <div class="apply-step-title">Offer Extended</div>
              <div class="apply-step-desc">If everything aligns, we move fast.</div>
            </div>
          </div>

          <div class="prose" style="margin-top:20px">
            <p>We read every application personally. If you're a strong fit, you'll hear back. If you don't hear back within 2 weeks, the role has been filled or you weren't selected this round — but we sincerely appreciate your interest and the time you put in.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- 09: SOP — HOW WE OPERATE -->
    <div class="section" id="s9">
      <div class="section-header" onclick="toggleSection('s9')">
        <div class="section-num">09</div>
        <div class="section-title">How We Operate (SOP)</div>
        <div class="section-tag tag-gold">Standard Operating System</div>
        <div class="chevron"><svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg></div>
      </div>
      <div class="section-body">
        <div class="section-body-inner">
          <p class="section-intro">This is how we run things at APW. If hired, this is the operating system you'll plug into. Read it carefully — your ability to thrive in this environment is non-negotiable.</p>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">1</span>Information & Task Processing</div>
            <div class="sop-block-desc">
              You will be processing <strong>large volumes of information, projects, and task lists simultaneously</strong> — and absorbing additional info, requests, and tasks daily. Every incoming item must be:
              <ul class="sop-list">
                <li>Captured immediately into the central task system (nothing lives in memory or in your head)</li>
                <li>Tagged with context, source, and category</li>
                <li>Assigned a priority level (see below)</li>
                <li>Assigned an estimated time-to-completion</li>
                <li>Assigned a deadline date</li>
                <li>Slotted into the active priority list — not tomorrow, not later, immediately</li>
              </ul>
            </div>
          </div>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">2</span>Priority Hierarchy</div>
            <div class="sop-block-desc">
              Every task is categorized on a clear priority scale, with an explicit hierarchy of <em>non-negotiables</em> at the top. You must be able to:
              <ul class="sop-list">
                <li>Identify priority levels of new and pre-existing tasks instantly</li>
                <li>Distinguish urgent vs. important vs. neither</li>
                <li>Re-rank the list on the fly as new information enters</li>
                <li>Flag conflicts and surface tradeoffs <em>before</em> they become problems</li>
                <li>Know what gets dropped, deferred, or delegated when capacity is exceeded</li>
              </ul>
            </div>
          </div>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">3</span>Time Estimation — The Musk Method</div>
            <div class="sop-block-desc">
              Every task gets a realistic time estimate for the <strong>quickest proficient completion at approximately 50% probability of success</strong> — the same standard Elon Musk uses. This means:
              <ul class="sop-list">
                <li>Aggressive, but honest — not padded, not sandbagged</li>
                <li>Forces clarity on what the task actually requires</li>
                <li>Surfaces hidden complexity early</li>
                <li>Creates accountability without false comfort</li>
                <li>If the estimate is consistently wrong, the estimating skill itself becomes the focus of improvement</li>
              </ul>
            </div>
          </div>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">4</span>Deadline Management & Missed Timelines</div>
            <div class="sop-block-desc">
              Every task has a deadline. Every deadline is tracked. When timelines are missed (and occasionally they will be), here's how you navigate:
              <ul class="sop-list">
                <li><strong>Surface immediately</strong> — never wait for someone to ask</li>
                <li>Recalculate impact on <em>all other</em> deadlines and dependencies</li>
                <li>Re-rank the priority list with the new reality</li>
                <li>Propose a clear path forward (not a problem statement)</li>
                <li>Identify the root cause and the lesson — feed it back into the system so it doesn't repeat</li>
                <li>Move forward without drama, defensiveness, or self-flagellation</li>
              </ul>
            </div>
          </div>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">5</span>Daily Rhythm — Meetings, Review, Execution</div>
            <div class="sop-block-desc">
              We run a <strong>daily meeting</strong> for review and execution alignment. Every day. This is where:
              <ul class="sop-list">
                <li>Yesterday's wins, misses, and lessons get reviewed</li>
                <li>Today's top 3 priorities get locked in</li>
                <li>Blockers get surfaced and unblocked</li>
                <li>The week's trajectory gets pressure-tested against goals</li>
                <li>Energy, alignment, and clarity get reset</li>
              </ul>
              Daily meetings are sacred. Show up prepared, present, and ready to move.
            </div>
          </div>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">6</span>KPI Sync Across All Time Horizons</div>
            <div class="sop-block-desc">
              Action-based KPIs are aligned with our goals at every cadence — with <strong>absolute coherence</strong> from the daily action all the way up to the yearly vision. Nothing happens in isolation. Every action ties to a larger arc.
              <div class="kpi-grid">
                <div class="kpi-cell"><div class="kpi-cell-label">Daily</div></div>
                <div class="kpi-cell"><div class="kpi-cell-label">Weekly</div></div>
                <div class="kpi-cell"><div class="kpi-cell-label">Bi-Weekly</div></div>
                <div class="kpi-cell"><div class="kpi-cell-label">Monthly</div></div>
                <div class="kpi-cell"><div class="kpi-cell-label">Quarterly</div></div>
                <div class="kpi-cell"><div class="kpi-cell-label">Yearly</div></div>
              </div>
              <ul class="sop-list" style="margin-top:14px">
                <li>Each layer feeds the next — daily wins become weekly progress become quarterly milestones</li>
                <li>Misalignment between layers is flagged and corrected immediately</li>
                <li>If a daily action doesn't tie to a yearly outcome, it gets challenged or cut</li>
              </ul>
            </div>
          </div>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">7</span>Navigating Failures Appropriately</div>
            <div class="sop-block-desc">
              Failures are inevitable. They are <em>not</em> the problem. The problem is failing to learn, failing to course-correct, or failing to communicate. Here's how we handle failures at APW:
              <ul class="sop-list">
                <li><strong>Own it fast.</strong> No deflection. No blame-shifting. No spin.</li>
                <li><strong>Surface it immediately.</strong> Never hide a failure hoping it resolves itself.</li>
                <li><strong>Diagnose the root cause</strong> — not the symptom</li>
                <li><strong>Propose a fix</strong> — not just identify the problem</li>
                <li><strong>Update the system</strong> so the same failure cannot happen twice</li>
                <li><strong>Move forward cleanly</strong> — no shame spirals, no self-flagellation, no drama</li>
                <li><strong>Document the lesson</strong> for the team and the playbook</li>
              </ul>
              Failure handled well makes you stronger. Failure handled poorly is the only kind that disqualifies you.
            </div>
          </div>

          <div class="sop-block">
            <div class="sop-block-title"><span class="sop-icon">8</span>Constant Review & Continuous Improvement</div>
            <div class="sop-block-desc">
              The system itself is always being managed, updated, and reviewed. There is no "set and forget." We expect:
              <ul class="sop-list">
                <li>Daily review of priorities, deadlines, and progress</li>
                <li>Weekly review of systems, workflows, and bottlenecks</li>
                <li>Monthly review of KPI alignment and goal trajectory</li>
                <li>Quarterly review of strategy, role evolution, and growth</li>
                <li>Constant micro-adjustments as new information enters</li>
              </ul>
              The goal: <strong>absolute coherence between action and vision, every day.</strong>
            </div>
          </div>

        </div>
      </div>
    </div>

    <footer class="footer">
      <div class="footer-tagline">Success is the ONLY Option.</div>
      <div class="footer-brand">Ascend Prime Wealth</div>
    </footer>

  </div>

<script>
  function toggleSection(id) {
    document.getElementById(id).classList.toggle('open');
  }

  function expandAll() {
    document.querySelectorAll('.section').forEach(s => s.classList.add('open'));
  }

  function collapseAll() {
    document.querySelectorAll('.section').forEach(s => s.classList.remove('open'));
  }

  // Open the first section by default
  document.getElementById('s1').classList.add('open');
</script>
</body>
</html>
