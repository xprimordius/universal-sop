# 🗺️ SOP MAP — Visual Reference For The Entire System
# VERSION: 1.0 | 2026-05-21 | aurelia | Per Alan: "visualize the entire SOP in a very easy to understand way"
# Renders in any Mermaid-aware viewer: Obsidian, GitHub web, VSCode preview, IntelliJ, etc.

---

## 🎯 ONE-LINE OVERVIEW

> **The Universal SOP is a 6-layer system: Devices → Bootstrap → Rulebook → Protocols → Agents → Cache, gated by Mechanical Enforcement (scripts + hooks).** The full SOP defines 20 protocols (16 SubSOPs + 4 Ensurance) but per F.19 / `MANDATORY_TIGHT_LOOP.md` (Tier 1 fix, 2026-05-21), only 6+1 are mandatory for operational use. The rest stay reference-only in `PROTOCOLS_REFERENCE.md`.

---

## 🗺️ Diagram 1 — The Full System Map (6 layers + enforcement)

```mermaid
flowchart TB
    classDef bootstrap fill:#3B82F6,color:white,stroke:#1E3A8A,stroke-width:2px
    classDef rulebook fill:#10B981,color:white,stroke:#047857,stroke-width:2px
    classDef protocols fill:#F97316,color:white,stroke:#9A3412,stroke-width:2px
    classDef agents fill:#A855F7,color:white,stroke:#6B21A8,stroke-width:2px
    classDef cache fill:#6B7280,color:white,stroke:#1F2937,stroke-width:2px
    classDef enforcement fill:#EF4444,color:white,stroke:#991B1B,stroke-width:2px
    classDef legacy fill:#D1D5DB,color:#374151,stroke:#9CA3AF,stroke-dasharray:5 5

    Alan(["👤 Alan<br/>(operator)"])

    subgraph DEVICES["🖥️ DEVICES (DEVICE_REGISTRY.md)"]
        mac["mac-main<br/>(MacBook)"]
        aurelia["aurelia<br/>(Windows Strix Halo)"]
        future["future devices<br/>(Strix Halo #2, etc.)"]
    end

    subgraph BOOT["🚪 BOOTSTRAP LAYER"]
        SS["SESSION_START.md<br/>canonical entry point"]
        CLAUDE["CLAUDE.md<br/>Claude Code config"]
        TIGHT["MANDATORY_TIGHT_LOOP.md<br/>operational ruleset (Tier 1)"]
        MULTI["MULTI_DEVICE_GIT_PROTOCOL.md<br/>7 Golden Rules"]
        MASTER["MASTER_CONTINUATION_PROMPT.md<br/>one-paste resume"]
    end

    subgraph RULE["📋 RULEBOOK LAYER"]
        SOP["UNIVERSAL_SOP_PROMPT.md<br/>v1.3 — the full SOP (940 lines)"]
        STAND["STANDALONE_SOP.md<br/>shippable MIT (~95% cross-model portable)"]
        REF["PROTOCOLS_REFERENCE.md<br/>20 protocols documented"]
        PRIME["PRIME_SOP.md v2.8<br/>APW-era — LEGACY"]
    end

    subgraph PROT["🧩 20 PROTOCOLS"]
        SP["16 SubSOPs<br/>SP.1 – SP.16"]
        EN["4 Ensurance<br/>EN.1 – EN.4"]
    end

    subgraph AG["🤖 4 ACTIVE AGENTS"]
        Ctrl["Controller<br/>(orchestrate + cache, F4 fusion)"]
        Val["Validator-Merged<br/>(Layer 1 audit)"]
        Karen["Karen<br/>(Layer 2 reality check)"]
        Para["Paradox Resolver<br/>(SCIO/APW tension, on-demand)"]
        Arch["📦 archived: Jenny<br/>+ Oversight + Cache Manager"]
    end

    subgraph CACHE["🗄️ CACHE LAYER (active state)"]
        STATE["SESSION_STATE.md<br/>decisions log"]
        CONT["CONTINUATION.md<br/>handoff"]
        BACK["BACKUP_LOG.md<br/>~170 entries"]
        FAIL["FAILURE_LEDGER.md<br/>F.1 – F.19"]
        BC["BOOTSTRAP_CHECK.md<br/>77-item spec"]
        LEG["cache/legacy/<br/>(APW-era archived)"]
        BAK["cache/backups/<br/>(snapshots)"]
    end

    subgraph ENF["⚙️ MECHANICAL ENFORCEMENT"]
        verify["bootstrap_verify.sh<br/>70 checks at session start"]
        comp["compliance_check.sh"]
        append["append_only_check.sh"]
        consist["consistency_check.sh"]
        activity["check_device_activity.sh"]
        setup["setup_device.sh"]
        safe["safe_push.sh"]
        precommit[".githooks/pre-commit"]
        prepush[".githooks/pre-push"]
    end

    Alan --> DEVICES
    DEVICES --> BOOT
    BOOT --> RULE
    RULE --> PROT
    SOP --> AG
    BOOT --> CACHE
    DEVICES --> ENF
    ENF -.->|gates| RULE
    ENF -.->|enforces| CACHE
    SS -.references.-> TIGHT
    SS -.references.-> MULTI

    class SS,CLAUDE,TIGHT,MULTI,MASTER bootstrap
    class SOP,STAND,REF rulebook
    class PRIME legacy
    class SP,EN protocols
    class Ctrl,Val,Karen,Para agents
    class Arch legacy
    class STATE,CONT,BACK,FAIL,BC cache
    class LEG,BAK legacy
    class verify,comp,append,consist,activity,setup,safe,precommit,prepush enforcement
```

