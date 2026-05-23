---
title: 12900K Idle High Clock
source: chatgpt
type: conversation
person: alan
created: "2025-03-05T09:05:47.900328+00:00"
updated: "2025-03-05T09:53:29.433392+00:00"
year: 2025
month: 2025-03
quarter: 2025-Q1
messages: 14
shared: False
id: 67c813eb-b2e8-8000-8b31-458192260b2c
tags:
  - chatgpt
  - alan
  - tech
---

# 12900K Idle High Clock

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

why is my 12900k stuck at 5000-5100 mhz just idling on desktop

---

## 🤖 ChatGPT

If your **Intel i9-12900K** is stuck at **5000-5100 MHz** while idling on the desktop, here are the main reasons and how to fix them:

### **Possible Causes & Fixes**
1. **Windows Power Plan (High Performance or Ultimate Performance)**
   - **Issue:** These power plans force max CPU frequency even when idle.
   - **Fix:** Go to **Control Panel > Power Options** and set it to **Balanced**.

2. **BIOS Settings (Multi-core Enhancement or CPU Ratio Override)**
   - **Issue:** Some BIOS settings force the CPU to run at turbo speeds constantly.
   - **Fix:**
     - Enter **BIOS (DEL/F2 at boot)**
     - Look for **Multi-core Enhancement** or **CPU Ratio Mode**
     - Set it to **Auto** or **Default** instead of "Enabled."

3. **Intel SpeedStep / Speed Shift Disabled**
   - **Issue:** If **SpeedStep (EIST)** or **Speed Shift** is disabled, the CPU won’t downclock at idle.
   - **Fix:** Enable **Intel SpeedStep (EIST)** and **Intel Speed Shift** in **BIOS**.

4. **Background Apps or High CPU Usage**
   - **Issue:** A rogue process could be keeping CPU usage high.
   - **Fix:** Open **Task Manager (Ctrl+Shift+Esc)** and check for **high CPU usage processes**. If nothing is using the CPU but it's still at 5GHz, it's likely a BIOS/power setting issue.

5. **Windows or Third-party Software Overclocking**
   - **Issue:** Software like **Intel XTU, ThrottleStop, or motherboard utilities (e.g., ASUS AI Suite, MSI Dragon Center, Gigabyte EasyTune)** could be forcing an overclock.
   - **Fix:** Disable/remove any software-based overclocking tools.

6. **Core Parking Disabled**
   - **Issue:** If CPU core parking is disabled, the CPU will stay at max frequency.
   - **Fix:** Open **Regedit**, go to:
     ```
     HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00
     ```
     - Look for `Attribute` and set it to `2` (this reveals hidden settings in power options).
     - Then go to **Power Options > Processor Power Management** and enable core parking.

7. **BIOS Version or Microcode Update**
   - **Issue:** Some BIOS versions may have a bug keeping the CPU at turbo frequencies.
   - **Fix:** Check your **motherboard manufacturer’s website** and update your BIOS.

8. **Power Limits Set Too High**
   - **Issue:** If PL1/PL2 (Power Limit 1/2) is set too high, the CPU stays at max clock speeds.
   - **Fix:** In **BIOS**, set **PL1 and PL2** to stock levels.

---

### **How to Check Clock Speed Behavior**
Use **HWiNFO64** to check:
- **Clock speeds per core**
- **CPU package power draw (W)**
- **Temperature (could be thermal throttling issue)**
- **Utilization and C-states** (should show low usage at idle)

---

### **Quick Fix Summary**
1. **Set Power Plan to Balanced**
2. **Enable Intel SpeedStep & Speed Shift in BIOS**
3. **Check Task Manager for high CPU usage**
4. **Uninstall any overclocking software**
5. **Enable Core Parking in Power Settings**
6. **Update BIOS if needed**

If it still sticks at 5GHz, let me know your motherboard model, BIOS version, and any overclock settings you have applied.

---

## 👤 You

if 1728x1080 is 16:10 for 1080p, what is 16:10 for 4k 2160p

---

## 👤 You

why can't i customize under nvidia control panel my alienware 32 monitor 4k 240hz

---

## 🤖 ChatGPT

