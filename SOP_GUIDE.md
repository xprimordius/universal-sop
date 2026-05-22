# 📖 SOP GUIDE — The Universal SOP In Plain English
# VERSION: 1.0 | 2026-05-22 | aurelia | The human-readable single-document version
# Read this end-to-end before touching any other file. ~12 minute read.

---

## 🎯 INTRO — What This Thing Is And Why

You (Alan) built the **Universal Output SOP** because Claude — and any LLM — produces inconsistent, theatrical, or sometimes-fabricated output by default. You needed Claude to behave the same way across sessions, devices, and tasks: honest numbers, real evidence, no acknowledge-without-execute, no convention decay over long sessions.

The Universal SOP is the **rulebook + enforcement infrastructure** that does this. Today it's:
- A formal rulebook (`UNIVERSAL_SOP_PROMPT.md`) with **18 SubSOPs + 4 Ensurance components**
- A reduced operational ruleset (`MANDATORY_TIGHT_LOOP.md`) with **8 mandatory + 7-item Pulse Check**
- **5 active agents** (Controller, Verifier, Validator, QC, Meta-Verifier)
- **16 enforcement scripts** that run in git hooks
- **22 documented failure modes** (F.1–F.22) each with a permanent structural fix
- **Cross-device infrastructure** (DEVICE_REGISTRY, MULTI_DEVICE_GIT_PROTOCOL, safe push/pull)
- **Self-improvement loops** in progress (SIR_LOG, META_AUDIT_LOG, REFINE protocol proposal)
- **A sister project** (`xprimordius/aurelius-vault`) that we cross-pollinate with

The SOP exists for one outcome: **predictable, honest, auditable Claude output on any machine, in any session, every time**. Everything below serves that.

---

## 🗺️ OVERVIEW — The Whole System In One Picture

Think of the Universal SOP as **six layers stacked on top of each other**:

| Layer | What it is | What it does |
|---|---|---|
| 1. **You + Your Devices** | Alan + `mac-main` + `aurelia` + future | Initiate work, give direction |
| 2. **Bootstrap** | Files Claude reads at session start | Make sure every session opens with full project context |
| 3. **Rulebook** | The SOP documents themselves | Tell Claude what to do and how |
| 4. **Protocols** | 18 SubSOPs + 4 Ensurance | The specific rules Claude follows |
| 5. **Agents** | 5 agents (Controller + 4-layer audit chain) | Orchestrate + verify Claude's output |
| 6. **Mechanical Enforcement** | Scripts + git hooks | Actually block bad output, not just suggest it |

The big insight (called F.19 in our system): **rules-as-conventions decay over a long session; rules-as-architecture hold forever**. We've been moving everything possible from convention → architecture, which is why git hooks, scripts, and pre-commit gates exist.

The "self-perfecting" target (called Quintessence in our docs) is **10 specific properties** the system needs to satisfy. We're currently at 6.5/10. The path to 10/10 is documented in `QUINTESSENCE_ROADMAP.md`.

**If you read nothing else, remember this:**
> The Universal SOP makes Claude predictable. It does this by replacing "Claude please follow rules" with "scripts that block bad output." Every gap we find adds another script or check. The goal is no Alan-prompted corrections needed.

---

## 📂 SECTION 1 — THE FOUNDATION (Vision + Rulebook)

### Overview

The foundation answers: *what is Claude supposed to do?* It's the rulebook layer. There are three documents at this level, in order of authority.

### The three rulebook files

| File | Role | When to read |
|---|---|---|
| **`UNIVERSAL_SOP_PROMPT.md`** | The full SOP — 18 SubSOPs + 4 Ensurance + 6 stages. 940 lines. | When you want the complete formal spec. |
| **`MANDATORY_TIGHT_LOOP.md`** | The **operational** reduced ruleset. 8 mandatory protocols + 7-item Pulse Check. | This is what gets followed every output. |
| **`PROTOCOLS_REFERENCE.md`** | Dictionary — every protocol's full name + acronym + spec. | Look up any acronym you see. |