**Color legend:** 🔵 Bootstrap · 🟢 Rulebook · 🟠 Protocols · 🟣 Agents · ⚫ Cache · 🔴 Enforcement · ⚪ Legacy/archived

---

## 🔄 Diagram 2 — Session Lifecycle

How a normal session flows from open-Claude-Code to push-to-remote, including every hook + gate:

```mermaid
sequenceDiagram
    autonumber
    actor Alan
    participant Device as 🖥️ Device<br/>(aurelia / mac-main)
    participant CC as Claude Code
    participant Verifier as bootstrap_verify.sh
    participant Cache as cache/*.md
    participant Hook as .githooks/<br/>(pre-commit + pre-push)
    participant Remote as origin/main

    Alan->>Device: open Claude Code
    Device->>CC: launch
    CC->>CC: auto-read CLAUDE.md
    CC->>CC: read SESSION_START.md (entry point)
    CC->>Verifier: bash scripts/bootstrap_verify.sh
    Verifier-->>CC: 70/0/0 pass ✅
    CC->>Cache: read SESSION_STATE + CONTINUATION + BOOTSTRAP_CHECK (Fast-Path)
    CC->>Alan: STEP 2 — 9-line ✅ RESUMED + macro/micro
    Alan->>CC: provides task
    CC->>CC: MODE declaration (CONVERSATION or OUTPUT-X)
    Note over CC: For OUTPUT mode, apply<br/>MANDATORY_TIGHT_LOOP<br/>(3-line STEP + 6 SubSOPs +<br/>5-item Pulse Check)
    CC->>Alan: deliver output
    CC->>Cache: backup before edit + log to BACKUP_LOG
    CC->>Device: git add (specific files)
    Device->>Hook: pre-commit triggers
    Hook->>Hook: append_only_check.sh
    Hook->>Hook: compliance_check.sh
    Hook->>Hook: device identity check
    Hook-->>Device: ✅ pass
    Device->>Device: commit with [device | TS] subject
    Device->>Hook: pre-push triggers
    Hook->>Remote: fetch + check sync
    alt remote ahead
        Hook-->>Device: BLOCK + run safe_push.sh
    else remote unchanged
        Hook-->>Device: ✅ push allowed
        Device->>Remote: git push
    end
    Remote-->>Device: confirmation
```

---

## 🧩 Diagram 3 — All 20 Protocols Grouped By Function

Functional grouping of the 16 SubSOPs + 4 Ensurance. **⭐ = part of the 6+1 MANDATORY TIGHT LOOP** (Tier 1 of F.19 fix — the rules that survive in real sessions). The other 13 are reference-only.

