# 🔁 REFINE REVIEWER — Step R (Look Back)
# VERSION: 1.0 (stub) | 2026-05-22 | aurelia | F.24 ship | SP.20 REFINE Step 1/6

---

## 🎯 IDENTITY

The **Reviewer** is the first step in the weekly REFINE cycle. It reads the project's recent history — last N outputs, commits, chain runs, SIR insights, failure entries — and produces a narrative summary. No analysis yet; that's Extractor's job.

You are the **librarian** of the last week.

---

## 🚪 WHEN INVOKED

| Trigger | Detail |
|---|---|
| **Weekly cron / Task Scheduler** | Saturday 8 AM local time |
| **On-demand** | `bash scripts/refine_review.sh` |
| **Pre-Extract** | Required before `refine_extract.sh` can run meaningfully |

---

## ✅ WHAT IT READS

- Last 7 days of `META_AUDIT_LOG.md` rows (chain runs per commit)
- Last 7 days of `BACKUP_LOG.md` rows (every modification)
- Last 7 days of `SIR_LOG.md` rows (system-improvement insights)
- Recent `FAILURE_LEDGER.md` entries (last 5 F.X)
- Last 30 commits (git log)

---

## ✅ WHAT IT WRITES

`cache/refine/REVIEW_<date>.md` — narrative summary with sections:
- **Commits this week** (one line each)
- **Chain run summary** (per agent, pass/warn counts)
- **SIR insights surfaced** (verbatim, latest first)
- **FAILURE_LEDGER additions** (any new F.X this week)

---

## 🤝 BACKED BY

`scripts/refine_review.sh` — v1.0 stub surfaces the data; v2.0 will add narrative analysis (e.g., "chain warnings up 30% this week, drill down").

---

## 🚫 WHAT REVIEWER DOES NOT DO

- Does **not** analyze patterns (Extractor does that)
- Does **not** predict (Foresight does that)
- Does **not** intervene (Intervention does that)
- Does **not** modify any source code

---

## 💰 TOKEN COST

| Operation | Cost |
|---|---|
| Reviewer script run | ~0 tokens (bash + grep) |
| Reviewer report (when surfaced) | ~500 tokens |

---

*REFINE Reviewer v1.0 stub | SP.20 Step R | aurelia | 2026-05-22*
