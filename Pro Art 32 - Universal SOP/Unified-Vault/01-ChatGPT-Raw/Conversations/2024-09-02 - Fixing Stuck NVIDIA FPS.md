---
title: Fixing Stuck NVIDIA FPS
source: chatgpt
type: conversation
person: alan
created: "2024-09-02T05:50:08.455599+00:00"
updated: "2024-09-02T06:11:32.707574+00:00"
year: 2024
month: 2024-09
quarter: 2024-Q3
messages: 11
shared: False
id: bef88f9e-d6db-468e-8eb2-79fb834202e9
tags:
  - chatgpt
  - alan
  - tech
---

# Fixing Stuck NVIDIA FPS

---

## 👤 You

how to restart nvidia performance monitor stuck at 60 fps with 240 fps monitor

---

## 🤖 ChatGPT

If the NVIDIA Performance Monitor is stuck at 60 FPS on a 240 FPS monitor, it might be due to several potential issues. Here’s a step-by-step guide to troubleshoot and resolve the problem:

### 1. **Check V-Sync Settings:**
   - **V-Sync** (Vertical Sync) can limit your FPS to match your monitor's refresh rate, and sometimes it might cap it at 60 FPS.
   - Open the **NVIDIA Control Panel**.
   - Navigate to **Manage 3D settings**.
   - Under the **Global Settings** tab or the **Program Settings** tab (if you want to apply the changes to a specific game), find **Vertical sync**.
   - Set **Vertical sync** to **Off**.

### 2. **Disable Frame Rate Limiter:**
   - Ensure there is no frame rate limiter enabled in the NVIDIA Control Panel or within specific game settings.
   - In the **NVIDIA Control Panel**, go to **Manage 3D settings**.
   - Look for **Max Frame Rate** and set it to **Off**.

### 3. **Check Monitor Refresh Rate Settings:**
   - Make sure your monitor is set to its maximum refresh rate (240Hz).
   - Right-click on the desktop and select **Display settings**.
   - Scroll down and click on **Advanced display settings**.
   - Click on **Display adapter properties for Display 1**.
   - In the new window, go to the **Monitor** tab and select **240Hz** from the **Screen refresh rate** dropdown.

### 4. **Update or Reinstall NVIDIA Drivers:**
   - Outdated or corrupted drivers can cause performance issues.
   - Open **GeForce Experience** and check for driver updates.
   - Alternatively, download the latest drivers directly from the NVIDIA website.
   - If you still experience issues, consider doing a **clean install** of the NVIDIA drivers.

### 5. **Check G-Sync Settings (If Applicable):**
   - If your monitor supports G-Sync, ensure it's properly configured.
   - Open the **NVIDIA Control Panel**.
   - Under **Display**, click on **Set up G-Sync**.
   - Make sure G-Sync is enabled for your monitor.

### 6. **Game-Specific Settings:**
   - Some games might have their own FPS cap settings. Ensure the in-game FPS cap is set to match your monitor’s refresh rate or turned off.
   - Check for any in-game V-Sync settings and disable them if they are limiting your FPS.

### 7. **Restart the NVIDIA Performance Monitor:**
   - You can try restarting the NVIDIA Performance Monitor.
   - Right-click on the **Taskbar** and open **Task Manager**.
   - Find **NVIDIA Container** processes related to the Performance Monitor and end those tasks.
   - Re-launch the Performance Monitor to see if it reflects the correct FPS.

### 8. **Reboot Your System:**
   - Sometimes a simple reboot can resolve issues with the performance monitor.

After following these steps, your NVIDIA Performance Monitor should correctly reflect the FPS output that matches your monitor's capabilities.

---

## 👤 You

i restarted and it's still happening. everytthing is up to date. it was working and then it just locked into 60 even though the game is at 240

---

## 🤖 ChatGPT

If you've already updated everything and restarted your system, but the NVIDIA Performance Monitor is still locked at 60 FPS despite your game running at 240 FPS, there are a few additional troubleshooting steps you can take:

### 1. **Check for Background Processes or Overlays:**
   - Sometimes, background applications or overlays (e.g., Discord, Steam, or GeForce Experience overlay) can interfere with the FPS reporting.
   - Try disabling any overlays:
     - For **GeForce Experience**: Open GeForce Experience, go to **Settings > General** and toggle off **In-Game Overlay**.
     - For **Discord**: Go to **Settings > Overlay** and toggle off **Enable in-game overlay**.

### 2. **Verify In-Game Settings:**
   - Double-check that the in-game FPS limit settings are correct. Some games have separate settings for menus and gameplay.
   - Ensure V-Sync is disabled within the game's settings.

### 3. **Reset NVIDIA Control Panel Settings:**
   - Sometimes, a misconfiguration in the NVIDIA Control Panel can cause issues. Try resetting all settings to default:
     - Open the **NVIDIA Control Panel**.
     - Go to **Manage 3D settings**.
     - Click on **Restore Defaults** in the upper right corner.

### 4. **Check for Windows Game Mode and Xbox Game Bar:**
   - **Windows Game Mode** and **Xbox Game Bar** might interfere with FPS performance monitoring:
     - Go to **Settings > Gaming > Game Mode** and toggle it off.
     - Also, go to **Settings > Gaming > Xbox Game Bar** and turn it off.

### 5. **Manually Set Performance Mode:**
   - Set your system to maximum performance mode:
     - In the **NVIDIA Control Panel**, go to **Manage 3D settings**.
     - Under **Power management mode**, select **Prefer maximum performance**.

### 6. **Try Another Monitoring Tool:**
   - Test using another FPS monitoring tool to see if the issue is specific to NVIDIA Performance Monitor:
     - Tools like **MSI Afterburner** with **RivaTuner Statistics Server** or **FRAPS** can provide alternative FPS readings.
   - This will help determine if it's a monitor issue or an actual FPS cap issue.

### 7. **Check for DSR (Dynamic Super Resolution):**
   - If you have **DSR** enabled in NVIDIA Control Panel, it might be affecting your FPS:
     - Go to **NVIDIA Control Panel > Manage 3D settings > Global Settings**.
     - Ensure **DSR - Factors** is disabled.

### 8. **Reinstall NVIDIA Software:**
   - Perform a clean installation of the NVIDIA drivers and GeForce Experience:
     - Download the latest drivers from NVIDIA’s website.
     - During installation, select **Custom Installation** and then check the box for **Perform a clean installation**.
   - This will reset all NVIDIA settings and remove any corrupted files.

### 9. **Check for Windows Updates:**
   - Sometimes a Windows update can cause issues or fix them. Ensure your Windows is up to date.

### 10. **Use Safe Mode for Driver Reinstallation:**
   - If none of the above steps work, boot your system into **Safe Mode** and reinstall the NVIDIA drivers:
     - Press `Shift + Restart` to boot into Safe Mode.
     - Uninstall the NVIDIA drivers using **DDU (Display Driver Uninstaller)** in Safe Mode.
     - Reinstall the latest drivers after restarting normally.

If the issue persists after trying these steps, it might indicate a more complex problem with the NVIDIA Performance Monitor, and you may need to contact NVIDIA support or explore further diagnostic tools.

---

## 👤 You

how to restart this process with task manager

---

## 🤖 ChatGPT

To restart the NVIDIA Performance Monitor process using Task Manager, follow these steps:

1. **Open Task Manager:**
   - Press `Ctrl + Shift + Esc` to open Task Manager directly.
   - Alternatively, you can right-click on the Taskbar and select **Task Manager**.

2. **Locate NVIDIA Processes:**
   - In Task Manager, go to the **Processes** tab.
   - Look for any processes related to NVIDIA. These may include:
     - **NVIDIA Container**
     - **NVIDIA Display Container**
     - **NVDisplay.Container.exe**
     - **NVIDIA Telemetry Container**
     - **NVIDIA Share** (related to GeForce Experience)
   - You may need to expand the list by clicking the arrow next to "NVIDIA" if they are grouped.

3. **End the Relevant Processes:**
   - Right-click on each of the NVIDIA-related processes mentioned above and select **End task**.
   - This will stop the NVIDIA services temporarily.

