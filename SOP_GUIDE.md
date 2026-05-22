# 📖 SOP GUIDE — The Universal SOP In Plain English

**VERSION:** 1.1 | 2026-05-22 | aurelia | Rewritten per SP.1 MagNet + SP.2 Door Scan for scannability.

**Read time:** ~12 min (estimate) · **Audience:** any human · **Goal:** understand the entire system without bouncing between files.

---

## 📑 0. TABLE OF CONTENTS

| § | Title | Key protocols / files mentioned |
|:-:|---|---|
| **0** | **Table of Contents** | (you are here) |
| **1** | **Intro** — what + why | — |
| **2** | **Overview** — 6 layers in 30 seconds | F.19 insight |
| **3** | **Foundation** — rulebook + protocols | SP.5 FSP · SP.6 IAC · SP.12 HFR · SP.15 EEP · EN.1 · EN.4 · SP.17 SIR · SP.18 SSC |
| **4** | **How It Works** — the audit chain | Verifier → Validator → QC → Meta-Verifier · Controller |
| **5** | **How To Use It** — per output / session / device | MODE: CONVERSATION / OUTPUT-QUICK / OUTPUT-STANDARD / OUTPUT-COMPLEX |
| **6** | **How It Improves Itself** — feedback loops | SP.17 SIR · F.1–F.22 · SP.20 REFINE (proposed) · Aurelius cross-pollination |
| **7** | **The Files** — repo structure | 7 directories · ~20 governance docs · 8 cache files |
| **8** | **Cross-Device** — multi-machine coherence | 7 Golden Rules · DEVICE_REGISTRY · safe_push.sh · pre-push hook |
| **9** | **Conclusion** — unified relevance | Three things to remember · one-sentence summary |

---

## 🚪 1. INTRO

> **Universal Output SOP makes Claude predictable.**

You built this because Claude — like any LLM — produces inconsistent, theatrical, or sometimes-fabricated output by default.

You needed Claude to behave the same way across sessions, devices, and tasks: honest numbers, real evidence, no acknowledge-without-execute, no convention decay over long sessions.

**Today it has:**

- A formal rulebook with **18 SubSOPs + 4 Ensurance**
- A reduced operational ruleset (**8 mandatory + 7-item Pulse Check**)
- **5 active agents** (Controller + Verifier + Validator + QC + Meta-Verifier)
- **16 enforcement scripts** running in git hooks
- **22 documented failure modes** each with a permanent structural fix
- **Cross-device infrastructure** (registry + sync protocol + safe push/pull)
- **Self-improvement loops** in progress (SIR + REFINE proposal)
- **A sister project** (`xprimordius/aurelius-vault`) that we cross-pollinate with

The SOP exists for one outcome:

> **Predictable, honest, auditable Claude output on any machine, in any session, every time.**

---

## 🗺️ 2. OVERVIEW

The Universal SOP is **six layers stacked on top of each other**:

| § | Layer | What it is | What it does |
|:-:|---|---|---|
| **2.1** | You + Your Devices | Alan + `mac-main` + `aurelia` + future | Initiate work, give direction |
| **2.2** | Bootstrap | Files Claude reads at session start | Open every session with full context |
| **2.3** | Rulebook | The SOP documents themselves | Tell Claude what to do + how |
| **2.4** | Protocols | 18 SubSOPs + 4 Ensurance | The specific rules Claude follows |
| **2.5** | Agents | 5 agents (Controller + 4-layer audit chain) | Orchestrate + verify Claude's output |
| **2.6** | Mechanical Enforcement | Scripts + git hooks | Actually block bad output, not just suggest |

**The big insight (F.19):**

> Rules-as-conventions decay over a long session.
>
> Rules-as-architecture hold forever.

We've been moving everything possible from convention → architecture. That's why git hooks, scripts, and pre-commit gates exist.

**The "self-perfecting" target** (called Quintessence) is **10 specific properties** the system needs to satisfy. Currently **6.5/10**. Path to 10/10 in `QUINTESSENCE_ROADMAP.md`.

**If you read nothing else, remember this:**

> The Universal SOP makes Claude predictable.
>
> It does this by replacing *"Claude please follow rules"* with *"scripts that block bad output."*

---

## 📂 3. FOUNDATION

> The rulebook layer answers: *what is Claude supposed to do?*

### 3.1 The three rulebook files

