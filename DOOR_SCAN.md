# 🚪 DOOR SCAN — The Caching / Hallway-of-Doors Architecture
# VERSION: 1.0 | 2026-06-03 (mac-main) | Governed by PRIME_SOP.md v2.8
# RESTORED to its true meaning (was wrongly flattened to "a table style" — see RESTORATION_LOG F.63)

> **Door Scan is NOT a visual table style. It is a CACHING + REFERENCING architecture** — the structural cure for approximation and token waste. This file restores Alan's original intent, verbatim.

---

## 🎯 ALAN'S ORIGINAL INTENT (Verbatim — PROMPT 5)

> *"Maybe for ease for this prime first layer to have **priority details that CANNOT be missed**; for 100% accuracy and consistency of intended outputs always. While also containing **macro directional caches / pointers to the details of all of the heavier things; that further break down into more cached reference points where relevant**; But this way we are able to maintain **coherence on an operational level; before getting completely lost** with everything that needs to be expanded upon and verified in the deeper work."*
> — `cache/legacy/USER_PROMPTS_VERBATIM.md` lines 45-47

---

## 🏛️ THE MODEL — A Hallway Lined With Doors

```
        🚪        🚪        🚪        🚪        🚪
   ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐
   │ brief  │ │ brief  │ │ brief  │ │ brief  │ │ brief  │   ← THE HALLWAY (cache/DOOR_INDEX.md)
   └───┬────┘ └────────┘ └───┬────┘ └────────┘ └────────┘     scan briefs in seconds; know what is what
       │ open only the           │
       ▼ door you need           ▼
   ┌──────────────┐         ┌──────────────┐
   │ DEEP CACHE   │         │ DEEP CACHE   │                  ← BEHIND THE DOOR (the actual file + lines)
   │ full detail  │         │ full detail  │                    loaded ONLY when relevant
   └──────────────┘         └──────────────┘
```

| Concept | Meaning |
|--------|---------|
| 🚪 **The hallway** | The operational surface — briefs + pointers you scan to know *what is what*. Lives in `cache/DOOR_INDEX.md`. Cheap to load. |
| 🚪 **Each door** | One topic / protocol / operation. Its "brief" is in the hallway; its depth is the cache behind it. |
| 💾 **Behind the door** | The deep cache — the full, never-thinned detail (a file + line range). |
| 🔓 **Opening a door** | Reading that deep cache — **only when the task needs it**. |
| 🧭 **A Door Scan** | Glancing down the hallway (reading the index) to locate the right door — *without* loading every room. |

---

## 🛡️ THE RULES (What Door Scan Mandates)

| # | Rule | Why |
|:-:|------|-----|
| DS.1 | **Depth lives behind doors, never deleted.** Every heavy detail is cached in full somewhere. | Build, never reduce (F.63). Efficiency = not *loading* depth, never *removing* it. |
| DS.2 | **The hallway holds briefs + pointers only.** One line + a path per door. | Keeps the operational layer coherent (PROMPT 5: "before getting lost in the deeper work"). |
| DS.3 | **Open a door before you assert.** If a task needs a detail, READ the cache behind its door — never approximate from memory. | Kills the approximation disease at its root. |
| DS.4 | **Scan first, open second.** Read the index; open only the door(s) the task requires. | This is the token saving — you don't re-read everything. |
| DS.5 | **New depth gets a door.** Any new heavy artifact is cached + indexed (a brief + pointer added to the hallway). | The hallway stays a complete map; nothing becomes un-findable. |

---

## 🧮 HOW IT SOLVES THE TWO CHRONIC FAILURES

| Failure | Without Door Scan | With Door Scan |
|---------|-------------------|----------------|
| **Approximation / BS** | Work from a fuzzy in-context summary → guess → drift | Open the exact door (read the source cache) → assert from fact (DS.3) |
| **Token waste / "too chunky"** | Re-read huge files every session; or compact them (destroying depth) | Scan the cheap hallway; open only needed doors; depth stays intact (DS.1, DS.4) |

> The system is dense **on purpose** — it has to be, to hold 100% fidelity. Door Scan makes density *navigable* instead of *overwhelming*. That is why "get to 100% success first, optimize later" is possible: the optimization is **referencing**, not **reducing**.

---

## 🔧 THE MECHANISM (Real, Not Just A Concept)

| Artifact | Role |
|----------|------|
| `cache/DOOR_INDEX.md` | **The hallway.** The manifest: every door = topic → one-line brief → deep cache (file + lines) → when-to-open. |
| `scripts/door_scan.sh` | **The navigator.** `bash scripts/door_scan.sh` lists the hallway; `bash scripts/door_scan.sh <door>` prints that door's brief + path (open it with Read). |
| This file (`DOOR_SCAN.md`) | The architecture + rules (a door itself). |

### Usage at session start (the token-saving bootstrap)
```
1. Scan the hallway:        bash scripts/door_scan.sh         (cheap — briefs only)
2. Open only needed doors:  bash scripts/door_scan.sh prime   → shows PRIME_SOP.md path → Read it
3. Assert only from opened doors (DS.3). Never from a half-remembered summary.
```

This is PROMPT 5 operationalized: a prime hallway of macro pointers; deeper cached reference points opened where relevant; coherence kept before diving into depth.

---

## 🔗 RELATIONSHIP TO EXISTING STRUCTURE

Door Scan is not new infrastructure bolted on — it **names + indexes** the caching the project already had (cache/, cache/legacy/, cache/subcache/, the SOP docs). The DOOR_INDEX simply turns that scattered depth into one navigable hallway. The old `SP.2 Door Scan ("Door Scanning Pattern")` visual-table interpretation is a *downstream consequence* (scannable briefs), not the essence — the essence is the caching architecture above.

---

*DOOR_SCAN.md v1.0 | The hallway-of-doors caching architecture | restores PROMPT 5 | Prime SOP v2.8 | 2026-06-03 (mac-main)*
