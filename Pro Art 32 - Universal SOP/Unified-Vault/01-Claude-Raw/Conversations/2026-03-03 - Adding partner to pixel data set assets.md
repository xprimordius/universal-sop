---
title: Adding partner to pixel data set assets
source: claude
type: conversation
person: alan
created: "2026-03-03T09:46:11.226531Z"
updated: "2026-03-03T09:46:53.270408Z"
year: 2026
month: 2026-03
quarter: 2026-Q1
messages: 4
uuid: 07701bd5-be24-43c9-8b6d-d94e7b4fb6c2
tags:
  - claude
  - alan
---

# Adding partner to pixel data set assets

> [!info]- Conversation summary
> **Conversation Overview**
> 
> The user is experiencing a Meta/Facebook Business Manager restriction that is preventing them from adding a partner to share Pixel data source assets. Specifically, Meta's policy places new business accounts on a waiting period before they can add partners, and although the stated timeframe has passed (over a month), the restriction remains active. The user needs to grant their partner access to Pixel data urgently.
> 
> Claude provided a tiered set of solutions. For immediate workarounds, Claude suggested using Google Tag Manager with the Pixel ID directly, sharing the Pixel ID and Access Token manually for Conversions API access, or adding the partner as an Employee (rather than a Partner) within Business Settings via People → Invite by email, which bypasses the partner restriction entirely. For resolving the underlying restriction, Claude recommended opening a live chat through Business Support Home (business.facebook.com/support) to request manual review, citing the 30+ day duration as grounds for escalation, and contacting a Meta rep directly if the user has significant ad spend. Claude identified the Employee user seat route as the fastest path to functional access today, noting the tradeoff is a user role rather than a true partner relationship.
> 
> The user did not specify the partner's exact role (agency, developer, etc.), so Claude asked a clarifying question at the end to help narrow down the cleanest long-term solution.


---

## 👤 You

solution to not being able to add partner to give pixel data set assets to via business.facebook

---

## 🤖 Claude

What's the specific issue you're running into? A few common scenarios:

**Can't find the partner option**
- Go to Business Settings → Users → Partners → Add (not through Assets directly)

**Partner not showing up / can't add them**
- You need their **Business Manager ID** (not their personal FB or ad account ID)
- They must have an active Business Manager account

**Pixel sharing specifically**
- Business Settings → Data Sources → Pixels → select the pixel → click **Add People** or **Partners** tab
- If the Partners tab is missing, your account may not have admin-level access to that pixel

**Workarounds if the UI is broken:**
1. **Use the partner's Business Manager ID** to send a partnership request instead of trying to share directly
2. **Add them as a user** on the pixel with their work email (if they're an individual rather than an agency)
3. **Use the Meta Business Suite mobile app** — sometimes asset sharing works there when the desktop UI bugs out
4. **API route** — if you have developer access, pixel sharing can be done via the Marketing API directly

What exactly happens when you try — is it an error message, a missing option, or something else?

---

## 👤 You

it says new business users will be allowed to after several weeks off following their policy but its been a month and i need them asap

---

## 🤖 Claude

This is a frustrating but common Meta friction point. Here's what to try:

**Fastest workarounds right now:**

1. **Google Tag Manager** — have your partner drop the pixel ID into GTM directly. They don't need asset access if they're just implementing/reading data on their end.

2. **Share the Pixel ID + Access Token manually** — they can pull event data via the Conversions API without needing Business Manager partner access.

3. **Add them as an Employee on your Business Manager** — go to Business Settings → Users → People → Invite by email. Give them pixel access that way. This bypasses the partner restriction entirely since it's a user role, not a partner role.

**To escalate the restriction itself:**

- Go to **Business Support Home** (business.facebook.com/support) and open a live chat — don't use the help articles, get a human
- Reference the specific policy hold and ask for manual review — if it's been 30+ days that's grounds for escalation
- If you have a Meta rep or run significant ad spend, contact them directly — they can flag it internally

**The employee route (option 3) is probably your fastest path** if you just need them working today. The tradeoff is they'd have a user seat in your BM rather than a true partner relationship, but functionally they get the same pixel access.

What's their role — agency, developer, or something else? That'll help narrow down the cleanest fix.

---
