---
title: Play YouTube in Discord
source: chatgpt
type: conversation
person: alan
created: "2025-07-13T06:32:23.871705+00:00"
updated: "2025-07-13T06:40:13.949459+00:00"
year: 2025
month: 2025-07
quarter: 2025-Q3
messages: 21
shared: False
id: 687352f7-8310-8000-a6e5-0a1f32bc79bb
tags:
  - chatgpt
  - alan
---

# Play YouTube in Discord

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
> ```Speak in mastery. Communicate in headlines. Maximize clarity, brevity, precision, and intuitive understanding. Eliminate confusion. Prioritize strategy, emotional intelligence, and vortex alignment. Operate like my elite strategic partner, spiritual mirror, execution coach, and heart-based closer. Integrate: Bashar’s excitement formula, Abraham Hicks’ vortex, Andy Elliott’s sales ethics, and principles from How to Win Friends and Everyone Communicates. Be powerful, kind, direct, and transformational. Mirror my highest self and vision at all times. Never let me settle.
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

how to play youtube through a discord bot that joins the voice channel

---

## 🤖 ChatGPT

**How to Play YouTube Audio Through a Discord Bot (2025 Guide)**

### ✅ TLDR Summary:
You need a Discord bot that can:
- Join a voice channel  
- Stream audio from YouTube

### 🛠️ Tools Required:
1. **Node.js**  
2. **Discord.js v14+**  
3. **@discordjs/voice**  
4. **ytdl-core**

---

### ⚙️ Step-by-Step Setup (Node.js Bot)

#### 1. **Install Required Packages**
```bash
npm install discord.js @discordjs/voice ytdl-core dotenv
```

#### 2. **Basic Bot Code (`index.js`)**
```js
require('dotenv').config();
const { Client, GatewayIntentBits } = require('discord.js');
const { joinVoiceChannel, createAudioPlayer, createAudioResource, AudioPlayerStatus } = require('@discordjs/voice');
const ytdl = require('ytdl-core');

const client = new Client({ intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildVoiceStates, GatewayIntentBits.GuildMessages, GatewayIntentBits.MessageContent] });

client.once('ready', () => {
  console.log(`Bot is online as ${client.user.tag}`);
});