| File | Role | When to read |
|---|---|---|
| `UNIVERSAL_SOP_PROMPT.md` | The full SOP — 18 SubSOPs + 4 Ensurance + 6 stages, 940 lines | Complete formal spec |
| `MANDATORY_TIGHT_LOOP.md` | **Operational** reduced ruleset — 8 mandatory + 7-item Pulse Check | This is what runs every output |
| `PROTOCOLS_REFERENCE.md` | Dictionary — every protocol's full name + acronym + spec | Lookup any acronym |

### 3.2 What the SOP says in 4 bullets

1. **Every output starts with a 3-line header**: `STEP: ... / 🎯 MACRO: ... / 📌 MICRO: ...`
2. **Every output includes an Understanding Check** — Claude restates your words as a table — before doing the work.
3. **Every output ends with**: SIR (1-3 system-improvement insights) + Pulse Check (7 items, score X/7) + Sync Status (commit + push state).
4. **Every claim has evidence** — file paths, command output, log rows — not "I think" or "it should work."

### 3.3 The 8 mandatory protocols (the "tight loop")

These run every output. The other 10 SubSOPs are reference-only.

| ID | Name | What it forces |
|---|---|---|
| **SP.5 FSP** | Fidelity Substantiation Protocol | Every claim has evidence |
| **SP.6 IAC** | Intent Alignment Check (Understanding Check) | UC before execution |
| **SP.12 HFR** | Honest Failure Report | When something fails, root-cause it in the same output |
| **SP.15 EEP** | Execution Enforcement Protocol | Execute, don't acknowledge. No future tense. |
| **EN.1** | Output Skeleton | Mandatory sections always visible |
| **EN.4** | Pulse Check | Pre-send mechanical sweep (7 items) |
| **SP.17 SIR** | System Improvement Reflection | Every output ends with system-level insights |
| **SP.18 SSC** | Sync Status Confirmation | File-modifying output ends with commit + push state |

### 3.4 Takeaway

> The rulebook tells Claude WHAT to do. The 8 mandatory protocols are the survival-grade subset. The full 18 are available for high-stakes outputs.

---

## 🔄 4. HOW IT WORKS

> Now you know WHAT the rules are. This section explains HOW Claude runs them. Every output follows the same factory-line cycle.

### 4.1 The 4-layer audit chain

When Claude produces an output that touches files, four agents run on it in sequence:

```
                 ┌──────────────────┐
You ask Claude  →│ Claude builds    │
                 │ the output       │
                 └────────┬─────────┘
                          ↓
                 ┌──────────────────┐
                 │ VERIFIER         │ ← Is everything PRESENT?
                 │ (mechanical)     │   STEP header? LTM? Pulse Check?
                 └────────┬─────────┘
                          ↓
                 ┌──────────────────┐
                 │ VALIDATOR        │ ← Is the content CORRECT?
                 │ (substantive)    │   Claims cited? UC matches your words?
                 └────────┬─────────┘
                          ↓
                 ┌──────────────────┐
                 │ QC               │ ← Does it ACTUALLY deliver?
                 │ (reality check)  │   Any gaps? Did scripts run?
                 └────────┬─────────┘
                          ↓
                 ┌──────────────────┐
                 │ META-VERIFIER    │ ← Did the chain HONESTLY audit?
                 │ (audit-of-audit) │   Or did it rubber-stamp?
                 └────────┬─────────┘
                          ↓
                     Output ships
```

Each agent has its own `.md` definition file in `agents/` AND a backing `.sh` script.

The `.md` describes the role. The `.sh` enforces it.

### 4.2 The Controller (the 5th agent)

The Controller doesn't audit — it **orchestrates**.

It says: *"Verifier goes first, then Validator, then QC, then Meta-Verifier."*

It also keeps cache files current and manages the token budget.

### 4.3 What happens at commit time