```mermaid
flowchart LR
    classDef visual fill:#FBBF24,color:black,stroke:#92400E,stroke-width:2px
    classDef token fill:#3B82F6,color:white,stroke:#1E40AF,stroke-width:2px
    classDef safety fill:#10B981,color:white,stroke:#065F46,stroke-width:2px
    classDef foresight fill:#A855F7,color:white,stroke:#6B21A8,stroke-width:2px
    classDef selfcheck fill:#F97316,color:white,stroke:#9A3412,stroke-width:2px
    classDef honest fill:#EF4444,color:white,stroke:#7F1D1D,stroke-width:2px
    classDef enforcement fill:#0D9488,color:white,stroke:#134E4A,stroke-width:2px
    classDef ensurance fill:#7C3AED,color:white,stroke:#4C1D95,stroke-width:2px
    classDef tight fill:#22C55E,color:white,stroke:#14532D,stroke-width:3px

    subgraph V["🎨 VISUAL"]
        SP1[SP.1 MagNet<br/>Magnetic Visual Engagement]
        SP2[SP.2 Door Scan<br/>Door Scanning Pattern]
        SP8[SP.8 Protocol Visibility]
    end

    subgraph T["🪙 TOKEN / MEASUREMENT"]
        SP3[SP.3 TTE<br/>Token Threshold Engine]
        LTM["LTM<br/>Live Token Monitor<br/>(per-section marker)"]
    end

    subgraph S["🛡️ PROCESS SAFETY"]
        SP4[SP.4 SCP<br/>System Change Protocol]
        SP5["SP.5 FSP ⭐<br/>Fidelity Substantiation"]
        SP6["SP.6 IAC ⭐<br/>Intent Alignment Check<br/>(aka Understanding Check)"]
    end

    subgraph F["🔮 FORESIGHT"]
        SP7[SP.7 Insights]
        SP9[SP.9 FE<br/>Foresight Engine]
    end

    subgraph SC["🔍 SELF-CHECK"]
        SP10[SP.10 SCC<br/>Self-Compliance Check]
        SP11[SP.11 QAC<br/>Quality Assurance Check]
    end

    subgraph HF["🪞 HONEST FAILURE"]
        SP12["SP.12 HFR ⭐<br/>Honest Failure Report"]
        SP14[SP.14 RPT<br/>Repeated Prompt Tracker]
        SP13[SP.13 SHR<br/>System Health Report]
    end

    subgraph E["⚡ EXECUTION"]
        SP15["SP.15 EEP ⭐<br/>Execution Enforcement"]
        SP16[SP.16 PCG<br/>Prompt Completion Gate]
    end

    subgraph EN["🛡️ 4 ENSURANCE (anti-decay)"]
        EN1["EN.1 ⭐<br/>Output Skeleton<br/>(Structural Anti-Decay)"]
        EN2[EN.2<br/>Priority 10<br/>Cognitive Load Reduction]
        EN3[EN.3<br/>Checkpoint Cycle<br/>Attention Reset]
        EN4["EN.4 ⭐<br/>Pulse Check<br/>(reduced 5 items in Tier 1)"]
    end

    class SP1,SP2,SP8 visual
    class SP3,LTM token
    class SP4 safety
    class SP5,SP6 tight
    class SP7,SP9 foresight
    class SP10,SP11 selfcheck
    class SP12 tight
    class SP14,SP13 honest
    class SP15 tight
    class SP16 enforcement
    class EN1,EN4 tight
    class EN2,EN3 ensurance
```

**The 7 mandatory tight-loop protocols** (green border):
- SP.5 FSP — every claim has evidence
- SP.6 IAC — Understanding Check before execution
- SP.12 HFR — honest root-cause when something fails
- SP.15 EEP — execute, don't acknowledge
- EN.1 Output Skeleton — mandatory sections always visible
- EN.4 Pulse Check (5 items) — pre-send mechanical sweep

---

## 🧠 Diagram 4 — The F.19 Insight: Discipline vs Architecture

Why some rules survive and others decay. The single deepest insight in the project's history:

```mermaid
flowchart LR
    classDef fail fill:#FEE2E2,color:#7F1D1D,stroke:#DC2626,stroke-width:2px
    classDef pass fill:#D1FAE5,color:#065F46,stroke:#10B981,stroke-width:2px
    classDef bridge fill:#FEF3C7,color:#92400E,stroke:#F59E0B,stroke-width:2px,stroke-dasharray:5 5

    subgraph DISC["❌ DISCIPLINE — decays<br/>(rules without gates, ~0% compliance)"]
        D1[STEP headers]
        D2[Understanding Check]
        D3[LTM per section]
        D4[Step Tracking Table]
        D5[Pulse Check 17 items]
        D6[Agent invocation]
        D7[Session-start ritual]
    end

    subgraph ARCH["✅ ARCHITECTURE — holds<br/>(rules with gates, ~85% compliance)"]
        A1[backups before edit]
        A2[device IDs in filenames]
        A3[append-only enforcement]
        A4[commit msg convention]
        A5[no deletion]
        A6[pre-commit hook]
        A7[pre-push hook]
        A8[bootstrap_verify.sh]
    end

    subgraph FIX["🛠️ TIERED FIX (F.19)"]
        T1["TIER 1 ✅ SHIPPED<br/>Scope reduction<br/>17→5, 16→6, 8→3"]
        T2["TIER 2 ⏳ STAGED<br/>Mode declaration<br/>(CONVERSATION vs OUTPUT-X)"]
        T3["TIER 3 ⏳ STAGED<br/>Outputs are files<br/>(pre-commit gates compliance)"]
    end

    DISC -->|"loses to<br/>immediate task"| Failed[F.1–F.19<br/>keep recurring]
    ARCH -->|"gated by hooks"| Success[holds across sessions<br/>+ devices]
    DISC -.->|T1 reduces surface| FIX
    DISC -.->|T2 scopes when SOP fires| FIX
    DISC -.->|T3 converts to architecture| ARCH

    class D1,D2,D3,D4,D5,D6,D7 fail
    class A1,A2,A3,A4,A5,A6,A7,A8 pass
    class T1,T2,T3 bridge
    class Failed fail
    class Success pass
```

