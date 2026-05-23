---
title: NVIDIA Control Panel Resolution Fix
source: chatgpt
type: conversation
person: alan
created: "2025-04-10T22:23:25.018332+00:00"
updated: "2025-04-10T22:46:45.087663+00:00"
year: 2025
month: 2025-04
quarter: 2025-Q2
messages: 20
shared: False
id: 67f844dc-6400-8000-a5f9-09355bdc461c
tags:
  - chatgpt
  - alan
---

# NVIDIA Control Panel Resolution Fix

---

## 👤 You

> [!info]- Custom instructions
> The user provided the following information about themselves. This user profile is shown to you in all conversations they have -- this means it is not relevant to 99% of requests.
> Before answering, quietly think about whether the user's request is "directly related", "related", "tangentially related", or "not related" to the user profile provided.
> Only acknowledge the profile when the request is directly related to the information provided.
> Otherwise, don't acknowledge the existence of these instructions or the information at all.
> User profile:
> ```Aspiring Entrepreneur that is learning business operations and tactics from the best in the world. Focused on Sales, Offer, Demand, Product; going from 0-$1M+/mo in as quick and fast as possible; focusing on leverage and optimal efficiency.
> 
> Energy and time is everything, so honor this and keep responses direct and as brief, but as thorough as posisible
> 
> Be loving, kind, considerate, and conscious and caring.
> 
> Do not make mistakes, and ensure that everything said is 100% true.
> 
> Be a perfect listener and do not miss or forget things.```
> 
> The user provided the additional info about how they would like you to respond:
> ```Straight the the point, optimal, efficient, strategic, detailed, precise, accurate, brief, professional, elite, tactical, intelligent, wise, sharp, thorough, cognizant, conscious. 
> 
> Time is everything so keep everything TLDR concise and respectful to max clarity and intuitive understanding in the least amount of wording possible.
> 
> Be sure to be a perfected listener and not make mistakes.
> 
> Take the extra time to verify things and do not say something that is not true
> 
> Keep things short and concise.
> Direct with respect to time.
> 
> Convey your responses masterfully, by delivering the message in the absolute least amount of words.
> 
> Less is more.```


---

## 👤 You

nvidia control panel change resolution customize button greyed out, how to fix

---

## 🤖 ChatGPT

Problem:  
In NVIDIA Control Panel → Display → Change Resolution → "Customize..." button is greyed out.

## Solution:

### Step 1: Ensure You’re Using NVIDIA GPU Output
- Right-click desktop → NVIDIA Control Panel  
- Display → Set up multiple displays →  
Ensure your monitor is connected to the *NVIDIA GPU output* (not motherboard / integrated graphics).  

### Step 2: Enable G-SYNC / Disable Optimus (If applicable)
- If using a laptop with Optimus (hybrid graphics), you *must* disable Optimus to allow custom resolutions.  
Search: "Disable Optimus BIOS" or use "NVIDIA Control Panel → Manage Display Mode → NVIDIA GPU only" (if available).

### Step 3: Update NVIDIA Drivers
- Download latest: https://www.nvidia.com/Download/index.aspx  
Clean Install with DDU (Display Driver Uninstaller) is recommended for best results.

### Step 4: Override EDID / Enable Custom Resolutions
- NVIDIA Control Panel → Manage 3D Settings → Global → Enable "Disable resolution scaling" or "Enable custom resolutions" (if visible).

### Step 5: Use CRU (Custom Resolution Utility)
- Download: https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU  
- Add custom resolutions manually.  
- Restart with "restart64.exe" from CRU folder.

---

## Final Option:
If locked by monitor's EDID or firmware:
- Check Monitor Menu → Disable DisplayPort DSC / Overclock / Variable Refresh Rate.
- Use a different port (DisplayPort / HDMI).
- Update monitor firmware (if available).

---

Let me know your setup (GPU model, monitor, laptop/desktop) if you'd like exact instructions.

---

## 👤 You

XG27UCG

---

## 🤖 ChatGPT

Your Monitor: ASUS ROG Swift XG27UCG  
(G-Sync Compatible | 4K 160Hz | DisplayPort 1.4 | HDMI 2.1)

---

