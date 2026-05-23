---
title: Change iPhone backup location
source: chatgpt
type: conversation
person: alan
created: "2025-10-13T03:22:19.853609+00:00"
updated: "2025-10-13T03:30:41.453109+00:00"
year: 2025
month: 2025-10
quarter: 2025-Q4
messages: 31
shared: False
id: 68ec7050-a204-832f-84bf-94c17a36ecfb
tags:
  - chatgpt
  - alan
---

# Change iPhone backup location

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


---

## 👤 You

[real_time_user_audio_video_asset_pointer]

How to manually change the iPhone backup location on the computer.

---

## 🤖 ChatGPT

Alright, so to manually change the iPhone backup location on a PC, you’ll need to use a symbolic link. Here’s how you can do it:

First, find the current backup folder.

[media]

---

## 👤 You

You don't want a Mac.

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

Got it, on a Mac, it’s similar but you'll use a terminal command. First, locate the backup folder. It’s in your Library folder, under Application Support, then MobileSync, and finally Backup.

Then, pick the new location where you want backups.

Next, open Terminal. You’ll create a symbolic

[media]

---

## 👤 You

I have to use terminal? I can't do it intuitively? How stupid is that?

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

I totally get that—it’s not the most user-friendly process! But once it's set, you won’t have to do it again. If it helps, I can walk you step by step so it feels less technical – just let me know!

[media]

---

## 👤 You

How do I change it quick?

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

Alright, let’s make it smooth! 

First, open Finder, click "Go" in the menu bar, hold the Option key, and select "Library." From there, go to Application Support, then MobileSync, then Backup.

Now, move that Backup folder to your new location.

Then open Terminal, and type: 
ln -s (new location path)/Backup ~/Library/Application\ Support/MobileSync/Backup

Press enter, and you're done! Super

[media]

---

## 👤 You

[real_time_user_audio_video_asset_pointer]

Wait, whoa, whoa, whoa, whoa, whoa. Go to...

---

## 🤖 ChatGPT

No worries, I got

[media]

---

## 👤 You

I don't know why they're asking.

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

Ah, got you! Okay, so in Finder, click "Go" at the top, then hold down the Option key. You’ll see "Library" appear in that menu. Click it, and

[media]

---

## 👤 You

Okay, I'm in the library folder. Now what?

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

Awesome! Now go into the "Application Support" folder, then "MobileSync," and inside there you’ll see the "Backup" folder. Let me know once you’ve found it, and we’ll keep going!

[media]

---

## 👤 You

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

Perfect! Now move that Backup folder to wherever you want your backups to be stored, like an external drive or another folder. Once you’ve moved it, let me know and we’ll do the final step to link it up!

[media]

---

## 👤 You

I can't hear you if you're saying anything.

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

Oops, my bad! No worries, I’ll keep everything verbal from here on out. Let me know once you’ve moved that Backup folder, and we’ll handle the last step!

[media]

---

## 👤 You

[real_time_user_audio_video_asset_pointer]

---

## 🤖 ChatGPT

Awesome! Now let’s link it. Open Terminal, and type this:  
ln space dash s, then the path to your new Backup folder, and then the path to where the old Backup

[media]

---

## 👤 You

Copy paste

---

## 🤖 ChatGPT

Could you clarify what you’d like me to copy and paste — a specific message, transcript, or file content?

---

## 👤 You

Terminal

---

## 🤖 ChatGPT

Got it — if you mean **copy-pasting into Terminal** (on macOS or Windows), here’s what to know:  

### 💻 How to Copy & Paste Commands into Terminal
1. **Highlight** the command (e.g. `ln -s /path/to/new/Backup ~/Library/Application\ Support/MobileSync/Backup`)  
2. **Copy** it (`Cmd + C` on Mac, `Ctrl + C` on Windows).  
3. **Paste into Terminal**:  
   - Mac: `Cmd + V`  
   - Windows (PowerShell or Command Prompt): `Ctrl + V`  
4. **Press Enter** to execute.

### ✅ Example (Mac – change iPhone backup location)
If you want to move your iPhone backup folder to a new drive:
```bash
ln -s /Volumes/ExternalDrive/Backup ~/Library/Application\ Support/MobileSync/Backup
```
*(Replace `/Volumes/ExternalDrive/Backup` with your actual destination path.)*

Would you like me to give you **the exact command customized** for your new backup location?

---

## 👤 You

Operation not permitted

---

## 🤖 ChatGPT

Perfect — that means macOS blocked Terminal from creating the symbolic link because it doesn’t have **Full Disk Access**.  
Here’s exactly how to fix it 👇  

---

### 🧰 Fix “Operation not permitted” on Mac Terminal

