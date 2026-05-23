---
title: Packet Loss Troubleshooting Apex
source: chatgpt
type: conversation
person: alan
created: "2024-08-13T17:32:51.852485+00:00"
updated: "2024-08-13T17:34:10.396463+00:00"
year: 2024
month: 2024-08
quarter: 2024-Q3
messages: 4
shared: False
id: 649d7de6-55ee-41c0-8fe7-abaff4b7dca8
tags:
  - chatgpt
  - alan
---

# Packet Loss Troubleshooting Apex

---

## 👤 You

Consistent packet loss despite hardwired Ethernet cables in apex legends. Why? I’ve done all possible forum searching, and the ISP and EA/Respawn Apex servers just keep pointing at each other without a clear solution.

I’ve had multiple techs come out, some saying the lines are good, other saying it’s bad, all recent ones say lines are healthy, one said high ingress, servicing has been done in the area, nothing has chanted

---

## 🤖 ChatGPT

Consistent packet loss in a game like Apex Legends, despite being hardwired via Ethernet, can be frustrating, especially when you're getting mixed messages from your ISP and game servers. Here’s a breakdown of potential causes and steps you can take to diagnose and potentially resolve the issue:

### 1. **Local Network Issues**
   - **Check for Other Devices**: Ensure no other devices on your network are consuming excessive bandwidth or causing interference, even if you are wired.
   - **Cable Quality**: Even though you're hardwired, ensure your Ethernet cables are Cat 5e or higher and in good condition. Damaged or older cables might not handle data transmission as effectively.
   - **Router and Modem**: Your router or modem might be the culprit. Consider upgrading the firmware or even trying a different model if possible. If your modem is provided by the ISP, you can request a replacement.

### 2. **ISP-Related Issues**
   - **Ingress Noise**: High ingress, as mentioned by one technician, could cause intermittent issues. Even if the lines are deemed "healthy" by recent techs, intermittent ingress noise can still disrupt the signal. This is often due to interference from external sources or issues with the cabling between your house and the ISP's node.
   - **Congestion**: If there’s network congestion, especially during peak hours, you might experience packet loss. Ask your ISP to check for congestion or routing issues on their end.
   - **Node Saturation**: The ISP node serving your area could be saturated, leading to inconsistent performance. This is harder to prove but worth discussing with your ISP.
   - **Line Quality**: Even if the lines are "healthy," line quality can fluctuate. Request a continuous monitoring tool from your ISP to track any intermittent issues.

### 3. **Server-Side or Routing Issues**
   - **Routing Path**: Sometimes, the issue lies in how data is routed from your ISP to the game servers. Use tools like WinMTR or PingPlotter to trace the route to Apex Legends servers and identify where packet loss occurs.
   - **Server Issues**: While EA and Respawn might deny server problems, intermittent issues might occur on certain nodes or data centers. Check if the issue happens at specific times, which might point to server load problems.

### 4. **Advanced Troubleshooting Steps**
   - **Network Monitoring**: Use tools like Wireshark to monitor packet loss and network health on your end. This can provide data when dealing with your ISP or EA support.
   - **Alternative DNS**: Switch to a different DNS provider like Google DNS or Cloudflare DNS. Sometimes, DNS resolution issues can lead to intermittent connectivity problems.
   - **Port Forwarding**: Ensure that necessary ports for Apex Legends are open and properly forwarded on your router.
   - **Quality of Service (QoS)**: Enable QoS on your router to prioritize gaming traffic.

### 5. **Consider a Third-Party VPN**
   - **VPN Testing**: Sometimes using a VPN can bypass problematic routing issues between your ISP and the game servers. Test with a reputable gaming VPN to see if packet loss improves.

### 6. **External Interference**
   - **EMI**: Electromagnetic interference from nearby electrical devices could potentially impact your Ethernet cable’s performance. Make sure your cables aren’t running parallel to power lines or near heavy machinery.

### 7. **Consult with Network Specialists**
   - **Professional Network Analysis**: If the issue persists, consider hiring a network specialist to analyze your setup. They can run thorough diagnostics that go beyond the typical ISP technician's scope.

While it can be challenging when both the ISP and game servers deflect responsibility, these steps should help narrow down the cause of the issue and potentially provide you with the information needed to push for a resolution.

---

## 👤 You

Examples of 7 best

---

## 🤖 ChatGPT

Here are seven of the best examples of practices or tools that can help diagnose and potentially resolve persistent packet loss issues:

### 1. **PingPlotter**
   - **Tool**: PingPlotter is an excellent tool for visualizing your network connection over time. It helps identify where packet loss or high latency occurs along the route between your device and the game server. It provides clear, graphical representations of network performance that you can use to show your ISP where the issue lies.
   - **Example**: Use PingPlotter to track your connection to Apex Legends servers over several hours, particularly during gameplay. If packet loss occurs at a specific hop, you can present this data to your ISP.

### 2. **Wireshark**
   - **Tool**: Wireshark is a powerful network protocol analyzer that captures and interacts with traffic data. It’s used to diagnose network problems and monitor packet transfers in real-time.
   - **Example**: Capture traffic while playing Apex Legends to see where packets are getting lost. This might reveal if the loss is happening on your local network or after your data leaves your router.

### 3. **Modem and Router Upgrade**
   - **Practice**: Upgrading to a higher-end modem or router, especially models known for stability and high throughput, can resolve packet loss issues caused by hardware limitations.
   - **Example**: Switching to a gaming-focused router like the ASUS ROG Rapture or a DOCSIS 3.1 modem like the Motorola MB8600 can reduce latency and packet loss.

### 4. **Cat 6a Ethernet Cables**
   - **Tool**: Upgrading to Cat 6a Ethernet cables can provide better shielding and support for higher data rates, which reduces the chance of packet loss due to cable interference or degradation.
   - **Example**: Replace older Ethernet cables with Cat 6a to ensure minimal signal loss and optimal performance, especially over longer distances.

### 5. **ISP Monitoring Tools**
   - **Practice**: Some ISPs provide tools or can set up monitoring to continuously check your connection's health. This long-term data can be crucial in diagnosing intermittent issues.
   - **Example**: Request your ISP to install monitoring software on your connection to check for fluctuations in signal quality, high ingress, or node saturation over time.

### 6. **Gaming VPN**
   - **Tool**: A VPN can sometimes route traffic more efficiently than your ISP, reducing packet loss and latency issues that occur due to poor routing or congested ISP nodes.
   - **Example**: Use a VPN like ExitLag, which is specifically designed for gamers, to reroute your traffic and potentially improve connectivity to Apex Legends servers.

### 7. **Network Specialist Consultation**
   - **Practice**: Consulting with a professional network specialist can provide a deep diagnostic of your home network setup. They can pinpoint obscure issues that might be missed by typical ISP technicians.
   - **Example**: Hire a network specialist to analyze your home network, looking for hidden problems like electromagnetic interference, suboptimal router placement, or hidden network configuration issues.

Each of these tools or practices addresses different potential causes of packet loss, providing a comprehensive approach to diagnosing and resolving persistent network issues.

---
