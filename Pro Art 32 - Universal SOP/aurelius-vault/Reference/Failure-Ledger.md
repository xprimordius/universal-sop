---
date: 2026-05-21
type: failure-ledger
tags: [failures, ledger, append-only, hfr, aurelius]
related: ["[[index]]", "[[Failure-Modes-and-Resolutions]]", "[[PROVE-IT-Protocol]]"]
---

# Failure Ledger — Append-Only Log of Real Failures

Linked: [[index]] · [[Failure-Modes-and-Resolutions]] · [[PROVE-IT-Protocol]]

**Status**: Active (introduced Op 26)
**Authority**: Every failure caught by PROVE-IT (or by user) gets a row. NEVER truncate. NEVER edit historical rows. Only append.

**Difference from `Failure-Modes-and-Resolutions.md`**: that file is the *taxonomy* (categories of what could fail). This file is the *log* of what actually did fail, when, root cause, permanent fix, proof.

---

## Format

Each row is an HFR (Honest Failure Report):

```
### F-NNN — short title (op number, date)
- Root cause: [what actually went wrong, not the symptom]
- Permanent fix: [code/doc change preventing recurrence]
- Proof: [test name | command output | commit SHA]
```

---

## Ledger (oldest first, append new at bottom)

### F-001 — `⚠` glyph crashes cp1252 console (Op 24, 2026-05-21)
- Root cause: `safe_push.py:181` printed U+26A0 (`⚠`) inside warning loop. Default Windows console encoding is cp1252, which has no codepoint for U+26A0. `print()` raised `UnicodeEncodeError` mid-loop, hiding the actual warning text.
- Permanent fix: (a) replaced `⚠` with ASCII `[!]` in `safe_push.py:181`; (b) added `sys.stdout.reconfigure(encoding='utf-8', errors='replace')` to `aurelius_paths.py` so every module importing it gets safe stdout for free.
- Proof: `test_safe_push_ascii_warning` (greps for absence of glyph) + `test_aurelius_paths_utf8_stdout` (subprocess prints multi-glyph string, returncode == 0). Commit `9e737c2`.

### F-002 — `.cmd` `for /f` resolver fails with spaces in `%VENV_PYTHON%` (Op 24, 2026-05-21)
- Root cause: Op 23 shipped `for /f "delims=" %%V in ('""%VENV_PYTHON%" -c "..."') do set VAULT_DIR=%%V`. The nested `""..."..."` quoting breaks cmd's parser when `%VENV_PYTHON%` contains spaces (Alan's path: `C:\Users\light\Desktop\Claude Codde 5.19.2026\agent-stack-venv\Scripts\python.exe`). The `for /f` silently produced empty `VAULT_DIR`. Tests passed because they greped the .cmd source rather than executing it. Daily routine would have written to legacy vault at next 8 AM Task Scheduler fire.
- Permanent fix: temp-file pattern — `python -c ... > %TEMP%\aurelius_vault_dir.tmp 2>nul ; set /p VAULT_DIR=<%TEMP%\aurelius_vault_dir.tmp ; del ...`. Applied to `run_daily_routine.cmd` + `push_to_github.cmd` + `_prove_it_smoke.cmd`. Added `test_daily_routine_resolver_safe` guard (asserts `set /p VAULT_DIR=<` present, `for /f ... VAULT_DIR` absent).
- Proof: `_prove_it_smoke.cmd` execution shows `VAULT_DIR resolved to: C:\aurelius\aurelius-vault` + `PROVE-IT PASS`. Commit `9e737c2`.

### F-003 — `safe_push.py` had hard-coded vault path (Op 22, 2026-05-21)
- Root cause: `safe_push.py:33` was `VAULT_DIR = Path(r"C:\Users\light\Documents\The Beginning\Aurelius")`. On a fresh-clone device at `C:/aurelius/`, this path doesn't exist as a git checkout, so safe-pushing the vault fired against the legacy directory instead of the canonical sibling.
- Permanent fix: `resolve_vault_dir()` function with priority order — env var → sibling → legacy → `~/aurelius/aurelius-vault`. First with `.git/` wins. Op 23 promoted it to a shared module `aurelius_paths.py` so 9 other modules use the same logic.
- Proof: `test_safe_push_env_override` + `test_safe_push_prefers_sibling`. Commits `b1d0c4a` (Op 22), `0895b34` (Op 23).