### What the SOP says in 4 bullets

1. **Every output starts with a 3-line header**: `STEP: ... / 🎯 MACRO: ... / 📌 MICRO: ...`
2. **Every output includes an Understanding Check** (Claude restates your words as a table) before doing the work.
3. **Every output ends with**: SIR (1-3 insights for system improvement) + Pulse Check (7 items, score X/7) + Sync Status (commit + push state).
4. **Every claim has evidence**: file paths, command output, log rows — not "I think" or "it should work."

### The 8 mandatory protocols (the "tight loop")

These run every output. The other 10 SubSOPs are reference-only.

| ID | Name | What it forces |
|---|---|---|
| SP.5 FSP | Fidelity Substantiation | Every claim has evidence |
| SP.6 IAC | Intent Alignment Check | Understanding Check before execution |
| SP.12 HFR | Honest Failure Report | When something fails, root-cause it in the same output |
| SP.15 EEP | Execution Enforcement | Execute, don't acknowledge. No future tense. |
| EN.1 | Output Skeleton | Mandatory sections always visible |
| EN.4 | Pulse Check | Pre-send mechanical sweep |
| SP.17 SIR | System Improvement Reflection | Every output ends with system-level insights |
| SP.18 SSC | Sync Status Confirmation | Every file-modifying output ends with commit/push/sync confirmation |

### Section 1 takeaway

> The rulebook tells Claude WHAT to do. The 8 mandatory protocols are the survival-grade subset. The full 18 are available for high-stakes outputs.

---

## 🔄 SECTION 2 — HOW IT WORKS (The Per-Output Cycle)

### Overview

Now you know WHAT the rules are. This section explains HOW Claude actually runs them. Every Claude output follows the same cycle — like a factory line.

### The 4-layer audit chain

When Claude produces an output that touches files, four agents run on it in sequence:

```
                  ┌─────────────────┐
You ask Claude →  │ Claude builds   │
                  │ the output      │
                  └────────┬────────┘
                           ↓
                  ┌─────────────────┐
                  │ VERIFIER        │ ← Is everything PRESENT?
                  │ (mechanical)    │   STEP header? LTM? Pulse Check?
                  └────────┬────────┘
                           ↓
                  ┌─────────────────┐
                  │ VALIDATOR       │ ← Is the content CORRECT?
                  │ (substantive)   │   Claims cited? UC matches your words?
                  └────────┬────────┘
                           ↓
                  ┌─────────────────┐
                  │ QC              │ ← Does it ACTUALLY deliver?
                  │ (reality check) │   Any gaps? Did scripts run?
                  └────────┬────────┘
                           ↓
                  ┌─────────────────┐
                  │ META-VERIFIER   │ ← Did the chain HONESTLY audit?
                  │ (audit-of-audit)│   Or did it rubber-stamp?
                  └────────┬────────┘
                           ↓
                       Output ships
```

Each agent has its own `.md` definition file in `agents/` AND a backing `.sh` script. The `.md` describes the role; the `.sh` enforces it.

### The Controller (the 5th agent)

The Controller doesn't audit — it **orchestrates**. It's the agent that says "Verifier goes first, then Validator, then QC, then Meta-Verifier." It also keeps the cache files current and manages the token budget.

### What happens at commit time

```
1. git commit triggers .githooks/pre-commit
2. pre-commit runs append_only_check.sh (cache files can't shrink)
3. pre-commit runs compliance_check.sh (Rule #11, P17, MACRO/MICRO, etc.)
4. pre-commit runs Verifier → Validator → QC → Meta-Verifier
5. Each agent appends a row to cache/META_AUDIT_LOG.md
6. If all pass, commit lands
7. git push triggers .githooks/pre-push
8. pre-push checks remote sync (blocks if origin is ahead)
9. Push succeeds OR Claude runs scripts/safe_push.sh to resolve divergence
```

### Section 2 takeaway

> Claude doesn't just "follow rules" anymore — scripts inspect the output and block bad commits at the git layer. The agents are markdown definitions; the scripts are the muscle.

