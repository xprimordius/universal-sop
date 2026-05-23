---
title: Resetting ASUS BIOS to unlock CPU frequency scaling
source: claude
type: conversation
person: alan
created: "2026-04-05T01:40:55.976596Z"
updated: "2026-04-05T03:36:11.359164Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 40
uuid: d0cd9ef8-0562-4ff4-9978-ffed9ad847c3
tags:
  - claude
  - alan
  - negotiation
  - tech
---

# Resetting ASUS BIOS to unlock CPU frequency scaling

> [!info]- Conversation summary
> **Conversation Overview**
> 
> This conversation centered on troubleshooting and optimizing a high-end Windows PC with an i9-12900K CPU, 32GB DDR5-6000 RAM, RTX 3090, and an ASUS ROG motherboard. The person began by resetting the BIOS to defaults to resolve a CPU frequency lock at 5000 MHz (50x ratio), successfully getting the system to show 4900 MHz with Auto ratio after the reset. Claude explained that this is normal BIOS behavior reflecting the 12900K's all-core turbo, and that proper frequency scaling would be visible in Windows. The conversation covered XMP/EXPO profiles in detail — the person is running DDR5-6000 RAM but had XMP disabled, leaving it at 4800 MHz — with Claude recommending enabling XMP to recover rated bandwidth with minimal risk. Additional BIOS topics addressed included Resizable BAR, iGPU multi-monitor output (found under Advanced → System Agent Configuration → Graphics Configuration), and CPU Power Management settings including SpeedStep and C-States.
> 
> A significant portion of the conversation addressed poor gaming performance in Apex Legends, specifically bad 1% low frametimes (80–115 FPS despite 200–300 FPS average) and microstutters. Claude identified the most likely causes as 12th-gen hybrid architecture E-core thread scheduling issues, RAM running below rated speed, and Resizable BAR causing inconsistent frame pacing in certain titles. The recommended test sequence was: enable XMP, set Windows power plan to High Performance, set Apex CPU affinity to P-cores only, and disable Resizable BAR for testing.
> 
> The person also resolved a long-standing monitor issue: their ASUS XG27UCG was stuck at 4K 60Hz while the Dell S2725QS achieved 4K 120Hz. Claude diagnosed this as a DSC negotiation failure over DisplayPort 1.4 and recommended switching the ASUS to its HDMI 2.1 port, which immediately resolved the issue. Following this, the person enabled 10-bit color output (10 bpc) via Nvidia Control Panel. The conversation ended with continued troubleshooting of the CPU frequency lock, which BIOS settings confirmed was correctly configured (SpeedStep enabled, C-States auto), pointing toward a Windows-side cause — likely the power plan or ASUS software such as AI Suite or Armory Crate overriding frequency scaling. The person noted this topic had been discussed in a prior conversation on a different platform, and referenced monitor details from that prior chat as well.


---

## 👤 You

> [!image] Image file: photo.jpeg


How to reset asus bios pc back to default? My cpu is locked at 5000 mhz and I want it variable like normal 12900k

---

## 🤖 Claude

> [!note]- Claude's thinking
> Quick BIOS reset question.


Two ways, easiest first:

1. **In BIOS → hit F5** (Load Optimized Defaults) → then F10 to save & exit.

2. If that doesn't work: **Exit tab → Load Optimized Defaults → OK → Save & Exit.**

Your screen shows Performance Core Ratio set to "Auto" but CPU is locked at 5000 MHz (50x ratio). That usually means either an XMP/EXPO profile or Ai Tweaker preset is forcing a fixed multiplier.

