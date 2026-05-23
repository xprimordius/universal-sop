---
date: 2026-05-22
type: index
tags: [index, manifest, protocols, sops, aurelius, external-reference]
related: ["[[Aurelius-Master-SOP]]", "[[PROVE-IT-Protocol]]", "[[GOLD-PATH-Protocol]]"]
---

# Aurelius Protocols + SOPs — Master Index

**For external AI systems** (ChatGPT, Gemini, Claude.ai chat, etc.) consulting on this project: this file is your entry point. Read it first to know which protocol applies to which situation.

**Last updated**: 2026-05-22 (Op 39)
**Public mirror**: see "How external systems pull these" at bottom of this file.

---

## The 6 mandatory protocols (always applicable)

| # | Protocol | When to apply | One-line summary |
|---|---|---|---|
| 1 | **Aurelius-Master-SOP** | Every turn, every operation | The 8-stage per-turn execution pattern (Receive → Understand → Relay → Plan → Execute → Validate → Persist → Summarize). The operating system. |
| 2 | **PROVE-IT-Protocol** | Every op that ships code or changes infra | "Don't tell me, prove it." 7-step verification (Pre-flight → Run → Observe → Verify → Evidence → Identify → Test) + the 9-point closeout block + the 10-item Pulse Check 2.0 audit. |
| 3 | **GOLD-PATH-Protocol** | Before recommending ANY new component | Always lead with the SOTA option. Render a Gather/Observe/Lead/Deviate/Prove table. No doc-anchoring. |
| 4 | **EMULATE-OR-EXCEED-Protocol** | Before BUILDING any new feature/capability | Find best public reference implementation. Render Search/Profile/Decide/Build/Compare table. Emulate or exceed — never build in isolation. |
| 5 | **Multi-Device-Sync-Protocol** | Every push, every device | Never `git push --force`. Always `safe_push.py`. Per-device git identity. Sync-Log is the source of truth. |
| 6 | **BACKUP-STATUS-Protocol** | End of every op writeup + state-persisting response | Render `backup_status.py` block showing 4 redundancy layers (local disk + local git + GitHub + public gist) + device ID + op number + restore commands. No silent "trust me." |

## The 2 reference docs (consult when relevant)

| # | Doc | When to consult |
|---|---|---|
| 5 | **Failure-Modes-and-Resolutions** | When designing a new system — covers the taxonomy of what can fail (cross-device, harness drift, objective drift, etc.) and how each is mitigated |
| 6 | **Failure-Ledger** | When debugging — chronological log of actually-encountered failures with HFR (root cause + permanent fix + proof). F-001..F-010 as of Op 39. |

## The 2 boot docs (read when starting fresh)

| # | Doc | When to consult |
|---|---|---|
| 7 | **BOOTSTRAP.md** | New device or new chat session. Master run-of-show. 11-file cold-start reading list + visible health-check (§5.1-§5.7). |
| 8 | **RUNBOOK.md** | Operating the voice agent — launch/kill commands, log locations, observed performance, known caveats. |

---

## Quick decision tree for external AI consultants

```
Asked to recommend a technology?       → GOLD-PATH-Protocol (mandatory scan)
Asked to BUILD a new feature?          → EMULATE-OR-EXCEED-Protocol (reference scan FIRST)
Asked to verify a change works?        → PROVE-IT-Protocol (7-step + Pulse Check)
Asked to ship an op?                   → Aurelius-Master-SOP §1 (8-stage pattern)
                                          + EOE if building new capability
                                          + GOLD-PATH if any new component
                                          + PROVE-IT 9-point closeout
                                          + Multi-Device-Sync for the push
Asked about a failure?                 → Failure-Ledger first (has it happened?)
                                          then Failure-Modes (taxonomy + mitigation)
Setting up on a new device?            → BOOTSTRAP.md
Running the voice agent?               → RUNBOOK.md
```

---

## Canonical inline expansions (Master-SOP §1.9 — Op 43)

When referencing any protocol or acronym in conversation/writeups, expand inline with steps:

- **PROVE-IT** — 7-step verification: Pre-flight → Run → Observe → Verify → Evidence → Identify → Test
- **PROVE-IT 9-POINT** — 9 op closeout sections: QA, Test, Quality, Bottlenecks, Constraints, Errors, Break points, Improve/Resolve, Foresight
- **Pulse Check 2.0** — 10-item mechanical gate: tests pass, citations, no fab numbers, foresight, guard tests, real exec, PROVE-IT block, commit ref, sync-log, HFR
- **GOLD-PATH** — 8-step research-SOTA-first: Gather → Observe → Lead → Deviate → Prove → Audit → Track → Honor
- **EOE (EMULATE-OR-EXCEED)** — 5-step reference scan: Search → Profile → Decide → Build → Compare
- **HFR (Honest Failure Report)** — root cause + permanent fix + proof
- **N/M (Not Measurable)** — honesty marker for numbers that can't be measured precisely
- **9-point gate** — safe_push refuses vault push if latest op missing 9 sections
- **F-NNN** — Failure-Ledger append-only row (never edit prior)

