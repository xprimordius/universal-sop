---
title: Free Ticketing Referral System
source: chatgpt
type: conversation
person: alan
created: "2025-05-08T18:30:25.891417+00:00"
updated: "2025-05-08T18:32:49.987975+00:00"
year: 2025
month: 2025-05
quarter: 2025-Q2
messages: 5
shared: False
id: 681cf841-6448-8000-9df4-c3fbbf09cc98
tags:
  - chatgpt
  - alan
---

# Free Ticketing Referral System

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

How to create a ticketing system online for free where people get extra virtual tickets towards a prize based on who they invite who also joined and followed everyone’s socials?is there an automation system that tracks all this and does it

---

## 🤖 ChatGPT

To create a **free online ticketing + referral reward system** that gives **extra entries** based on successful **referrals and social follows**, here's the most efficient stack and how to set it up:

---

### **Platform to Use (Free or Freemium)**

#### 1. **Gleam.io** (Freemium)
- Tracks: Referrals, social follows (Twitter, YouTube, Instagram*, Facebook*)
- Automates ticket entries
- Each action = ticket/entry
- Referral system built-in (unique referral links)
- *Instagram/Facebook follow tracking limited due to API*

#### 2. **KingSumo** (Free plan available with branding)
- Focused on virality + referrals
- Referrals = bonus entries
- Simple setup for email + social follow
- Less advanced tracking than Gleam but easier UI

#### 3. **Rafflecopter** (Freemium)
- Referral links + social action tracking
- Lower customization vs. Gleam

---

### **Process (Using Gleam as Example)**

1. **Create a Giveaway**
   - Set your prize, end date, terms
2. **Set Entry Actions**
   - Follow X on Twitter = +1 entry
   - Subscribe to YT = +1
   - Refer a friend = +3 per join
   - Visit IG profile = +1 (no IG API follow verify)
3. **Activate Viral Sharing**
   - Gleam auto-generates referral link for each entrant
4. **Embed or Link**
   - Host on your site or share Gleam page

---

### **Automation Built-In**
- Referral tracking via unique links
- Email validation
- Entry logs & anti-cheat filters
- Export entries to CSV

---

### **Limitations**
- Instagram/Facebook no longer allow true “follow” tracking due to API policy—only “profile visit” can be tracked.
- Some platforms may require paid plans to remove branding or unlock more features.

---

### **Alternative Stack (if coding-savvy)**
- **Google Firebase + Typeform + Zapier + Google Sheets**
  - Manual but free.
  - You’ll need logic to track referrals via UTM or custom links.
  - Social follows not easily verifiable.

---

### **Best Recommendation (No Code)**
- **Use Gleam.io free plan** if you want all-in-one functionality with minimal tech setup.
- Upgrade if you want more social tracking or branding control.

---

Want me to generate a sample giveaway campaign or provide templates?

---

## 👤 You

How will we be able to track if the referrals were legit people who followed all of the socials / twitch accounts / TikTok’s

---

## 🤖 ChatGPT

**TLDR:** No free platform can **fully verify** that a referral actually **followed all social accounts** (especially TikTok/Instagram/Twitch) due to API restrictions. However, here’s the **closest reliable system**:

---

### **1. Tracking Referrals (Verified)**
- **Gleam** or **KingSumo** generates **unique referral links**.
- Only **real people** who enter through that link and confirm their email are counted.
- This ensures the referred person **actually entered**—not just clicked.

---

### **2. Tracking Social Follows (Partially Verified)**
| Platform    | Can Auto-Verify? | Notes |
|-------------|------------------|-------|
| **Twitter** | Yes              | Via OAuth API (Gleam can confirm follow) |
| **YouTube** | Yes              | User must be logged in (OAuth) |
| **Twitch**  | **No**           | Cannot verify follow—only "visit" via link |
| **TikTok**  | **No**           | TikTok API does not allow follow verification |
| **Instagram** | **No**         | API blocked follow tracking since 2020 |

---

### **3. Workarounds**
- **Custom Verification Task**:
   - After entry, show: “Submit screenshot proof of all follows to get bonus entries.”
   - Use Google Forms, Typeform, or Gleam’s upload feature (paid plan).
- **Gate reward access**:
   - Only email confirmed + screenshot verified entries are eligible to win.

---

### **4. Anti-Cheat Filtering**
Platforms like Gleam include:
- Email verification
- IP/cookie duplicate detection
- Bot filtering

---

### **Best Practice Stack**
- **Gleam Free Plan**: Tracks legit referrals + auto-verifies Twitter/YT.
- **Google Form Upload (optional)**: Manual verification for TikTok/Twitch/IG.
- **Final manual check** before selecting winners if needed.

---

Want a prebuilt Gleam + Google Form combo system mockup?

---
