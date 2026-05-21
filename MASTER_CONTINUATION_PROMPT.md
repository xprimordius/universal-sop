# 🚀 MASTER CONTINUATION PROMPT — New Device / New Chat / Full Fidelity

**Version:** 1.0 | **Created:** 2026-05-21 | **Owner:** Alan (xprimordius/universal-sop) | **Status:** Production

---

## 📋 WHAT THIS FILE IS

**The single paste-ready prompt that resumes the Universal Output SOP (USOP) + APW Course project on ANY new device or new chat — with FULL fidelity, FULL context, and ZERO setup friction.**

This is the ONLY thing you need to copy. Everything else is auto-resolved from the GitHub repo `xprimordius/universal-sop` (PRIVATE).

---

## 🎯 HOW TO USE (3 STEPS — 90 SECONDS TOTAL)

### Step 1 — On the new device (one-time, ~60 seconds)

Open a terminal and run:

```bash
# Install GitHub CLI if not present
brew install gh        # macOS
# OR: winget install GitHub.cli   (Windows)
# OR: see https://cli.github.com  (Linux)

# Authenticate (browser opens — log in as xprimordius)
gh auth login

# Clone the repo
gh repo clone xprimordius/universal-sop
cd universal-sop

# Register this device (one-time)
bash scripts/setup_device.sh
```

### Step 2 — Open Claude Code

```bash
claude
```

### Step 3 — Paste the prompt below VERBATIM

Copy everything in the **PASTE-READY PROMPT** box (next section) and paste it as your FIRST message in the new Claude Code (or Claude.ai) chat. That's it.

---

## 📋 PASTE-READY PROMPT (Copy Everything Between the Lines)

═══════════════════════════════════════════════════════════════════════

You are resuming an in-progress project on a new device/chat. The full state lives in this repo. Execute the following in order. Do NOT skip steps. Do NOT ask questions until you have completed bootstrap.

**REPO:** xprimordius/universal-sop (PRIVATE — already cloned to your current working directory)

**STEP 1 — Read the bootstrap entry point:**
Read `./SESSION_START.md` end-to-end FIRST. It contains the canonical session-start procedure, current precedence rules, and the list of mandatory cache files.

**STEP 2 — Execute Fast-Path bootstrap (3 files, ~10K tokens):**
Read these three files via the Read tool (in this order):
1. `cache/SESSION_STATE.md` — current position, decisions log, token state, MACRO + MICRO goals
2. `cache/CONTINUATION.md` — latest session handoff with cumulative log
3. `cache/BOOTSTRAP_CHECK.md` — self-verification unit test (confirm you understood the state)

**STEP 3 — Run the bootstrap self-test:**
After reading the 3 Fast-Path files, answer these in your reply (the BOOTSTRAP CONFIRMATION):
1. MACRO goal (from SESSION_STATE.md GOAL TRACKING section)
2. MICRO goal (current session focus)
3. Active SOP version (UNIVERSAL_SOP_PROMPT.md current version)
4. Last commit hash and what it fixed (from `git log -1`)
5. Open failure entries in FAILURE_LEDGER.md (F.1 through F.N — name latest)
6. Latest 3 decisions from SESSION_STATE.md decisions log
7. What the user (Alan) most recently asked for (last user turn before this resume)
8. Your proposed next action (1-2 sentences) — what would you do next if Alan said "continue"
9. Pulse Check P1-P17 status (mark ✅ for each item you can already confirm, ⏳ for items requiring next deliverable)

**STEP 4 — Verify multi-device safety:**
Run `bash scripts/check_device_activity.sh` and confirm:
- This device is registered in DEVICE_REGISTRY.md
- No uncommitted changes from a different device
- Latest remote commit matches latest local commit (`git status` clean)

**STEP 5 — STOP and wait.**
Do not start new work. Do not propose changes. Display the BOOTSTRAP CONFIRMATION (9 lines from Step 3) and wait for Alan to direct the next action.

**MANDATORY RULES (from UNIVERSAL_SOP_PROMPT.md v1.3):**
- Rule #11: Use FULL protocol names + acronyms on EVERY use (not just first). Example: "Token Transparency Estimate (TTE) + Long-Term Memory (LTM)" — never bare "TTE + LTM".
- Rule #13: Run `bash scripts/compliance_check.sh` before any commit. Pre-commit hook will enforce. Do NOT use `--no-verify` without explicit Honest Failure Report (HFR) justification.
- Append-only: cache/SESSION_STATE.md, cache/CONTINUATION.md, cache/FAILURE_LEDGER.md, cache/BACKUP_LOG.md NEVER shrink. Add entries; never delete history.
- Device naming: Every commit message must follow `[device-name | YYYY-MM-DD HH:MM TZ] summary` format.
- Step Header: Every deliverable must start with the v1.3 step header (STEP / SOP / TIER / SCOPE / EST / MACRO / MICRO).
- Pulse Check 17-item: Run before sending any deliverable. P16 = MACRO/MICRO visible. P17 = compliance_check.sh passed.

**WHO ALAN IS (USER_PROFILE.md summary):**
- Builds Ascend Prime Wealth (APW), a $100K-$500K business funding course
- Communication: lead with answer, no filler, no hedging, tables for comparisons, copy-paste ready
- Hates: word vomit, missed facts, re-asking answered questions, sloppy work, unproposed solutions
- Wants: verify everything, never assume, do what you promised in the SAME message

**WHAT'S ACTIVE NOW (2026-05-21):**
- MACRO goal: Build APW course (Skool-hosted, $100K-$500K funding in 90 days)
- MICRO goal: Universal Output SOP infrastructure (currently overshadowing macro — O1 OBJECTIVE DRIFT documented in FAILURE_MODES_ANALYSIS.md)
- Latest fix: F.16 — script enforcement agent (Karen v2.2 + .githooks/pre-commit)
- Latest commit: `3641d81` or newer (check `git log -1`)
- Open critical task: Return to APW course building (Module 4.1 — 7DFS Lessons)

