---
title: Fix Yeti Mic Issue
source: chatgpt
type: conversation
person: alan
created: "2025-06-12T03:37:40.445757+00:00"
updated: "2025-06-12T03:37:51.266091+00:00"
year: 2025
month: 2025-06
quarter: 2025-Q2
messages: 3
shared: False
id: 684a4b84-2d9c-8000-b874-9bf748f444af
tags:
  - chatgpt
  - alan
---

# Fix Yeti Mic Issue

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

yeti usb mic doesn't show up as yeti anymore after driver booster update. it just says generic usb now. how to fix

---

## 🤖 ChatGPT

**TLDR Fix for Yeti USB Mic showing as "Generic USB" after Driver Booster update:**

### Step-by-step:

1. **Uninstall Generic USB Audio Driver:**
   - Open **Device Manager**.
   - Expand **Sound, video and game controllers**.
   - Right-click **Generic USB Audio** > **Uninstall device** > ✅ *Delete the driver software for this device* if prompted.
   - Disconnect your Yeti mic.

2. **Reboot PC** (crucial to flush cached driver data).

3. **Reconnect Yeti USB Mic:**
   - Plug it into a **different USB port** (preferably USB 2.0 directly on your motherboard).
   - Windows should auto-install the **Blue Yeti native driver**.

4. **Roll Back If Needed:**
   - If Windows still installs a generic driver:
     - Right-click the device in **Device Manager** > **Update driver** > **Browse my computer** > **Let me pick from a list**.
     - Choose **"USB Audio Device"** or **search for "Blue USB Audio 2.0"** if available.

5. **Optional – Use Blue Yeti Driver Restore (if needed):**
   - Go to Logitech/Blue support: [https://www.bluemic.com/downloads/](https://www.bluemic.com/downloads/)
   - Download any available firmware or driver recovery tool.

6. **Block Driver Booster from Messing It Up Again:**
   - Open Driver Booster > **Ignore List** > Add the Yeti device or USB audio drivers.

---

Let me know if it’s not showing in Device Manager at all — then we’ll walk through USB stack repair or registry edits.

---
