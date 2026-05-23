---
date: 2026-05-21
type: protocol
tags: [protocol, qa, verification, prove-it, fidelity, aurelius]
related: ["[[index]]", "[[Aurelius-Master-SOP]]", "[[Failure-Modes-and-Resolutions]]", "[[Operations-Log]]"]
---

# PROVE-IT Protocol — Don't Tell Me, Prove It

Linked: [[index]] · [[Aurelius-Master-SOP]] · [[Failure-Modes-and-Resolutions]]

**Status**: Active (v1 Op 24 · v2 Op 31 — user-specified 9-point checklist)
**Authority**: Required for any operation that ships code or changes infrastructure
**Owner**: Claude (orchestrator) self-administers; user can demand a PROVE-IT pass any time

---

## 🎯 THE 9-POINT CHECKLIST (user-specified, Op 31)

**This is the authoritative spine of the protocol.** Every operation writeup must render these 9 items as visible checkboxes with concrete content per row.

```
[ ] 1. QA              — independent audit (agent or human eyes)
[ ] 2. Test            — exact N/N tests passing (not "all green")
[ ] 3. Quality         — what improved this op (concrete, not vibe)
[ ] 4. Bottlenecks     — perf / structural issues identified
[ ] 5. Constraints     — dependencies / limits exposed
[ ] 6. Errors          — what failed this op (full HFR block if any)
[ ] 7. Break points    — where it could break next (specific)
[ ] 8. Improve/Resolve — fixes shipped this op (file:line)
[ ] 9. Foresight       — proactive forecast (top 2-3 risks queued)
```

**Rules:**
- Every row must have a non-empty entry. If genuinely N/A, write `N/A — reason`.
- Items 1, 3, 4, 5, 7, 9 require a sentence each. Items 2, 6, 8 require concrete artifacts (counts, file paths, SHAs).
- Row 6 (Errors) triggers a full HFR block + new F-NNN row in `Failure-Ledger.md` if anything failed.
- Row 9 (Foresight) is at least 2 items, ideally 3+. Single-item foresight is a smell.

This 9-point list IS the protocol. The acronym + 10-item Pulse Check below are supporting structure, but **the 9 are what the user explicitly asked for and the rendering format is non-negotiable.**

---

## Honesty markers (Op 26 — borrowed from universal-sop)

### N/M — "Not Measurable"

When asked for a number you cannot accurately measure:
- ❌ Don't fabricate ("~5K" when guessing)
- ✅ Write `N/M` or `N/M (Not Measurable — reason)`
- ✅ Or provide best estimate with uncertainty: `~5K (est., ±50%)`

Common N/M cases for Aurelius: wall-clock time per op step (no API), exact token counts mid-stream, cross-session cumulative tokens after a compact.

### HFR — Honest Failure Report

Required block in any op writeup where something failed (test, push, agent run, etc.). Three fields:

```
HFR
- Root cause: [what actually went wrong, not the symptom]
- Permanent fix: [code/doc change preventing recurrence]
- Proof: [test name added | command output | commit SHA]
```

If you cannot write all three fields, you don't yet understand the failure — keep investigating.

---

## The principle

> Code that compiles isn't proof. Tests that pass aren't proof. The thing actually working in its actual execution environment is proof.

Three operations in a row (21 → 22 → 23) shipped logic that **looked fine in code review and passed tests** but had latent break points that would have bitten in production:

- Op 21: `safe_push.py` hard-coded a path. Tests passed because tests didn't push.
- Op 22: Fixed the resolver in code but still pushed via the broken path the same day.
- Op 23: Wrote `.cmd` resolver with nested quotes that **silently fails when `%VENV_PYTHON%` has spaces** — which it does on every Strix Halo. Tests passed because tests didn't exec the `.cmd`. Task Scheduler would have broken at the next 8 AM run.

PROVE-IT exists so this stops happening.

---

## The acronym