### F-004 — Awake999 mirror documented but did not exist (Op 22, 2026-05-21)
- Root cause: 5 doc files claimed "4-way / 6-way GitHub redundancy" across `xprimordius` + `Awake999`. `gh repo view Awake999/aurelius-vault` → 404. The Awake999 mirror was aspirational from earlier sessions, never created.
- Permanent fix: scrubbed wording from `LIBRARY.md` (×4 spots), `Goals/Status.md`, `Multi-Device-Sync-Protocol.md`, `Failure-Modes-and-Resolutions.md`. Honest current redundancy is 3-way: local disk + local git + GitHub xprimordius. Op 21 Operations-Log entry documents the honest count.
- Proof: `grep "Awake999\|4-way\|6-way GitHub" vault/` returns no non-archival matches. Commit `58e40bf`.

### F-005 — Two parallel vault directories (Ops 21-23, 2026-05-21)
- Root cause: Legacy box wrote to `C:/Users/light/Documents/The Beginning/Aurelius/`. Bootstrap on fresh device cloned into `C:/aurelius/aurelius-vault/`. For three ops, daily routine and tooling wrote to legacy while `safe_push.py` (Op 22 fix forward) targeted canonical sibling. Two simultaneously-valid clones tracking the same GitHub remote — confusing but not data-losing.
- Permanent fix: Op 23 — every module imports `VAULT_DIR` from `aurelius_paths.py`. `.cmd` files derive `VAULT_DIR` via the same resolver. Result: canonical sibling (`C:/aurelius/aurelius-vault/`) wins on Alan's box; legacy becomes historical clone. No data migration needed (both clones can pull from origin).
- Proof: PROVE-IT smoke `_prove_it_smoke.cmd` confirms `.cmd`-side resolver returns canonical. Tests `test_safe_push_prefers_sibling` enforce. Commit `0895b34`.

### F-006 — BOOTSTRAP §5 health check defined but not executed (Ops 21-26, user-caught 2026-05-21)
- Root cause: Op 21 wrote `BOOTSTRAP.md` Step 5 specifying a row-by-row "check, check, check visually" health table. I documented the procedure but did NOT execute it at session start for 6 consecutive ops (21-26). User explicitly asked "reread the prompt before PROVE-IT, you missed a lot" — the miss was: BOOTSTRAP §5 is supposed to RUN, not just exist on disk. I gave the summary line and skipped the visible probe-by-probe rendering.
- Permanent fix: (a) Op 26 GAP closure added §5.7 "My understanding" so future bootstraps prove comprehension vs file listing; (b) Op 27 session executed full §5.1-§5.7 with real probe output rendered visibly; (c) recording this as F-006 so any future "I wrote the procedure but didn't run it" failure has a precedent to point at.
- Proof: prior-turn response in this session contains the full §5.1 (15 rows) + §5.2 (13 agents) + §5.3 (DoD) + §5.4 (intent) + §5.5 (backup) + §5.6 (real issues) + §5.7 (understanding) tables. Commit landing this F-006 row pushes Op 27/28.

### F-009 — `--force-allow` / `--skip-9point` loophole (Op 34 recorded → Op 35 FIXED, 2026-05-21)
- Root cause: `safe_push.py` had two escape hatches that bypassed the Op 33 9-point gate: `--force-allow` (intended for risky deletions) and `--skip-9point` (intended for genuine doc-only changes). The condition `if not skip_9point and not force_allow:` meant `--force-allow` also silently bypassed the 9-point gate even though that was a separate concern. Op 33 push used `--force-allow` because the diff brushed a risky-pattern; the 9-point gate was bypassed as a side effect even though Op 33's entry was complete.
- Permanent fix (Op 35): Decoupled the two flags in `safe_push.py:safe_push()`. The 9-point gate now runs whenever `--skip-9point` is NOT set, regardless of `--force-allow`. Each escape hatch is explicit and orthogonal. Updated CLI help text to make the distinction clear. Updated gate-fail message to say "Override: --skip-9point (NOT --force-allow as of Op 35)". (b) Sync-Log flag-tracking remains queued — separate concern.
- Proof: New guard test `test_force_allow_does_not_bypass_9point` asserts the dangerous condition `if not skip_9point and not force_allow:` is absent from safe_push.py and the safe condition `if not skip_9point:` is present. 98/98 tests. Commit lands the fix.