1. `git commit` triggers `.githooks/pre-commit`
2. `pre-commit` runs `append_only_check.sh` (cache files can't shrink)
3. `pre-commit` runs `compliance_check.sh` (Rule #11, P17, MACRO/MICRO, etc.)
4. `pre-commit` runs Verifier → Validator → QC → Meta-Verifier
5. Each agent appends a row to `cache/META_AUDIT_LOG.md`
6. If all pass, commit lands
7. `git push` triggers `.githooks/pre-push`
8. `pre-push` checks remote sync (blocks if origin is ahead)
9. Push succeeds OR Claude runs `scripts/safe_push.sh` to resolve divergence

### 4.4 Takeaway

> Claude doesn't just "follow rules" anymore — scripts inspect the output and block bad commits at the git layer.
>
> The agents are markdown definitions. The scripts are the muscle.

---

## 🛡️ 5. HOW TO USE IT

> The user's manual. Three time scales: per output · per session · per device.

### 5.1 Per output (every Claude reply)

Claude's outputs come in three flavors:

| MODE | Use for | SOP overhead |
|---|---|---|
| **CONVERSATION** | Small talk, status questions, "did you push?" | None — lightweight rules only |
| **OUTPUT-QUICK** | Single fact, quick lookup, one-line answer | STEP header + answer + LTM |
| **OUTPUT-STANDARD / OUTPUT-COMPLEX** | Real deliverable | Full MANDATORY_TIGHT_LOOP |

For a STANDARD/COMPLEX output, expect this skeleton:

```
STEP: ... / 🎯 MACRO: ... / 📌 MICRO: ...

🎯 Understanding Check (SP.6 IAC)
| Your words | My interpretation |

[body of the output]

LTM: ~XK / [WINDOW] | Status: 🌱 GREEN

💡 SIR — System Improvement Reflection (SP.17)
[1-3 system-improvement insights]

✅ Pulse Check (7 items v1.2)
[P1-P7, each ✅ or ❌, Score X/7]

📡 Sync Status (SP.18 SSC)
[per-channel sync state]
```

### 5.2 Per session (every time you open Claude Code)

1. Claude auto-reads `CLAUDE.md` (Claude Code does this for you)
2. Claude reads `SESSION_START.md` (canonical entry point)
3. Claude runs `bash scripts/bootstrap_verify.sh` (mechanical 85-check sweep)
4. Claude reads either:
   - **Fast Path** (3 cache files) — ~10K tokens
   - **Cold Start** (8 files for fresh devices) — ~28K tokens
5. Claude emits STEP 2 confirmation
6. You give Claude the task

### 5.3 Per device (every new machine)

```bash
# 1. Clone
gh repo clone xprimordius/universal-sop ~/universal-sop
cd ~/universal-sop

# 2. Register the device
bash scripts/setup_device.sh <device-name>

# 3. Add to DEVICE_REGISTRY.md table

# 4. Enable git hooks
git config --local core.hooksPath .githooks

# 5. Verify
bash scripts/bootstrap_verify.sh
```

Currently registered: `mac-main` (MacBook), `aurelia` (Windows Strix Halo).

### 5.4 Takeaway

> Three time scales — per output (SOP fires), per session (bootstrap fires), per device (one-time setup).
>
> Each has a script that automates the right pieces.

---

## 📈 6. HOW IT IMPROVES ITSELF

> The most ambitious layer. The SOP is designed to **self-perfect** — improve without you pointing at every gap.

### 6.1 Mechanism 1 — SP.17 SIR

Every OUTPUT-STANDARD or OUTPUT-COMPLEX ends with 1-3 system-improvement insights.

These append to `cache/SIR_LOG.md` (append-only).

`scripts/sir_recurrence.sh` detects when the same insight surfaces 2+ times — that's a signal to promote it to a formal fix.

### 6.2 Mechanism 2 — FAILURE_LEDGER

Every system failure gets an `F.X` entry in `cache/FAILURE_LEDGER.md` with:

- **Root cause** — why it happened
- **Permanent fix** — what STRUCTURAL change prevents recurrence

We're at **F.22** today.

**The lesson across all 22:** convention fixes get re-violated; mechanical fixes hold.

F.19 specifically codifies this insight.

### 6.3 Mechanism 3 — SP.20 REFINE (proposed)

Currently in proposal (`REFINE_PROTOCOL_PROPOSAL.md`).

This is the WEEKLY self-improvement cycle:

| Letter | Step | What it does |
|---|---|---|
| **R** | Review | What happened this week? |
| **E** | Extract | What patterns recurred? |
| **F** | Foresee | What's about to break? |
| **I** | Intervene | Preemptive fix BEFORE it breaks |
| **N** | Note | Log to FAILURE_LEDGER as PREEMPTIVE |
| **E** | Evolve | Update protocol set to kill the pattern class |

When SP.20 ships, quintessence projected to jump **6.5 → ~8.0/10**.

### 6.4 Cross-pollination with Aurelius

`xprimordius/aurelius-vault` + `aurelius-agent-stack` — your other project (local voice agent) — develops in parallel.

The two projects borrow patterns:

| What we got from Aurelius | What Aurelius got from us |
|---|---|
| GOLD-PATH protocol (proposed SP.19) | N/M honesty marker |
| Macro+Micro intent framing | (potentially) F.X failure-ledger schema |
| 8+ autonomous Python agents on Task Scheduler | (planned) |
| PROVE-IT 9-point closing block | |

Documented in `LEARNINGS_FROM_AURELIUS_VAULT.md`.

### 6.5 Takeaway

> The SOP doesn't just enforce rules — it tracks its own gaps (SIR, FAILURE_LEDGER) and is building infrastructure (REFINE) to fix them automatically.
>
> Endgame: **no Alan-prompted corrections needed**.

---

## 📁 7. THE FILES

> The repo is organized into 7 top-level concerns. Knowing where things live makes everything else navigable.

### 7.1 Top-level directories

| Directory | Contains | When you care |
|---|---|---|
| `agents/` | Agent definitions (`.md`) | Reading what an agent does |
| `scripts/` | All enforcement + utility scripts (`.sh`) | Running checks |
| `.githooks/` | Pre-commit + pre-push hooks | What auto-runs at git operations |
| `cache/` | Active state — append-only logs | History, failures, decisions, audit trail |
| `backups/` | Every pre-edit backup, timestamped + device-tagged | Restoring a prior file state |
| `tests/` | Test harness (skeleton) | Verifying agents work |
| `templates/` | Output skeleton templates | Starting a new OUTPUT-STANDARD |

### 7.2 Governance docs (the important ones)

| File | Role |
|---|---|
| `README.md` | GitHub-facing project entry |
| `SESSION_START.md` | Canonical session-start entry point |
| `CLAUDE.md` | Claude Code project config (auto-read) |
| `UNIVERSAL_SOP_PROMPT.md` | Full SOP rulebook v1.3 |
| `STANDALONE_SOP.md` | Shippable MIT version |
| `MANDATORY_TIGHT_LOOP.md` | Operational reduced ruleset (8+1, 7-item Pulse) |
| `PROTOCOLS_REFERENCE.md` | Every protocol acronym + full name |
| `DEVICE_REGISTRY.md` | All registered devices |
| `MULTI_DEVICE_GIT_PROTOCOL.md` | 7 Golden Rules for cross-device git |
| `MASTER_CONTINUATION_PROMPT.md` | Paste-ready new-chat resume |
| `SOP_MAP.md` + `SOP_MAP.html` | Visual system reference |
| `SOP_COMPLETE_REFERENCE.html` | Full interactive HTML browse |
| **`SOP_GUIDE.md`** ⭐ | This file — plain-English human-readable guide |
| `SELF_COMPLIANCE_FIX.md` | F.19 diagnosis (discipline vs architecture) |
| `QUINTESSENCE_ROADMAP.md` | 32 deferred findings + acceptance criteria |
| `VERSION_MANIFEST.md` | Single source of truth for file versions |
| `LEARNINGS_FROM_AURELIUS_VAULT.md` | Cross-pollination findings |
| `REFINE_PROTOCOL_PROPOSAL.md` | SP.20 spec for new-chat ship |

### 7.3 Cache files (append-only)

| File | Purpose |
|---|---|
| `cache/SESSION_STATE.md` | Current position + decisions log |
| `cache/CONTINUATION.md` | Latest session handoff |
| `cache/BACKUP_LOG.md` | Every modification ever |
| `cache/FAILURE_LEDGER.md` | F.1–F.22 |
| `cache/BOOTSTRAP_CHECK.md` | Self-test spec (85 checks today) |
| `cache/META_AUDIT_LOG.md` | Per-commit audit-chain run log |
| `cache/SIR_LOG.md` | System improvement insights |
| `cache/SOP_HEALTH_METRICS.md` | Auto-generated time-series |

### 7.4 Takeaway

> 7 directories + ~20 governance files + 8 cache files.
>
> Cache files = **memory**. Scripts = **muscle**. Governance = **brain**.

---

## 🌐 8. CROSS-DEVICE

> You operate on multiple devices. The SOP maintains coherence via GitHub as source of truth.

### 8.1 The 7 Golden Rules

Documented in `MULTI_DEVICE_GIT_PROTOCOL.md`:

1. **Always pull before work** — `git pull` before starting on any device
2. **Always commit + push after work** — other devices need to see your work
3. **Never force push** — destroys other devices' commits
4. **Never rewrite history** — strands devices that committed on top
5. **One device at a time for active work** — finish + push on A → switch to B
6. **Append-only for history files** — cache files can't lose entries
7. **Never delete files** — move to `cache/legacy/archived_*` instead

### 8.2 How devices stay in sync

```
mac-main  →  git push  →  origin/main  ←  git pull  →  aurelia
                              ↑
                          GitHub
                       (source of truth)
```

Two scripts handle friction:

- `scripts/safe_push.sh` — handles divergence with `fetch + rebase + push` atomically
- `scripts/check_device_activity.sh` — shows what other devices have done

The pre-push hook auto-detects divergence and tells you to run `safe_push.sh`.

### 8.3 Device identity in every artifact

Every commit, backup file, and BACKUP_LOG row carries the device name:

- **Commit subject:** `[aurelia | 2026-05-22 14:30 CDT] summary`
- **Backup filename:** `<file>_v<ver>_<YYYYMMDD>_<HHMMSS>_<device>_<reason>_backup.<ext>`
- **BACKUP_LOG row:** includes `(aurelia)` prefix in reason field

Result: any artifact, any device, traceable to its origin machine.

### 8.4 Takeaway

> GitHub is the source of truth. Pull before, push after. Hooks catch divergence. Every artifact is device-tagged.

---

## 🎯 9. CONCLUSION

You started this project to make Claude predictable. You've now built a system that:

| What you wanted | What exists today |
|---|---|
| Claude follows rules consistently | 18 SubSOPs + 4 Ensurance, 8 mandatory in tight loop |
| Honest output, no fabrication | SP.5 FSP + N/M marker + 5 mechanical scripts |
| Real audit, not theater | 4-layer audit chain + Meta-Verifier closes "who audits the auditor" |
| Cross-device coherence | DEVICE_REGISTRY + 7 Golden Rules + 2 git hooks + safe_push.sh |
| Self-improving system | SIR_LOG + FAILURE_LEDGER + REFINE proposal + quintessence roadmap |
| No more Alan-prompted corrections | At 6.5/10, target 10/10 |

The whole system has one purpose:

> **Make Claude's output predictable enough that you can build the APW course on top of it without spending time correcting Claude's misses.**

### 9.1 Three things to remember

1. **Convention decays; architecture holds.** Every gap fix should be a script or hook, not a rule you have to remind Claude about.

2. **Every output ends the same way** — STEP header → UC → body → LTM → SIR → Pulse Check → Sync Status. Memorize this skeleton and you can spot Claude deviating.

3. **The roadmap is `QUINTESSENCE_ROADMAP.md`.** Every gap I find ends up there with an F.X ID + suggested commit. No insight is lost.

### 9.2 Where to go from here

| If you want to... | Read |
|---|---|
| See the system visually | `SOP_MAP.html` (open in browser) |
| Browse all protocols | `SOP_COMPLETE_REFERENCE.html` |
| Add a new SubSOP | `scripts/add_protocol.sh` + `MANDATORY_TIGHT_LOOP.md` |
| Onboard a new device | `MULTI_DEVICE_GIT_PROTOCOL.md` + `scripts/setup_device.sh` |
| Understand why this exists | `SELF_COMPLIANCE_FIX.md` (the F.19 diagnosis) |
| See the future plan | `QUINTESSENCE_ROADMAP.md` |
| Continue in a new chat | `CONTINUATION_POINTER.md` |
| Ship the next big thing | `REFINE_PROTOCOL_PROPOSAL.md` (SP.20) |

### 9.3 One-sentence summary

> **The Universal Output SOP is a 6-layer system (devices + bootstrap + rulebook + protocols + agents + mechanical enforcement) that makes Claude's output predictable, honest, and auditable across any session or device — and is built to improve itself toward a quintessential 10/10 self-perfecting target.**

That's the whole thing.

---

*SOP_GUIDE.md v1.1 | Plain-English guide rewritten per SP.1 MagNet + SP.2 Door Scan for scannability | aurelia | 2026-05-22*