If you can't **customize** the resolution or refresh rate in the **NVIDIA Control Panel** for your **Alienware 32" 4K 240Hz monitor**, here are the most common reasons and fixes:

---

### **Possible Causes & Fixes**
#### **1. DisplayPort or HDMI Bandwidth Limitation**
- **Issue:** Running **4K @ 240Hz** requires **DisplayPort 2.1** or **HDMI 2.1 with DSC (Display Stream Compression)**.
- **Fix:**
  - Use a **certified DisplayPort 2.1 cable** (or HDMI 2.1 if using HDMI).
  - If using HDMI, enable **DSC (Display Stream Compression)** in **NVIDIA Control Panel > Adjust Desktop Size & Position**.

#### **2. Incorrect Cable or Port**
- **Issue:** Not all ports on your **GPU** or **monitor** support full bandwidth.
- **Fix:**
  - Ensure you are plugged into a **DisplayPort 1.4+ or HDMI 2.1** port on your GPU and monitor.
  - If using HDMI, check that your monitor’s HDMI supports **240Hz at 4K** (some ports may be limited to 120Hz).

#### **3. Refresh Rate Locked by Windows or Drivers**
- **Issue:** Windows might not detect the full refresh rate.
- **Fix:**
  - **Go to Windows Settings → Display → Advanced Display Settings**  
  - Select your monitor and set the **refresh rate to 240Hz** manually.

#### **4. Custom Resolution Option Disabled in NVIDIA Control Panel**
- **Issue:** If **G-Sync, HDR, or VRR** is enabled, custom resolutions may be restricted.
- **Fix:**
  - Open **NVIDIA Control Panel > Display > Change Resolution**  
  - Click **Customize...** (if greyed out, disable **G-Sync** and **HDR** temporarily).

#### **5. Display Mode Set to Limited (Instead of Full)**
- **Issue:** Your color mode may be restricted.
- **Fix:**
  - **NVIDIA Control Panel > Display > Change Resolution**  
  - Set **Output Dynamic Range to FULL** instead of Limited.

#### **6. Outdated GPU Drivers or Monitor Firmware**
- **Issue:** Some NVIDIA drivers and monitor firmware versions have bugs that disable custom settings.
- **Fix:**
  - **Update NVIDIA drivers** via **GeForce Experience**.
  - Check for **monitor firmware updates** from Dell/Alienware.

#### **7. Windows Display Scaling Interference**
- **Issue:** Custom resolutions may not work with **non-100% scaling**.
- **Fix:**
  - Set **Windows Display Scaling to 100%** under **Settings → Display → Scale & Layout**.

#### **8. Custom Resolution Blocked by NVIDIA Drivers**
- **Issue:** Some drivers block non-native resolutions for high refresh rates.
- **Fix:**
  - Try creating a **Custom Resolution via CRU (Custom Resolution Utility)**.

---

### **Final Steps**
1. **Use DisplayPort 2.1 or HDMI 2.1 (Certified Cable)**
2. **Manually Set 240Hz in Windows Display Settings**
3. **Disable HDR & G-Sync to Unlock Customization**
4. **Set Dynamic Range to Full in NVIDIA Control Panel**
5. **Update Drivers and Firmware**

If you still can’t access custom resolution settings, let me know your **GPU model, monitor model, and connection type (HDMI or DP)** for more precise troubleshooting.

---

## 👤 You

what is hdmi cec? would this do it?

---

## 🤖 ChatGPT

### **What is HDMI CEC?**
**HDMI CEC (Consumer Electronics Control)** is a feature that allows multiple HDMI-connected devices to communicate and control each other with a single remote. It enables functions like:
- Controlling multiple devices (e.g., TV, soundbar, console) with one remote.
- Turning all connected devices on/off together.
- Adjusting volume of a soundbar through the TV remote.

**HDMI CEC does NOT affect custom resolution settings** in the **NVIDIA Control Panel**. It primarily deals with **device control and automation, not display settings or refresh rates**.

### **Would HDMI CEC Fix Your Issue?**
No. **HDMI CEC has nothing to do with resolution, refresh rate, or custom settings in NVIDIA Control Panel**. If you’re having issues customizing your **Alienware 32” 4K 240Hz monitor**, the problem is more likely related to:
- **Cable bandwidth (HDMI 2.1 or DP 2.1)**
- **G-Sync, HDR, or VRR settings**
- **NVIDIA driver or monitor firmware issues**

