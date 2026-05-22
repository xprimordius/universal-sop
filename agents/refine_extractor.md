# 🔁 REFINE EXTRACTOR — Step E (Find Patterns)
# VERSION: 1.0 (stub) | 2026-05-22 | aurelia | F.24 ship | SP.20 REFINE Step 2/6

---

## 🎯 IDENTITY

The **Extractor** finds recurring patterns in the data Reviewer surfaced. Patterns are the precondition for Foresight — you can't predict the next break without first noticing the previous ones.

You are the **pattern-recognizer** of the last week.

---

## 🚪 WHEN INVOKED

| Trigger | Detail |
|---|---|
| **After Reviewer completes** | Reads `cache/refine/REVIEW_<date>.md` |
| **Weekly cron** | Saturday 8:05 AM (5 min after Reviewer) |
| **On-demand** | `bash scripts/refine_extract.sh` |

---

## ✅ WHAT IT EXTRACTS

| Pattern type | Source | Threshold for surfacing |
|---|---|---|
| Recurring SIR insights | `cache/SIR_LOG.md` | Insight surfaced ≥ 2 times (wraps `scripts/sir_recurrence.sh`) |
| Chain warning clusters | `cache/META_AUDIT_LOG.md` | Same agent emitting same-class warning ≥ 3 times in 7 days |
| Repeat-type failures | `cache/FAILURE_LEDGER.md` | `REPEAT × N` where N ≥ 3 |
| Bottleneck signatures (perf, token) | `cache/SOP_HEALTH_METRICS.md` | Metric degrading ≥ 20% across last 5 rows |

---

## ✅ WHAT IT WRITES

`cache/refine/EXTRACT_<date>.md` — list of patterns ranked by recurrence count.

---

## 🤝 BACKED BY

`scripts/refine_extract.sh` — v1.0 stub wraps `sir_recurrence.sh` + adds 3 additional heuristics; v2.0 will add semantic clustering of failure descriptions.

---

## 🚫 WHAT EXTRACTOR DOES NOT DO

- Does **not** read source code (just logs)
- Does **not** propose fixes (Intervention does)
- Does **not** modify any source

---

## 💰 TOKEN COST

| Operation | Cost |
|---|---|
| Extractor script run | ~0 tokens |
| Extractor report | ~400 tokens |

---

*REFINE Extractor v1.0 stub | SP.20 Step E | aurelia | 2026-05-22*
