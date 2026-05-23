---
title: Removing green screen artifacts in OBS
source: claude
type: conversation
person: alan
created: "2026-03-22T22:44:17.205405Z"
updated: "2026-03-22T23:38:14.061653Z"
year: 2026
month: 2026-03
quarter: 2026-Q1
messages: 4
uuid: 0e7fffb3-5825-42a0-8905-eb45d5b4df2d
tags:
  - claude
  - alan
  - tech
---

# Removing green screen artifacts in OBS

> [!info]- Conversation summary
> **Conversation Overview**
> 
> Alan is working on optimizing his OBS Studio green screen setup for professional video output, with the goal of achieving clean, trustworthy-looking background removal comparable to Zoom's AI-based segmentation. He uses an Elgato 4K camera and has been experimenting extensively with stacked chroma key and color key filters in OBS — up to five filters simultaneously — including Chroma Key, Chroma Key 2, Chroma Key 3, Color Key, and Chroma Key 4, with settings such as Similarity values of 709 and 424, Smoothness of 50 and 80, and Key Color Spill Reduction at 100. His core problem is persistent green artifacts above his head and green spill/glow around his hair and body edges. He has tried selecting specific colors from the green screen including the artifact locations directly, but this approach destroys the overall image quality.
> 
> Alan tested the obs-backgroundremoval AI plugin (occ-ai) and found it produced worse, more artificial results than his current stacked filter approach, so that solution was ruled out. Claude explained that OBS's built-in chroma keying is fundamentally color-math based and cannot match Zoom's neural network person segmentation regardless of filter stacking, and that the remaining green glow is green light spill bouncing off the screen onto him — a lighting and distance issue rather than a keying parameter issue.
> 
> The conversation concluded with two recommended paths: first, using Zoom's built-in Virtual Camera output (which applies Zoom's AI background removal) as a camera source in Loom, OBS, or other apps directly — selecting "Zoom Virtual Camera" as the input device in any destination app; second, if staying in native OBS, adding a Color Correction filter after all chroma key filters and pulling the green channel down slightly to neutralize spill, combined with the hardware recommendation of moving 3–4 feet from the green screen and using dedicated LED panels aimed at the screen rather than the subject. Alan's stated priority is that he needs to look trustworthy and the output must feed into other apps like Loom.


---

## 👤 You

> [!image] Image file: color key.png

> [!image] Image file: chroma key.png


How to fix the artifacts above my head , as well as the green outline in OBS? I tried removing my green screen through chroma key and color key, however I cannot get rid of the artifacts from the green screen or the glow without making myself look digitally processed with a bunch of pixels. I need to look trust worthy. and it needs to be as good as zoom's background green screen remover is. there is no glow or artifacts in zoom. However i need it in OBS to output to other apps. This is the max settings right before i start to begin looking digitally processed/downsampled/reduced/pixelated 

I've also tried selecting specific colors from the greenscreen, including the artificating location itself, but it does not work for the intention. how to resolve?

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is asking about fixing green screen artifacts and green outline/spill in OBS Studio. He's using an Elgato 4K camera with multiple chroma key and color key filters stacked. The issues are:
> 
> 1. Green artifacts above his head
> 2. Green outline/glow around his body
> 3. Can't push settings further without looking digitally processed/pixelated
> 
> Let me analyze what I see in the screenshots:
> 
> **Image 1 (Color Key selected):**
> - Chroma Key, Chroma Key 2, Chroma Key 3 (all with the disabled/eye icon)
> - Color Key (active, selected)
> 
> 
> - Chroma Key 4 (disabled)
> - Settings: Key Color Type: Green, Similarity: 709, Smoothness: 50, Opacity: 1.0, Contrast: 0, Brightness: 0, Gamma: 0
> 
> **Image 2 (Chroma Key 4 selected):**
> - Same filter stack
> - Chroma Key 4 settings: Key Color Type: Green, Similarity: 424, Smoothness: 80, Key Color Spill Reduction: 100, Opacity: 1.0, Contrast: 0, Brightness: 0
> 
> I can see the green artifacts above his head in the preview and the green spill around his edges. The high similarity values on multiple filters are likely causing over-keying, and the stacked approach might be creating conflicting edge detection that's producing those artifacts and outlines.
> 
> Looking at the root cause, the real issue is probably uneven lighting on the green screen itself—different shades of green across the background make it nearly impossible to key cleanly without affecting the subject. Zoom's AI-based background removal uses neural networks to segment the subject, which is fundamentally different from OBS's traditional color-based chroma keying, so it's not surprising the results don't match.
> 
> The practical fix isn't more filters—it's addressing the lighting. I should focus on how to improve the green screen setup rather than tweaking similarity and smoothness values.


Hey Alan. The core issue: **OBS's built-in chroma key is old-school color math — Zoom uses AI-based segmentation.** No amount of stacking chroma/color key filters will match it. You're fighting the wrong battle.

## The Fix: OBS Background Removal Plugin (AI-based, like Zoom)

There's a free open-source OBS plugin that does exactly what Zoom does — neural network person segmentation instead of color-based keying. It works with or without a green screen, and with a green screen it's extremely clean.

**Plugin:** `obs-backgroundremoval` by occ-ai

> [!abstract]- Tool call: web_search
> {"query": "obs-backgroundremoval plugin occ-ai 2025"}


> [!note]- Claude's thinking
> Good, I have the info I need. Let me give Alan a clear, actionable answer.


## Why Your Current Approach Can't Win

