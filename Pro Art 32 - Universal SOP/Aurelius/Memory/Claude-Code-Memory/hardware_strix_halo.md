---
name: hardware-strix-halo
description: "Alan's primary workstation specs — AMD Strix Halo APU, unified memory architecture, target 96 GB allocated to iGPU."
metadata: 
  node_type: memory
  type: project
  originSessionId: 93a59399-6023-481c-8192-fc0e325aad50
---

Workstation: AMD Ryzen AI Max+ 395 (Strix Halo), 128 GB LPDDR5X-8000 unified memory, Radeon 8060S iGPU. Windows 11 Pro 10.0.26200.

**Why:** Determines which inference backend (Vulkan on the iGPU) and which model sizes/quants are feasible. UMA architecture means iGPU "VRAM" is carved from system RAM via BIOS.

**How to apply:** Default to Vulkan backend (LM Studio Vulkan / `OLLAMA_VULKAN=1`). Target UMA = 96 GB to iGPU; if a model load fails for memory reasons, surface the UMA setting as a BIOS-side TODO for the user — never try to fix it from software.

Related: [[project-local-agent-stack]].