---

## 🛡️ SECTION 3 — HOW TO USE IT (Per Output, Session, Device)

### Overview

This section is the user's manual. There are three time scales: per output, per session, per device.

### Per output (every Claude reply)

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

### Per session (every time you open Claude Code)

1. Claude auto-reads `CLAUDE.md` (Claude Code does this for you)
2. Claude reads `SESSION_START.md` (the canonical entry point)
3. Claude runs `bash scripts/bootstrap_verify.sh` (mechanical 85-check sweep)
4. Claude reads either:
   - **Fast Path** (3 cache files: `SESSION_STATE.md` + `CONTINUATION.md` + `BOOTSTRAP_CHECK.md`) — ~10K tokens
   - **Cold Start** (8 files for fresh devices or after major changes) — ~28K tokens
5. Claude emits a STEP 2 confirmation: `✅ RESUMED + Macro/Micro + cache loaded`
6. You give Claude the task

### Per device (every new machine)

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

### Section 3 takeaway

> Three time scales: per output (SOP fires), per session (bootstrap fires), per device (one-time setup). Each has a script that automates the right pieces.

---

## 📈 SECTION 4 — HOW IT IMPROVES ITSELF

### Overview

This is the most ambitious layer. The Universal SOP is designed to **self-perfect** — improve without you needing to point at every gap. Three mechanisms power this.

### Mechanism 1 — SIR (System Improvement Reflection)

Every OUTPUT-STANDARD or OUTPUT-COMPLEX ends with 1-3 insights about how the SOP itself could improve. These get appended to `cache/SIR_LOG.md` (append-only). The `scripts/sir_recurrence.sh` script detects when the same insight surfaces 2+ times — that's a signal to promote it to a formal fix.

### Mechanism 2 — FAILURE_LEDGER

Every system failure (`F.X` entry) is logged in `cache/FAILURE_LEDGER.md` with:
- **Root cause** — why it happened
- **Permanent fix** — what STRUCTURAL change prevents recurrence

We're at F.22 (22 documented failure modes, each with a structural fix). The lesson across all 22: **convention fixes get re-violated; mechanical fixes hold**. F.19 specifically codifies this insight.

### Mechanism 3 — REFINE Protocol (proposed, SP.20)

Currently in proposal stage (`REFINE_PROTOCOL_PROPOSAL.md`). This is the WEEKLY self-improvement cycle:

```
R · Review     — what happened this week?
E · Extract    — what patterns recurred?
F · Foresee    — what's about to break?
I · Intervene  — preemptive fix BEFORE it breaks
N · Note       — log to FAILURE_LEDGER as PREEMPTIVE
E · Evolve     — update the protocol set to kill the pattern class
```

When SP.20 ships, the quintessence score is projected to jump from 6.5/10 → ~8.0/10.

### What's in the roadmap

`QUINTESSENCE_ROADMAP.md` lists 32 deferred findings + 10 acceptance criteria for "the SOP is done." The system is built to converge on those.

### Cross-pollination with Aurelius

You have another project (`xprimordius/aurelius-vault` + `aurelius-agent-stack`) — a local voice agent — that's been developing in parallel. The two projects borrow patterns:

| What we got from Aurelius | What Aurelius got from us |
|---|---|
| GOLD-PATH protocol (proposed SP.19) | N/M honesty marker |
| Macro+Micro intent framing | (potentially) F.X failure-ledger schema |
| 8+ autonomous Python agents on Task Scheduler | (planned) |
| PROVE-IT 9-point closing block | |

`LEARNINGS_FROM_AURELIUS_VAULT.md` documents the cross-pollination.

### Section 4 takeaway

> The SOP doesn't just enforce rules — it tracks its own gaps (SIR, FAILURE_LEDGER) and is building infrastructure (REFINE) to fix them automatically. The endgame is no Alan-prompted corrections needed.

---

## 📁 SECTION 5 — THE FILES (Where Things Live)

### Overview

The repo is organized into 7 top-level concerns. Knowing where things live makes everything else navigable.