If you’re troubleshooting display problems, **disabling HDMI CEC won’t make a difference** unless you’re experiencing automatic input switching or power control issues. 

Let me know if you need help checking your display settings further.

---

## 👤 You

greyed out, how todisable G-Sync and HDR temporarily

---

## 🤖 ChatGPT

If **G-Sync or HDR settings are greyed out**, follow these steps to **temporarily disable them** so you can access custom resolution settings.

---

### **1. Disable G-Sync in NVIDIA Control Panel**
1. **Open NVIDIA Control Panel** (Right-click on Desktop > NVIDIA Control Panel).
2. **Go to**: **Display > Set up G-SYNC**.
3. **Uncheck** “Enable G-SYNC, G-SYNC Compatible”.
4. Click **Apply** and restart your PC if needed.

---

### **2. Disable HDR in Windows Settings**
1. **Open Windows Settings** (**Win + I**).
2. **Go to**: **System > Display**.
3. **Scroll to HDR settings** and **toggle OFF**:
   - “Use HDR”  
   - “Auto HDR” (if available).
4. Restart your PC.

---

### **3. Check Custom Resolution Again**
Now, go back to **NVIDIA Control Panel**:
1. **Go to**: **Display > Change Resolution**.
2. Click **Customize...** and check if it’s now available.
3. If enabled, create your custom resolution and refresh rate.

---

### **4. Re-enable G-Sync and HDR After Customization**
Once you’ve set your custom resolution:
- **Re-enable G-Sync** in **NVIDIA Control Panel**.
- **Turn HDR back on** in **Windows Settings**.

---

### **Additional Fixes If Still Greyed Out**
✔ **Use DisplayPort 1.4+ or HDMI 2.1 with DSC enabled** (switch cables if needed).  
✔ **Manually set 240Hz** in Windows **Advanced Display Settings**.  
✔ **Update NVIDIA drivers** and **monitor firmware**.  
✔ **Try a different refresh rate** (e.g., 144Hz or 120Hz) to see if 240Hz is the issue.  

Let me know if you need further troubleshooting!

---

## 👤 You

what does gsync even do? doesn't it incerase latency

---

## 🤖 ChatGPT

### **What Does G-Sync Do?**
**G-Sync** is **NVIDIA's adaptive sync technology** that eliminates screen tearing and reduces stuttering by synchronizing your monitor's **refresh rate** with your **GPU's frame rate (FPS)** in real-time.

---

### **How G-Sync Works**
- Normally, a monitor **refreshes at a fixed rate** (e.g., **240Hz**).
- If your GPU **doesn't output frames at exactly 240 FPS**, screen tearing occurs.
- **G-Sync dynamically adjusts the refresh rate** to match your FPS **frame-by-frame**, preventing tearing and stuttering.

---

### **Does G-Sync Increase Latency?**
**Yes, slightly, but only in certain scenarios.**
- **G-Sync ON (V-Sync OFF):** **Minimal latency impact**, but eliminates tearing.
- **G-Sync + V-Sync ON (NVIDIA Default Setting):**  
  - Adds **input lag** when FPS **exceeds monitor refresh rate** (because V-Sync forces buffering).
  - Can be **avoided** by using a **frame cap** (e.g., set FPS limit to **237 FPS** for a 240Hz monitor).
- **G-Sync OFF:** Lower latency, but screen tearing may occur.

---

### **Who Should Use G-Sync?**
✅ **Great for Single-Player & Casual Games**  
✅ **Best for Variable FPS (below max refresh rate)**  
✅ **Useful for High-Resolution Gaming (4K, Ultrawide)**  

❌ **Not ideal for esports/pro players** (adds a few milliseconds of input lag).  
❌ **Unnecessary if you can maintain stable FPS at monitor refresh rate (e.g., 240 FPS on a 240Hz monitor).**  

---

