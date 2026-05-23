---
date: 2026-05-21
type: setup-guide
tags: [cloud, tailscale, rdp, setup, aurelius]
related: ["[[index]]", "[[Aurelius-Master-SOP]]"]
---

# Cloud Access — Tailscale + RDP (15-Minute Setup)

Linked: [[index]] · [[Aurelius-Master-SOP]]

> **What you get when done**: Aurelius accessible from your phone, iPad, laptop — from anywhere — securely. Free. No port forwarding. No DNS. No SSL certs.

---

## Why this works

- **Tailscale** = encrypted mesh VPN over WireGuard. Free for personal use (100 devices, 3 users).
- **Windows Remote Desktop** = built into Windows 11 Pro (you have it).
- **Together** = phone connects to your Strix Halo as if it's on the same LAN, anywhere on Earth.

Aurelius keeps running on your Strix Halo (best compute). Your phone is just a terminal.

---

## Setup steps — do these in order

### Step 1: Sign in to Tailscale on Strix Halo (Tailscale itself: already installed via winget)

**Tailscale is installed on this machine** (`C:\Program Files\Tailscale\tailscale.exe` v1.98.2).
You just need to sign in:

1. Look for the **Tailscale tray icon** (system tray, lower-right). If not running:
   - Run: `"C:\Program Files\Tailscale\tailscale-ipn.exe"` (it'll start the tray app)
2. Click the tray icon → **Log in**
3. Browser opens → sign in with Google/GitHub/Microsoft (use the same account you'll use on your phone)
4. Authorize this device
5. Once connected, the tray icon turns green. Run `tailscale ip -4` in a terminal to see your `100.x.x.x` address

### Step 2: Enable Remote Desktop on Strix Halo (2 min)
1. Press `Win + I` → **System** → **Remote Desktop**
2. Toggle **Remote Desktop** → **ON**
3. Click **Confirm** in the popup
4. Note your Windows username (top-right of the same panel)

### Step 3: Install Tailscale on your phone (3 min)
1. App Store (iPhone) or Play Store (Android) → search **Tailscale**
2. Install → open → sign in with the SAME account from Step 1
3. Tap the toggle → connection green = you're on the mesh

### Step 4: Install Microsoft RD Client on your phone (2 min)
- iPhone: App Store → **Windows App** (replaces the old RD Client, same vendor)
- Android: Play Store → **Microsoft Remote Desktop**
- Open → tap **+** → **Add PC**

### Step 5: Connect (1 min)
1. **PC name**: the `100.x.x.x` Tailscale IP from Step 1
2. **User account**: your Windows username from Step 2
3. **Friendly name**: "Aurelius" (or whatever)
4. Save → tap the new entry → enter Windows password → **Connect**

You should now see your Strix Halo desktop on your phone. Launch `launch_voice_agent.cmd` from there. Aurelius runs locally on the Strix Halo, you see + control her remotely.

---

## What it'll feel like

- **Latency**: ~50-150ms on a normal cellular connection. Voice agents handle this fine.
- **Bandwidth**: ~2-5 Mbps when active. Free tier handles unlimited.
- **Always-on**: as long as your Strix Halo is on + Tailscale running, you can connect from anywhere.

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| Can't see Strix Halo in Tailnet | Restart Tailscale tray app, make sure both devices signed into SAME account |
| "Can't connect to remote PC" | Strix Halo must be ON and not asleep. Settings → System → Power → Sleep: Never (while plugged in) |
| RDP works on LAN but not Tailscale | Windows firewall rule — Settings → Privacy & Security → Windows Security → Firewall → Allow an app → check both **Remote Desktop (TCP-In)** boxes for "Private" and "Public" |
| Connection drops over cellular | Use 5GHz Wi-Fi when possible; Tailscale handles handoff but cellular NAT can be fussy |

---

## Security notes

- Tailscale enforces device identity via your sign-in account. No port is opened to the internet.
- Anyone with your account credentials can join the mesh — use a strong password + 2FA.
- Default is "every device sees every device on your tailnet" — fine for personal use.

---

## Next-level (when you want it)

- **Tailscale Funnel**: expose Aurelius to public internet WITHOUT VPN — useful if you want a friend to use her. Skip for now.
- **Custom PWA** (1 day): native-app feel on phone, mic via browser. Better than RDP for voice-first interaction. Queued.
- **Web UI on Strix Halo** that any browser on the tailnet hits — middle ground between RDP and PWA.

---

#cloud #tailscale #setup #aurelius
