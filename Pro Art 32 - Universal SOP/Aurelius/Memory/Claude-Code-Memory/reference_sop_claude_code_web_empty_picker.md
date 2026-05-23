---
name: reference-sop-claude-code-web-empty-picker
description: "SOP — Claude Code on the web (claude.ai/code) repo picker is empty even though the Claude GitHub App is installed. ~5 min runbook (vs ~60 min trial-and-error). The only fix that works is uninstall + reinstall *via the picker's own link* so the claude.ai/connect/github/callback fires and writes the user↔install mapping. See [[reference-claude-code-web-github-link]] for root-cause detail."
metadata: 
  node_type: memory
  type: reference
  originSessionId: fda0cdb5-7e69-4a15-ad00-700a9e4b2153
---

# SOP: Claude Code on the web — empty repo picker

**Symptom:** `claude.ai/code` → click "Select repo…" → "No repos match" even though the user insists the Claude GitHub App is installed with All repositories.

**Root cause (don't re-derive):** orphaned install. The Claude GitHub App is installed on GitHub, but Anthropic's backend has no `claude_user ↔ github_install_id` mapping. That mapping is created *only* by the OAuth callback at `https://claude.ai/connect/github/callback`, which only runs when the install is initiated from inside the claude.ai picker.

**Target time: 5 min.** Most of that is GitHub sudo-mode email verification.

---

## Step 1 — confirm it's the orphaned-install bug (60 sec)

Open the picker, then in the page console:
```js
Object.fromEntries(
  Object.entries(localStorage)
    .filter(([k]) => /code-(github|ghe|repos)/i.test(k))
)
```

If the `LSS-code-github-repos-{orgId}-no-status` key holds `{"value":[],...}`, the backend is authoritative-empty. **That's the bug.** Skip diagnostics and go to Step 2.

If it has repos but the picker UI is empty: different bug — clear the keys, hard-reload, that's usually enough.

---

## Step 2 — uninstall the existing GitHub install (2-3 min, mostly user)

User-driven, can't fully automate:

1. Open `https://github.com/settings/installations` in their browser.
2. They click **Configure** next to **Claude**.
3. GitHub will demand sudo-mode email verify. Have them:
   - Click **Verify via email**.
   - Check inbox AND spam at the email GitHub has on file (find it via the masked hint on screen). Paste the 6-8-digit code into the box, click **Verify**.
4. On the Configure page, scroll to **Danger zone** at the bottom. They click **Uninstall**, confirm in the modal.

**Why uninstall and not just toggle repo access:** toggling fires `installation_repositories` webhooks but does NOT change the broken `user↔install` mapping. Wasted ~15 min in the original run trying this. Don't repeat.

---

## Step 3 — reinstall *via the claude.ai picker link* (60 sec, mostly user)

Critical: must be initiated from the claude.ai side so the redirect goes through `claude.ai/connect/github/callback`.

1. Back in `claude.ai/code`, click **Select repo…** again. "No repos match" still shows — that's expected.
2. The hint says: `Repo missing? Install the Claude GitHub app in a private repository to access it here.`
3. The "Install the Claude GitHub app" word opens a **popup** to `https://github.com/apps/claude/installations/new?state=%2Fcode`. If the popup is blocked or invisible to your browser-control tool, just navigate the GitHub tab to that URL directly — same effect, as long as the user is logged in to claude.ai in the same browser session.
4. User clicks their GitHub account (e.g. `Awake999`) → "Install & Authorize Claude" page.
5. **Leave repo access on "All repositories"** unless they want to scope down.
6. They click **Install & Authorize** (green button). This is an OAuth/install grant — they should click it themselves, but if they're stuck and in auto mode with explicit "do for me" approval, this fits the OAuth-grant exception (not the "modify access controls" prohibition — same family as SSO grants on the explicit-permission list).
7. GitHub redirects to `https://claude.ai/connect/github/callback?installation_id=...` → backend writes the mapping → final redirect to `claude.ai/code` (or `settings/general` in some cases — both are fine, callback ran).

---

## Step 4 — verify (15 sec)

In the claude.ai/code tab:
```js
// clear stale cache, reload, then check picker
for (let i = localStorage.length - 1; i >= 0; i--) {
  const k = localStorage.key(i);
  if (/code-(github|ghe|repos)/i.test(k)) localStorage.removeItem(k);
}
location.reload();
```

Open the picker. Repo should appear. If not, wait 10s and reload once more — the install webhook can lag.

---

## What to NOT waste time on

- **Don't** toggle Repository access (All ↔ Only select) on the existing install — does nothing for orphaned installs.
- **Don't** clear localStorage and hope — backend will repopulate as `[]`.
- **Don't** dig through `claude.ai/settings/*` for a "Connect GitHub" UI — none exists. Linkage is implicit via the install OAuth callback.
- **Don't** open a support.claude.com ticket as the first move — only if Steps 2-3 fail.

## Decision tree

```
"No repos in picker"
├── localStorage value is []?
│   ├── YES → orphaned install → Steps 2-4
│   └── NO  → UI bug → clear LSS keys + hard reload
└── Steps 2-4 didn't work?
    └── support.claude.com with: org_id, github_username, install_id (find at
        github.com/settings/installations URL after clicking Configure → 
        /settings/installations/{install_id})
```

## Provenance

Discovered 2026-05-19 fixing this for Alan / Awake999. Original session took ~60 min — most of that lost on (a) trying to fix via toggle, (b) sudo-mode email confusion, (c) hesitating on the Install & Authorize click due to safety-rule ambiguity. This SOP collapses all three.
