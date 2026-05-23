---
name: project-local-agent-stack
description: Local desktop AI agent build — Qwen3 MoE + LM Studio (Vulkan) + Open Interpreter + MCP servers on Windows 11.
metadata: 
  node_type: memory
  type: project
  originSessionId: 93a59399-6023-481c-8192-fc0e325aad50
---

Building a local AI agent that screenshots, reasons, clicks, and types across desktop apps.

Stack:
- Model: Qwen 3.6 35B-A3B (MoE, 35B total / 3B active), Q4_K_M, with vision (mmproj)
- Runner (preferred): LM Studio, Vulkan backend, ctx 65536, FA on, full GPU offload, OpenAI-compat server on :1234
- Runner (fallback): Ollama with `OLLAMA_VULKAN=1` on :11434
- Agent framework: Open Interpreter (vision + OS mode), pointed at local endpoint
- MCP servers: `server-playwright`, `server-filesystem`, `server-fetch`

**Why:** Alan wants a natural-language desktop agent that operates his APW apps locally for privacy and zero per-call cost.

**How to apply:** Treat this as the source of truth for the assembled stack. If a component name appears in memory but isn't on disk yet, verify before recommending. Safety guards live in [[feedback-confirm-before-irreversible]].

Related: [[hardware-strix-halo]], [[user-alan-apw]], [[feedback-confirm-before-irreversible]].