### Top-level directories

| Directory | Contains | When you care |
|---|---|---|
| `agents/` | Agent definitions (.md) | Reading what an agent does |
| `scripts/` | All enforcement + utility scripts (.sh) | Running checks or seeing what runs at commit |
| `.githooks/` | Pre-commit + pre-push hooks | Understanding what auto-runs at git operations |
| `cache/` | Active state — append-only logs | Looking up history, failures, decisions, audit trail |
| `backups/` | Every pre-edit backup, timestamped + device-tagged | Restoring a prior file state |
| `tests/` | Test harness (skeleton) | Verifying agents work |
| `templates/` | Output skeleton templates | Starting a new OUTPUT-STANDARD from a template |

### Top-level governance docs (alphabetical, just the important ones)

| File | Role |
|---|---|
| `README.md` | GitHub-facing project entry |
| `SESSION_START.md` | The canonical session-start entry point |
| `CLAUDE.md` | Claude Code project config (auto-read) |
| `UNIVERSAL_SOP_PROMPT.md` | Full SOP rulebook v1.3 (940 lines) |
| `STANDALONE_SOP.md` | Shippable MIT version of the SOP |
| `MANDATORY_TIGHT_LOOP.md` | The operational reduced ruleset (8+1, 7-item Pulse) |
| `PROTOCOLS_REFERENCE.md` | Every protocol acronym + full name |
| `DEVICE_REGISTRY.md` | All registered devices |
| `MULTI_DEVICE_GIT_PROTOCOL.md` | 7 Golden Rules for cross-device git |
| `MASTER_CONTINUATION_PROMPT.md` | Paste-ready new-chat resume |
| `SOP_MAP.md` + `SOP_MAP.html` | Visual system reference (6 diagrams) |
| `SOP_COMPLETE_REFERENCE.html` | Full interactive HTML browse |
| `SOP_GUIDE.md` ⭐ (this file) | Plain-English human-readable guide |
| `SELF_COMPLIANCE_FIX.md` | The F.19 diagnosis (discipline vs architecture) |
| `QUINTESSENCE_ROADMAP.md` | 32 deferred findings + acceptance criteria |
| `VERSION_MANIFEST.md` | Single source of truth for file versions |
| `LEARNINGS_FROM_AURELIUS_VAULT.md` | Cross-pollination findings |
| `REFINE_PROTOCOL_PROPOSAL.md` | SP.20 REFINE spec for new-chat ship |

### Cache files (append-only)

| File | Purpose |
|---|---|
| `cache/SESSION_STATE.md` | Current position + decisions log |
| `cache/CONTINUATION.md` | Latest session handoff (where to resume) |
| `cache/BACKUP_LOG.md` | Every modification ever, with backup pointer |
| `cache/FAILURE_LEDGER.md` | F.1–F.22 — every failure + permanent fix |
| `cache/BOOTSTRAP_CHECK.md` | Self-test spec (currently 85 checks) |
| `cache/META_AUDIT_LOG.md` | Per-commit audit chain run log |
| `cache/SIR_LOG.md` | System improvement insights (append-only) |
| `cache/SOP_HEALTH_METRICS.md` | Auto-generated time-series of SOP health |

### Section 5 takeaway

> 7 directories + ~20 governance files + 8 cache files. The cache files are the system's MEMORY across sessions. The scripts are the MUSCLE. The governance files are the BRAIN.

---

## 🌐 SECTION 6 — CROSS-DEVICE (How It Works Across Machines)

### Overview

You operate on multiple devices (Mac, 2 Strix Halos, desktop). The SOP is designed to maintain coherence across all of them via GitHub as the source of truth.

### The 7 Golden Rules

Documented in `MULTI_DEVICE_GIT_PROTOCOL.md`:

1. **Always pull before work** — `git pull` before starting on any device
2. **Always commit + push after work** — other devices need to see your work
3. **Never force push** — destroys other devices' commits
4. **Never rewrite history** — strands devices that committed on top
5. **One device at a time for active work** — finish + push on A → switch to B
6. **Append-only for history files** — cache files can't lose entries
7. **Never delete files** — move to `cache/legacy/archived_*` instead

