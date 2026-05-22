# 🧠 SELF-COMPLIANCE FIX — Why The SOP Keeps Failing And How To Stop That
# VERSION: 1.0 | 2026-05-21 | F.19 fix | Devices: aurelia (diagnosis) + future replicate on mac-main / others

---

## 🎯 ONE-LINE THESIS

> **The Universal SOP keeps failing to enforce itself because it's a discipline system asked to do an architecture job. Discipline cannot solve an architecture problem. The fix is to convert discipline to architecture wherever possible, and reduce surface area everywhere else.**

---

## 📊 THE EVIDENCE (Day-1 Session On Device aurelia, 2026-05-21)

Honest audit of every SOP rule that should have been applied in a real working session. The session had 30+ turns of operational work (clone repo, install CLI, set up git, fix drift, push, merge with mac-main, etc.). Compliance was tabulated retrospectively:

| Category | Rules in category | Compliance rate | Why this rate |
|----------|------------------|-----------------|---------------|
| **File mechanics** — backups before edit, device hostname in filename, commit-message convention, append-only files, no deletion, pull-before-work | 7 | **~85%** | First-time failures, then **mechanically enforced** by `.githooks/pre-commit` + `.githooks/pre-push` + `scripts/append_only_check.sh`. Once gated, compliance held. |
| **Output conventions** — STEP header on line 1, MACRO/MICRO goal lines, Understanding Check, token estimate before writing, LTM per section, Step Tracking Table, Conclusion + Foresight + SHR, Pulse Check P1–P17 | 8 | **~0%** (until user explicitly demanded a SOP-compliant output) | These are documented rules with **no gate**. Every output requires Claude to remember + apply + self-audit. Skipping each is locally rational. Decay is global. |
| **Session start** — run `bootstrap_verify.sh`, read STEP 1 mandatory files in order, emit STEP 2 9-line `✅ RESUMED` confirmation | 3 | **~5%** (verifier run late, not at bootstrap; STEP 1 files read on-demand; STEP 2 never emitted) | Session-start ritual has no enforcement. Claude can just start working. |
| **Agent activation** — invoke Controller, Validator-Merged, Karen, Paradox Resolver where required | 4 | **0%** | Agents are markdown files. They run only if Claude actively invokes them. No scheduler. |

**Read this off the data:** the rules that survived are the ones that became **mechanical** (hooks, scripts, git refusing to commit). The rules that decayed are the ones that remained **conventions** (asking Claude to do the right thing every time).

This is also the pattern across **all 18 prior failure entries (F.1–F.18)**:

| Pattern | Outcome |
|---------|---------|
| Visual rules treated as suggestions (F.1, F.3) | "Fixed" via SP.1 MagNet always-on — but each new sub-agent test re-finds visual gaps |
| Live token tracking defined but never activated (F.2) | "Fixed" via LTM-after-every-section — Pulse Check still flags missing LTM regularly |
| Acknowledge-not-execute (F.4, F.7) | "Fixed" via SP.15 EEP + SP.16 PCG + Execution Debt Counter — still happens |
| Compliance decay across outputs (F.9) | "Fixed" via Ensurance System EN.1–EN.4 — but Ensurance itself decays (the meta-recursion) |
| Truncation regression (F.10, F.11) | "Fixed" via Rule #11 (full names every use) + Rule #12 (`<details>`) — `scripts/compliance_check.sh` still catches violations regularly |

**Every prior fix that was a convention got re-violated.** Every prior fix that was mechanical (file backups, device IDs, append-only files, pre-commit hook, pre-push hook, `bootstrap_verify.sh`) held.

The 14 sub-agent tests plateaued at 8.5/10 friction (one outlier at 2/10 on STANDALONE_SOP which is structurally different). Per `EFFICIENCY_GUIDE.md`, the in-session ceiling is bounded by three things:
1. Harness-injected stale `claudeMd` drift (requires user-side fix)
2. Same-brain-audits-itself (structural)
3. 940-line SOP read length (asks too much per output)

(2) and (3) are precisely the discipline-vs-architecture gap.

---

## 🧠 ROOT CAUSE — Three Reinforcing Mechanisms

### 1. Same-Brain-Audits-Itself

Karen is "anti-rubber-stamp". Validator-Merged is "Layer 1 verification". Controller is "control plane". All four agents are Claude in different prompts. The same underlying model runs the audit that ran the original output. **Anti-rubber-stamp text doesn't change the underlying judge.** Whatever bias caused the original miss is the same bias auditing for it. This is a structural property of LLM self-audit, not a bug in the agent definitions.