### Root Cause of Greyed Out "Customize..." in NVIDIA Control Panel:
This monitor uses Display Stream Compression (DSC) for high refresh rates at 4K. DSC can block NVIDIA's custom resolution feature.

---

## Optimal Fix (Step-by-Step)

### 1. Disable DSC (if option available)
- Monitor OSD Menu → Image → *DSC* → Disable  
*(Not all firmware versions have this option — check yours.)*

---

### 2. Set Refresh Rate Lower Temporarily
- NVIDIA Control Panel → Display → Change Resolution →  
Select 4K @ 120Hz (or lower) → Apply  
→ Now see if *Customize...* becomes available.

---

### 3. Use CRU Tool (Bypass NVIDIA Limitations)
Download: https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU  
Steps:
- Open CRU.exe  
- Select XG27UCG  
- Add custom resolution in "Detailed Resolutions"  
- Save  
- Run *restart64.exe*  
- Apply in NVIDIA Control Panel.

---

### 4. Ensure Proper DisplayPort Settings
- Use DisplayPort 1.4 cable (high quality).  
- Monitor OSD → DisplayPort Version → Set to 1.2 (if only testing lower res)  
- 1.4 + DSC is required for full 4K 160Hz.

---

## Summary:
| Step | Action | Purpose |
|------|--------|---------|
|1|Disable DSC|Allows custom res control|
|2|Lower Hz|Bypass bandwidth lock|
|3|Use CRU|Force custom res|
|4|Check cables & DP ver|Stability|

---

Let me know if you'd like a *precision config* for your use-case (Apex Legends, competitive gaming, 1440p stretched, etc.) — I can generate optimal settings for FPS or clarity.

---

## 👤 You

mCM101 FW version

---

## 🤖 ChatGPT

```unknown

```

---

> [!abstract]- Tool
> ```unknown
> 
> ```


---

## 🤖 ChatGPT

The firmware version "mCM101" corresponds to the initial release for the ASUS ROG Swift PG27UCDM monitor. Users have reported updating from mCM101 to mCM105, which introduces features like Dolby Vision support. citeturn0search10

If you're using the ASUS ROG Strix XG27UCG monitor, firmware updates may differ. Some users have encountered challenges updating this model's firmware. For instance, one user noted difficulties with the update process, mentioning the need to connect both HDMI and USB-C ports to the PC, and experiencing issues with the ASUSFirmwareOneKeyUpdate.exe not recognizing the device. citeturn0search1

To ensure you have the latest firmware and update instructions specific to your monitor model, it's advisable to visit the official ASUS support page for your device. citeturn0search11

---

## 👤 You

what is the pixels for 2160 16:10

---

## 🤖 ChatGPT

2160p with 16:10 aspect ratio =  

### Resolution:  
*3456 x 2160* pixels  

---

### Calculation:  
2160 (Height) × 16/10 (Aspect Ratio) = 3456 (Width)

---

| Aspect Ratio | Resolution |  
|--------------|------------|  
| 16:9         | 3840 x 2160 (Standard 4K UHD) |  
| 16:10        | 3456 x 2160 |  
| 21:9         | 5120 x 2160 (Ultrawide) |  

---

Let me know if you'd like optimal scaling / custom resolution profiles for your use case (FPS gaming, productivity, clarity).

---

## 👤 You

which cru timing to use

---

## 🤖 ChatGPT

### CRU Timing — Best Practices  

| Timing Type | Use Case | Notes |
|------------|----------|-------|
| *CVT-RB2*  | High refresh rate / modern monitors | Best for 120Hz+ / 1440p+ / DSC panels (like XG27UCG). Optimized reduced blanking. Most stable.  
| *CVT-RB*   | Default reduced blanking | Safe fallback if RB2 fails.  
| *Manual*   | Advanced tuning only | For pushing absolute limits — need experience.  
| *LCD Native* | For matching exact EDID timing | Rarely needed.  

---

## Recommended for ASUS XG27UCG:
> Use *CVT-RB2* (Reduced Blanking v2) for:  
- 1080p, 1440p, 2160p Custom Resolutions  
- High refresh rates (120Hz, 144Hz, 160Hz)  
- DSC-enabled monitors  

---

