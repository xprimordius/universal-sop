---
title: Port Forwarding Apex Legends
source: chatgpt
type: conversation
person: alan
created: "2025-03-04T09:41:54.254762+00:00"
updated: "2025-03-04T09:46:36.098292+00:00"
year: 2025
month: 2025-03
quarter: 2025-Q1
messages: 8
shared: False
id: 67c6cae1-b5d8-8000-8466-d82e77c9a885
tags:
  - chatgpt
  - alan
---

# Port Forwarding Apex Legends

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

how to port forward to two PCs for apex legends

---

## 🤖 ChatGPT

Port forwarding to **two PCs** for **Apex Legends** requires careful configuration to avoid conflicts since both PCs will need to use the same ports. Here’s how to do it properly:

### **Step 1: Identify Apex Legends Ports**
Apex Legends typically uses the following ports:

- **PC (Steam/Origin)**
  - **UDP:** 8088-8089, 1024-1124, 3216, 18000-20999, 29900-29901, 30000-30099
  - **TCP:** 80, 443, 9960-9969, 1024-1124, 18000-20999, 42127

### **Step 2: Assign Static IPs to Each PC**
1. Open **Command Prompt** on each PC and type:
   ```
   ipconfig /all
   ```
   - Note down the **IPv4 address** (e.g., `192.168.1.100` for PC1 and `192.168.1.101` for PC2).

2. Set static IPs on each PC in your router's **DHCP settings** (to prevent IP changes).

### **Step 3: Use Different External Ports for Each PC**
Since both PCs need the **same internal ports**, you must use different **external ports** and translate them to the correct internal ones.

#### **Example Port Forwarding Rules**
| **External Port** | **Internal Port** | **IP Address** | **Protocol** |
|------------------|------------------|---------------|-------------|
| 50000-50099 | 30000-30099 | 192.168.1.100 | UDP |
| 50100-50199 | 30000-30099 | 192.168.1.101 | UDP |
| 51000-51099 | 8088-8089 | 192.168.1.100 | UDP |
| 51100-51199 | 8088-8089 | 192.168.1.101 | UDP |

1. Log in to your **router settings** (usually `192.168.1.1` or `192.168.0.1`).
2. Locate **Port Forwarding** settings.
3. Create rules mapping **unique external ports** to each PC’s **internal Apex ports**.
4. Apply and save changes.

### **Step 4: Configure Each PC to Use Its Own External Port**
1. In **Apex Legends launch options**, force each PC to use its specific external ports.
   - **Go to Steam/Origin → Game Properties → Advanced Launch Options**
   - For **PC1**, add:
     ```
     +clientport 50000
     ```
   - For **PC2**, add:
     ```
     +clientport 50100
     ```

### **Step 5: Restart Router and Test**
- **Restart your router and both PCs.**
- **Test connectivity by launching Apex Legends on both PCs** at the same time.
- If one PC cannot connect, verify the firewall settings or try different external port ranges.

This setup ensures **both PCs** can connect to Apex Legends **without port conflicts**.

---

## 🤖 ChatGPT

Since **Xfinity only allows port forwarding to one device**, you’ll need to work around this limitation. Here’s how:

---

### **Solution 1: Use Different External Ports with UPnP**
1. **Enable UPnP (Universal Plug and Play) in the Router**
   - Log into your **Xfinity Gateway** (`10.0.0.1`).
   - Go to **Advanced Settings > UPnP** and enable it.
   - This allows Apex Legends to request its own ports dynamically.

2. **Set Custom Ports in Apex Legends on Each PC**
   - On **PC1**, set a custom port:
     ```
     +clientport 50000
     ```
   - On **PC2**, set a different custom port:
     ```
     +clientport 50100
     ```
   - This tells Apex to use different outbound ports, reducing conflicts.

---

### **Solution 2: Use a Secondary Router (Best for Stability)**
If UPnP doesn’t work well, set up a **secondary router**:
1. **Buy a second router** and connect it to the Xfinity modem/router via **Ethernet**.
2. **Put one PC on the Xfinity network** and the **other PC on the secondary router’s network**.
3. **Port forward** each PC separately based on the router it’s connected to.

---

### **Solution 3: DMZ Mode for One PC, UPnP for the Other**
1. **Put one PC in the DMZ** (Exposed Host) in Xfinity settings:
   - Go to **Advanced Settings > DMZ**.
   - Enter the **IP address of PC1**.
   - This allows unrestricted access for **PC1**.
2. **Enable UPnP for PC2**.
   - The second PC will still be able to request ports dynamically.

---

### **Solution 4: Use a VPN on One PC**
1. Connect **PC2** to a gaming-optimized VPN.
2. This makes PC2 route traffic through the VPN, **bypassing Xfinity’s port forwarding limit**.

---

### **Best Approach?**
- **If UPnP works**, it’s the simplest solution.
- **If stability is key**, use **Solution 2** (secondary router).
- **If you need a quick fix**, **DMZ + UPnP** works well.

Let me know which method works best for you! 🚀

---

## 👤 You

how to refresh ip after all is done like the netsh winsock reset and ip reset

---

## 🤖 ChatGPT

To **fully refresh your IP** after setting up port forwarding and network configurations, follow these steps:

### **Step 1: Release and Renew IP**
1. **Open Command Prompt (Run as Administrator)**
2. Run the following commands:
   ```
   ipconfig /release
   ipconfig /renew
   ```

---

### **Step 2: Flush DNS Cache**
Run:
   ```
   ipconfig /flushdns
   ```

---

### **Step 3: Reset TCP/IP Stack**
1. Reset Winsock:
   ```
   netsh winsock reset
   ```
2. Reset TCP/IP:
   ```
   netsh int ip reset
   ```

---

### **Step 4: Change Public IP (if needed)**
If your **ISP assigns dynamic IPs**, restart your **modem/router**:
1. Turn off **modem + router**.
2. Wait **5-10 minutes** (or longer if needed).
3. Turn them back on.

👉 If your **ISP still gives you the same IP**, you might need to:
- **Leave your modem off overnight** for a new dynamic IP.
- **Use a VPN** to get a different external IP.
- **Contact your ISP** to request a new IP (if dynamic).

---

### **Step 5: Verify New IP**
Check your **public IP** before and after at:
🔗 [https://whatismyipaddress.com](https://whatismyipaddress.com)

If it hasn’t changed and you need a fresh **public IP**, your ISP may require you to **change your MAC address** in the router settings.

Let me know if you need deeper troubleshooting! 🚀

---

## 👤 You

thank you

---

## 🤖 ChatGPT

You're welcome! 🚀 If you ever need more tech help or optimizations, just let me know. Happy gaming! 🎮🔥

---