Mitigation: external verification (humans, scripts, other models) is the only path to genuinely independent audit. `compliance_check.sh` (F.14) works because it's not Claude. Karen does not.

### 2. No Pre-Send Gate

Token output is autoregressive. By the time Claude has emitted "Pulse Check: 17/17 ✅", the entire prior output is already in the user's view. There is no draft-then-review step at the architecture level. Pulse Check is supposed to be a pre-send check, but it cannot actually prevent send — it can only describe what already shipped.

Mitigation: convert outputs into artifacts that pass through a pre-publish gate. Files passing through `pre-commit` are exactly this — the commit doesn't land until the hook passes. Chat replies have no equivalent.

### 3. Convention Loses To Immediate Task

When the user says "fix the typo" or "commit and push", Claude's attention goes to the task. The STEP header is overhead. The Understanding Check is friction. The Pulse Check is yet more friction. Skipping each is faster. Each individual skip is locally rational, locally invisible. **Aggregated across 30+ session turns, conventions erode predictably.** This is the F.9 compliance-decay pattern that Ensurance was meant to solve — and it didn't, because Ensurance itself is convention.

Mitigation: aggressive scope reduction. Fewer rules = lower per-turn cognitive cost = higher retention. Below some surface area threshold, conventions can survive without mechanical enforcement. Above that threshold, they cannot.

---

## 🛠️ THE FIX — Three Tiers, Architectural Direction

### Tier 1 — Scope Reduction (✅ SHIPPED 2026-05-21)

Cut the conventional surface area to what a real session can carry. Spec: `MANDATORY_TIGHT_LOOP.md` (same commit as this file).

| Cut from | Cut to | Rationale |
|----------|--------|-----------|
| Pulse Check P1–P17 (17 items, ~5 min/output) | P1–P5 (5 items, ~30 sec/output) | Keep the 5 that catch the highest-frequency failure modes. The other 12 are nice-to-haves that decay first under load. |
| 16 SubSOPs + 4 Ensurance, all mandatory every output | 6 SubSOPs + 1 Ensurance, mandatory; other 13 = REFERENCE | Keep the 6 that form a tight execution loop: fidelity, intent alignment, honest failure, execute-don't-acknowledge, output skeleton, pulse check. Other 13 stay documented in `PROTOCOLS_REFERENCE.md` for transparency but are no longer asked-of-every-output. |
| STEP header with 8 fields (STEP/SOP/TIER/SCOPE/EST/MACRO/MICRO/CACHES) | 3 lines max (STEP + 🎯 MACRO + 📌 MICRO) | The other 5 fields get fabricated, forgotten, or both. Three lines is honestly survivable. |

**Reversibility:** every cut is logged here + in BACKUP_LOG. If data over the next week shows a cut rule was actually critical, re-promote it to mandatory. No content was deleted — full SOP is preserved in `UNIVERSAL_SOP_PROMPT.md` and `PROTOCOLS_REFERENCE.md`, unchanged.

**Tier 1 follow-up (small):** `scripts/compliance_check.sh` currently only accepts 10/10, 11/11, 12/12, 15/15, 16/16, 17/17 as valid Pulse Check scores. Add 5/5 since `MANDATORY_TIGHT_LOOP.md` defines a 5-item Pulse Check.

### Tier 2 — Mode Declaration (STAGED, ~2 hours when scheduled)

First line of every Claude response: explicit mode.

```
MODE: CONVERSATION
  → no SOP overhead. Only the always-on user-profile rules
    (honest numbers, tables for comparisons, headline-first,
    inference vs fact, promise = deliver same message).

MODE: OUTPUT-QUICK
  → single fact / lookup / quick answer.
    Required: STEP header (3 lines) + answer + LTM.

MODE: OUTPUT-STANDARD
  → a real deliverable.
    Required: full MANDATORY_TIGHT_LOOP (Tier 1 reduced SOP).

MODE: OUTPUT-COMPLEX
  → multi-step, multi-file, structural change.
    Required: MANDATORY_TIGHT_LOOP + extended Foresight + SHR + extra rigor.
```

**Why this works:** today, the SOP demands full overhead on every turn — including "did you push?", "what's the status?", "is the typo fixed?". Most session turns are conversational. The SOP's failure to scope itself is half the compliance gap. Mode declaration kills the false universal demand.

**Enforcement:** add a `Stop` hook in `.claude/settings.json` (the harness lets you run a script after the assistant message; it can grep for the MODE prefix and inject a system reminder if missing). When the user notices MODE is being skipped, hook surfaces a `⚠️ MODE not declared in last turn` message.

