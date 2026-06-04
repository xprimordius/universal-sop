# 🚪 DOOR INDEX — The Hallway
# VERSION: 1.0 | 2026-06-03 (mac-main) | The navigable manifest for DOOR_SCAN.md
# SCAN this (cheap). OPEN only the door(s) a task needs (DS.4). ASSERT only from opened doors (DS.3).
# Navigator: `bash scripts/door_scan.sh [door]`

> Each row is a DOOR. The **brief** tells you what's inside without opening it. The **deep cache** is the door's
> full, never-thinned detail — Read it only when relevant. Add a row whenever new depth is created (DS.5).

| 🚪 Door | 📋 Brief (what's behind it) | 💾 Deep cache (file · lines) | 🔓 When to open |
|---------|-----------------------------|------------------------------|-----------------|
| `prime` | The 12-stage unconditional foundation SOP (gold standard) | `PRIME_SOP.md` | Any output — it's Layer 0 |
| `prompts` | Alan's verbatim prompts (19) + Standing Directives SD-1..12 | `cache/legacy/USER_PROMPTS_VERBATIM.md` | Before changing a protocol — confirm original intent |
| `drules` | The 32 D-rules (D1-D32), canonical text | `cache/legacy/APW_MASTER_CACHE.md` · L24-86 | Tracing a rule's origin / mapping to a SubSOP |
| `protocols` | Every protocol SP.1-SP.24 + EN.1-EN.4, full sub-rules | `PROTOCOLS_REFERENCE.md` | Referencing/expanding any protocol |
| `sop` | Active rulebook v1.3 (6 stages, 16 SubSOPs, EN.1-4) | `UNIVERSAL_SOP_PROMPT.md` | Operating-procedure questions |
| `tightloop` | The trimmed operational loop (5 mandatory SubSOPs) v1.7 | `MANDATORY_TIGHT_LOOP.md` | Day-to-day output mechanics |
| `chain` | The 9-agent verification + improvement pipeline (order, gates) | `AGENT_CHAIN.md` | Running/auditing a deliverable |
| `agents` | All active agent definitions (Karen, Master Pass, Scope, Tom, ...) | `agents/` (one .md each) | Invoking a specific agent |
| `discipline` | The mechanical guards (Checklist Gate + No-Reduction) + the ladder | `RESTORATION_LOG.md` § Discipline + `scripts/*guard*`, `checklist_gate.sh` | Understanding/why a commit was blocked |
| `failures` | Every failure + structural fix, F.1-F.64 | `cache/FAILURE_LEDGER.md` | "Have we hit this before?" |
| `token` | Token system — estimate/track/report, YELLOW/RED gates, reserve | `PRIME_SOP.md` Stage 3 (3A-3E) | Budget / checkpoint decisions |
| `doorscan` | This caching architecture (hallway-of-doors), rules DS.1-DS.5 | `DOOR_SCAN.md` | Token/approximation strategy |
| `state` | Current position, decisions log, MACRO+MICRO goals | `cache/SESSION_STATE.md` | Session start / "where are we" |
| `continuation` | Latest session handoff | `cache/CONTINUATION.md` | Resuming work |
| `bootstrap` | Session-start procedure + boot self-test | `SESSION_START.md` + `cache/BOOTSTRAP_CHECK.md` | New session |
| `reference` | The full expandable system reference (HTML) | `SOP_COMPLETE_REFERENCE.html` | Wide overview of everything |
| `restoration` | The Prime-fidelity rebuild plan + map + discipline layer | `RESTORATION_LOG.md` | Restoration work |
| `multidevice` | 3-device git protocol + device registry + safe_push | `MULTI_DEVICE_GIT_PROTOCOL.md` + `DEVICE_REGISTRY.md` | Cross-device sync issues |
| `profile` | Alan's communication preferences | `USER_PROFILE.md` | Uncertain about style/preference |
| `scio` | SCIO principles + paradox resolutions (APW domain) | `cache/legacy/SCIO_KNOWLEDGE_CACHE.md` + `cache/subcache/` | APW course content work |
| `program` | APW course: 8 classrooms, 12 modules, ascension tiers | `cache/legacy/PROGRAM_DETAILS_CACHE.md` | APW course building (paused) |
| `per` | Prompt Execution Records (the checklist-gate ledger) | `cache/prompt_records/PER_INDEX.md` | Audit which checklist gated a change |
| `chainlog` | Agent-chain mechanical-band run ledger | `cache/CHAIN_LOG.md` | Did the chain run for an output? |

---

## 🧭 HOW TO USE (DS.4 — scan first, open second)

```
bash scripts/door_scan.sh              # scan the hallway (briefs only — cheap)
bash scripts/door_scan.sh prime        # locate the 'prime' door → prints PRIME_SOP.md → then Read it
bash scripts/door_scan.sh token        # locate token system → PRIME_SOP.md Stage 3 → Read that range
```

**Discipline:** never assert a detail you haven't opened the door for (DS.3). The hallway tells you *where* the truth is; it is not a substitute for *reading* it.

---

*cache/DOOR_INDEX.md v1.0 | The hallway for DOOR_SCAN.md | add a row for every new deep cache (DS.5) | 2026-06-03 (mac-main)*