4. **Restart the Processes:**
   - After ending the tasks, NVIDIA services will usually restart automatically. If they don't:
     - You can restart them manually by opening **GeForce Experience** or by simply restarting your computer.

5. **Check if the Problem Persists:**
   - After the processes restart, launch your game and see if the FPS monitor is now reflecting the correct frame rate.

This method should help reset the NVIDIA services and potentially resolve the FPS monitoring issue.

---

## 👤 You

which one specifically is it

---

## 🤖 ChatGPT

The specific process you should target to restart the NVIDIA Performance Monitor is **`NVDisplay.Container.exe`**. This process is responsible for many of the services related to the display, including performance monitoring and other on-screen display features.

Here’s a streamlined approach:

1. **Open Task Manager:**
   - Press `Ctrl + Shift + Esc` to open Task Manager.

2. **Locate `NVDisplay.Container.exe`:**
   - Go to the **Processes** tab in Task Manager.
   - Scroll down to find **`NVDisplay.Container.exe`** under the **NVIDIA Container** section.

3. **End the Task:**
   - Right-click on `NVDisplay.Container.exe` and select **End task**.
   - This will terminate the process, which may briefly disable some display-related NVIDIA features.

4. **Restart the Process:**
   - To restart the process, you can either reboot your computer or manually start it:
     - Rebooting is the simplest way to ensure all services restart correctly.
     - Alternatively, if you prefer not to reboot, you can manually restart the NVIDIA Display Container LS service via the Services app:
       1. Press `Win + R`, type `services.msc`, and press Enter.
       2. In the Services window, find **`NVIDIA Display Container LS`**, right-click it, and select **Start**.

After performing these steps, check if the FPS monitor is now reflecting the correct frame rate.

---

## 👤 You

nvidia share did it. but now after restart the fps says n/a

---

## 🤖 ChatGPT

User identified that restarting "NVIDIA Share" resolved the FPS lock issue but now the FPS monitor displays "n/a" after the restart.

---

> [!abstract]- Tool
> Model set context updated.


---

## 🤖 ChatGPT

If the FPS monitor is showing "n/a" after restarting "NVIDIA Share," it usually indicates that the performance monitoring feature hasn't fully reinitialized or that it’s having trouble accessing the necessary data. Here’s what you can do to resolve this:

### 1. **Restart NVIDIA Share and GeForce Experience:**
   - **Open Task Manager** again.
   - Find and end the **NVIDIA Share** process.
   - End the **NVIDIA Container** and **NVIDIA Telemetry Container** processes as well.
   - After ending these processes, **restart GeForce Experience** by launching it from the Start menu or desktop shortcut.
   - This will restart the NVIDIA services and should reinitialize the FPS monitoring feature.

### 2. **Check In-Game Overlay Settings:**
   - Open **GeForce Experience**.
   - Go to **Settings** (click the gear icon).
   - Ensure that **In-Game Overlay** is enabled.
   - Click on **Settings** under the In-Game Overlay section, then go to **HUD Layout** and make sure the FPS counter is turned on and properly positioned.

### 3. **Verify Game-Specific Settings:**
   - Ensure that the game you’re playing is running in **Fullscreen** mode, as some games might not report FPS correctly in **Windowed** or **Borderless Windowed** modes.

### 4. **Reinstall GeForce Experience:**
   - If the problem persists, you might need to reinstall **GeForce Experience**.
   - Uninstall GeForce Experience from the **Control Panel > Programs and Features**.
   - Download the latest version from the [NVIDIA website](https://www.nvidia.com/en-us/geforce/geforce-experience/) and install it.

### 5. **Use a Third-Party FPS Counter Temporarily:**
   - As a temporary workaround, you can use a third-party FPS counter like **MSI Afterburner** or **FRAPS** to monitor your FPS until the NVIDIA Share issue is resolved.

These steps should help in restoring the FPS counter functionality. If the issue persists, you may want to check for any updates to GeForce Experience or contact NVIDIA support for further assistance.

---
