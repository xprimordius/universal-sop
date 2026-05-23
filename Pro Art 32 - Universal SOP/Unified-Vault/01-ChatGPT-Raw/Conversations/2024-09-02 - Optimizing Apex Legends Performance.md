---
title: Optimizing Apex Legends Performance
source: chatgpt
type: conversation
person: alan
created: "2024-09-02T02:53:26.331590+00:00"
updated: "2024-09-02T03:14:25.678978+00:00"
year: 2024
month: 2024-09
quarter: 2024-Q3
messages: 11
shared: False
id: eca4bf37-3ced-461e-8e65-437278721c05
tags:
  - chatgpt
  - alan
  - tech
---

# Optimizing Apex Legends Performance

---

## 👤 You

12900k rtx3090 average PC latency apex legends 15-35ms 99% fps 100fps why?

---

## 🤖 ChatGPT

The latency and FPS issues you're experiencing in Apex Legends with your i9-12900K and RTX 3090 setup could be caused by several factors. Given your hardware, you should expect better performance, so let's troubleshoot potential causes:

### 1. **Game Settings**
   - **Graphics Settings:** Ensure your graphics settings are optimized for performance. Lowering settings like texture quality, shadows, and anti-aliasing can help improve FPS and reduce latency.
   - **V-Sync and G-Sync:** If V-Sync or G-Sync is enabled, it might introduce input lag. Try disabling these settings to see if it reduces latency.
   - **NVIDIA Reflex:** Make sure NVIDIA Reflex is enabled in the game settings to reduce latency.

### 2. **CPU and GPU Utilization**
   - **Check Utilization:** Monitor your CPU and GPU usage during gameplay. If your CPU or GPU is not fully utilized, it might indicate a bottleneck. Ensure both are running optimally.
   - **Background Processes:** Close unnecessary background processes or applications that might be using CPU resources.

### 3. **Driver and Software Updates**
   - **Update Drivers:** Ensure that your GPU drivers are up to date. Sometimes, outdated drivers can cause performance issues.
   - **Windows Updates:** Ensure your operating system is fully updated.
   - **Game Updates:** Make sure Apex Legends is running the latest version.

### 4. **Network Latency**
   - **Ping and Packet Loss:** High ping or packet loss can also contribute to increased latency. Check your network connection, and consider using a wired connection if you’re currently on Wi-Fi.
   - **Game Servers:** Sometimes, the issue might be with the game servers themselves. Test your connection to different servers to see if the problem persists.

### 5. **Power Settings**
   - **Power Plan:** Ensure your PC is set to a high-performance power plan in Windows settings.
   - **NVIDIA Control Panel:** Set the power management mode in the NVIDIA Control Panel to "Prefer maximum performance."

### 6. **Cooling and Thermal Throttling**
   - **Temperature Check:** Monitor your CPU and GPU temperatures. If either component is overheating, it may throttle performance, leading to lower FPS and higher latency.
   - **Cooling Solution:** Ensure your cooling solution is adequate for the i9-12900K and RTX 3090, and that your system is not overheating.

### 7. **Resolution and Monitor Settings**
   - **Resolution:** Running the game at a high resolution like 4K can reduce FPS. Consider lowering the resolution to 1440p or 1080p to improve performance.
   - **Monitor Refresh Rate:** Ensure your monitor’s refresh rate is set correctly and that your FPS cap (if any) aligns with your monitor’s refresh rate.

### 8. **In-Game Limitations**
   - **Apex Legends Engine:** The Source engine used by Apex Legends has its own limitations. Even with top-tier hardware, there might be optimization issues within the game itself that can cause unexpected performance drops.

If these suggestions don't resolve the issue, you may want to look into more detailed performance monitoring or consider reinstalling the game to rule out any corrupted files.

---

## 👤 You

temps are good. resolution is 17xx x 1080 16:10, settings are on low, maximum performance on, high performance mode on, its not network, cpu and gpu utiolization is well below 100%, this only happens when i plug in multiple monitors, but this build should be able to handle this\

---

## 🤖 ChatGPT

User has a 12900K and RTX 3090 setup, experiencing high latency and low FPS in Apex Legends when using multiple monitors. The resolution is 17xx x 1080 16:10, with settings on low, maximum performance, high performance mode on, good temperatures, and it is not a network issue. CPU and GPU utilization is well below 100%. The issue occurs only when multiple monitors are plugged in.

