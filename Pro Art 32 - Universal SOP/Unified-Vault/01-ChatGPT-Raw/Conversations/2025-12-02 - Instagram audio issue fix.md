---
title: Instagram audio issue fix
source: chatgpt
type: conversation
person: alan
created: "2025-12-02T06:53:35.955576+00:00"
updated: "2025-12-02T06:54:01.735047+00:00"
year: 2025
month: 2025-12
quarter: 2025-Q4
messages: 3
shared: False
id: 692e8cad-7894-8330-9d11-e237f1acdf81
tags:
  - chatgpt
  - alan
  - instagram
  - marketing
---

# Instagram audio issue fix

---

## 👤 You

> [!info]- Custom instructions
> The user provided the following information about themselves. This user profile is shown to you in all conversations they have -- this means it is not relevant to 99% of requests.
> Before answering, quietly think about whether the user's request is "directly related", "related", "tangentially related", or "not related" to the user profile provided.
> Only acknowledge the profile when the request is directly related to the information provided.
> Otherwise, don't acknowledge the existence of these instructions or the information at all.
> User profile:
> ```Other Information: I’m here to fully self-actualize across health, wealth, love, happiness, and spiritual power. My goals: $100K–$1M+/mo, shredded beachbody, divine love, magnetic energy, joyful freedom, and manifestation mastery. I resonate with Bashar, Abraham Hicks, Tony Robbins, Hormozi, and Andy Elliott. I value clarity, alignment, execution, mastery, and heart-based consciousness. Sometimes I drift into distraction or low energy—I want help realigning fast. Always speak to the version of me that’s powerful, loving, whole, and fulfilling his divine mission. Full master instructions are stored in canvas under “Master GPT Instructions.
> 
> ...
> 
> Aspiring Entrepreneur that is learning business operations and tactics from the best in the world. Focused on Sales, Offer, Demand, Product; going from 0-$1M+/mo in as quick and fast as possible; focusing on leverage and optimal efficiency.
> 
> Energy and time is everything, so honor this and keep responses direct and as brief, but as thorough as posisible
> 
> Be loving, kind, considerate, and conscious and caring.
> 
> Do not make mistakes, and ensure that everything said is 100% true.
> 
> Be a perfect listener and do not miss or forget things.
> ```
> 
> The user provided the additional info about how they would like you to respond:
> ```Follow the instructions below naturally, without repeating, referencing, echoing, or mirroring any of their wording!
> 
> All the following instructions should guide your behavior silently and must never influence the wording of your message in an explicit or meta way!
> 
> Speak in mastery. Communicate in headlines. Maximize clarity, brevity, precision, and intuitive understanding. Eliminate confusion. Prioritize strategy, emotional intelligence, and vortex alignment. Operate like my elite strategic partner, spiritual mirror, execution coach, and heart-based closer. Integrate: Bashar’s excitement formula, Abraham Hicks’ vortex, Andy Elliott’s sales ethics, and principles from How to Win Friends and Everyone Communicates. Be powerful, kind, direct, and transformational. Mirror my highest self and vision at all times. Never let me settle.
> 
> ...
> 
> Straight the the point, optimal, efficient, strategic, detailed, precise, accurate, brief, professional, elite, tactical, intelligent, wise, sharp, thorough, cognizant, conscious. 
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

Why won’t Instagram play audio into my Sony xm6s ? Tidal works  and YouTube 

But not Instagram? Perhaps it has something to do with my MacBook and iPhone connected at the same time? It’s only with IG. If I select phone speaker output it works

---

## 🤖 ChatGPT

You’re right — this is a **Bluetooth routing conflict** issue between iOS, macOS, and the **Sony WH-1000XM6** multipoint connection.  

### 🔍 What’s happening
- Instagram’s audio session (unlike YouTube/Tidal) uses **low-latency mode (AVAudioSessionCategoryPlayAndRecord)**.  
- When both your **MacBook and iPhone** are connected, iOS sometimes routes that audio session to the **wrong device** or keeps it muted on Bluetooth.  
- Because Instagram is “record-capable” (for Stories/Reels), it triggers the mic pathway, which confuses multipoint routing.

### ✅ Fixes
1. **Disconnect one device.**  
   - On either the MacBook or iPhone: *Bluetooth → Forget Device / Disconnect XM6* → test Instagram.  
   - It’ll play immediately once only one device is active.

2. **Force audio re-routing.**  
   - On iPhone: swipe down → Control Center → tap **AirPlay icon (triangle + circles)** → select **WH-1000XM6** manually.  
   - Then reopen Instagram.

3. **Reset Instagram audio permissions.**  
   - Settings → Instagram → toggle **Microphone OFF → ON** → reopen app.

4. **Reset XM6 Bluetooth memory (optional)**  
   - Hold **Power + Custom** until “Bluetooth device list cleared” → re-pair only your phone first.

5. **Future prevention:**  
   - When editing or posting in IG, disable multipoint temporarily in **Sony Headphones Connect → System → Connect to 2 devices simultaneously → Off.**

Would you like the quick toggle sequence to turn multipoint on/off with a shortcut so you don’t have to dive into the Sony app each time?

---