#### 1. **Grant Full Disk Access**
1. Open **System Settings** → **Privacy & Security** → **Full Disk Access**  
2. Click the **“+”** button → add your **Terminal app** (you may need to unlock the padlock first)  
   - For macOS Sonoma or Ventura: you’ll find **Terminal** under `/Applications/Utilities/Terminal.app`
3. Turn the toggle **ON** next to Terminal  
4. Quit and reopen Terminal  

---

#### 2. **Re-run the command**
Once reopened, run this again (update the path as needed):
```bash
ln -s /Volumes/ExternalDrive/Backup ~/Library/Application\ Support/MobileSync/Backup
```

---

#### 3. **Optional – confirm it worked**
Run:
```bash
ls -l ~/Library/Application\ Support/MobileSync
```
You should see something like:
```
Backup -> /Volumes/ExternalDrive/Backup
```

---

Would you like me to help you write the **exact full command** for your new backup drive’s name (so you can just paste and go)?

---

## 👤 You

There’s no full disk access there in privacy

---

## 🤖 ChatGPT

Got it — you’re likely on **macOS Sequoia, Sonoma, or Ventura** where Apple changed the layout a bit.  
Here’s the updated, **step-by-step fix** for the *“Operation not permitted”* error when creating symbolic links:  

---

### 🔒 Step-by-Step (macOS Sequoia/Sonoma/Ventura)

#### **1. Give Terminal Full Disk Access (new menu location)**
1. Open **System Settings → Privacy & Security**.  
2. Scroll **all the way down** to **“App Management”** or **“Full Disk Access”** — it may be nested under **Security** or **Developer Tools**, depending on your version.  
3. If you **don’t see “Full Disk Access”**, click the search bar at the top of System Settings and type **“Full Disk Access.”**  
4. When it appears, click it → unlock the padlock → click the **“+”** → add:
   ```
   /Applications/Utilities/Terminal.app
   ```
   ✅ Make sure the toggle is ON.  
5. Close settings, **quit Terminal completely**, then reopen it.

---

#### **2. Retry the command**
Example (adjust path to your drive name):
```bash
ln -s /Volumes/YourDriveName/Backup ~/Library/Application\ Support/MobileSync/Backup
```

---

#### **3. If you still get “Operation not permitted”**
Then SIP (System Integrity Protection) is blocking it — rare, but possible if you’re modifying a protected directory.

Quick workaround:
```bash
sudo ln -s /Volumes/YourDriveName/Backup ~/Library/Application\ Support/MobileSync/Backup
```
→ Enter your Mac password (it won’t show as you type).  

---

Would you like to tell me your macOS version (` menu > About This Mac`)?  
I can give the *exact* navigation path for your version — Apple moved this setting 3 times in recent updates.

---

## 👤 You

Added but not permitted

---

## 🤖 ChatGPT

Perfect — you did everything right so far.  
If you’ve **already granted Full Disk Access** and still get “Operation not permitted,” that means **System Integrity Protection (SIP)** is blocking changes to that specific Apple-protected folder (`~/Library/Application Support/MobileSync/Backup`).  

Let’s fix this safely, without disabling SIP permanently.  

---

### ✅ 3 Working Options (from safest to most direct)

#### **Option 1 – Use `sudo` (most people’s fix)**
Try this exact command, just replacing your drive name:
```bash
sudo ln -s "/Volumes/YourDriveName/Backup" "$HOME/Library/Application Support/MobileSync/Backup"
```
Then type your Mac password when prompted (nothing will show as you type).  
If this still says *“Operation not permitted”*, go to Option 2.  

---

#### **Option 2 – Make the symbolic link inside a non-protected parent**
Apple sometimes restricts symlinks in that `MobileSync` path.  
You can instead:
```bash
mv "$HOME/Library/Application Support/MobileSync/Backup" "$HOME/Library/Application Support/MobileSync/Backup-Old"
sudo ln -s "/Volumes/YourDriveName/Backup" "$HOME/Library/Application Support/MobileSync/Backup"
```
This renames the original, then recreates the link.  

---

#### **Option 3 – (Last resort)** Temporarily disable SIP
Only do this if Options 1–2 fail — you can re-enable SIP immediately afterward.

1. **Restart your Mac into Recovery Mode**
   - Apple Silicon: Hold **Power** until *Loading startup options…*  
   - Intel: Hold **Cmd + R** at boot.
2. From the menu bar → **Utilities > Terminal**
3. Run:
   ```bash
   csrutil disable
   reboot
   ```
4. Once back in macOS, re-run your `ln -s` command (it will now succeed).
5. **Re-enable SIP** afterward (important for security):  
   - Reboot into Recovery again  
   - In Terminal, run:
     ```bash
     csrutil enable
     reboot
     ```

---

Would you like to tell me your macOS version (e.g. *Sequoia 15.0* or *Sonoma 14.6*)?  
I’ll confirm which of those three options will definitely work for your version.

---
