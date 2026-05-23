---
title: Find Wistia Video ID
source: chatgpt
type: conversation
person: alan
created: "2025-05-24T20:17:45.848880+00:00"
updated: "2025-05-24T20:18:12.061696+00:00"
year: 2025
month: 2025-05
quarter: 2025-Q2
messages: 3
shared: False
id: 68322969-aa6c-8000-b89e-e4ff2580ff57
tags:
  - chatgpt
  - alan
  - tech
---

# Find Wistia Video ID

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

how to find wistia video ID

---

## 🤖 ChatGPT

**TLDR:**
To find a **Wistia video ID**, do one of the following:

---

### ✅ **Option 1: Inspect the Page**
1. **Right-click** the video → Click **“Inspect”** or press `Cmd+Option+I` / `Ctrl+Shift+I`.
2. Look for a line like:
   ```html
   <div class="wistia_embed wistia_async_abcd1234" ...>
   ```
3. The **video ID** is the part after `wistia_async_` → e.g., `abcd1234`.

---

### ✅ **Option 2: Page Source**
1. Right-click → View Page Source (`Cmd+U` or `Ctrl+U`).
2. Search for `wistia_async_` or `"hashed_id"`.

You’ll see something like:
```js
"hashed_id":"abcd1234"
```

---

### ✅ **Option 3: Wistia Player URL**
If embedded in a script or iframe:
```html
<script src="https://fast.wistia.com/embed/medias/abcd1234.jsonp"></script>
```
The video ID = `abcd1234`.

---

Let me know if you want a script to extract it automatically.

---
