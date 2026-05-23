---
title: Controller Software Mouse Conflict
source: chatgpt
type: conversation
person: alan
created: "2025-01-10T06:56:01.294932+00:00"
updated: "2025-01-10T06:59:34.753878+00:00"
year: 2025
month: 2025-01
quarter: 2025-Q1
messages: 7
shared: True
id: 6780c481-0a14-8000-8477-115277fe169e
tags:
  - chatgpt
  - alan
  - shared
---

# Controller Software Mouse Conflict

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

scuff controller software corsair for play station controller disables mouse via devices HID keyboard device linked to the software. Disabling the HID keyboard in devices allows the mouse to work, having it open disables the mouse, how to fix; having to manually disabling every time

---

## 🤖 ChatGPT

This issue is likely caused by the Corsair or Scuf controller software misinterpreting the HID keyboard device input, which causes conflicts with the mouse functionality. Here’s a step-by-step guide to fix or work around the issue:

---

### **Solutions**

#### 1. **Update Software & Drivers**
   - Ensure that both the **Scuf/Corsair controller software** and your **mouse drivers** are updated to their latest versions.
   - Update your **HID device drivers**:
     - Go to **Device Manager** → **Human Interface Devices**.
     - Right-click on each HID-compliant device and select **Update Driver**.

#### 2. **Change USB Ports**
   - Plug the controller and mouse into different USB ports (preferably USB 3.0 ports if available).
   - Avoid using a USB hub, as it may cause power or communication conflicts between devices.

#### 3. **Disable HID Devices Automatically**
   Use a script or scheduled task to automatically disable the conflicting HID device when starting the controller software:
   
   **Steps:**
   - Open Notepad and paste the following script:
     ```bash
     devcon disable "HID\VID_xxxx&PID_yyyy"
     ```
   - Replace `VID_xxxx&PID_yyyy` with the **Hardware ID** of the conflicting HID device (found in Device Manager under the device's properties).
   - Save the file as `disable_hid.bat`.
   - Create a **Task Scheduler** task that runs this script whenever the controller software starts.

#### 4. **Contact Corsair/Scuf Support**
   If the issue persists, reach out to **Corsair** or **Scuf support** to report the bug and request a patch or workaround.

#### 5. **Alternative Software**
   If possible, try using third-party controller mapping software like **DS4Windows** instead of the Scuf/Corsair software, as it might avoid this conflict entirely.

---

Would you like detailed steps for automating the disabling of the HID device using a script?

---

## 👤 You

how to 

Create a Task Scheduler task that runs this script whenever the controller software starts.

---

## 🤖 ChatGPT

Here’s how to create a Task Scheduler task that runs your script when the controller software starts:

---

### **Step-by-Step Guide:**

#### **1. Open Task Scheduler**
- Press `Win + S` and type **Task Scheduler**, then hit **Enter**.

#### **2. Create a New Task**
- In the right-hand panel, click **Create Task**.

#### **3. General Tab**
- Give your task a name, e.g., **Disable HID Device**.
- Check **Run whether user is logged on or not**.
- Check **Run with highest privileges**.

#### **4. Triggers Tab**
- Click **New** to create a new trigger.
- Set **Begin the task** to **On an event**.
- Under **Settings**, select:
  - **Log:** `Application`
  - **Source:** `Scuf/Corsair software executable name` (you may need to find the correct name by running the software and checking Task Manager logs)
  - **Event ID:** `1` (or the specific event ID tied to when the software starts—use Event Viewer to find the ID if needed)
- Click **OK**.

#### **5. Actions Tab**
- Click **New** to create a new action.
- Set **Action** to **Start a program**.
- In the **Program/script** field, browse to the `disable_hid.bat` script you created earlier.

#### **6. Conditions Tab**
- Uncheck **Start the task only if the computer is on AC power**.

#### **7. Settings Tab**
- Check **Allow task to be run on demand**.
- Check **If the task fails, restart every** and set it to **1 minute** with **3 retries**.

#### **8. Save and Test**
- Click **OK**. You may be prompted to enter your administrator password.
- Manually run the task to test if it successfully disables the HID device.

---

This setup ensures that the script runs automatically when the controller software starts. If you need help finding the exact event ID or executable name, I can guide you through it. Want those details?

---

## 👤 You

yes

---

## 🤖 ChatGPT

Here’s how to find the exact **event ID** and **executable name** for the controller software:

---

### **Step 1: Launch the Controller Software**
1. Open the **Scuf/Corsair controller software** as you normally would.
2. Keep it running.

---

### **Step 2: Open Event Viewer**
1. Press `Win + S` and type **Event Viewer**, then hit **Enter**.
2. In Event Viewer, expand **Windows Logs** and select **Application**.

---

### **Step 3: Filter the Log for Relevant Events**
1. Click **Filter Current Log** on the right-hand panel.
2. In the **Filter Current Log** window:
   - Check **Information** under Event Level.
   - Under **Event sources**, look for the name of your controller software (e.g., `Scuf`, `Corsair`, or similar).
   - Click **OK**.

---

### **Step 4: Identify the Event ID**
1. Scroll through the filtered logs to find an entry that corresponds to when you opened the controller software.
2. Once you find it, note the **Event ID** and **Source**. You will need these for creating the trigger in Task Scheduler.

---

### **Step 5: Find the Executable Name**
1. Open **Task Manager** (`Ctrl + Shift + Esc`) and go to the **Details** tab.
2. Look for the process related to the controller software (e.g., `scuf.exe`, `corsair.exe`).
3. Note down the exact **executable name**.

---

### **Step 6: Use the Information in Task Scheduler**
- Use the **Event ID** and **Source** you noted down when creating the trigger in Task Scheduler.
- Ensure the **Action** points to your `disable_hid.bat` script.

---

If you encounter any issues with identifying the correct event or executable, let me know, and I can guide you further!

---
