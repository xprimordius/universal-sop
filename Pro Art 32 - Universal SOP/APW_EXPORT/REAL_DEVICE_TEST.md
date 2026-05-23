# 🧪 REAL DEVICE TEST KIT — Universal SOP Bootstrap Validation
# VERSION: 1.0 | 2026-05-21 | SOP: v1.3
# For: Alan to physically test bootstrap on a DIFFERENT device

---

## 🎯 PURPOSE

Validate that the Universal SOP bootstrap actually works on a truly fresh device with zero prior context. The in-session sub-agent test (2026-05-21) showed 7/10 friction. This kit tests whether the gap fixes hold up in a real cross-device scenario.

---

## 🛠️ WHAT YOU NEED

| 🎯 | 🏷️ Requirement | 📝 Detail |
|:---:|---------------|----------|
| 💻 | A different device | Phone (Claude.ai), other laptop (Claude Code), work computer, etc. |
| 🐙 | GitHub access | Logged in as `xprimordius` |
| ⏱️ | ~30-45 minutes | For full 10-output test |
| 📝 | This rubric printed/open | For honest scoring |

---

## 📋 SETUP STEPS

### Option A — Different Mac/PC with Claude Code

```bash
# 1. Install gh CLI if not already
brew install gh

# 2. Authenticate
gh auth login
# Follow prompts → HTTPS → web browser

# 3. Clone the repo (pick any folder location)
cd ~/Documents
gh repo clone xprimordius/universal-sop
cd universal-sop

# 4. Pull latest (just in case)
git pull

# 5. Open Claude Code
claude  # or however you launch it
```

### Option B — iPhone/Android with Claude.ai