After loading defaults, re-enable XMP for your DDR5-6000 kit separately — defaults will drop RAM back to 4800 MHz (which is what it's actually running at now per your Hardware Monitor).

**Quick sequence:**
1. F5 → Load Defaults → F10 Save & Exit
2. Reboot back into BIOS
3. Ai Tweaker → XMP I or XMP II to get DDR5-6000 back
4. Verify Performance Core Ratio shows "Auto" (should now let the 12900K boost/downclock normally between ~800 MHz idle and 5.2 GHz boost)
5. F10 Save & Exit

That should restore normal P-core/E-core frequency scaling with Intel Speed Step and Turbo Boost active.

---

## 👤 You

> [!image] Image file: photo.jpeg


Pros and cons of XMP on and off. By default it’s off.

And after the reset now it says 4900 mhz and 49x ratio but I wonder if this means it’s still locked

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is asking two things:
> 
> 1. Pros/cons of XMP on vs off
> 2. Whether 4900 MHz / 49x ratio means it's still locked
> 
> Let me address both concisely.
> 
> For the 4900 MHz question: The Hardware Monitor in BIOS shows a real-time snapshot. At 49x ratio with "Auto" core ratio, this is normal — the 12900K boosts up to 5.2 GHz (single core) and 4.9 GHz (all-core). In BIOS, the CPU is under light load, so it's likely showing a turbo state. The key indicator is whether Performance Core Ratio is set to "Auto." If it is, the CPU will scale normally in Windows (down to ~800 MHz at idle, up to 5.2 GHz under single-thread load).
>  
> For XMP, the main trade-off is stability versus performance — enabling it pushes memory to rated speeds and tighter timings for better bandwidth, but it also increases voltage and heat, which can occasionally cause crashes if the silicon lottery isn't in your favor or if your cooling isn't adequate.


## 4900 MHz — You're Good

That's **normal behavior after reset**. In BIOS, the CPU is under light load and boosting to 4.9 GHz (all-core turbo for 12900K). The key difference from before:

- **Before:** Locked at 5000 MHz (50x) — forced overclock, never downclocked
- **Now:** 4900 MHz (49x) at idle in BIOS = turbo boost working naturally

Once you boot into Windows, you'll see it scale between ~800 MHz (idle) and up to 5.2 GHz (single-core boost). You're unlocked now.

---

## XMP On vs Off

| | **XMP Off (Default)** | **XMP On** |
|---|---|---|
| **RAM Speed** | 4800 MHz (JEDEC spec) | 6000 MHz (your kit's rated speed) |
| **Stability** | Maximum — guaranteed by Intel | Very high, but technically an overclock |
| **Performance** | ~20-25% less memory bandwidth | Full bandwidth your kit was designed for |
| **Risk** | None | Minimal — kit is validated at 6000 |
| **Warranty** | Fully covered | Intel technically voids CPU warranty for memory OC, but almost never enforced |
| **Temps** | Slightly lower DRAM voltage | VDD/VDDQ go to 1.35V (normal for DDR5-6000) |

**Bottom line:** Turn XMP on. You paid for 6000 MHz RAM — running it at 4800 is leaving free performance on the table. The "risk" is near-zero with a validated kit.

---

## 👤 You

S o what’s the experiential difference

---

## 🤖 Claude

> [!note]- Claude's thinking
> He's asking what the real-world difference feels like between DDR5-4800 and DDR5-6000 with XMP.


For most of what you do — **you won't feel it.**

**Where you'd notice it:**
- Video editing / Ableton with large projects → slightly faster render times, smoother with many tracks
- Heavy multitasking (tons of Chrome tabs + OBS + DAW) → snappier switching
- Gaming at high FPS (240Hz+) → a few % more frames in CPU-bound titles

**Where you won't notice it:**
- Web browsing, email, general desktop
- Streaming content
- Opening apps
- Boot times

It's roughly a **5-10% real-world bump** in memory-intensive tasks. Not dramatic, but it's free performance you already paid for — no downside to enabling it.

---

## 👤 You

Why is it not default enabled

---

## 🤖 Claude

> [!note]- Claude's thinking
> Simple question, concise answer.


DDR5-6000 is technically an **overclock** beyond Intel's official spec (4800 MHz for 12th gen). 

Motherboards ship with JEDEC defaults so the system **always boots stable** regardless of what RAM you install. If they auto-enabled XMP and your kit couldn't handle it, you'd get boot loops and most people wouldn't know how to fix it.

So it's a liability/compatibility thing — not a performance recommendation. The motherboard is just playing it safe until you explicitly say "yes, run my RAM at its rated speed."

---

## 👤 You

Resize bar is on by default. But you said turning it off will help stability? And 1% low?

---

## 🤖 Claude

> [!note]- Claude's thinking
> The user is asking about Resizable BAR (ReBAR) - I don't think I said turning it off would help stability. Let me be careful here and not claim I said something I didn't.
> 
> Resizable BAR allows the CPU to access the full GPU VRAM at once instead of in 256MB chunks. It can help performance in some games but hurt in others.
> 
> Let me give accurate info about ReBAR pros/cons.


I didn't actually say that — but here's the real story:

**ReBAR is generally a net positive.** Leave it on.

Where it gets nuanced:

- **Most modern games:** +2-5% average FPS
- **Some older/poorly optimized titles:** Can actually *hurt* performance by 1-3%
- **1% lows:** Game-dependent, not a blanket improvement or degradation

It's not a stability concern at all — it's purely a performance toggle. The only reason to turn it off is if you notice stuttering in a specific game, then test with it off to compare.

**TLDR:** Keep it on. If a specific game feels off, toggle it off for that game as a troubleshooting step. Otherwise it's free performance.

---

## 👤 You

My 1% lows are really bad. Like 80-115 fps consistently despite 200-300 fps in apex

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is experiencing bad 1% lows in Apex Legends - getting 80-115 FPS on 1% lows despite 200-300 average FPS. That's a significant gap indicating frame time spikes. Let me think about common causes.
> 
> Key system specs from BIOS:
> - i9-12900K
> - 32GB DDR5 at 4800 MHz (XMP off currently)
> - ASUS ROG motherboard
> 
> Common causes for bad 1% lows with high average FPS:
> 
> 1. E-cores causing thread scheduling issues in games
> 2. RAM speed (4800 vs 6000 could help)
> 
> 
> 3. GPU driver issues
> 4. Power limit throttling
> 5. Background processes
> 6. Windows thread scheduler struggling with the hybrid architecture
> 7. Game-specific settings
> 
> I should prioritize these by what's most likely to be causing the frame time inconsistency and give him the most impactful fixes to try first.


That's a classic 12900K hybrid architecture problem. The **E-cores** are almost certainly your main culprit.

## Most Likely Causes (in order)

**1. E-core thread scheduling**
Windows sometimes throws game threads onto the efficiency cores, causing massive frame drops. Biggest single fix:
- In BIOS → disable E-cores temporarily to test
- Or in Windows → set Apex to "High Performance" power plan + set CPU affinity to P-cores only (cores 0-15)

**2. RAM at 4800 instead of 6000**
DDR5 latency matters for 1% lows more than averages. Enable XMP — this alone could tighten your lows by 10-15%.

**3. Power/thermal throttling**
Your 12900K may be hitting power limits momentarily → frame drops. Check if you have unlimited PL1/PL2 in BIOS under Ai Tweaker.

**4. Background apps**
OBS, Chrome, Discord overlay, Wallpaper Engine — all compete for threads.

## Quick test stack
1. Enable XMP → reboot
2. Set Windows power plan to "High Performance"
3. In Task Manager → Apex → set affinity to P-cores only
4. Test

If lows jump to 150+, it was thread scheduling. That's the answer 90% of the time with 12th gen.

---

## 👤 You

And I get bad microstutters 

Didn’t you say turning resize bar will help? Why not turn off

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is asking about ReBAR and microstutters. He's attributing something to me that I didn't say. I need to be honest — I didn't recommend turning it off. But I should address whether ReBAR could be contributing to his microstutters.
> 
> Actually, ReBAR CAN cause microstutters in some games. Let me give him the real answer.


I didn't say that — but you're right to question it because **ReBAR can cause microstutters in some titles**, especially Apex.

Turn it off and test. Here's why:

ReBAR gives the CPU full access to VRAM all at once instead of 256MB chunks. In theory faster — but some game engines don't handle it well and it creates **inconsistent frame pacing**, which is exactly what microstutters are.

Apex Legends is one of the known offenders.

## Your test order for microstutters

1. **Turn off ReBAR** → test Apex
2. **Enable XMP to 6000** → test again
3. **Disable E-cores or lock affinity to P-cores** → test again

Do them one at a time so you know what actually fixed it. My bet is ReBAR off + XMP on + P-core affinity gets you smooth.

---

## 👤 You

Where’s thr section for turning on motherboard video outputs for monitors

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan wants to enable the integrated GPU video outputs on his motherboard (iGPU). On ASUS boards this is typically under Advanced → System Agent Configuration or Advanced → Graphics Configuration.


**Advanced tab → System Agent (SA) Configuration → Graphics Configuration**

Set **iGPU Multi-Monitor** to **Enabled**.

This lets the motherboard video outputs work alongside your dedicated GPU. Useful if you want to run extra monitors off the 12900K's integrated graphics without loading your main GPU.

---

## 👤 You

Thank you. Any downsides of turning this on?

---

## 🤖 Claude

> [!note]- Claude's thinking
> Quick answer about downsides of enabling iGPU multi-monitor.


Minimal, but worth knowing:

- **Slightly higher idle power/temps** — iGPU stays active, draws a small amount of power
- **Tiny amount of RAM reserved** — usually 64-128MB for iGPU VRAM (irrelevant with 32GB)
- **No gaming impact** — games still run on your dedicated GPU

That's it. No meaningful downside for your use case. Turn it on.

---

## 👤 You

Anything I can do here to make sure my asus monitor can do 4k120 without blacking out one of my monitors , like my dell can?

---

## 🤖 Claude

> [!note]- Claude's thinking
> The user is asking about getting 4K 120Hz working on their ASUS monitor without it causing one of their other monitors to black out. This is a common issue with bandwidth limitations. Let me think about what could cause this.
> 
> Common causes:
> 1. DisplayPort/HDMI bandwidth limitations
> 2. DSC (Display Stream Compression) not being enabled
> 3. GPU running out of bandwidth when pushing multiple high-res displays
> 4. Cable quality issues
> 
> Let me ask some clarifying questions since I need to know their setup to give accurate advice.


Need a few details to pinpoint it:

- **What GPU are you running?**
- **What ASUS monitor model?** (and what Dell?)
- **What cables/ports?** (HDMI 2.1, DP 1.4, etc.)
- **How many monitors total?**

The blackout is almost always a **bandwidth issue** — the GPU can't push enough data through the port/cable for 4K120 on one monitor while maintaining the other. The fix depends on your exact setup.

Most common solutions:
- Wrong cable (HDMI 2.0 cable can't do 4K120 — needs 2.1)
- Need to enable DSC (Display Stream Compression) in Nvidia Control Panel
- Plugged into a port that shares bandwidth with another port on the GPU

But I don't want to guess — what's your setup?

---

## 👤 You

3090 dp 

Same cables that can do 8K

But even if I toggle down dell to 60 I can’t toggle up asus , I mentioned this in a prior chat

---

## 🤖 Claude

> [!note]- Claude's thinking
> The user is referencing a prior chat about monitor issues. Let me search for it.


> [!abstract]- Tool call: conversation_search
> {"query": "ASUS monitor 4K 120Hz blackout Dell"}


> [!abstract]- Tool result: conversation_search
> <chat url='https://claude.ai/chat/637b3896-e471-4dea-9bd0-085e85736978' updated_at=2026-03-27T04:31:51.879618+00:00>Uploading large ChatGPT data exports
> GAMING
> 
> ### Apex Legends (heavy focus Aug-Oct 2024)
> - Lurch strafing technique — specifically right-to-left input sequence (D-jump + W→A→S roll)
> - Key limiting factor: absence of tap strafe bind on scroll wheel
> - Sensitivity settings research (Soar Kirito reference)
> - Performance optimization (launch options, packet loss troubleshooting)
> - Montage techniques
> - 120Hz vs 60Hz on Xbox Series X
> 
> ### Other
> - Roblox (Robux pricing researched)
> - Call ...[truncated]


> [!note]- Claude's thinking
> The search didn't find the specific monitor blackout conversation. Let me try a more specific search.


> [!abstract]- Tool call: conversation_search
> {"query": "monitor blackout 4K 120Hz 3090 DisplayPort"}


> [!abstract]- Tool result: conversation_search
> <chat url='https://claude.ai/chat/637b3896-e471-4dea-9bd0-085e85736978' updated_at=2026-03-27T04:31:51.879618+00:00>Uploading large ChatGPT data exports
> GAMING
> 
> ### Apex Legends (heavy focus Aug-Oct 2024)
> - Lurch strafing technique — specifically right-to-left input sequence (D-jump + W→A→S roll)
> - Key limiting factor: absence of tap strafe bind on scroll wheel
> - Sensitivity settings research (Soar Kirito reference)
> - Performance optimization (launch options, packet loss troubleshooting)
> - Montage techniques
> - 120Hz vs 60Hz on Xbox Series X
> 
> ### Other
> - Roblox (Robux pricing researched)
> - Call ...[truncated]


> [!note]- Claude's thinking
> I couldn't find the specific monitor conversation. Let me be honest about that and give him practical troubleshooting steps.


I couldn't find that specific chat — it may have been on ChatGPT rather than here.

That said, here's what's likely happening with your 3090 + dual DP + 4K120:

## The Problem

The 3090 has **4 display outputs**, but they share bandwidth internally. Some port combos on certain cards cap out when both monitors demand high bandwidth simultaneously — even on DP 1.4.

## Try These

1. **Which physical ports are you using?** Try swapping to different DP ports on the card. Some 3090s have ports that share lanes internally.

2. **Enable DSC** — Nvidia Control Panel → Change Resolution → make sure DSC is toggled on for the ASUS monitor. Without DSC, 4K120 on DP 1.4 exceeds raw bandwidth.

3. **Check Nvidia Control Panel → resolution settings for the ASUS** — is 4K120 even showing as an option, or is it greyed out / absent?

4. **What specific ASUS monitor model?** Some ASUS panels need DSC enabled in the monitor's own OSD menu before the GPU can negotiate 4K120.

What model is the ASUS? That'll narrow it fast.

---

## 👤 You

In the control panel there is only a 4k 60hz selection in nvidia for asus

Dell has 60 and 120

Windows hz gives more options, but has a star next to it for asus. If I select the 120 preset there it downscales resolution

---

## 🤖 Claude

> [!note]- Claude's thinking
> This is a clear sign the GPU isn't negotiating full bandwidth with the ASUS monitor. The star in Windows display settings means "not natively supported" — Windows is offering it as a custom/forced option, which is why it downscales resolution to fit the bandwidth.
> 
> Key issue: Nvidia Control Panel only showing 4K60 means DP 1.4 without DSC can't push 4K120. The monitor either doesn't support DSC, or DSC isn't being negotiated.
> 
> I need the monitor model to confirm, but the most common causes:
> 
> 1. ASUS monitor might only support 4K120 over HDMI 2.1, not DP 1.4
> 
> 
> 2. DSC isn't supported or enabled on the monitor
> 3. Cable issue (unlikely if Dell works at 4K120 on the same cable type)
> 4. Monitor firmware needs updating
> 
> DP 1.4 raw bandwidth maxes out at 32.4 Gbps, which handles 4K60 with full color but requires DSC or DP 2.0 for 4K120. The starred options are probably 4K120 with chroma subsampling instead, which is what allows it to squeeze through without DSC.
> 
> Since the Dell achieves 4K120 over DP, it's almost certainly negotiating DSC properly—so the ASUS either lacks DSC support over DP or only does 4K120 through HDMI 2.1. I'd need to check the specific model to confirm, but this is almost certainly what's happening.


That confirms it — **the ASUS monitor isn't negotiating DSC (Display Stream Compression) over DisplayPort.**

DP 1.4 without DSC maxes out at **4K 60Hz** at full color. Your Dell supports DSC over DP, so it gets 4K120. The ASUS doesn't — or it only supports 4K120 over **HDMI 2.1**, not DP.

The star in Windows means "forced/non-native" — it's cramming 120Hz by dropping resolution or color depth to fit the bandwidth. Not a real solution.

## What to check

1. **What's the ASUS model?** This will confirm whether it does 4K120 over DP at all, or only HDMI 2.1
2. If it's HDMI 2.1 only for 4K120 → you need an **HDMI 2.1 cable** from the 3090's HDMI port to the ASUS
3. The 3090 only has **one HDMI 2.1 port** — so if the Dell is using it, that's your conflict

**Most likely fix:** Run the ASUS on HDMI 2.1 (for 4K120) and the Dell on DisplayPort. Swap which monitor gets which cable.

What's the ASUS model? I can confirm in 30 seconds.

---

## 👤 You

I told you in the other chat

---

## 🤖 Claude

> [!note]- Claude's thinking
> Let me search more specifically for the ASUS monitor model.


> [!abstract]- Tool call: conversation_search
> {"query": "ASUS monitor model"}


> [!abstract]- Tool result: conversation_search
> <chat url='https://claude.ai/chat/2dcd359d-69ae-4a91-a94b-8683eb59de53' updated_at=2026-03-23T05:57:06.428642+00:00>APW Primary Bureaus video script checklist
> <chat_conversation>Title: APW Primary Bureaus video script checklist
> 
> Human: create me an essential checklist for a video script for the lesson of the APW course on the Primary Bureaus
> 
> Assistant: # Primary Bureaus — Video Script Checklist
> 
> ## WHY Video
> - [ ] Why understanding the bureaus matters before applying for funding
> - [ ] How bureau data directly determines approvals, limits, and terms
> - [ ] Why most people treat bureaus as inter ...[truncated]


> [!note]- Claude's thinking
> I couldn't find the specific monitor model in past chats. It might have been in a ChatGPT conversation. Let me be upfront.


I can't find the monitor model in our chat history here — it was likely in one of your ChatGPT conversations. Drop the ASUS model number and I'll tell you immediately whether it's a DP limitation or something else.

---

## 👤 You

XG27ucg and dell s2725qs

---

## 🤖 Claude

> [!note]- Claude's thinking
> Let me search for the specs on both monitors to confirm the 4K120 situation.


> [!abstract]- Tool call: web_search
> {"query": "ASUS XG27UCG 4K 120Hz DisplayPort HDMI specs"}


> [!note]- Claude's thinking
> Now I have the info. The ASUS XG27UCG has DisplayPort 1.4 with DSC and HDMI 2.1. So it should be able to do 4K 160Hz over DP 1.4 with DSC enabled. The issue is that the 3090 supports DSC over DP 1.4, so theoretically the XG27UCG should negotiate 4K 160Hz over DP.
> 
> The problem is likely that DSC isn't being negotiated properly. The 3090 does support DSC. Let me think about why Nvidia Control Panel only shows 4K 60Hz...
> 
> This could be a cable issue, a firmware issue, or DSC not being enabled. 
> 
> Let me search for any known compatibility issues between this specific monitor and the 3090.


Found it. Your **XG27UCG supports 4K 160Hz over DP 1.4 with DSC** — so it absolutely should work. The fact that Nvidia only shows 4K 60Hz means **DSC isn't negotiating.**

## The fix

The monitor has DisplayPort 1.4 with DSC, two HDMI 2.1 ports with full 48 Gbps bandwidth — so you have two paths:

**Path 1 (easiest): Use HDMI 2.1 instead of DP**
- Swap the ASUS to one of its **two HDMI 2.1 ports** using an HDMI 2.1 cable
- The 3090 has one HDMI 2.1 port — connect ASUS there, Dell on DP
- This gives you 4K 120Hz instantly with zero DSC negotiation needed

**Path 2: Fix DSC on DisplayPort**
- Try a different DP cable (even "8K" cables can have bad pin contacts that break DSC handshake)
- Update the monitor firmware via ASUS DisplayWidget Center
- In monitor OSD → check if there's a "DisplayPort Stream" or "DSC" toggle
- Try a different DP port on the 3090

**My recommendation:** Path 1. Plug the ASUS into HDMI 2.1, Dell into DP. Done in 30 seconds, guaranteed 4K 120Hz+, no troubleshooting.

---

## 👤 You

The hdmi worked somehow hallelujah 

Thank you 

Can my asus be 10bit color?

---

## 🤖 Claude

> [!note]- Claude's thinking
> Yes, based on the search results, the XG27UCG supports 10-bit color via dithering (8-bit + 2-bit FRC).


Yes. It supports 10-bit color depth via dithering (8-bit + 2-bit FRC) — so it's not native 10-bit, but functionally 10-bit with smooth gradients.

**To enable it:**
Nvidia Control Panel → Change Resolution → scroll down → set **Output color depth** to **10 bpc**.

Over HDMI 2.1 at 4K 120Hz you have enough bandwidth for 10-bit + full RGB color. No compromises needed.

---

## 👤 You

Thank you. But the cpu mhz It’s still locked after bios reset

---

## 🤖 Claude

> [!note]- Claude's thinking
> Alan is saying the CPU is still locked at a fixed frequency even after the BIOS reset. Let me help troubleshoot.
> 
> The 12900K should scale between ~800 MHz idle and 5.2 GHz boost. If it's stuck at a fixed frequency, we need to check both BIOS and Windows settings.


Check these in order:

**1. Windows Power Plan**
Settings → Power → set to **Balanced** (not High Performance). High Performance locks the CPU at max frequency.

**2. Check in BIOS**
- Ai Tweaker → make sure **ASUS Performance Enhancement** or **ASUS MultiCore Enhancement** is set to **Auto** or **Disabled**
- Advanced → CPU Configuration → verify **Intel SpeedStep** is **Enabled**
- Advanced → CPU Configuration → verify **C-States** are **Enabled**

**3. Quick test**
Open Task Manager → Performance → CPU. Watch the speed. If it's pinned at one number and never drops at idle, it's one of the above.

What frequency is it stuck at now — still 4900/5000?

---

## 👤 You

Between the 2

---

## 🤖 Claude

> [!note]- Claude's thinking
> He's saying the CPU is stuck between 4900-5000 MHz and won't downclock. Let me give him the most likely fixes.


That's the all-core turbo range — it's not downclocking at idle.

**Most likely culprit: Windows power plan.**

Check right now: Settings → System → Power → Power Mode. If it says **Best Performance**, switch to **Balanced**. That alone will probably fix it.

If it's already on Balanced, open Command Prompt and run:

`powercfg /list`

Look for any custom plans or "High Performance" set as active.

Let me know what it shows.

---

## 👤 You

In cpu config but I don’t see 2 or 3

---

## 🤖 Claude

> [!note]- Claude's thinking
> He's in BIOS under Advanced → CPU Configuration but doesn't see Intel SpeedStep or C-States options. On ASUS boards these might be labeled differently.


On ASUS boards they're often labeled differently:

- **SpeedStep** might show as **Intel SpeedStep Technology** or **EIST** — could be buried further down the list, scroll all the way
- **C-States** might show as **CPU C-States Support** or **Intel C-State**

Can you take a photo of the full CPU Configuration screen? I'll identify exactly what's there and what to change.

---

## 👤 You

> [!image] Image file: IMG_1255.jpeg

> [!image] Image file: IMG_1256.jpeg

> [!image] Image file: IMG_1257.jpeg


*(empty)*

---

## 🤖 Claude

> [!note]- Claude's thinking
> Looking at the BIOS screenshots. The key settings I can see:
> 
> Photo 1: CPU Configuration showing EIST Technology = Supported (this is just info, not a toggle), C-states listed as supported/not supported (also just info)
> 
> Photo 2 & 3: The configurable options - Hardware Prefetcher, Adjacent Cache Line Prefetch, VMX, Per P-Core/E-Core Control (Disabled), Active Performance/Efficient Cores (All), Hyper-Threading (Enabled), and at the bottom "CPU - Power Management Control" submenu
> 
> The key is that "CPU - Power Management Control" submenu at the bottom of photo 3. 
> 
> The actual SpeedStep and C-states toggles will be inside that submenu—what I'm seeing in photo 1 are just status indicators. I should also check the Ai Tweaker section for MultiCore Enhancement settings.


The settings you need are inside that **CPU - Power Management Control** submenu at the bottom of photo 3. Open that.

That's where the actual toggles for **SpeedStep (EIST)** and **C-States** will be — the items in photo 1 are just info readouts showing "Supported," not toggles.

Open it and take a photo — that's where the fix is.

Also after that, check **Ai Tweaker tab** → look for **ASUS MultiCore Enhancement** — if it's set to anything other than Auto/Disabled, that could be forcing max frequency too.

---

## 👤 You

Speed step enabled and c states auto

---

## 🤖 Claude

> [!note]- Claude's thinking
> BIOS settings look correct. SpeedStep enabled, C-States auto. The issue is likely Windows-side then.
> 
> The CPU showing 4900 MHz in BIOS is actually normal - BIOS doesn't downclock. The real test is in Windows.


BIOS is fine then. The CPU won't downclock while you're in BIOS — it always runs at boost in BIOS. That's normal.

**Boot into Windows and check there.** Open Task Manager → Performance → CPU. Watch the speed for 30 seconds at idle.

If it's still locked at 4900-5000 in Windows:

1. **Power plan** — type `powercfg /list` in Command Prompt and tell me what's active
2. Check if **ASUS AI Suite** or **Armory Crate** is installed — both can override and lock frequency from Windows

Bet it's one of those two.

---
