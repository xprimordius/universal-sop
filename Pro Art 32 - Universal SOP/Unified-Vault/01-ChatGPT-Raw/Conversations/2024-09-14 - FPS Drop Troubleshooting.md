---
title: FPS Drop Troubleshooting
source: chatgpt
type: conversation
person: alan
created: "2024-09-14T02:21:24.058243+00:00"
updated: "2024-09-14T03:02:52.421230+00:00"
year: 2024
month: 2024-09
quarter: 2024-Q3
messages: 7
shared: False
id: 66e4f323-dc70-8000-a931-b6781c96fd61
tags:
  - chatgpt
  - alan
---

# FPS Drop Troubleshooting

---

## 👤 You

why is my 99% fps only 90 in apex even though i have a 3090. 12900k and 32gb ram and SSD? in game fps says 200+ but 99% is more real

---

## 🤖 ChatGPT

The reason your 99% FPS is showing as 90 in Apex Legends, despite having high-end hardware like the RTX 3090, Intel 12900K, 32GB of RAM, and an SSD, likely boils down to a few performance factors:

### 1. **CPU Bottlenecking**
   - Even with a 12900K, there can be CPU bottlenecks in certain games, especially in battle royales like *Apex Legends*, where the CPU needs to handle complex physics, AI, and player interactions. While the game can show 200+ FPS, the 99th percentile reflects moments where the CPU can struggle under heavy load (e.g., during combat, explosions, or large-scale player interactions).

### 2. **Frame Time Variability**
   - Your 99th percentile FPS represents the lowest frames during the most demanding scenarios. It captures frame dips caused by high particle effects, AI processing, or network activity, which is a more realistic indicator of performance stability than peak FPS. The game might maintain 200+ FPS in less intensive moments but drop to around 90 FPS in chaotic scenes.

### 3. **Thermal Throttling**
   - High-end components like the 12900K and RTX 3090 can produce significant heat. If thermal throttling occurs (due to insufficient cooling), both the CPU and GPU can downclock to protect themselves, leading to lower FPS in heavy scenarios, reflected in your 99% FPS.

### 4. **Game Optimization**
   - *Apex Legends* is not always perfectly optimized for every hardware configuration. Some areas or specific scenes can cause FPS dips due to inefficient game code or engine limitations, even if the hardware can technically handle it.

### 5. **Background Tasks and Windows Processes**
   - Background tasks or other Windows processes can impact your 99% FPS by occasionally consuming CPU or disk resources, which affects frame stability, particularly in demanding situations.

### 6. **Network Latency and Server Performance**
   - Network-related issues, such as high ping or packet loss, can also impact FPS stability, particularly in a fast-paced, multiplayer environment like *Apex Legends*.

### Possible Solutions:
1. **Adjust CPU-bound Settings:** Lower settings like shadow quality, view distance, or CPU-intensive tasks to reduce the load on your processor.
2. **Improve Cooling:** Ensure your system is sufficiently cooled to prevent thermal throttling, particularly during intense gameplay moments.
3. **Update Drivers and Game Settings:** Keep your GPU drivers up to date and check for any game-specific optimizations.
4. **Disable Background Processes:** Use Task Manager to eliminate unnecessary background processes that might impact game performance.

If you'd like a more in-depth diagnostic or tweak suggestions based on your exact setup, let me know!

---

## 👤 You

these numbers do not seem right. temps are good. but shouldn't my hardware be much higher? i just restarted and it went up to 115 99% fps, but how to get it to 240? what should i expect with my hardware

---

## 🤖 ChatGPT

User reports good temperatures on their system and restarted it, which increased their 99% FPS in Apex Legends to 115.

---

> [!abstract]- Tool
> Model set context updated.


---

## 🤖 ChatGPT

Given your hardware—a **3090**, **12900K**, **32GB RAM**, and SSD—you should expect much higher performance, potentially reaching close to 240 FPS or at least closer to the game's refresh cap depending on your monitor's settings (assuming a high refresh rate monitor). However, hitting 240 FPS consistently in a game like *Apex Legends* is challenging, even with top-tier hardware, due to the game's nature and engine limitations.

Here's what you can do to potentially push closer to 240 FPS:

### 1. **In-Game Settings Optimization**
   - **Set Texture Streaming Budget to High:** The RTX 3090 can handle higher textures, but overloading it can cause some instability in the frame rates.
   - **Disable V-Sync:** Turn off V-Sync to allow the game to run uncapped and avoid unnecessary frame limiting.
   - **Lower Anti-Aliasing:** Switch to **TSAA** or **None**. Anti-aliasing can be taxing, and reducing it can give a decent FPS boost.
   - **Set Model Detail, Effects Detail, and Impact Marks to Low/Medium:** These settings affect CPU load, and keeping them lower can balance out the performance.
   - **Disable Dynamic Spot Shadows:** Shadows can be very CPU-intensive.

