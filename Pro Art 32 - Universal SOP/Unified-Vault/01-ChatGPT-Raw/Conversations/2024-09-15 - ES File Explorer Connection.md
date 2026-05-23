---
title: ES File Explorer Connection
source: chatgpt
type: conversation
person: alan
created: "2024-09-15T03:51:07.631609+00:00"
updated: "2024-09-15T03:51:21.003728+00:00"
year: 2024
month: 2024-09
quarter: 2024-Q3
messages: 2
shared: False
id: 66e659ab-3b6c-8000-844b-65cd7b874258
tags:
  - chatgpt
  - alan
---

# ES File Explorer Connection

---

## 👤 You

cant connect windows es file explore to windows 11 pc i typed in the right ip but it says connection failed. it used to work fine on windows 10

---

## 🤖 ChatGPT

To resolve the issue with ES File Explorer not connecting to your Windows 11 PC, even though it worked fine on Windows 10, follow these steps:

### 1. **Ensure File Sharing is Enabled on Windows 11**
   - Go to **Settings > Network & Internet > Advanced network settings > Advanced sharing settings**.
   - Make sure **Network discovery** and **File and printer sharing** are turned on for the network profile you're using (Private/Public).
   - Also, ensure **Password-protected sharing** is either turned off or, if it's on, you're using the correct username and password.

### 2. **Check Windows Firewall**
   - Press `Windows + S`, type "Windows Security", and open it.
   - Go to **Firewall & network protection** > **Allow an app through firewall**.
   - Look for **File and Printer Sharing** and make sure it's allowed on the active network type (Private or Public).

### 3. **Share the Folder Properly**
   - Right-click the folder you want to share and select **Properties**.
   - Go to the **Sharing** tab, click **Advanced Sharing**, and check **Share this folder**.
   - Click **Permissions** and ensure that your user or the group "Everyone" has at least "Read" access.

### 4. **Use SMB 1.0/CIFS File Sharing Support (Optional)**
   - Windows 11 may have SMB 1.0/CIFS disabled by default. You may need to enable it:
     - Open **Control Panel** > **Programs and Features** > **Turn Windows features on or off**.
     - Scroll down and check **SMB 1.0/CIFS File Sharing Support**, then click **OK** and restart your PC.

### 5. **Check IP and Credentials**
   - Verify the IP address of your PC by running `ipconfig` in Command Prompt to get the correct IPv4 address.
   - Ensure you're using the correct username and password when prompted in ES File Explorer. If password-protected sharing is enabled on your PC, the login credentials are mandatory.

### 6. **Disable SMB Encryption (if applicable)**
   - In some cases, SMB encryption may prevent ES File Explorer from connecting properly. You can check for this setting in **Local Group Policy Editor**:
     - Press `Windows + R`, type `gpedit.msc`, and press Enter.
     - Navigate to **Computer Configuration > Administrative Templates > Network > Lanman Workstation**.
     - Ensure that SMB encryption is either disabled or not enforced.

### 7. **Reconfigure Network Type**
   - If your network type is set to Public, change it to Private:
     - Go to **Settings > Network & Internet > Properties** of the active network.
     - Set the network to **Private**.

### 8. **Test the Connection**
   - After configuring these settings, try connecting again using the correct IP address in ES File Explorer.

These steps should help resolve your connection issue between ES File Explorer and your Windows 11 PC. Let me know if you need further assistance.

---