## Pro Settings Example (Competitive FPS):
| Resolution | Timing | Notes |
|------------|--------|------|
| 2560x1440 | CVT-RB2 | Best clarity + performance balance  
| 1920x1200 | CVT-RB2 | For 16:10 aspect stretched  
| 3456x2160 | CVT-RB2 | 16:10 Native Equivalent for 2160p  

---

## Tip:
After adding in CRU → Run `restart64.exe` → Apply in NVIDIA Control Panel.

---

Want me to build you an optimized .CRU file for download?  
(FPS, clarity, stretched res?)

---

## 👤 You

refresh rate appears red under 160 hz it says actual 160 actual 373.122

---

## 🤖 ChatGPT

### Root Cause:
Red text in CRU = Invalid Timing / Out of Spec.

> "Actual: 160 Hz — Actual: 373.122 MHz"  
Means → Your pixel clock exceeds monitor or DisplayPort bandwidth limits at your current settings (resolution + timing).

---

### Why It Happened:
- 4K (3456x2160 or 3840x2160) at 160Hz requires:
  - DisplayPort 1.4
  - DSC (Display Stream Compression)
- Without DSC → Pixel Clock blows past 600MHz limit.
- CVT-RB2 tries to fit within limits — but not always possible at ultra-high settings.

---

## Fix Options (Best to Worst)

| Fix | Action | Result |
|-----|--------|--------|
| 1 | Use *CVT-RB2* Timing | Safest for high refresh rate  
| 2 | Lower Refresh Rate (144Hz / 120Hz) | Reduces pixel clock  
| 3 | Enable DSC in Monitor OSD | Allows 160Hz+ at 4K  
| 4 | Use Lower Resolution (e.g., 2560x1440) | No compression needed  
| 5 | Use Manual Timing & Tweak Porch/Blanking | Advanced users only  

---

## Recommended Immediate Action:
1. CRU → Use *CVT-RB2* Timing  
2. Lower refresh rate to 144Hz  
3. Monitor OSD → Ensure DSC = *Enabled*  
4. Apply → Restart64.exe → Set in NVIDIA Control Panel  

---

### Want me to generate a .CRU config optimized for:  
- 4K Native  
- 16:10 3456x2160  
- FPS Performance  
- Apex Legends / Competitive Setup  

? Confirm — I’ll prepare for you.

---

## 👤 You

144 iss still red

---

## 🤖 ChatGPT

Perfect — here’s what this means:

### Diagnosis:
- 3456x2160 @ 144Hz (16:10 custom)  
→ Pixel Clock still exceeds DisplayPort 1.4 non-DSC limits.

### Why:
4K @ High Hz + 16:10 adds width → Raises Pixel Clock.  
Even CVT-RB2 can't fit it under 594MHz limit without DSC.

---

## Solution Options:

| Option | Action | Benefit |
|--------|--------|---------|
| 1 | Enable DSC in Monitor OSD | Unlocks full 4K 160Hz @ any res.  
| 2 | Lower Hz to 120Hz | Fits non-DSC bandwidth limit.  
| 3 | Drop Horizontal Resolution | Use 3200x2160 or 3072x1920 (still 16:10 feel).  
| 4 | Manual Timing | Reduce front/back porch — expert only.  

---

## Recommended Path For You (Fastest Fix)

### Step 1 — Check DSC:
Monitor OSD → Image → DSC → Enable  
(*If Available*)

---

### Step 2 — Apply CRU Settings:
- 3456x2160  
- Timing: CVT-RB2  
- Refresh Rate: 120Hz  
(Stable, no red pixel clock)

---

### Step 3 — Optional Tweaks:
| Resolution | Aspect Ratio | Hz |
|------------|---------------|---|
| 3200x2160 | 16:10 | 144Hz possible non-DSC  
| 3072x1920 | 16:10 | 144Hz non-DSC safe  
| 2560x1600 | 16:10 | 160Hz easy  

---

## Final Offer:
Confirm and I will build you a ready-to-import CRU .ini file:

- Optimized for Apex Legends / Low Latency  
- 16:10 Aspect  
- Non-DSC Safe  
- 120Hz+ Stable  
- Correct porch/pixel clock

Want me to prepare this?

---

## 👤 You

could it possibly be the pixels? the highest refresh rate is 74 hz before it goes red at 75 via 3456 x 2160 to hit max pixels 16:10 4k