See `SELF_COMPLIANCE_FIX.md` for the full diagnosis + acceptance tests.

---

## 📅 Diagram 5 — Failure Ledger Timeline (F.1 → F.19)

```mermaid
timeline
    title FAILURE_LEDGER — 19 entries across 2 months
    section March 2026
        F.1 Emojis far left (REPEAT × 3) : MagNet always-on
        F.2 Live token tracking (REPEAT × 4) : LTM mandatory per section
        F.3 Visual rules (REPEAT × 2) : Door Scan + MagNet
        F.4 Acknowledge w/o execute (REPEAT × 2) : EEP + PCG + Debt Counter
        F.5 Rules defined never activated (REPEAT × 2) : Mandatory wrap-up
        F.6 Self-judgment override (REPEAT × 2) : Skeleton + Pulse Check
    section April 2026
        F.7 Acknowledge w/o execute (REPEAT × 2) : Same as F.4 pattern recurred
        F.8 Self-judgment override (REPEAT × 2) : Same as F.6 pattern recurred
        F.9 Compliance decay across outputs : Ensurance System EN.1–EN.4
    section May 2026 (Session 5 — most active)
        F.10 Truncation regression (HFR) : Rule #11 full names every use
        F.11 No details in SubSOP reports (HFR) : Rule #12 details mandatory
        F.12 Pre-Flight Gate + Pulse Check redundancy : Consolidated to Pulse Check 2.0
        F.13 Macro+Micro goal absent : MACRO+MICRO mandatory in step header
        F.14 Rule #11 cluster violations : compliance_check.sh script
        F.15 Multi-device naming absent : DEVICE_REGISTRY + setup_device.sh
        F.16 Script enforcement bypassable : Karen + pre-commit hook
        F.17 Bootstrap lacks transparency : bootstrap_verify.sh (70 checks)
        F.18 Live push/pull not optimized : safe_push.sh + pre-push hook
    section May 21 evening (this commit's predecessor)
        F.19 META — output-level convention decays everywhere : Tier 1 SHIPPED — scope reduction
```

**Pattern visible in the timeline:** the most recent failures (F.14 onward) all got **mechanical** fixes (scripts, hooks, verifiers). The earlier failures (F.1–F.9) got **conventional** fixes (more rules), most of which re-failed and required a second pass. F.19 is the meta-insight: this IS the pattern, and the fix is to convert discipline to architecture.

---

## 📂 Diagram 6 — File Structure (repo at a glance)