### 2. **NVIDIA Control Panel Tweaks**
   - **Set Power Management Mode to "Prefer Maximum Performance":** Go to the NVIDIA Control Panel, find *Apex Legends*, and under "Power Management Mode," set it to "Prefer Maximum Performance."
   - **Disable G-Sync (if you're using it):** G-Sync, while great for eliminating screen tearing, can cap the max FPS to the monitor's refresh rate, impacting your overall FPS in high refresh rate gaming.
   - **Enable "Low Latency Mode":** In the NVIDIA Control Panel, turn on "Ultra" under the "Low Latency Mode" setting for *Apex Legends*.

### 3. **Set Max FPS via Launch Options**
   Add these launch options to *Apex Legends*:
   ```
   +fps_max 0
   ```
   This command uncaps your frame rate entirely. You can also set it to a desired number (like `+fps_max 240`).

### 4. **Ensure Hardware is Running at Full Power**
   - **Check CPU Clock Speeds:** Ensure your 12900K is running at optimal clock speeds during gameplay. Intel CPUs can downclock if power management settings limit their performance.
   - **Check GPU Usage:** During gameplay, use monitoring software (like MSI Afterburner) to see if your GPU usage is close to 100%. If it's low, you may have a CPU bottleneck or power-saving settings hindering performance.

### 5. **Game Engine and 240 FPS**
   - Keep in mind that *Apex Legends*' game engine and servers may have limitations that make hitting a consistent 240 FPS difficult, even with high-end hardware. The 99th percentile metric will always drop lower due to moments of heavy calculation (e.g., combat, explosions, multiple players in one area).

With this hardware, pushing closer to 200+ FPS should be realistic with proper settings. Hitting a rock-solid 240 FPS may be tough due to *Apex Legends*' engine, but you should at least be getting higher than 115 FPS consistently after these optimizations.

---

## 👤 You

its still at 115

---

## 🤖 ChatGPT

If your 99% FPS is still at 115 despite making the changes, this could indicate a few deeper issues that may be limiting your performance. Here are advanced steps you can try:

### 1. **Check for Background Bottlenecks**
   - **Task Manager Monitoring:** Open Task Manager and go to the "Performance" tab while playing *Apex Legends*. Check the CPU, GPU, Disk, and Network usage. If any of these components are maxing out or behaving abnormally (like sudden spikes), you might be running into a bottleneck.
   - **Disable Unnecessary Background Processes:** Some applications, like antivirus, overlays (Discord, NVIDIA GeForce Experience), and other resource-heavy programs, can hinder performance. Try disabling them temporarily.

### 2. **Check for CPU Core Usage**
   - Use a tool like **MSI Afterburner** to monitor individual core utilization while playing. *Apex Legends* can be CPU-intensive, and it may not fully utilize all cores of the 12900K efficiently, leading to performance dips.
   - **Turn off E-cores (Efficiency Cores)**: The 12900K has both performance and efficiency cores. In some cases, the game may not be using the performance cores optimally. Disabling the E-cores in the BIOS (temporarily) can help force the game to use the P-cores for better performance.

### 3. **BIOS/Windows Power Settings**
   - **BIOS Settings:** Ensure that your BIOS is set for optimal performance. You can enable *XMP* for your RAM to ensure it's running at its full speed, and check that your CPU is not being limited by power-saving settings.
   - **Windows Power Settings:** Set your Windows power plan to **High Performance** (or create a custom power plan that maximizes CPU and GPU performance).

### 4. **DirectX or Vulkan**
   - **DirectX Version:** Try forcing the game to run on DirectX 11 instead of 12 (if it's currently on 12) or vice versa. You can set this via the launch options in Origin or Steam:
     ```
     -dx11
     ```
     or
     ```
     -dx12
     ```

### 5. **Check for GPU Bottleneck or Power Limiting**
   - **GPU Usage Monitoring:** Use **MSI Afterburner** or similar to monitor GPU clock speeds and ensure your GPU is running at full power (check for power limiting or underclocking). 
   - **Undervolt the GPU:** Sometimes, high-end GPUs like the RTX 3090 can hit power or thermal limits, even if temperatures seem fine. Try undervolting slightly to keep performance consistent.

### 6. **Windows/NVIDIA Driver Issues**
   - **Clean Install of NVIDIA Drivers:** Use **DDU (Display Driver Uninstaller)** to completely remove your NVIDIA drivers, then reinstall the latest drivers from the NVIDIA website. Sometimes, driver remnants or misconfigurations can cause performance bottlenecks.
   - **Windows Game Mode:** Ensure that **Game Mode** is enabled in Windows Settings to prioritize game performance.
   - **Windows Updates:** Make sure you’re on the latest version of Windows and that no pending updates are hindering performance.

### 7. **Test on Another Game**
   - **Benchmark in Other Games:** Try running benchmarks in other demanding games to see if the 99% FPS is similarly low, or if it’s just *Apex Legends*. If other games perform well, it may indicate a game-specific issue.

### 8. **Check PCIe Configuration**
   - Ensure that your GPU is running in **PCIe 4.0 x16** mode in your BIOS. Sometimes, motherboards can run the GPU at a lower PCIe bandwidth, which limits performance, especially in high-demand situations.

If none of these steps yield results, the next step might be to:
- **Reinstall Apex Legends**: A fresh install can resolve hidden configuration or corruption issues.
- **Check if Overlays Are Impacting Performance**: Disable overlays from programs like NVIDIA GeForce Experience, Discord, Steam, etc.

Let me know if you’d like more detailed steps on any of these suggestions!

---