---

> [!abstract]- Tool
> Model set context updated.


---

## 🤖 ChatGPT

Given that the issue occurs specifically when multiple monitors are connected, even with your powerful setup, the problem may be related to how your system handles multi-monitor output. Here are some steps you can take to address this:

### 1. **Check Multi-Monitor Configuration**
   - **Primary Monitor:** Ensure that the correct monitor is set as the primary display in Windows settings. Sometimes, having the wrong monitor as the primary display can cause performance issues.
   - **Display Scaling:** Check the scaling settings for each monitor. Mismatched scaling settings across monitors can cause unnecessary strain on the GPU, even with a powerful card like the RTX 3090.
   - **Refresh Rate:** Make sure all monitors are set to their correct refresh rates. If one monitor has a significantly different refresh rate, it can affect overall performance.

### 2. **NVIDIA Control Panel Settings**
   - **Multi-Display/Mixed-GPU Acceleration:** Go to the NVIDIA Control Panel > Manage 3D Settings > Global Settings and set "Multi-Display/Mixed-GPU Acceleration" to "Single display performance mode" if you're only gaming on one monitor. This can reduce the load on the GPU caused by multiple displays.
   - **Power Management Mode:** Ensure the power management mode is set to "Prefer maximum performance" specifically under the "Program Settings" tab for Apex Legends.

### 3. **Monitor Connections**
   - **Connection Types:** Check how your monitors are connected (HDMI, DisplayPort, etc.). Sometimes, using different types of connections for multiple monitors can cause issues. If possible, try using the same type of connection for all monitors.
   - **GPU Outputs:** Ensure all monitors are connected directly to the GPU and not to any motherboard ports. This ensures that the GPU is handling all display outputs.

### 4. **Windows Display Settings**
   - **Disable Unused Monitors:** If you’re not actively using all connected monitors during gaming, try disabling the extra monitors temporarily in Windows settings to see if performance improves.
   - **Extended Desktop vs. Duplicate:** Ensure that the monitors are set to "Extend these displays" rather than "Duplicate these displays," which can be more demanding on the system.

### 5. **Driver Issues**
   - **Clean Driver Installation:** Sometimes, driver issues can cause problems with multiple monitors. Consider performing a clean installation of the GPU drivers using a tool like DDU (Display Driver Uninstaller) and then reinstalling the latest NVIDIA drivers.

### 6. **Windows Power Plan Settings**
   - **High Performance Plan:** Double-check that Windows is set to the High Performance plan, and that this is being applied correctly when multiple monitors are connected.

### 7. **Check for Background Processes**
   - **Task Manager:** Check Task Manager for any background processes that might only activate when multiple monitors are connected. Sometimes, applications might change behavior when a second monitor is detected.

### 8. **Monitor-Specific Drivers**
   - **Update Monitor Drivers:** Check if your monitors have specific drivers available from the manufacturer and ensure they are up to date.

### 9. **In-Game Settings**
   - **Fullscreen vs. Borderless Window:** Try switching between fullscreen and borderless window modes in Apex Legends. Borderless window mode can sometimes cause issues with multiple monitors.

If none of these steps resolve the issue, you might want to try testing the game with different combinations of monitors connected to see if the problem persists with specific monitors or setups. This could help isolate if one particular monitor or connection type is causing the issue.

---

## 👤 You

main monitor is the one im gaming on. i just made nvidia make all the resolutions the same across the 3 monitors. refresh rates are 240hz, 75hz, 60hz

multi-display/mixed-gpu accelerations does not exist in the 3d settings global settings

power management is high performance, which has prefer maximum performance

all ports are via GPU

all mointors are extended

nothing heavy in background processes

---

## 🤖 ChatGPT

Given that you've ensured uniform resolution across the monitors and have the correct settings applied, the issue could be related to the disparity in refresh rates between your monitors. Here's how you can address this:

### 1. **Refresh Rate Synchronization**
   - **Try Lowering the Primary Monitor's Refresh Rate:** Although your main gaming monitor is 240Hz, try lowering it to 144Hz or 120Hz temporarily to see if it alleviates the latency issues. Discrepancies between very high refresh rates (240Hz) and lower ones (75Hz, 60Hz) on other monitors can sometimes cause synchronization issues.
   - **Disable V-Sync:** Make sure V-Sync is disabled in the game and in the NVIDIA Control Panel to avoid potential frame pacing issues that might arise from the mixed refresh rates.