```mermaid
flowchart TD
    classDef gov fill:#3B82F6,color:white,stroke:#1E40AF
    classDef rule fill:#10B981,color:white,stroke:#065F46
    classDef new fill:#F59E0B,color:white,stroke:#92400E,stroke-width:3px
    classDef cache fill:#6B7280,color:white,stroke:#1F2937
    classDef enf fill:#EF4444,color:white,stroke:#991B1B
    classDef arch fill:#D1D5DB,color:#374151,stroke:#9CA3AF

    Root["📦 universal-sop/"]
    Root --> Gov["governance docs (root)"]
    Root --> Cache["cache/"]
    Root --> Scripts["scripts/"]
    Root --> Hooks[".githooks/"]
    Root --> Agents["agents/"]
    Root --> Backups["backups/"]
    Root --> ChatA["chat_archive/"]
    Root --> Source["source_files/"]

    Gov --> g1["README.md<br/>SESSION_START.md<br/>CLAUDE.md"]
    Gov --> g2["UNIVERSAL_SOP_PROMPT.md<br/>STANDALONE_SOP.md<br/>PROTOCOLS_REFERENCE.md"]
    Gov --> g3["DEVICE_REGISTRY.md<br/>MULTI_DEVICE_GIT_PROTOCOL.md<br/>MASTER_CONTINUATION_PROMPT.md"]
    Gov --> g4["FAILURE_MODES_ANALYSIS.md<br/>TOKEN_OPTIMIZATION_GUIDE.md<br/>EFFICIENCY_GUIDE.md"]
    Gov --> g5["⭐ MANDATORY_TIGHT_LOOP.md<br/>⭐ SELF_COMPLIANCE_FIX.md<br/>⭐ SOP_MAP.md (THIS FILE)"]

    Cache --> c1["SESSION_STATE.md<br/>CONTINUATION.md<br/>BACKUP_LOG.md<br/>FAILURE_LEDGER.md<br/>BOOTSTRAP_CHECK.md"]
    Cache --> c2["legacy/<br/>(APW-era archived)"]
    Cache --> c3["backups/<br/>(historical snapshots)"]

    Scripts --> s1["bootstrap_verify.sh<br/>compliance_check.sh<br/>append_only_check.sh<br/>consistency_check.sh<br/>check_device_activity.sh<br/>setup_device.sh<br/>safe_push.sh"]

    Hooks --> h1["pre-commit<br/>pre-push"]

    Agents --> a1["controller.md<br/>validator-merged.md<br/>karen-reality-check.md<br/>paradox-resolver.md"]
    Agents --> a2["archive/<br/>jenny + oversight + cache-manager"]

    class g1,g3 gov
    class g2 rule
    class g5 new
    class c1 cache
    class c2,c3,a2 arch
    class s1,h1 enf
    class a1 gov
```

---

## 🎯 Quick Reference — What To Read When

| 🎯 Situation | 📄 Read |
|---|---|
| Fresh session, any device | `SESSION_START.md` → then `MANDATORY_TIGHT_LOOP.md` |
| New device first-time | `SESSION_START.md` + `DEVICE_REGISTRY.md` + run `scripts/setup_device.sh <name>` |
| Producing an output | `MANDATORY_TIGHT_LOOP.md` (3-line STEP + 6 SubSOPs + 5 Pulse Check) |
| Producing a publishable deliverable | `MANDATORY_TIGHT_LOOP.md` + full `UNIVERSAL_SOP_PROMPT.md` for the extras |
| Looking up a protocol by name | `PROTOCOLS_REFERENCE.md` |
| Investigating why something failed | `cache/FAILURE_LEDGER.md` (F.1 – F.19) |
| Understanding the F.19 insight | `SELF_COMPLIANCE_FIX.md` |
| Multi-device sync question | `MULTI_DEVICE_GIT_PROTOCOL.md` |
| Restoring a prior file state | `cache/BACKUP_LOG.md` → find the backup row → grab from `backups/` |
| External (non-Alan, non-Claude.ai) consumer | `STANDALONE_SOP.md` (MIT licensed, self-contained) |

---

## 🏷️ Glossary (read once, refer back)

| Term | Meaning |
|---|---|
| **SubSOP** | Sub-Standard-Operating-Procedure. 16 protocols SP.1 – SP.16 forming the rulebook's mechanics. |
| **Ensurance** | 4 anti-decay components EN.1 – EN.4 that prevent SubSOP compliance from eroding over a long session. |
| **Tight Loop** | The 6+1 protocols that MANDATORY_TIGHT_LOOP.md selects as mandatory for every operational OUTPUT (F.19 Tier 1 fix). |
| **Tier (in F.19 context)** | One of three architectural moves to fix the discipline-vs-architecture gap. Tier 1 shipped 2026-05-21; Tier 2 + Tier 3 staged. |
| **Tier (in SOP context)** | QUICK / STANDARD / COMPLEX — the rigor level of an output. Different from F.19 tiers. |
| **Pulse Check** | Pre-send mechanical sweep at the end of an output. Original: 17 items. Reduced (Tier 1): 5 items (P1–P5). |
| **HFR** | Honest Failure Report. When something failed, produce root cause + permanent fix in the same output. |
| **F.X** | Failure-Ledger entry X. Cumulative immutable log of every system failure + permanent fix. |
| **Mechanical enforcement** | Rule enforced by a script or hook, not by Claude self-discipline. (The ones that actually hold per F.19.) |
| **F4/F5/F8/etc. (fusion)** | Operations that merged multiple SOP components into one to reduce surface area. F4 merged Oversight + Cache Manager → Controller. F5 archived Jenny. F8 merged RPT_LOG + HFR → FAILURE_LEDGER. |

---

*Universal Output SOP v1.3 | SOP_MAP.md v1.0 | Visual reference for entire system | aurelia | 2026-05-21*