### F-008 — Protocol structure misaligned with user spec for 7 ops (Op 31, 2026-05-21)
- Root cause: When user asked (pre-Op-24) for a "protocol to ensure fidelity ... QA, test, quality improvement, identify bottlenecks, constraints, errors, break points, improve/resolve, proactive with foresight," I named it PROVE-IT and built my own acronym (P/R/O/V/E/I/T) instead of treating their 9 categories as the spine. The protocol worked mechanically but didn't render the 9 user labels as visible checkpoints. User had to catch this twice (during Ops 24-26, then at Op 30) before I restructured.
- Permanent fix: Op 31 — `PROVE-IT-Protocol.md` now leads with the 9-Point Checklist as the authoritative spine. `Aurelius-Master-SOP.md §1.8` requires every op closeout to render the 9 checkboxes. `pulse_check.py` has `--9point` flag with `NINE_POINT_LABELS` constant. Guard test `test_pulse_check_9point` enforces the 9 exact labels.
- Proof: 91/91 tests including the new guard. Op 31 entry in Operations-Log itself renders the 9 checkboxes as the new mandatory format. Commit lands the structural restoration.

### F-007 — Agent count drift "12 → 13" across multiple docs (Op 21 audit, 2026-05-21)
- Root cause: Multiple files claimed "12 specialist agents in daily routine" — actual count was 11 in `agents/run_agents.py` AGENTS list + 2 Claude-dispatched (`QA Validation`, `Alignment Audit`) = 13 total. Drift originated during rapid Op 17 expansion when alignment_tracker + timeline_agent were added (bringing autonomous runner count to 11) but headline counts in docs weren't updated.
- Permanent fix: Op 21 + Op 26 scrubbed: `Goals/Status.md` (12 → 13), `LIBRARY.md` (9 → 13), `New-Device-Migration.md` (12 → 13), `Operations-Log.md` Op 17 entry (12 → 11+2=13), `BOOTSTRAP.md` Step 4 reading list. Going forward: §5.2 health check renders all 13 with live status, so any further drift surfaces immediately.
- Proof: `grep "12 specialist agents\|12 agents" vault/ --exclude-dir=Sessions` returns no non-archival matches. §5.2 of last bootstrap rendered all 13 with last_run timestamps.

### F-010 — Doc-anchoring instead of SOTA research (Op 38, user-caught 2026-05-21)
- Root cause: When recommending technology for the voice/screen-streaming work, I anchored on "what's already in Aurelius's docs" (Kokoro, Piper, Qwen) and recommended incremental extensions instead of independently researching "what's the best practical solution in 2026 for each problem." Status-quo bias + flattery of existing decisions. Symptom user named: "bouncing around from different experiments and LLMs just to get to broken versions... wasting time experimenting on failure."
- Permanent fix: GOLD-PATH Protocol (`vault/Reference/GOLD-PATH-Protocol.md`) — mandatory SOTA scan before recommending any new component. Wired into Master-SOP §1.4.5 ("Plan" step expansion). Added to BOOTSTRAP reading list (item #9). Future recommendations include a GOLD-PATH comparison table before the recommendation body. Skipping a required scan is itself an F-NNN entry.
- Proof: Op 38 entry in Operations-Log includes the first GOLD-PATH scan (TTS — OpenVoice gold), demonstrating the protocol in use. User can audit via `grep "GOLD-PATH for" vault/Reference/Operations-Log.md`. Commit landing this entry pushes Op 38.

### F-011 — Naked acronyms used as shared jargon (Op 43, user-caught 2026-05-22)
- Root cause: After shipping PROVE-IT (Op 24), GOLD-PATH (Op 38), and EOE (Op 42), I started invoking these protocols in conversation as "PROVE-IT 9-POINT", "Pulse Check 2.0", "EOE", "GOLD-PATH" without inline expansion of what each one does. The user has to remember what 9 sections "9-POINT" means, what 8 steps "GOLD-PATH" executes, what 5 steps "EOE" applies. Created ambiguity exactly like the doc-anchoring failure (F-010) but in the human-communication direction.
- Permanent fix: Master-SOP §1.9 "Cite-with-substance (no naked acronyms)" — mandatory inline expansion of every protocol/acronym/shorthand the first time it appears in any response, with the canonical phrasing table. Failure to expand is a §1.9 violation; user can flag with "what's that?" or "expand it".
- Proof: This Op 43 entry. Future op writeups + responses include expansions on first reference. Quick-reference card published in Op 43 closeout. Audit: grep recent Operations-Log entries for `PROVE-IT \(` and `GOLD-PATH \(` and `EOE \(` — each invocation should be paired with the parenthetical expansion.

---

## How to add a row

When PROVE-IT (or user) catches a failure:

1. Assign the next `F-NNN` number (zero-padded, monotonically increasing).
2. Write the HFR block under the heading.
3. Append to this file (never edit prior rows).
4. Reference the F-NNN id in the Operations-Log entry that fixed it.
5. If the fix isn't in yet: still write the row with `Permanent fix: PENDING — queued for Op N` so the failure is recorded even if the fix lands later.

#failure-ledger #hfr #append-only #aurelius