| Letter | Step | Concrete action |
|---|---|---|
| **P** | **Pre-flight snapshot** | Capture state before change: `git status`, test count, `agents/run_agents --status`, sync-log tail. Anything that could regress must have a baseline. |
| **R** | **Run it, don't read it** | Execute every code path the change touches. Code review is necessary but never sufficient. If a `.cmd` file changed, run the `.cmd`. If a Python module changed, import and call it. If a doc claims a behavior, exhibit the behavior. |
| **O** | **Observe real output** | Capture stdout/stderr/exit code from the actual run. Not "the diff looks right" — the bytes that came out. Truncate for the writeup but never skip the capture. |
| **V** | **Verify against the claim** | Side-by-side: what did you say it would do, what did it actually do? Disagreement = bug. Include test count delta (before → after) in every operation closeout. |
| **E** | **Evidence in the writeup** | Operations-Log entries cite file:line, commit SHAs, command outputs, test counts. "Trust me" is never written. |
| **I** | **Identify break points + foresight** | After fixing the immediate issue, list what could still break: encoding mismatches, path quoting, env-var assumptions, race conditions, silent failures. Queue them. |
| **T** | **Test the find** | Every concern surfaced becomes a permanent guard test in `aurelius_tests.py`. The same regression cannot ship twice. |

Read it as **"PROVE IT"** — the phrase you should ask yourself before declaring an operation done.

---

## When PROVE-IT is mandatory

Any operation that:
1. Modifies a script the daily routine runs (`run_daily_routine.cmd`, `safe_push.py`, anything in `agents/`)
2. Changes a path, env var, or external dependency
3. Adds claims to user-facing docs (BOOTSTRAP.md, RUNBOOK.md, LIBRARY.md)
4. Introduces a new failure mode
5. Touches multi-device sync (`safe_push.py`, sync-log writers)

If unsure: PROVE-IT. The cost is ~5 minutes; the cost of skipping it is shipped breakage.

## When PROVE-IT can be lighter

Pure documentation typo fixes, comment-only changes, formatting. Still capture a `git diff` summary in the writeup, but skip the full exec pass.

---

## The minimum PROVE-IT pass (every op)

```bash
# 1. Pre-flight
cd "$AGENT_STACK" && git status -s && python tests/aurelius_tests.py | tail -3

# 2. Run-it: the actual command(s) the change affects.
#    Examples — pick whichever apply to this op.
python -c "from aurelius_paths import VAULT_DIR; print(VAULT_DIR)"
python -m agents.run_agents --status
python safe_push.py --show-device-id
python safe_push.py --status
cmd /c run_daily_routine.cmd   # only as a dry-run with logging muted
python checkpoint.py --note "PROVE-IT dry run"
python session_capture.py --list

# 3. Observe-it: real stdout/exit code captured into the op writeup

# 4. Verify-it: tests must still pass
python tests/aurelius_tests.py | tail -3

# 5. Evidence in Operations-Log: file:line + SHA + counts

# 6. Identify break points (write to the op entry under "Foresight" header)

# 7. Test the find (new test in aurelius_tests.py if a real bug was caught)
```

---

## Pulse Check 2.0 — 10-item mechanical gate (Op 26)

The 7 PROVE-IT steps are the spine. Pulse Check is the mechanical pre-send pass. Run BEFORE declaring an op done. Tick all 10 or surface what failed.

```
[ ] 1. Tests pass — exact count (N/N), not "all green"
[ ] 2. Every claim has a citation (file:line, SHA, command output)
[ ] 3. No fabricated numbers (N/M used where can't measure)
[ ] 4. Foresight section non-empty (what could break next)
[ ] 5. New code path has a guard test
[ ] 6. Real command executed for any .cmd / hook change (not just grep)
[ ] 7. Operations-Log entry includes PROVE-IT pass block
[ ] 8. Commit message references op number + change list
[ ] 9. Sync-Log appended (safe_push handled it, or manually noted)
[ ] 10. If something failed: HFR block written
```

Treat this as a checklist, not prose. If a row is N/A, write `N/A — reason`. Skip nothing silently.

### The "SKIPPED" loophole rule (Op 29)