client.on('messageCreate', async message => {
  if (!message.content.startsWith('!play') || message.author.bot) return;

  const args = message.content.split(' ');
  const url = args[1];
  const voiceChannel = message.member.voice.channel;

  if (!voiceChannel) {
    return message.reply('Join a voice channel first.');

---

## 👤 You

is there a way i can do without coding

---

## 🤖 ChatGPT

**Yes — You can play YouTube in a Discord voice channel without coding** by using a **prebuilt music bot**. Here are the top options:

---

### ✅ **1. Hydra Bot** (Free + Premium)
- **Website:** [https://hydra.bot](https://hydra.bot)
- **Features:**  
  - Play YouTube, Spotify, SoundCloud, and more  
  - Slash commands: `/play [link or name]`  
  - Web dashboard for control  

---

### ✅ **2. FredBoat** (Free)
- **Website:** [https://fredboat.com](https://fredboat.com)
- **Features:**  
  - Plays from YouTube, SoundCloud, Twitch, etc.  
  - Commands: `;;play [link or keywords]`  
  - No dashboard, all command-based  

---

### ✅ **3. Chip Bot** (Music-focused, Free + Premium)
- **Website:** [https://chipbot.gg](https://chipbot.gg)
- **Features:**  
  - High-quality audio  
  - Easy `/play` command  
  - Good for streaming playlists  

---

### 🧠 How To Use (with any of the above):
1. **Invite the bot** to your server from the website.
2. **Join a voice channel.**
3. Type a command like:
   ```
   /play https://youtube.com/watch?v=VIDEO_ID
   ```
   or
   ```
   ;;play never gonna give you up
   ```

---

### ⚠️ Note:
Some bots **require premium** for YouTube audio due to restrictions. Hydra and FredBoat often work without that.

---

Want help choosing the best one for your specific use (e.g. playlists, quality, or minimal permissions)?

---

## 👤 You

theres no /play for hydra

---

## 🤖 ChatGPT

```unknown

```

---

## 🤖 ChatGPT

```unknown

```

---

> [!note]- Reasoning recap
> Thought for a couple of seconds


---

## 🤖 ChatGPT

Hydra **no longer supports music**, including YouTube audio—this feature was officially removed in February 2023 after legal pressure citeturn0search7turn0search16.

---

## 🎶 No-Code Alternatives for YouTube on Discord

### 1. **FredBoat**
- Completely **free**, no premium required.
- Uses commands like:
  ```
  ;;play [YouTube link or keywords]
  ```
- Reliable, supports playlists.

### 2. **Chip**
- Music-first bot supporting YouTube/Spotify.
- Slash commands like:
  ```
  /play [YouTube link or keywords]
  ```
- Free tier available; check premium for high-quality audio.

### 3. **Hydra Replacement: Zira Music**
- Not related to Hydra, but built by Team Hydra.
- Use `/play [YouTube URL or search]` citeturn0search10.
- Controls: `/pause`, `/skip`, `/volume`, `/leave`, etc.

---

## ✅ Quick Setup

1. Visit bot website (e.g. FredBoat, Chip, Zira).
2. Invite bot to your server with necessary permissions.
3. Join a voice channel.
4. Use slash or prefix commands:
   - **FredBoat**: `;;play VIDEO_URL`
   - **Chip/Zira**: `/play VIDEO_URL`

---

## 🔑 Recommendation

- Want **free & simple**? ➜ **FredBoat**
- Want **slash commands + modern UI**? ➜ **Chip** or **Zira**

Let me know if you want an invite link, setup help, or config tips for any of these.

---

## 👤 You

fredboat isn't working with my youtube link

---

## 🤖 ChatGPT

```unknown

```

---

## 🤖 ChatGPT

```unknown

```

---

> [!note]- Reasoning recap
> Thought for a couple of seconds


---

## 🤖 ChatGPT

FredBoat **no longer supports playing YouTube URLs directly**—this was disabled globally in late 2022 due to policy changes citeturn0search0turn0search1. It can still play from other sources like SoundCloud, Bandcamp, Twitch, JioSaavn, Dailymotion citeturn0search4turn0search9.

---

## ✅ Quick Fixes & Alternatives

### 1. **Use FredBoat’s Search Instead of URL**
Type:
```
/play [song name]
```
FredBoat will search across supported sources (not YouTube URLs) citeturn0search4turn0search7.

---

### 2. **Switch to a Bot That Still Supports YouTube**

- **Jockie Music**  
  Slash commands like:
  ```
  /play https://youtu.be/…
  ```
  Reddit users confirm it still works:
  > “Jockie Music still works great with YouTube links…” citeturn0search11

- **Hydra** or **Groovy**  
  Some communities report ongoing YouTube functionality citeturn0search11. Hydra recently removed music, but forks like Zira Music may work.

---

## 🧭 Recommendation For You:

- **Option A**: Use FredBoat with search terms for SoundCloud, Bandcamp, etc.  
- **Option B**: Add **Jockie Music** for reliable YouTube playback with simple `/play [link]`.  
- **Option C**: Consider **Hydra forks** like Zira if you prefer modern slash commands.

---

Need help inviting and setting up **Jockie Music** or another bot? I’ll guide you step-by-step—just say the word.

---

## 👤 You

how to change default starting volume of jockie bot

---

## 🤖 ChatGPT

```unknown

```

---

> [!note]- ChatGPT reasoning
> **Looking for volume change info**
> I’m going to search for information on changing the default volume for Jockie Music. Hopefully, I’ll find something relevant that explains how to adjust it. I'll refine my search for precision and check the best sources I can find for this detail. Once I gather enough, I’ll summarize how changes can be made or if specific settings need to be adjusted.


---

## 🤖 ChatGPT

```unknown

```

---

> [!note]- Reasoning recap
> Thought for a couple of seconds


---

## 🤖 ChatGPT

To change Jockie Music's **default starting volume**, use its built-in settings command. This sets the volume level automatically each time it plays:

---

### 🔧 How to Set Default Volume

Use this command in chat:

```
m!set default volume <value>
```

- Replace `<value>` with your desired volume percentage (e.g., `50` for 50%)  
- This sets the **starting volume** for all playback by Jockie Bot citeturn0search10

---

### ✅ Example Usage

```text
m!set default volume 60
```

- Results in all future tracks starting at 60% volume  
- Can be tested with `m!play [song]`

---

### 🧠 Tip: Check Current Setting

To verify your change:

```text
m!settings  # or look under Settings in dashboard
```

Look for **default volume** showing your value.

---

Let me know if you want to adjust per-session levels or automate it further.

---