You're stacking 5 color/chroma key filters trying to brute-force a color-math solution. The problem is fundamental: OBS's built-in chroma key works by removing pixels that match a color range. When your green screen has uneven lighting, wrinkles, or shadows, those pixels are *different shades* of green — so you either leave artifacts (too conservative) or eat into your body edges (too aggressive). There's no sweet spot. That's why you're stuck.

Zoom doesn't use color keying at all. It uses **AI person segmentation** — a neural network that detects the shape of a human and masks everything else. That's why it has zero spill and zero artifacts regardless of background color.

## The Solution

**OBS Background Removal Plugin** — free, open source, does exactly what Zoom does.

It uses a neural network to predict the mask of the portrait and remove the background pixels — same approach as Zoom and Google Meet.

It supports GPU acceleration on Windows (DirectML), Mac (CoreML for Apple Silicon), and Linux (CUDA/MIGraphX).

**Download:** https://github.com/royshil/obs-backgroundremoval/releases (current version is 1.3.5)

There's also a **Lite version** if the main one gives you any stability issues: Live Background Removal Lite is a complete rewrite of the popular obs-backgroundremoval tool, engineered from scratch to prioritize stability, compatibility, and smart resource management, following a "Gaming-First" philosophy that offloads AI inference to the CPU while using GPU only for lightweight post-processing.

## Setup

1. Download and install the plugin (Windows installer available)
2. In OBS, right-click your Elgato 4K source → Filters
3. **Delete all 5 of your current chroma/color key filters**
4. Add new Effect Filter → "Background Removal"
5. Set it to replace background with a solid color or image, or set to transparent for compositing
6. Adjust the segmentation threshold until edges are clean

With your green screen still behind you, the AI segmentation will be even *cleaner* than Zoom because the contrast helps the neural network. But even without the green screen, it'll work.

## If You Want to Keep Chroma Key Instead

The real fix would be **lighting**, not filter stacking. Two cheap LED panels aimed at the green screen (not you) from 45° angles, plus 3–4 feet of distance between you and the screen, would eliminate 90% of your issues with a single chroma key filter. But the AI plugin is faster to implement and more reliable.

---

## 👤 You

> [!image] Image file: best so far filter.png

> [!image] Image file: best so far.png


that plug in is way worse. way more artificial. These are the best OBS settings i found so far. I've tested Chroma Key and Color Key using default green, and muultiple different screen selected greens. this is the best i can do so far. but i have a bad green glow. if i try to select the color near my hair to remove via chroma key, it does not work and destroys the whole picture. 

how to resolve? or how to use zoom output and feed it to other apps like loom live

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan tried the AI plugin and it looked worse/more artificial. He wants to either fix the green spill in his current OBS setup, or find a way to use Zoom's superior background removal and pipe it to other apps like Loom.
> 
> The second option is actually the fastest win. Zoom has a virtual camera output. He can use Zoom's background removal → Zoom Virtual Camera → use that as input in OBS or Loom directly.
> 
> Let me think about this:
> 
> 1. **Zoom Virtual Camera route**: Zoom has a "Virtual Camera" feature that outputs its processed video (with background removal) as a virtual webcam. Other apps like Loom, OBS, Google Meet, etc. 
> 
> can then select "Zoom Virtual Camera" as their camera input. This is the cleanest solution.
> 
> 2. **Fix green spill in OBS**: The green glow/spill around his hair and edges is a lighting issue. But he could try adding a "Color Correction" filter after the chroma keys to desaturate greens, or use the "Spill Reduction" more aggressively on specific filters.
> 
> The Zoom virtual camera route is the fastest, cleanest answer. Let me focus on that.


## Fastest Fix: Use Zoom's Virtual Camera as Your Source

Zoom has a built-in **Virtual Camera** that outputs its processed video (background removed) as a webcam feed. Any app — OBS, Loom, Google Meet, etc. — can use it as a camera input.

**Setup:**

1. Open Zoom (don't need to be in a meeting — just open Settings)
2. Go to **Settings → Video → Background & Effects** → set your virtual background
3. Start Zoom's **Virtual Camera**: In a meeting or from the toolbar, click the caret next to "Video" → **Start Virtual Camera**. Alternatively in newer Zoom versions, go to **Settings → Video → toggle "Virtual Camera"**
4. In **Loom / OBS / any app**, select **"Zoom Virtual Camera"** as your camera source instead of "Elgato 4K"

That gives you Zoom-quality removal piped everywhere. No green screen needed at all.

## If You Want to Keep OBS as the Hub

Same concept but reversed — Zoom processes the video, OBS captures it:

1. Zoom → Start Virtual Camera (with background removal active)
2. In OBS → Add Source → **Video Capture Device** → select **"Zoom Virtual Camera"**
3. Remove all your chroma/color key filters from the Elgato source (or hide that source)
4. Layer the Zoom virtual cam source over your background image in OBS
5. OBS Virtual Camera → Loom / other apps

This keeps OBS as your routing hub while Zoom handles the AI segmentation.

## Green Spill Fix (If You Still Want Native OBS)

Your current setup is solid — 8 filters is a lot of work. The remaining green glow around your hair/edges is **green spill**, not a keying issue. It's green light bouncing off the screen onto you. Two options:

**Software:** Add one more filter *after* all your chroma keys — **Color Correction** filter. Pull the **green channel** down slightly (shift the color toward magenta). This neutralizes the spill cast without affecting the key.

**Hardware (permanent fix):** Two 80W LED panels angled at the green screen only, plus move your chair ~3-4 feet away from the screen. Distance kills spill more than any filter.

But the Zoom Virtual Camera route is the real answer here — zero artifacts, zero spill, zero filter stacking, and it works in every app.

---
