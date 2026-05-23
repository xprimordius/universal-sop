---
title: Multi-Monitor FPS Drop
source: chatgpt
type: conversation
person: alan
created: "2024-08-12T02:56:19.392540+00:00"
updated: "2024-08-12T02:59:07.603969+00:00"
year: 2024
month: 2024-08
quarter: 2024-Q3
messages: 4
shared: False
id: a2471c64-1659-4564-bc6f-bd36e40b417c
tags:
  - chatgpt
  - alan
  - credit
  - tech
  - utilization
---

# Multi-Monitor FPS Drop

---

## 👤 You

why does having two extra monitors plugged in passively reduce my FPS by over 100-150 fps in apex? I have a 12900k, 3090, and 32 gb ddr5 ram XMP 6000

---

## 🤖 ChatGPT

Having multiple monitors connected to your system can reduce FPS in games like Apex Legends due to a combination of factors, despite your powerful hardware. Here's why this happens:

### 1. **GPU Resource Allocation:**
   - **Resource Distribution:** When you have multiple monitors connected, your GPU needs to manage the display output for all of them, even if they are not actively displaying the game. This increases the load on the GPU, leading to fewer resources being available for rendering the game, which can result in a lower FPS.
   - **VRAM Usage:** Each additional monitor increases VRAM usage, as the GPU needs to buffer additional display outputs. Even though your 3090 has a substantial amount of VRAM, the added usage can still impact performance, especially at high resolutions or when using high settings.

### 2. **Power Consumption and Thermal Throttling:**
   - **Increased Power Draw:** Driving multiple displays increases the overall power consumption of the GPU. If your GPU is close to its power limit, this can lead to thermal throttling or a reduction in available power for rendering the game, decreasing FPS.
   - **Thermal Management:** More power draw leads to more heat. If the GPU temperature increases significantly, it might reduce clock speeds to manage heat, further reducing FPS.

### 3. **Driver Overhead:**
   - **Driver Management:** GPU drivers must manage multiple display outputs, which can introduce overhead. This overhead can slightly reduce the performance of the GPU, especially in demanding games like Apex Legends.

### 4. **CPU Overhead:**
   - **Increased CPU Workload:** Your CPU may have to handle additional tasks related to managing multiple displays, such as context switching between different screen outputs. Even with a high-performance CPU like the 12900K, this can introduce some latency and reduce overall FPS.

### 5. **Windows Desktop Manager (DWM) Impact:**
   - **DWM Overhead:** Windows Desktop Manager (DWM) handles the compositing of multiple display outputs in Windows. When more monitors are connected, DWM has more work to do, potentially reducing performance in fullscreen or borderless windowed games.

### 6. **PCIe Bandwidth:**
   - **PCIe Lane Distribution:** If you have additional devices connected to the PCIe lanes, like SSDs or other peripherals, the bandwidth available to the GPU can be slightly reduced, impacting performance when multiple monitors are connected.

### **Mitigating the Impact:**
   - **Disable Unused Monitors:** Temporarily disable additional monitors in your display settings while gaming to ensure maximum resources are allocated to the game.
   - **Use Fullscreen Mode:** Playing games in fullscreen mode (not borderless windowed) can reduce the impact of DWM and help improve performance.
   - **Update Drivers:** Ensure your GPU drivers are up to date, as driver updates can optimize multi-monitor setups.
   - **Adjust Power Settings:** Ensure your GPU is set to maximum performance mode in the NVIDIA Control Panel to prevent downclocking.

These factors combined can cause a noticeable drop in FPS when gaming with multiple monitors connected, even with a high-end system like yours.

---

## 👤 You

geforce experience shows 20-30% CPU tilizatrion with 0% GPU utilization 26c

---

## 🤖 ChatGPT

If GeForce Experience is showing 20-30% CPU utilization with 0% GPU utilization and a low temperature of 26°C, here are a few things to consider:

### 1. **Background Processes:**
   - **GeForce Experience Overhead:** GeForce Experience itself can use CPU resources for tasks like checking for updates, running background services, or preparing game optimization profiles. This can cause a spike in CPU usage.
   - **Other Background Tasks:** Other applications or services running in the background might be contributing to the CPU usage, while the GPU is not under load because you are not running any GPU-intensive applications.

### 2. **Idle GPU:**
   - **No GPU Load:** If your GPU is not actively rendering anything demanding (like games, GPU-accelerated tasks, or videos), it will show 0% utilization. This is normal when the system is idle or performing tasks that don't require GPU acceleration.
   - **Low Power State:** The GPU might be in a low power state, especially when the system is not under load, contributing to the low temperature and 0% utilization.

### 3. **CPU-Intensive Tasks:**
   - **CPU Tasks:** If you're running tasks that are primarily CPU-bound (like file compression, background updates, or software compilation), these tasks will use CPU resources while the GPU remains idle.
   - **Monitoring Tools:** Tools like GeForce Experience or Task Manager can sometimes misreport or show delayed information on GPU usage, especially if the GPU load is very low.

### 4. **Thermal and Power Management:**
   - **Effective Cooling:** A temperature of 26°C indicates that your system has effective cooling, and the GPU is not under significant load. This low temperature suggests that the GPU is idle or operating at minimal capacity, likely in a power-saving mode.

### 5. **System Idle:**
   - **System Idle Process:** The system idle process can sometimes show as CPU usage in monitoring tools, leading to an apparent 20-30% CPU usage when the system is not doing much.

### **Troubleshooting Steps:**
   - **Check Task Manager:** Open Task Manager to see which processes are consuming CPU resources. This will help identify if a specific application or service is causing the high CPU usage.
   - **Close Unnecessary Background Programs:** Close any unnecessary background applications to reduce CPU load.
   - **Run a GPU-Intensive Task:** Launch a game or a GPU stress test to see if the GPU utilization increases. This will help confirm if the GPU is functioning correctly.
   - **Update Drivers:** Make sure your GPU drivers and GeForce Experience are up to date. Outdated drivers can sometimes cause monitoring issues or performance discrepancies.
   - **Check for Updates:** Ensure Windows and any relevant software are fully updated, as sometimes background updates can cause spikes in CPU usage.

### **Conclusion:**
The behavior you're seeing is likely normal, especially if your system is not running any GPU-intensive tasks. The CPU usage could be due to background processes or GeForce Experience itself, while the GPU remains idle and cool. If you launch a game or a task that uses the GPU, you should see GPU utilization increase.

---