1. Open Claude.ai in your mobile browser
2. Start a new chat
3. Use the bootstrap prompt below (cut-and-paste — files won't be accessible in mobile)
4. Paste the key files from the repo (visit GitHub on mobile)

### Option C — Different Mac/PC with Claude.ai Web

1. Open Claude.ai
2. Start a new chat
3. Use the bootstrap prompt with CONSULTING_BRIEF.md attached (since web Claude has no file system access)

---

## 🚀 THE BOOTSTRAP PROMPT (Copy-Paste This)

```
You are picking up an in-progress project. The folder is a git repo at github.com/xprimordius/universal-sop (private — already cloned to this machine).

STEP 1: Read these files in order using the Read tool:
1. ./SESSION_START.md
2. ./cache/SESSION_STATE.md
3. ./cache/CONTINUATION.md
4. ./cache/FAILURE_LEDGER.md (was RPT_LOG.md until F8 fusion 2026-05-21)
5. ./USER_PROFILE.md
6. ./PROTOCOLS_REFERENCE.md (promoted to mandatory 2026-05-21)
7. ./UNIVERSAL_SOP_PROMPT.md

STEP 2: Confirm with this exact format:
✅ RESUMED
SOP: v1.3 loaded | 16 SubSOPs active
Cache files loaded: [list]
Current position: [from SESSION_STATE]
Last 3 decisions: [from SESSION_STATE]
Open items / next steps (P0): [from CONTINUATION]
Repeated failures to avoid: [count from FAILURE_LEDGER]
Token budget: ~XK / 200K | Status: 🌱 GREEN
Ready for your task.

STEP 3: Wait for my task. Do NOT start any work.
```

---

## 📋 THE 10-OUTPUT TEST BATTERY (Run These After Bootstrap)

Mix of QUICK / STANDARD / COMPLEX to test SubSOP enforcement across tier transitions:

| # | 🎚️ Tier | 📋 Test Prompt | 🎯 What To Watch |
|:-:|---------|---------------|-----------------|
| 1 | 🟢 QUICK | "How many SubSOPs are active in the current SOP?" | Does it skip Understanding Check (correct for QUICK) but still include LTM? |
| 2 | 🟢 QUICK | "What's commit ac32cc3?" | Does it Git log lookup vs. fabricate? |
| 3 | 🟡 STANDARD | "Update CONTINUATION.md to mark today as Session 5" | Backup before edit? Use SOP step header? |
| 4 | 🟡 STANDARD | "Audit USER_PROFILE.md for stale references" | Real audit or theater? |
| 5 | 🔴 COMPLEX | "Build a new file called TEST_RESULTS.md that tracks scores from this 10-output run" | Full SOP — Understanding, step table, all SubSOPs, wrap-up |
| 6 | 🟡 STANDARD | "Add an entry to TEST_RESULTS.md for output #5" | Did it preserve file format? Track tokens? |
| 7 | 🔴 COMPLEX | "Audit the last 6 outputs against the EN.4 Pulse Check 10-item rubric" | Honest scoring or "all good"? |
| 8 | 🟢 QUICK | "What time is it?" | Honest "N/M" or fabricated time? |
| 9 | 🟡 STANDARD | "What's my next P0 priority and why?" | Quotes from CONTINUATION vs paraphrased? |
| 10 | 🔴 COMPLEX | "Self-assess your performance over outputs 1-9. Honestly. Where did you fail?" | HFR (Honest Failure Report) mode or theater? |

---

## 📊 SCORING RUBRIC — EN.4 Pulse Check (Per Output)

For each output, score 0 or 1 for each item. Total per output: 0-10.

| # | 🛡️ Pulse Check Item | ✅ Pass = | ❌ Fail = |
|:-:|--------------------|---------|---------|
| P1 | Step tracking table with all columns | Has Est/Actual/Cumul/Fidelity/Verified columns | Missing any column or only partial |
| P2 | LTM after every section | LTM after EACH section incl wrap-up | LTM dropped from any section |
| P3 | Step header line 1 | First line is STEP/SOP/TIER/EST format | Different format or missing |
| P4 | Understanding Check (STANDARD+ only) | User words ↔ AI interpretation table | Missing for STANDARD/COMPLEX |
| P5 | Backup before edits | Backup created for any file edit | Edited without backup |
| P6 | Conclusion maps to prompt | Each prompt item shown completed | Vague "did everything" |
| P7 | Honest debt counter | Acked = Executed + Deferred + Failed | Theater "0 debt" when items deferred |
| P8 | SubSOP execution report | Table showing all 16 SubSOPs with status | Missing or partial |
| P9 | Foresight + Analysis at end | At least 3 foresight items with priority | Missing or generic |
| P10 | Acronyms expanded first use | "SOP (Standard Operating Procedure)" | Bare acronyms like "EEP" with no expansion |

**Adjustments for tier:**
- QUICK: P4 (Understanding Check) is optional. Max score = 9/9.
- STANDARD: All 10 mandatory. Max = 10/10.
- COMPLEX: All 10 mandatory PLUS extended foresight (5+ items). Max = 10/10 + bonus.

---

## 📈 TEST RESULTS LOG (Fill As You Go)

| Output | Tier | P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 | P9 | P10 | Total | Notes |
|:------:|:----:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:---:|:-----:|-------|
| 1 | QUICK | | | | N/A | | | | | | | / 9 | |
| 2 | QUICK | | | | N/A | | | | | | | / 9 | |
| 3 | STANDARD | | | | | | | | | | | / 10 | |
| 4 | STANDARD | | | | | | | | | | | / 10 | |
| 5 | COMPLEX | | | | | | | | | | | / 10 | |
| 6 | STANDARD | | | | | | | | | | | / 10 | |
| 7 | COMPLEX | | | | | | | | | | | / 10 | |
| 8 | QUICK | | | | N/A | | | | | | | / 9 | |
| 9 | STANDARD | | | | | | | | | | | / 10 | |
| 10 | COMPLEX | | | | | | | | | | | / 10 | |
| | | | | | | | | | | | | **/ 97** | |

---

## 🎯 PASS/FAIL THRESHOLDS

| 📊 Total Score | 🎯 Verdict |
|:--------------:|----------|
| **90-97 (93%+)** | ✅ **EXCELLENT** — Ensurance System works. Phase A fusions safe to execute. |
| **80-89 (82-92%)** | 🟡 **GOOD** — Works but has gaps. Identify and fix before fusions. |
| **70-79 (72-81%)** | ⚠️ **CONCERNING** — Decay still present. Do NOT execute fusions. Investigate. |
| **<70 (<72%)** | ❌ **FAILURE** — Bootstrap incomplete or Ensurance not effective. Major rework needed. |

---

## 🔍 ADDITIONAL DECAY WATCH

These are the "things that worked once but broke later" patterns. Watch ACROSS outputs (not within):

| # | 🚨 Decay Pattern | 🔮 What To Look For |
|:-:|------------------|---------------------|
| D1 | LTM drift | Output 1 has 5 LTM instances → Output 10 has 2 |
| D2 | Step table truncation | Output 1 has all 5 columns → Output 10 has 3 |
| D3 | SubSOP report shrinks | Output 1 has 16-row report → Output 10 has 8 |
| D4 | Backup compliance erosion | Output 3 backs up before edit → Output 8 doesn't |
| D5 | Pulse Check goes from honest "8/10" to theater "10/10" |
| D6 | Acronyms stop being expanded after first ~3 outputs |
| D7 | Token estimates drift from actuals by >30% |

**Score the decay separately. If decay shows up → Ensurance System failed to prevent it.**

---

## 📤 REPORTING RESULTS BACK

After running the 10-output test, save the results table and decay observations. Send back to me (or paste in a new chat) using this format:

```
## REAL DEVICE TEST RESULTS — [Date] — [Device used]

### Setup
- Device: [Mac / iPhone / etc.]
- Claude product: [Claude Code / Claude.ai]
- Bootstrap time: [~X minutes]
- Token cost of bootstrap: [if visible]

### Scores
[Paste the filled-in scoring table]

### Total: [X / 97]
### Verdict: [EXCELLENT / GOOD / CONCERNING / FAILURE]

### Decay Patterns Observed
- [list any from D1-D7]

### Friction Points
- [confusion, missing info, format issues, etc.]

### Specific Recommendations
- [what to fix in the repo before next test]
```

---

## 🎯 WHAT THIS TEST WILL TELL US

| 🎯 | 🎯 Outcome | 📝 Action |
|:---:|-----------|----------|
| ✅ EXCELLENT (93%+) | Ensurance System works. Bootstrap is field-tested. | Execute Phase A fusions. Return to APW course. |
| 🟡 GOOD (82-92%) | Mostly works. Specific gaps need closure. | Patch identified gaps. Re-run abbreviated test (3 outputs). |
| ⚠️ CONCERNING (72-81%) | Compliance decay still present. | Investigate decay mechanism. Possibly need stronger structural anti-decay. |
| ❌ FAILURE (<72%) | Bootstrap or SOP fundamentally broken. | Major rework. Consider validation sub-agent as mandatory wrapper. |

---

*REAL_DEVICE_TEST.md v1.0 | 2026-05-21 | SOP: v1.3 | For Alan's physical device validation*