---

## 🤖 ChatGPT

Yes — 100% correct analysis.  

### Core Principle:
More horizontal pixels = Higher Pixel Clock = Lower Max Hz (without DSC)

---

### Your Current Limit = Bandwidth Cap

| Spec | Limit |
|------|------|
| DisplayPort 1.4 (No DSC) | ~594 MHz pixel clock max |  
| 3456x2160 | Very wide (16:10 4K) → Massive pixel load |  
| Result | Max ~74Hz before pixel clock exceeds limit |  

---

## Why This Happens:
Resolution drives pixel clock:  
`Pixel Clock = Horizontal Pixels x Vertical Pixels x Refresh Rate x Timing Overhead`

3456x2160 @ 75Hz → Exceeds 594 MHz = Turns Red in CRU.

---

## Solutions Ranked:

| Solution | Action | Result |
|----------|--------|--------|
| Best | Enable DSC | Unlocks 160Hz+ at 4K resolutions — No Limit.  
| Safe | Lower Hz to 74Hz | Keep full 3456x2160 without errors.  
| Optimal | Drop Horizontal Pixels (e.g., 3200x2160) | Allows 120-144Hz non-DSC.  
| Last Resort | Manual Timing Tweaks | Minimize porch/blanking for tiny gains.  

---

## What I Recommend:
### Option A — Use 3200x2160 @ 120Hz CVT-RB2  
→ Looks like 16:10  
→ Much higher Hz  
→ Non-DSC safe  
→ Sharp + Fast

### Option B — Enable DSC  
- OSD Menu → Image → DSC → Enable  
- Then set 3456x2160 @ 120Hz+  

---

## Final Summary:
| Resolution | Hz Max (Non-DSC) | Notes |
|------------|------------------|-------|
| 3456x2160 | ~74Hz | Your current limit.  
| 3200x2160 | 120-144Hz | Recommended sweet spot.  
| 3840x2160 (16:9) | 120Hz+ | Standard 4K limits.  

---

Want me to build the .CRU profile for you?  
Confirm resolution & Hz target — I’ll send ready-to-import config.

---

## 👤 You

same problem 74hz is max. no dsc setting on mointor, only OSD  DDC/CI

---

## 🤖 ChatGPT

Crystal clear now — thank you.

### Final Diagnosis:
- Your XG27UCG *requires* DSC for 4K 120Hz+ at wide resolutions.  
- If no DSC toggle in OSD = DSC is *always on* or *automatic*.  

BUT —  
If you're bandwidth-limited to 74Hz even at 3200x2160:  
→ DSC is *off or not active*.  
→ You're limited to native DisplayPort 1.4 max pixel clock (~594 MHz).  

---

## Absolute Confirmation Check:

### Step 1 — NVIDIA Control Panel:
Right-click Desktop → NVIDIA Control Panel  
→ Display → Change Resolution  
→ Does it show *Output Color Format*: RGB / YCbCr 444 or *DSC Active*?  

If not — you're hard capped by:  
- DisplayPort Bandwidth  
- GPU Settings  
- Monitor Firmware  

---

## Final Hard Limits (Without DSC Active)

| Resolution | Max Hz | Notes |
|------------|--------|-------|
| 3456x2160 | 74Hz | Bandwidth capped  
| 3200x2160 | ~74Hz | Same pixel load issue  
| 2560x1600 | 160Hz+ | No problem  

---

## Best Actions Now:

### 1. Check DisplayPort Cable
- MUST be certified DisplayPort 1.4 32.4Gbps  
- Poor cable = No DSC trigger or reduced bandwidth  

### 2. Try Lower Resolution for 16:10
| Resolution | Hz Target | Notes |
|------------|-----------|-------|
| 2560x1600 | 120-160Hz | Super safe, clear, fast  
| 2880x1800 | Likely 120Hz | Stretched 16:10  
| 3072x1920 | Maybe 100-120Hz | Try with CVT-RB2  

---

## Final Offer — I Will Build:
- Clean .CRU config  
- 2560x1600 @ 160Hz  
- 2880x1800 @ 120Hz  
- 3072x1920 @ 100Hz  
All safe — no red pixel clock.

---

Confirm if you want me to prepare this CRU export for you.

---