### 2. **GPU Load Balancing**
   - **Limit Frame Rate in Apex Legends:** Set a frame rate limit (cap) just below your monitor’s refresh rate (e.g., 237 FPS for a 240Hz monitor) to reduce the GPU load and prevent spikes in latency.
   - **G-Sync and FreeSync:** Ensure G-Sync (if using an NVIDIA GPU) is only enabled for the primary monitor and not the others.

### 3. **Test with Different Combinations**
   - **Disconnect Secondary Monitors:** Temporarily disconnect the 60Hz and 75Hz monitors to see if performance improves significantly on the 240Hz monitor. This test can help isolate whether the mixed refresh rates are indeed the cause.
   - **Change Display Order:** Experiment with changing which monitor is the primary display in Windows settings to see if the issue persists when gaming on different monitors.

### 4. **Windowed Modes**
   - **Switch Between Fullscreen and Borderless Windowed:** Try both fullscreen and borderless windowed modes. Fullscreen mode might better optimize resources when using multiple monitors, whereas borderless windowed mode can cause issues with multi-monitor setups.

### 5. **NVIDIA Control Panel Specific Adjustments**
   - **Adjust Power Management for Multiple Displays:** Although "Multi-Display/Mixed-GPU Acceleration" isn't available, you can try adjusting the power management mode specifically for multiple displays by creating a custom profile in the NVIDIA Control Panel for each game you play.

### 6. **Monitor DisplayPort/HDMI Cables**
   - **Check Cables:** Ensure that the DisplayPort or HDMI cables you’re using are high quality and support the required refresh rates and resolutions for each monitor. Faulty or low-quality cables can cause display issues when running multiple monitors.

### 7. **Windows Display Settings**
   - **Try Using Only Two Monitors:** If reducing to two monitors (one being the 240Hz) solves the issue, it might be a sign that the system struggles to manage the large disparity in refresh rates across three monitors. This could indicate a need to balance the refresh rates more evenly or upgrade to monitors with similar specs.

### 8. **Driver and BIOS Updates**
   - **Update BIOS:** Ensure your motherboard BIOS is up to date, as it can affect how the CPU and GPU handle multiple displays.
   - **NVIDIA Driver:** Consider using the latest Studio Driver instead of the Game Ready Driver to see if stability improves when using multiple monitors.

These steps should help narrow down the issue and potentially resolve the latency and FPS drops when using multiple monitors. The mixed refresh rates across the monitors are likely contributing to the performance degradation, so focusing on synchronizing or reducing the disparity between the refresh rates could yield the best results.

---

## 👤 You

theres still something seriously wrong. memoy 22/32gb cpu 30% gpu less than 80% in game fps says 239, nvidia perfomance overlay shows 150-200 fps, 99% fps 90

---

## 🤖 ChatGPT

Given the significant discrepancies between reported FPS in-game and what NVIDIA’s performance overlay is showing, as well as the apparent low utilization of both CPU and GPU, here are some advanced steps you can take to troubleshoot the issue:

### 1. **NVIDIA Reflex and Low Latency Mode**
   - **Enable/Disable NVIDIA Reflex:** If not already done, enable NVIDIA Reflex in the Apex Legends settings to reduce latency. If it's already enabled, try disabling it to see if it stabilizes your FPS.
   - **Low Latency Mode:** In the NVIDIA Control Panel, set the "Low Latency Mode" to either "On" or "Ultra" to reduce latency further. Test with both settings to see which one performs better.

### 2. **Windows Game Mode and GPU Scheduling**
   - **Windows Game Mode:** Ensure that Windows Game Mode is enabled, which can optimize your system for gaming.
   - **Hardware-Accelerated GPU Scheduling:** If using Windows 10 or 11, make sure Hardware-Accelerated GPU Scheduling is enabled. This can help reduce latency and improve performance.

