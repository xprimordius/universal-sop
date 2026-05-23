---
title: ASUS 4070 No Video Signal
source: chatgpt
type: conversation
person: alan
created: "2025-03-04T01:48:47.812962+00:00"
updated: "2025-03-04T01:49:16.036716+00:00"
year: 2025
month: 2025-03
quarter: 2025-Q1
messages: 3
shared: False
id: 67c65bff-6614-8000-a74f-59ee15c67d28
tags:
  - chatgpt
  - alan
  - tech
---

# ASUS 4070 No Video Signal

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

Brand new asus 4070 desktop from Best Buy not outputting any video signal even with new cable and working monitor

---

## 🤖 ChatGPT

Here are the troubleshooting steps to resolve the issue with your **ASUS 4070 desktop not outputting a video signal**:

### **Step 1: Basic Checks**
1. **Confirm Power On** – Make sure the desktop is turning on (fans spinning, lights on).
2. **Check Monitor Input** – Ensure the monitor is set to the correct input source (HDMI, DisplayPort, etc.).
3. **Try a Different Cable** – If you haven’t already, try another HDMI or DisplayPort cable.
4. **Try a Different Port** – Use another port on the GPU.

### **Step 2: Bypass the GPU (Test with Integrated Graphics)**
- Some motherboards have **integrated graphics** (if using an Intel CPU with iGPU).  
- **Steps**:
  1. Remove the HDMI/DisplayPort from the GPU.
  2. Plug it into the **motherboard’s video output**.
  3. If you get a signal, the system may not be detecting the GPU properly.
  4. If this works, go to BIOS and ensure the **primary display adapter** is set to **PCIe (GPU)**.

### **Step 3: Ensure GPU is Seated Properly**
- If no integrated graphics are available or you suspect a GPU issue:
  1. Power off the PC and unplug it.
  2. Open the case and **reseat the GPU**:
     - Remove the GPU and reinstall it in the PCIe slot.
     - Ensure the **PCIe latch is fully locked**.
  3. Check the **GPU power cables** – Ensure all required power connectors (6/8-pin PCIe cables) are properly plugged in.

### **Step 4: Check RAM Seating**
- **Steps**:
  1. Power off, unplug, and open the case.
  2. Remove the RAM sticks and **reseat them firmly**.
  3. Try booting with only **one RAM stick in the primary slot**.

### **Step 5: Reset BIOS (Clear CMOS)**
- If there’s still no signal, reset the BIOS:
  1. **Method 1**: Remove the CMOS battery (small coin-shaped battery) for **30 seconds**, then put it back.
  2. **Method 2**: Use the motherboard’s **CMOS reset button** or **jumper pins** (refer to manual).

### **Step 6: Check for Faulty Components**
- **Test on another monitor** – Ensure the monitor itself isn’t the issue.
- **Check for motherboard error codes or beeps** (if applicable).
- **Test another GPU** (if possible).

### **Step 7: Last Resort – Contact Best Buy**
- If none of the above works, it could be a defective **GPU or motherboard**.
- **Since it’s brand new**, you should be eligible for an **exchange or repair** at Best Buy.

Let me know what happens after trying these steps.

---
