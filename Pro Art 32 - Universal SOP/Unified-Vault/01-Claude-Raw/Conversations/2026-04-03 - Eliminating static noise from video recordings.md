---
title: Eliminating static noise from video recordings
source: claude
type: conversation
person: alan
created: "2026-04-03T19:22:48.626108Z"
updated: "2026-04-03T19:23:01.938199Z"
year: 2026
month: 2026-04
quarter: 2026-Q2
messages: 2
uuid: bf299dd2-a814-4b10-bfbb-038862039d4d
tags:
  - claude
  - alan
---

# Eliminating static noise from video recordings

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The person asked for help troubleshooting static noise in video recordings. Claude provided a comprehensive overview of the most common causes and their solutions, covering input gain settings, cable quality, electrical interference and ground loops, USB microphone power issues, built-in camera microphones, and preamp noise floor limitations. Claude also outlined post-production noise reduction options across several software tools including Audacity, Adobe Audition, DaVinci Resolve, and iZotope RX. The response concluded with a prioritized quick-fix recommendation: lower gain, move the microphone closer to the source, and apply noise reduction in post-production. Claude invited the person to share their specific setup for more targeted advice, but the conversation ended without the person providing additional details about their equipment or recording environment.


---

## 👤 You

How to get rid of static noise in video recording

---

## 🤖 Claude

**Kill the Static: Video Recording**

Static/hiss in video recordings almost always comes from one of these sources:

---

**1. Gain Too High on the Mic or Interface**
- Lower the input gain — this is the #1 cause
- Record louder *at the source* (get mic closer) instead of boosting gain

**2. Cheap or Unshielded Cables**
- Use balanced XLR cables instead of unbalanced TS/RCA
- Replace any long runs of cheap cable

**3. Electrical Interference / Ground Loop**
- Move away from computers, monitors, LED lights, power strips
- Try a **ground loop isolator** inline
- Plug everything into the same power strip/outlet

**4. USB Mic Drawing Noisy Power**
- Use a powered USB hub or dedicated audio interface
- Avoid plugging directly into a laptop USB (noisy power delivery)

**5. In-Camera Mic (Built-in)**
- These are almost always noisy — use an external mic

**6. Preamp Noise Floor**
- Budget interfaces have high noise floors
- Consider upgrading to a Focusrite Scarlett, MOTU M2, or similar

---

**Fix in Post (if needed)**
- **Audacity**: Noise Reduction effect (capture a noise profile first)
- **Adobe Audition**: Adaptive Noise Reduction
- **DaVinci Resolve**: Fairlight → Noise Reduction
- **iZotope RX**: Best in class for serious cleanup

---

**Quick Win:** Lower gain → get mic closer → apply noise reduction in post. That solves 90% of cases.

What's your current setup? (Mic, interface, recording software) — I can get more specific.

---