---

## Cross-cutting principles (apply across all protocols)

1. **N/M honesty marker** — never fabricate numbers. Use `N/M` or `~5K (±50%)` when can't measure precisely.
2. **HFR format** — every failure gets root-cause + permanent-fix + proof, never just symptom description.
3. **Append-only ledgers** — Operations-Log, Failure-Ledger, Sync-Log: never edit history rows.
4. **Visible health-check** — BOOTSTRAP §5 runs every cold-start with row-by-row probe output, not summary prose.
5. **Per-op 9-point** — every op writeup has the 9 user-spec'd sections: QA, Test, Quality, Bottlenecks, Constraints, Errors, Break points, Improve/Resolve, Foresight.
6. **9-point gate at push** — `safe_push.py` refuses vault pushes whose latest op entry is missing 9-point sections.

---

## How external systems pull these

The Aurelius vault repo is private. A **public gist** mirrors the protocols for external consumption:

### Multi-file gist (all 9 docs + this index)

```
https://gist.github.com/xprimordius/b6b78c9bca02b94bb74c0db555586923
```

(Gist ID populated when Op 39 ships — see Operations-Log Op 39 entry.)

### Individual raw URLs (single-file fetches)

```
INDEX.md                        → https://gist.githubusercontent.com/.../raw/INDEX.md
Aurelius-Master-SOP.md          → https://gist.githubusercontent.com/.../raw/Aurelius-Master-SOP.md
PROVE-IT-Protocol.md            → https://gist.githubusercontent.com/.../raw/PROVE-IT-Protocol.md
GOLD-PATH-Protocol.md           → https://gist.githubusercontent.com/.../raw/GOLD-PATH-Protocol.md
Multi-Device-Sync-Protocol.md   → https://gist.githubusercontent.com/.../raw/Multi-Device-Sync-Protocol.md
Failure-Modes-and-Resolutions.md → https://gist.githubusercontent.com/.../raw/Failure-Modes-and-Resolutions.md
Failure-Ledger.md               → https://gist.githubusercontent.com/.../raw/Failure-Ledger.md
BOOTSTRAP.md                    → https://gist.githubusercontent.com/.../raw/BOOTSTRAP.md
RUNBOOK.md                      → https://gist.githubusercontent.com/.../raw/RUNBOOK.md
```

### Standalone GOLD-PATH gist (Op 38, kept for backward compatibility)

```
https://gist.github.com/xprimordius/8a5f44963aa97e49aa2609f947fcf05b
```

---

## Paste-ready prompt for external AI consultants

```
You are consulting on the Aurelius project (local autonomous AI assistant).
Before any work, fetch this index and the 4 mandatory protocols:

https://gist.githubusercontent.com/xprimordius/b6b78c9bca02b94bb74c0db555586923/raw/INDEX.md

Then for every recommendation or operation you propose, apply:
- GOLD-PATH (if recommending tech): render Gather/Observe/Lead/Deviate/Prove table
- PROVE-IT 9-point: include QA, Test, Quality, Bottlenecks, Constraints,
  Errors, Break points, Improve/Resolve, Foresight in every op closeout
- N/M honesty: never fabricate numbers
- HFR: every failure gets root-cause + permanent-fix + proof

The full index above tells you which protocol applies to which situation.
```

---

## Refresh procedure (when protocols change)

After editing any protocol or SOP in the vault, update the public gist:

```bash
gh gist edit b6b78c9bca02b94bb74c0db555586923 \
  vault/Reference/INDEX.md \
  vault/Reference/Aurelius-Master-SOP.md \
  vault/Reference/PROVE-IT-Protocol.md \
  vault/Reference/GOLD-PATH-Protocol.md \
  vault/Reference/Multi-Device-Sync-Protocol.md \
  vault/Reference/Failure-Modes-and-Resolutions.md \
  vault/Reference/Failure-Ledger.md \
  agent-stack/BOOTSTRAP.md \
  agent-stack/RUNBOOK.md
```

Or use the helper script (Op 39): `python publish_protocols.py` — automates the refresh.

---

## What this is NOT

- **Not the full vault** — only protocols + SOPs. Conversations, intent ledgers, daily reviews, agent outputs stay private.
- **Not a substitute for the code** — these are governance docs. Implementation lives in `xprimordius/aurelius-agent-stack` (private repo; clean-room reimplementation possible from these protocols + RUNBOOK).
- **Not stable URLs forever** — the gist ID is stable until/unless deleted, but treat it as semi-permanent (bookmark + refresh).

#index #manifest #protocols #sops #external-reference #aurelius