### 3. **Disable Fullscreen Optimizations**
   - **Disable Fullscreen Optimizations:** Go to the Apex Legends executable (usually found in the installation folder), right-click it, select "Properties," go to the "Compatibility" tab, and check the box that says "Disable fullscreen optimizations." This can sometimes resolve performance discrepancies.

### 4. **Task Manager and Process Priority**
   - **Set Priority:** Open Task Manager, find Apex Legends in the "Details" tab, right-click it, and set the priority to "High." This ensures that more CPU resources are allocated to the game.
   - **Affinity Settings:** Check the CPU affinity for Apex Legends in the Task Manager, ensuring that all CPU cores are being utilized for the game.

### 5. **Overlay and Monitoring Software Conflicts**
   - **Disable Overlays:** Sometimes, multiple overlays (such as NVIDIA, Discord, Steam, etc.) can conflict with each other and cause performance issues. Disable all overlays except for the essential ones and check if the performance improves.
   - **Monitoring Tools:** If you have any other performance monitoring tools running, try disabling them temporarily to see if they are causing any interference.

### 6. **Check for Bottlenecks**
   - **Check VRAM Usage:** Although GPU usage is under 80%, high VRAM usage could still be an issue. Use a tool like MSI Afterburner to monitor VRAM usage during gameplay. If it’s near the limit, try reducing texture quality or other VRAM-heavy settings.
   - **Check for CPU Core Bottlenecking:** Although overall CPU usage is at 30%, one or two cores might be maxing out. Use Task Manager or another monitoring tool to check individual core usage. If one or two cores are consistently maxed out, the game might be bottlenecked by those cores.

### 7. **Power Supply and Power Delivery**
   - **Power Supply Check:** Ensure that your PSU is providing adequate power, especially when running multiple monitors and high-performance gaming. If the PSU is underpowered or unstable, it could cause inconsistent GPU performance.
   - **Motherboard Power Delivery:** Check your motherboard's power settings in the BIOS. Ensure that power delivery settings are optimized for performance, particularly for the CPU and GPU.

### 8. **Test with a Single Monitor**
   - **Single Monitor Test:** Disconnect the secondary monitors and test the game with only the primary monitor connected. This will help isolate whether the multiple monitors are indeed causing the issue.

### 9. **Potential Software Conflicts**
   - **Reinstall GPU Drivers:** If all else fails, consider using DDU (Display Driver Uninstaller) to completely remove your current GPU drivers and then reinstall the latest version. This can resolve any driver-related issues that might be causing the performance discrepancies.
   - **Background Software Conflicts:** Consider clean booting your system (disabling all non-Microsoft services and startup programs) to see if a background application might be conflicting with the game’s performance.

### 10. **Reinstall Apex Legends**
   - **Reinstall the Game:** As a last resort, if none of the above solutions work, consider reinstalling Apex Legends. Corrupted game files could be causing performance issues, and a clean installation might resolve them.

### 11. **Consider a Fresh Windows Install**
   - **Windows Reinstallation:** If after trying all troubleshooting steps the issue persists, a fresh installation of Windows might be necessary. Sometimes, a fresh OS install can resolve underlying issues that are difficult to diagnose.

These steps should help you identify and address the underlying issue. If you find that disabling the additional monitors or any specific setting drastically improves performance, that would be a key indicator of where the problem lies.

---

## 👤 You

what else practically could it be? is my hardware just bad? benchmarks show  good. why is it so dramatically unstable when 3 monitors vs 1

---

## 🤖 ChatGPT

Given that your hardware is benchmarking well and performing as expected in single-monitor scenarios but exhibits instability with multiple monitors, it's unlikely that your hardware is "bad." The issue is more likely related to the complexities of managing multiple displays, particularly with the significant differences in refresh rates and the demanding nature of modern games like Apex Legends. Here are some more practical considerations and checks:

### 1. **Driver and Firmware Compatibility**
   - **GPU Driver Issues:** Sometimes, even with updated drivers, certain driver versions can have bugs or compatibility issues with multi-monitor setups, especially with different refresh rates. Consider rolling back to an earlier driver version or trying the latest beta drivers from NVIDIA.
   - **Monitor Firmware:** Check if your monitors have any available firmware updates. While less common, monitor firmware can affect how displays interact with your GPU.