### How devices stay in sync

```
mac-main  →  git push  →  origin/main  ←  git pull  →  aurelia
                              ↑
                          GitHub
                       (source of truth)
```

Two scripts handle the friction:
- `scripts/safe_push.sh` — handles divergence with `fetch + rebase + push` atomically
- `scripts/check_device_activity.sh` — shows what other devices have done

The pre-push hook automatically detects divergence and tells you to run `safe_push.sh`.

### Device identity in every artifact

Every commit, backup file, and BACKUP_LOG row carries the device name:
- Commit subject: `[aurelia | 2026-05-22 14:30 CDT] summary`
- Backup filename: `<file>_v<ver>_<YYYYMMDD>_<HHMMSS>_<device>_<reason>_backup.<ext>`
- BACKUP_LOG row: includes `(aurelia)` prefix in reason field

This means: any artifact, any device, you can trace which machine produced it.

### Section 6 takeaway

> GitHub is the source of truth. Pull before, push after. Hooks catch divergence. Every artifact is device-tagged.

---

## 🎯 CONCLUSION — Unified Relevance

You started this project to make Claude predictable. You've now built a system that:

| What you wanted | What exists today |
|---|---|
| Claude follows rules consistently | 18 SubSOPs + 4 Ensurance, 8 mandatory in tight loop |
| Honest output, no fabrication | SP.5 FSP + N/M marker + 5 mechanical scripts |
| Real audit, not theater | 4-layer audit chain + Meta-Verifier closes "who audits the auditor" |
| Cross-device coherence | DEVICE_REGISTRY + 7 Golden Rules + 2 git hooks + safe_push.sh |
| Self-improving system | SIR_LOG + FAILURE_LEDGER + REFINE proposal + quintessence roadmap |
| No more Alan-prompted corrections | At 6.5/10, target 10/10; REFINE protocol projected to take us to 8.0/10 |

The whole system is **one project** with one purpose: **make Claude's output predictable enough that you can build the APW course on top of it without spending time correcting Claude's misses**.

Right now the APW course is paused because SOP validation continues. The Universal SOP is the meta-infrastructure. APW is the actual product.

### Three things to remember

1. **Convention decays; architecture holds.** Every gap fix should be a script or a hook, not a rule you have to remind Claude about.

2. **Every output ends the same way** — STEP header → UC → body → LTM → SIR → Pulse Check → Sync Status. Memorize this skeleton and you can spot when Claude deviates.

3. **The roadmap is in `QUINTESSENCE_ROADMAP.md`.** Every gap I find ends up there with a F.X ID and a suggested commit. No insight is lost.

### Where to go from here

| If you want to... | Read |
|---|---|
| See the system visually | `SOP_MAP.html` (open in browser) |
| Browse all protocols | `SOP_COMPLETE_REFERENCE.html` |
| Add a new SubSOP | `scripts/add_protocol.sh` (advisory) + `MANDATORY_TIGHT_LOOP.md` |
| Onboard a new device | `MULTI_DEVICE_GIT_PROTOCOL.md` + `scripts/setup_device.sh` |
| Understand why this exists | `SELF_COMPLIANCE_FIX.md` (the F.19 diagnosis) |
| See the future plan | `QUINTESSENCE_ROADMAP.md` |
| Continue in a new chat | `CONTINUATION_POINTER.md` |
| Ship the next big thing | `REFINE_PROTOCOL_PROPOSAL.md` (SP.20) |

### One-sentence summary

> **The Universal Output SOP is a 6-layer system (devices + bootstrap + rulebook + protocols + agents + mechanical enforcement) that makes Claude's output predictable, honest, and auditable across any session or device — and is built to improve itself toward a quintessential 10/10 self-perfecting target.**

That's the whole thing.

---

*SOP_GUIDE.md v1.0 | Plain-English human-readable guide | aurelia | 2026-05-22*