### **Best G-Sync Settings for Low Latency**
For competitive gaming:
1. **Enable G-Sync** in **NVIDIA Control Panel**.
2. **Turn OFF V-Sync** in-game and in **NVIDIA Control Panel**.
3. **Use an FPS limiter** (cap at **237 FPS for 240Hz** or **141 FPS for 144Hz**).
4. **Enable “Ultra Low Latency Mode”** in NVIDIA settings.

This setup keeps the benefits of G-Sync **without the extra input lag from V-Sync**.

---

### **TL;DR**
- **G-Sync stops tearing & stuttering** by syncing refresh rate to FPS.
- **Adds slight latency**, but mainly when combined with V-Sync.
- **Best for non-esports gaming**; competitive players may prefer G-Sync OFF for lowest input lag.

Let me know if you want an optimized setup for your specific games. 🚀

---

## 👤 You

it's still greyed out

---

## 🤖 ChatGPT

If **G-Sync and HDR options are still greyed out** in the **NVIDIA Control Panel**, try these steps:

---

### **1. Verify You Are Using a Compatible Connection**
- **G-Sync requires DisplayPort (preferred) or HDMI 2.1.**  
  - If using **HDMI 2.0**, G-Sync may be disabled.
  - Use a **certified DisplayPort 1.4+ or HDMI 2.1 cable**.

---

### **2. Check NVIDIA Control Panel for G-Sync Compatibility**
1. **Go to NVIDIA Control Panel > Display > Set Up G-Sync**  
   - If "Enable G-Sync" is greyed out:
     - Your monitor might **not support G-Sync or G-Sync Compatible Mode** over your current connection.

2. **Go to Display > Change Resolution**  
   - Ensure you're using **a supported refresh rate & resolution**.  
   - **4K 240Hz may require DSC (Display Stream Compression)**, which some GPUs may not support.

---

### **3. Force Enable G-Sync via NVIDIA Profile Inspector**
1. **Download NVIDIA Profile Inspector** ([Get it here](https://github.com/Orbmu2k/nvidiaProfileInspector/releases)).
2. Open **NVIDIA Profile Inspector** and select **Global Profile**.
3. Locate **GSYNC - Application Mode** and set to **Fullscreen and Windowed**.
4. Locate **GSYNC - Global Feature** and set to **On**.
5. Click **Apply Settings**, restart your PC, and check NVIDIA Control Panel again.

---

### **4. Disable HDR in Windows Settings (If Greyed Out)**
1. **Go to Settings → Display**  
2. **Disable HDR and Auto HDR**  
3. Restart your PC.

---

### **5. Check for Firmware Updates**
- **Alienware Monitors (AW3225QF, AW3225QF, AW3423DW, etc.)** may require **firmware updates** for full G-Sync compatibility.
- Check Dell’s support site for firmware updates for your **exact model**.

---

### **6. Reset NVIDIA Control Panel Settings**
1. Open **NVIDIA Control Panel**.
2. Go to **Manage 3D Settings**.
3. Click **Restore Defaults**.
4. Restart PC and check if G-Sync and HDR options are now available.

---

### **7. Reinstall NVIDIA Drivers (Clean Install)**
1. **Download DDU (Display Driver Uninstaller)** ([Get it here](https://www.wagnardsoft.com/DDU)).
2. Boot into **Safe Mode** and run **DDU** to remove all NVIDIA drivers.
3. **Reinstall the latest NVIDIA driver** from [NVIDIA's official site](https://www.nvidia.com/download/index.aspx).
4. Restart and check NVIDIA Control Panel.

---

### **8. If Nothing Works, Check Monitor OSD Settings**
- Some Alienware monitors have **G-Sync settings in the OSD (On-Screen Display Menu)**.
  - Open your monitor settings.
  - Look for **G-Sync or Adaptive Sync** and **enable it manually**.

---

### **TL;DR Fix Order**
✅ **Use DisplayPort 1.4+ or HDMI 2.1**  
✅ **Disable HDR in Windows**  
✅ **Force enable G-Sync using NVIDIA Profile Inspector**  
✅ **Update monitor firmware**  
✅ **Reinstall NVIDIA drivers using DDU**  
✅ **Check monitor OSD settings for G-Sync toggle**  

Let me know your exact **monitor model, GPU, and connection type** for more precise troubleshooting. 🚀

---
