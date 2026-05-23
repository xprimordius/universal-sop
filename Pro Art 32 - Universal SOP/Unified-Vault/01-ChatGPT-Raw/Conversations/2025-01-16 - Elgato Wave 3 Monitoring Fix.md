---
title: Elgato Wave 3 Monitoring Fix
source: chatgpt
type: conversation
person: alan
created: "2025-01-16T16:48:01.784398+00:00"
updated: "2025-01-16T16:49:30.615432+00:00"
year: 2025
month: 2025-01
quarter: 2025-Q1
messages: 5
shared: False
id: 67893841-76f4-8000-8cd6-5911165f6d04
tags:
  - chatgpt
  - alan
  - tech
---

# Elgato Wave 3 Monitoring Fix

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

Elgato wave 3 can hear myself through ear buds connected to microphone, and windows listen to device is unchecked. how to fix?

---

## 🤖 ChatGPT

If you're hearing yourself through your earbuds connected to the Elgato Wave 3 microphone and the "Listen to this device" option in Windows is unchecked, it's likely due to the Wave 3's own monitoring feature. Here's how to fix it:

### Steps to Adjust Monitoring on the Elgato Wave 3:

1. **Check Wave Link Software:**
   - Open the Elgato Wave Link software that manages the microphone.
   - Look for the **Monitor Mix** slider or monitoring settings.
   - Lower or mute the monitor mix to reduce or eliminate the playback of your voice in the earbuds.

2. **Adjust Microphone Monitoring Directly:**
   - The Elgato Wave 3 has built-in hardware monitoring. If the monitoring volume is set high, you'll hear yourself through the connected earbuds.
   - Adjust the **volume knob** on the Wave 3:
     - Tap the knob to cycle through modes (input gain, headphone volume, or monitor mix).
     - Ensure you're adjusting the monitor mix mode (usually indicated by the LED).
     - Lower or mute the monitor mix as needed.

3. **Windows Sound Settings:**
   - Confirm that the microphone is not being routed elsewhere unintentionally:
     - Right-click the speaker icon in the taskbar and choose **Sounds** or **Sound Settings**.
     - Go to the **Recording** tab, select the Elgato Wave 3, and click **Properties**.
     - In the **Listen** tab, confirm that "Listen to this device" is unchecked.
   - Go to the **Playback** tab and ensure the output isn't looping through another device.

4. **Wave Link Routing Configuration:**
   - In the Wave Link software, check the routing table to see if the microphone channel is being sent to your headphones unnecessarily.
   - Disable or adjust routing settings as needed.

### Test:
After making these adjustments, speak into the microphone and check if you can still hear yourself. The issue should be resolved by reducing or muting the monitor mix in the Wave Link software or on the microphone itself.

---

## 👤 You

turning down input gain to 0db fixed it, which doesn't make sense? why?

---

## 🤖 ChatGPT

Turning the input gain to 0 dB resolving the issue is surprising but can happen due to how the Elgato Wave 3 processes audio internally. Here’s why it might have worked:

### 1. **Internal Monitoring Link to Input Gain**
   - The Elgato Wave 3 allows you to hear yourself via its built-in hardware monitoring feature. If the input gain is high, the signal sent to the monitoring circuit may also increase, even if you're not explicitly routing it to your earbuds.
   - Lowering the input gain effectively reduces the intensity of the signal sent to the internal monitoring path, causing the self-monitoring level to drop or become imperceptible.

### 2. **Hardware Monitoring Signal Chain**
   - The Wave 3 is designed with a direct hardware path for monitoring. If this path isn’t managed correctly (via the monitor mix or the gain controls), the microphone signal might leak into the headphone output at an audible level.

### 3. **Gain Misconfiguration**
   - When the input gain is set higher than necessary, it amplifies your voice within the monitoring system. Turning the gain to 0 dB essentially bypasses or significantly reduces the input signal, indirectly muting what you hear through the monitor.

### 4. **Signal Processing Glitch**
   - There might have been a minor software or firmware glitch where the input gain inadvertently affected the monitoring volume due to improper handling of audio routing by the Wave Link software or the microphone's internal processing.

### 5. **Audio Feedback from Software Loop**
   - Even with “Listen to this device” disabled, some audio software or drivers might unintentionally loop the input back to your output. Reducing the input gain could have prevented this by minimizing the audio signal entering the chain.

---

### Suggestions to Investigate Further:
1. **Check Firmware and Software Updates:**
   - Ensure the Wave 3 and Wave Link software are updated to the latest versions to avoid routing glitches.

2. **Test Monitoring with Different Gain Levels:**
   - Gradually increase the input gain to see if the monitoring issue reappears and note the threshold where it begins.

3. **Confirm Monitor Mix Setting:**
   - Double-check the monitor mix slider in the Wave Link software. Even a low value might become noticeable with high input gain.

This behavior indicates that the input gain setting is tightly linked to the self-monitoring signal path, even if unintentionally. Reducing the gain effectively muted the unwanted monitoring signal.

---
