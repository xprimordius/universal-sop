---
date: 2026-05-21
type: design-doc
status: queued-for-op-13
tags: [cloud, architecture, websocket, pwa, op-13, aurelius]
related: ["[[index]]", "[[Aurelius-Master-SOP]]", "[[Cloud-Access-Setup]]"]
---

# Cloud Bridge Architecture — Op 13 Design

Linked: [[index]] · [[Aurelius-Master-SOP]] · [[Cloud-Access-Setup]]

Goal: Aurelius accessible from any device on your Tailnet — phone, iPad,
work laptop — without an RDP heavy lift. Voice + text both work over the
network. Audio stays local on Strix Halo (where the GPU is); only
transcripts + responses traverse.

---

## 3-tier architecture

```
YOUR DEVICES (any browser, any OS)
    iPhone PWA  ·  iPad PWA  ·  laptop browser
                       |
                       v   (WebSocket over HTTPS/Tailscale)
STRIX HALO — cloud_relay.py  (NEW)
    FastAPI + websockets, listens on Tailnet IP :7777
    Fan-out queue: tkinter UI + WebSocket both see responses
                       |
                       v   (in-process Queue)
STRIX HALO — voice_agent.py  (existing, untouched mostly)
    Mic + STT + LLM + TTS
    Adds: enqueue_response(text) — feeds both UI and relay
```

Key decisions:
1. Audio stays local — mic runs on Strix Halo, never sent over network
2. Text traverses — transcript + response text go to web clients
3. Voice input from web client = Phase 2 (record on phone, POST WAV)
4. Coexistence — tkinter UI and WebSocket both subscribe to the same Queue

---

## Stack: FastAPI + websockets

| Option | Verdict |
|---|---|
| Flask | sync-only, chokes on streaming |
| **FastAPI + websockets** | **chosen — async, streaming, pydantic** |
| Aiohttp | adds little vs FastAPI |
| Starlette raw | more code, no benefit |

---

## Files Op 13 will add

```
agent-stack/
  cloud_relay.py          NEW: FastAPI server + WebSocket handler
  web/
    index.html            PWA entry point (looks like Aurelius UI)
    manifest.json         PWA install metadata
    sw.js                 Service worker (offline cache)
    app.js                WebSocket client + UI logic
    style.css             onyx + gold theme matching desktop
  install_cloud_service.cmd  Task Scheduler registration
  tests/test_cloud_relay.py  regression guards
```

---

## Hook into voice_agent.py — minimal

Two-line change to existing `_log_session` method:

```python
def _log_session(self, who, text, ts):
    # existing markdown logging...
    try:
        from cloud_relay import broadcast
        broadcast({"who": who, "text": text, "ts": ts})
    except ImportError:
        pass   # cloud_relay not installed — silently OK
```

The relay code is a separate file. voice_agent.py only knows about it
if installed.

---

## WebSocket message protocol

Client to server:
```json
{ "type": "input", "text": "What time is it?", "from": "phone-pwa" }
```

Server to client (events):
```json
{ "type": "transcript", "who": "You", "text": "What time is it?", "ts": "13:45:22" }
{ "type": "thinking", "model": "Llama 3.3 70B", "tokens": 12 }
{ "type": "response", "who": "Aurelius", "text": "It's 1:45 PM, Alan.", "ts": "13:45:35" }
{ "type": "status", "mode": "LISTENING" }
```

---

## Phase plan

### Phase 1: text-only — Op 13, ~6 hours
- FastAPI server on :7777
- WebSocket endpoint /ws/aurelius
- Static HTML at / — text input + response display
- Tailscale already provides transport security
- **Acceptance**: type a question on phone, see Aurelius respond on phone + Strix Halo

### Phase 2: voice-in — Op 14, ~8 hours
- PWA records mic via MediaRecorder API
- POSTs WAV blob to /audio/upload
- Relay forwards to voice_agent.py STT path
- Response audio returned as WAV stream over WebSocket
- **Acceptance**: speak to phone, hear Aurelius respond

### Phase 3: PWA polish — Op 15, ~4 hours
- Add iOS/Android install metadata (manifest.json + sw.js)
- Offline cache for UI shell
- Onyx + gold theme matching desktop
- **Acceptance**: install on phone like a native app

---

## Security model

| Layer | Mechanism |
|---|---|
| Transport | Tailscale (already deployed) — encrypted + auth via your account |
| Authentication | None initially. Tailscale's device identity IS the auth. |
| Authorization | Anyone on your Tailnet can use Aurelius |
| Voice/audio | Stays local. WAV blobs not stored at relay. |
| Logs | Vault auto-syncs to GitHub like today |

Stronger auth (Op 16+): add shared-secret in WebSocket handshake.
Tailscale alone is sufficient for now.

---

## What Op 13 will SHIP

```bat
launch_cloud_relay.cmd        :: starts FastAPI on :7777
:: Then from phone: http://{strix-halo-tailnet-ip}:7777/
```

---

## Effort

| Phase | Hours | Op |
|---|---|---|
| 1 (text-only) | 6 | Op 13 |
| 2 (voice-in) | 8 | Op 14 |
| 3 (PWA install) | 4 | Op 15 |

Total to "phone has full Aurelius": **18 hours over 3 ops.**

Until then: Tailscale + RDP works (cloud-access guide in vault).

#cloud #architecture #op-13 #queued