Item 7 ("Operations-Log entry includes PROVE-IT pass block") has one legitimate exception: an op that was never executed. To prevent this from becoming a way to dodge audits, the convention is strict:

- **Only ops with the literal phrase `_SKIPPED in numbering_` in their `## Operation N — ...` heading are exempt** from Pulse Check item 7.
- A skipped op must have a one-paragraph body explaining why it was never executed (e.g., "Op 25 — Foresight Sweep proposed but Op 26 ran first; punch list shipped in Op 27").
- Any other op missing a PROVE-IT pass block is a FAIL on item 7, not a yellow.

This was caught by Op 28's audit when Op 25's placeholder entry returned `PROVE-IT pass block count = 0` — surfaced as ⚠️ explainable, but the rule above makes it ✅ unambiguous going forward.

---

## The visible health-check (in BOOTSTRAP.md Step 5)

This already exists as of Op 21. PROVE-IT formalizes its role: **the health-check IS the per-bootstrap PROVE-IT pass.** It runs the resolver, prints agent statuses, confirms test counts, and tracks doc drift — all of which are PROVE-IT instruments.

If the health-check shows a ❌ anywhere, Step 6 ("Report ready") is blocked. That's PROVE-IT enforced as a hard gate.

---

## Foresight pattern — what to look for next

PROVE-IT's "I" step is proactive. After fixing the immediate issue, scan for:

| Class of break point | How to spot it | Example caught |
|---|---|---|
| **Console encoding** | Non-ASCII glyphs in `print()` on Windows | Op 24: `⚠` crashed cp1252 |
| **Nested shell quoting** | `for /f` + `"%VAR%"` with spaces | Op 24: `%VENV_PYTHON%` with spaces broke `.cmd` resolver |
| **Hard-coded paths** | `Path(r"C:\Users\...")` anywhere outside `aurelius_paths.py` | Ops 21/22/23: 9 hard-coded vault paths |
| **PATH dependence** | bare `python` in `.cmd` files | Op 24: `push_to_github.cmd` used system python |
| **Silent failures** | `2>nul`, `--quiet`, `errors='ignore'` without an audit log | Daily routine pushes — would fail silently if remote unreachable |
| **Aspirational claims in docs** | "All N mirrors", "Always", "Never fails" | Op 22: Awake999 mirror didn't exist |
| **Untested code paths** | Code that only runs in production (scheduler, hooks) | Op 24: `.cmd` files never had a test |
| **Encoding in subprocess** | `subprocess.run(...)` with text=True on Windows | safe_push hit cp1252 mid-print |
| **Tests that don't exercise the surface** | Tests that import but never call | `test_auto_sync_present` only greps the .cmd — doesn't run it |

---

## What PROVE-IT is NOT

- **Not a substitute for the QA agent.** QA reads code independently and finds class-of-bug concerns. PROVE-IT verifies a *specific* change works. Both run on every op.
- **Not the test harness.** Tests are the regression guard. PROVE-IT is the smoke pass that confirms the test harness reflects reality.
- **Not the alignment audit.** Alignment Audit checks macro mission fit. PROVE-IT checks micro correctness.

---

## Sample writeup template (paste into Operations-Log entry)

```markdown
## Operation N — {title} ({date})

{Brief description of what shipped}

### What shipped
| Change | Where | Verification |
|---|---|---|

### PROVE-IT pass
- Pre-flight: tests N/N, git clean, agents M/12 ok
- Run-it: {commands actually executed + their stdout summary}
- Observe-it: {real output — paste the relevant lines}
- Verify-it: tests N+Δ/N+Δ passing
- Evidence: commits {sha1}, {sha2}; files touched {paths}
- Foresight: {what could still break next; queued for Op N+1 or later}
- Tests added: {names of new guard tests}
```

---

## Audit history of PROVE-IT itself

- **Op 24** (2026-05-21): Introduced. First exercise caught the nested-quote `.cmd` bug shipped in Op 23.
- (future) Each operation that uses the protocol appends a one-liner here so we can audit adherence.

#protocol #prove-it #qa #verification #fidelity