### 2. **GPU Resource Allocation**
   - **GPU Resource Allocation:** Managing multiple displays, especially with different refresh rates, can cause uneven GPU resource allocation. Some GPUs might struggle to efficiently allocate resources across multiple displays, leading to unstable performance. This is particularly true when gaming on a high-refresh-rate monitor (240Hz) while also supporting lower-refresh-rate monitors (60Hz, 75Hz).

### 3. **VRAM and Memory Management**
   - **VRAM Allocation:** Even though you have a powerful GPU with ample VRAM, running multiple monitors can increase VRAM usage significantly. This is particularly true if each monitor has different refresh rates and resolutions, causing the GPU to allocate resources differently. Monitoring VRAM usage during gameplay could reveal spikes or inconsistencies that point to memory management issues.
   - **Memory Leaks:** Some games and applications might have memory leaks when handling multiple monitors, especially with different refresh rates. These leaks can cause performance degradation over time.

### 4. **Multi-Monitor Handling by the Game Engine**
   - **Game Engine Optimization:** The Source engine, which powers Apex Legends, might not be optimized for handling multiple monitors, especially with varying refresh rates. Some game engines are less efficient at distributing rendering tasks across multiple displays, leading to performance drops.
   - **Monitor Sync Issues:** The game engine might struggle to sync rendering across monitors with different refresh rates, causing instability. This can result in lower effective FPS, even if the GPU reports higher frame rates.

### 5. **Windows and Display Management**
   - **Windows Display Management:** Windows' display management system might be causing issues when handling multiple monitors with varying refresh rates. The way Windows manages display refresh rates and resolutions can sometimes lead to performance problems, especially in demanding applications.
   - **Graphics Pipeline Issues:** The process of rendering frames across different refresh rates can cause bottlenecks in the graphics pipeline, leading to FPS drops and increased latency. This is often exacerbated when the GPU is trying to render high FPS (240Hz) while also managing lower FPS displays.

### 6. **Power Delivery and Stability**
   - **Power Supply Unit (PSU):** Although you have a good PSU, multi-monitor setups can sometimes cause power delivery issues, especially if the PSU is operating near its limits. Ensuring the PSU is well within its capacity, especially during peak load, is important.
   - **Power Delivery to GPU:** The GPU might be drawing more power when handling multiple monitors, and if the power delivery isn't stable, it could cause performance issues. Checking power cables and connections to the GPU to ensure they're secure and providing stable power could help.

### 7. **Display Port Versions and Bandwidth**
   - **DisplayPort and HDMI Versions:** Ensure that the cables you're using are capable of handling the required bandwidth for your monitors, especially at their respective refresh rates. Using DisplayPort 1.4 or HDMI 2.1 cables can ensure sufficient bandwidth.
   - **Bandwidth Limitations:** Running multiple monitors at different refresh rates and resolutions can push the bandwidth limits of your GPU’s display outputs. Even though your GPU is powerful, there could be bandwidth allocation issues leading to instability.

### 8. **Software Conflicts**
   - **Overlay Conflicts:** Even if you’ve disabled most overlays, certain background processes or software (like capture software or other GPU-related utilities) could still be causing conflicts. Perform a clean boot with only essential services running and test the performance.
   - **Driver Conflicts:** Consider that there might be conflicts between the GPU drivers and other drivers (like those for your monitors or motherboard). Ensuring all drivers are compatible and updated can sometimes resolve these issues.

### 9. **Testing with Different Combinations**
   - **Different Monitor Combinations:** Test with just two monitors at different combinations of refresh rates to see if the issue persists. This can help identify if the problem lies with a specific monitor or refresh rate combination.
   - **Testing Other Games:** Run other games or benchmarks while using multiple monitors to see if the issue is specific to Apex Legends or if it occurs in other applications as well.

### 10. **Consideration of Diminishing Returns**
   - **Complexity of Multi-Monitor Setups:** Multi-monitor setups, especially with mixed refresh rates and resolutions, can introduce complexities that are sometimes difficult to manage, even with top-tier hardware. This is more about the inherent challenges of display synchronization and GPU load balancing than a deficiency in your hardware.

Given that your hardware is strong and benchmarks well, the issue is more likely related to the management of resources when handling multiple monitors rather than any fundamental problem with the components themselves. The complexity of rendering across different refresh rates might just be a limitation in how the system handles these tasks, rather than an outright failure of the hardware.

---