**FULL CHAT HISTORY:**
The full JSONL transcript of the prior chat is at `chat_archive/session_5_continued_20260521_172216/` (5.2 MB, 1,805 lines, 489 user turns, 824 assistant turns). Read selectively if you need exact prior reasoning.

**FAILURE PATTERNS TO AVOID:**
Read `cache/FAILURE_LEDGER.md` entries F.1-F.16. Especially:
- F.13: Macro/Micro goal tracking must appear in every step header
- F.14: Rule #11 violations (bare acronyms) — use full names EVERY use
- F.15: Multi-device drift (device naming + append-only enforcement)
- F.16: Script bypass (Karen audits + pre-commit hook enforces)

**GO.** Execute Steps 1-5. Output the BOOTSTRAP CONFIRMATION. Then stop and wait.

═══════════════════════════════════════════════════════════════════════

---

## 🛡️ WHY THIS WORKS — THE FIDELITY GUARANTEE

This prompt achieves **full fidelity** continuation because it leverages five layered systems already in place:

| Layer | What it preserves | Where it lives |
|-------|-------------------|----------------|
| 1. Cache state | Decisions, position, prompts, tokens | `cache/SESSION_STATE.md` + `cache/CONTINUATION.md` |
| 2. AI reasoning | Full prior chat transcript (JSONL) | `chat_archive/session_5_continued_20260521_172216/` |
| 3. Rulebook | The SOP itself (v1.3, 16 SubSOPs, EN.1-EN.4) | `UNIVERSAL_SOP_PROMPT.md` |
| 4. Failure memory | Every past mistake + permanent fix | `cache/FAILURE_LEDGER.md` (F.1-F.16) |
| 5. Mechanical enforcement | Scripts that can't be bypassed silently | `scripts/` + `.githooks/pre-commit` |

The new chat reconstructs EVERYTHING by reading these — no human translation needed.

---

## 📊 BOOTSTRAP COST

| Path | Files read | Tokens | When to use |
|------|-----------|--------|-------------|
| **Fast-Path (default)** | 3 (SESSION_STATE, CONTINUATION, BOOTSTRAP_CHECK) | ~10K | New chat, work resuming, same project |
| **Cold Start (rare)** | 8 (adds USER_PROFILE, UNIVERSAL_SOP_PROMPT, FAILURE_LEDGER, MULTI_DEVICE_GIT_PROTOCOL, DEVICE_REGISTRY) | ~28K | Brand new device, no prior context at all |
| **Deep Audit (debug only)** | Full repo scan | ~80K+ | After major regression or unexplained behavior |

**Default to Fast-Path.** Escalate only if Step 3 self-test fails.

---

## 🧪 HOW TO VERIFY THE NEW CHAT WORKED

After the new chat displays its BOOTSTRAP CONFIRMATION, run this sanity check:

1. ✅ MACRO + MICRO goals match what's in SESSION_STATE.md
2. ✅ Latest commit hash matches `git log -1 --format=%H | head -c 7`
3. ✅ Pulse Check P1-P17 displayed (not omitted)
4. ✅ Rule #11 obeyed in the confirmation itself (no bare acronyms)
5. ✅ The proposed next action references your actual open task (APW Module 4.1 or similar)

If ALL FIVE pass → continuation is full-fidelity. Proceed.

If ANY fail → tell the new chat: "Re-read SESSION_START.md and the 3 Fast-Path cache files. Your BOOTSTRAP CONFIRMATION had [specific gap]. Try again."

---

## 🆘 IF SOMETHING BREAKS

| Symptom | Fix |
|---------|-----|
| `gh repo clone` fails (auth) | Run `gh auth login` again, choose "Login with a web browser" |
| `setup_device.sh` not found | Repo may be older; run `git pull` first |
| Pre-commit hook blocks first commit | That's correct behavior — fix the violation it flags, do NOT use `--no-verify` |
| New chat ignores SESSION_START.md | Paste the prompt again with: "You skipped Step 1. Read SESSION_START.md NOW before anything else." |
| Cache files appear out of sync | Run `git status` + `git pull --rebase`. If conflicts, see `MULTI_DEVICE_GIT_PROTOCOL.md` conflict playbook. |

---

## 🔗 RELATED DOCUMENTS

- `SESSION_START.md` — The canonical bootstrap procedure (this prompt invokes it)
- `MULTI_DEVICE_GIT_PROTOCOL.md` — Seven Golden Rules for multi-device work
- `DEVICE_REGISTRY.md` — Named devices + commit conventions
- `UNIVERSAL_SOP_PROMPT.md` — The v1.3 rulebook (16 SubSOPs, 6 Stages)
- `cache/FAILURE_LEDGER.md` — Every past failure + permanent fix
- `CLAUDE.md` — Claude Code project config (legacy APW zone + active precedence)

---

## 📝 MAINTENANCE

**When to update this file:**
- New mandatory cache file added → update Step 2 file list
- New mandatory rule added → update the MANDATORY RULES section
- Bootstrap test format changed → update the 9-line BOOTSTRAP CONFIRMATION spec
- Repo URL changes → update REPO line + `gh repo clone` command

**Who updates it:**
- Append-only? No (this is an instruction file, not a history file)
- Version bump? Yes — increment top header on every substantive edit
- Karen audit? Yes — Karen (Layer 2) reviews this on F.X expansion commits

---

*MASTER_CONTINUATION_PROMPT.md v1.0 | xprimordius/universal-sop | Last updated: 2026-05-21*