### Tier 3 — Outputs Are Files, Not Chat Replies (STAGED, ~1 day when scheduled)

The architectural completion. Most powerful fix, biggest change.

**Today:** when the user asks for a deliverable, Claude emits it as a chat message. No gate. Convention is supposed to prevent missing STEP headers etc., and doesn't.

**Proposed:** when the user asks for a deliverable, Claude:
1. Writes the draft to `outputs/<YYYY-MM-DD>_<topic>_<device>.md`
2. Commits the file via the existing `pre-commit` hook
3. The hook runs `compliance_check.sh` against the draft. STEP header present? MACRO/MICRO present? Pulse Check P1–P5 visible? Honest numbers (no fabricated time)? Cited evidence for claims?
4. **If hook fails, commit fails, output cannot reach user.** Convention becomes architecture.
5. User reads the file in their IDE / Obsidian / browser (already wired up via the chat_archive + Obsidian-vault infrastructure).
6. Chat replies remain CONVERSATION mode — lightweight.

**Why this is the real fix:** it collapses the discipline/architecture gap by eliminating the discipline side entirely. Outputs become artifacts. Artifacts go through hooks. Hooks are mechanical.

**Cost:** an extra commit per deliverable. Latency: seconds. Acceptable, since most deliverables already span minutes of work.

---

## ✅ ACCEPTANCE TEST — How To Know This Worked

| 🧪 Test | 🎯 Pass criterion |
|---------|-------------------|
| Run `bash scripts/bootstrap_verify.sh` on aurelia | 70/0/0 (already passing) |
| Run a sub-agent simulation against `MANDATORY_TIGHT_LOOP.md` instead of full SOP | Friction score ≤ 3/10 (vs 8.5/10 baseline) within 14 days |
| Audit the next 10 real session turns on any device | OUTPUT-mode turns hit ≥ 4/5 Pulse Check; CONVERSATION-mode turns skip SOP overhead cleanly |
| `compliance_check.sh` after Tier 1 follow-up | Accepts 5/5 as valid Pulse Check score |
| If Tier 2 ships: `Stop` hook flags ≥ 1 MODE-missing turn in first 10 outputs | Hook architecture works; expect MODE adoption within 3 days of nagging |
| If Tier 3 ships: deliverable file commits get blocked at least once by `compliance_check.sh` | Architecture is gating real output, not just describing rules |

---

## 🔗 RELATED FILES

| 📄 File | 🎯 Relationship |
|---------|----------------|
| `MANDATORY_TIGHT_LOOP.md` | Tier 1 spec — the reduced ruleset shipped in this commit |
| `cache/FAILURE_LEDGER.md` § F.19 | Canonical failure entry pointing at this file |
| `UNIVERSAL_SOP_PROMPT.md` | The full SOP — unchanged. Stays as reference. Mandatory subset is `MANDATORY_TIGHT_LOOP.md`. |
| `PROTOCOLS_REFERENCE.md` | All 20 protocols documented. 6 of them are now mandatory-tight-loop; the other 14 are reference-only for operational sessions. |
| `EFFICIENCY_GUIDE.md` | Confirms the 8.5/10 in-session ceiling caused by the same problem. This file proposes the architectural completion. |
| `scripts/compliance_check.sh` | Needs small update to accept 5/5 Pulse Check (Tier 1 follow-up) |
| `.githooks/pre-commit` | Foundation that Tier 3 (outputs-as-files) would extend |
| `FAILURE_MODES_ANALYSIS.md` | mac-main's broader analysis — F.19 is the meta-pattern that explains why many of those modes fire |

---

## 📜 ORIGIN

| Field | Value |
|-------|-------|
| Diagnosed during | aurelia Day-1 setup session, 2026-05-21 |
| Diagnosing device | aurelia (Windows Strix Halo) |
| Prompt that triggered | "actually test the universal SOP. and identify why it keeps failing to adhere to its own programming despite agents and prompts and instructions, and create the solution" |
| Session compliance data | retrospective audit of ~30 turns; honestly tabulated (no fabrication; estimates flagged as such) |
| Author commit | `[aurelia | 2026-05-21 ~20:55 CDT]` (this commit) |
| Status | Tier 1 SHIPPED; Tier 2 + Tier 3 STAGED awaiting separate decision |

---

*Universal Output SOP v1.3 | SELF_COMPLIANCE_FIX.md v1.0 | F.19 diagnosis + 3-tier architectural solution | 2026-05-21*
