---
title: recommended_plugins.md
source: claude
type: project-doc
project: Credit Data Sheets
person: alan
created: "2026-05-15T22:52:06.136935+00:00"
uuid: ef364265-db6e-4da0-9a49-8102af747828
tags:
  - claude
  - alan
  - credit
---
# recommended_plugins.md

> [!info] From project: [[_Project Info|Credit Data Sheets]]

---
title: Recommended Obsidian Plugins for APW
tags: [APW, obsidian, plugins]
---

# Recommended Obsidian Plugins

## Tier 1 · Install First (Highest Value)

### Dataview
- **Why:** Query your vault like a database
- **Use case:** "Show all banks with bureau=Experian and underwriter=Elan"
- **Example query:**
```dataview
TABLE bureau, underwriter, geo_locked
FROM "01_Canonical_Data"
WHERE contains(file.name, "STATE_INDEX")
```

### Kanban
- **Why:** Track bank application status visually
- **Use case:** Card columns = Pending · Approved · Denied · Recon Pending · Activated
- **Setup:** Create "Application_Tracker.md" → toggle Kanban view

### Calendar
- **Why:** D-Day execution scheduling
- **Use case:** Visual block for prep weeks, D-Day, follow-up phases
- **Pair with:** Daily Notes core plugin

---

## Tier 2 · High Value

### Templater
- **Why:** Auto-fill templates for recurring tasks
- **Use case:** "New Bank Application Note" template with bank · UW · bureau · date · status fields

### Excalidraw
- **Why:** Hand-drawn diagrams
- **Use case:** Wave 1-5 timeline visualization · UW clustering maps

### Tag Wrangler
- **Why:** Rename tags across all files at once
- **Use case:** When restructuring tags later

---

## Tier 3 · Nice to Have

### JSON to Markdown
- **Why:** View CANONICAL_FACTS.json as readable note
- **Use case:** Browse the JSON without leaving Obsidian

### Style Settings
- **Why:** Customize appearance per theme
- **Use case:** Dark mode tweaks to match Alan's aesthetic (rounded · purple/cyan accents)

### Advanced Tables
- **Why:** Better table editing experience
- **Use case:** Editing the many tables in this migration package

### Mind Map
- **Why:** Visualize hierarchical relationships
- **Use case:** Stack tiers · underwriter clusters

---

## Tier 4 · Optional

### QuickAdd
- Quick capture for new bank/inquiry data

### Periodic Notes
- Weekly · monthly review templates

### Tasks
- GTD-style task management within Obsidian

---

## Configuration Recommendations

### Theme
- **Minimal Theme** by Stephan Ango (clean · readable · works with all plugins)
- Or **Things** by colineckert (rounded · warm · matches Alan's aesthetic)

### Settings → Editor
- ✅ Spell check ON
- ✅ Default editing mode: "Live Preview"
- ✅ Show line numbers ON
- ✅ Strict line breaks OFF

### Settings → Files & Links
- ✅ Default location for new notes: "In the folder of the current file"
- ✅ Automatically update internal links ON
- ✅ Detect all file extensions ON

### Settings → Hotkeys
- Custom: Cmd+Shift+O → "Open Daily Note"
- Custom: Cmd+Shift+K → "Open Kanban Board"

---

## Plugin Installation Order

1. Restart Obsidian
2. Settings → Community Plugins → "Turn on community plugins"
3. Browse → search each plugin name
4. Install one at a time
5. After install: click "Options" to configure
6. Test in a small note before relying on it

---

## What You DON'T Need

Skip these for APW:
- ❌ Audio plugins (no podcast/recording work)
- ❌ Citation plugins (no academic work)
- ❌ Pandoc plugins (not converting to other formats)
- ❌ AI plugins INSIDE Obsidian (use Claude Project for AI work instead)

Keep Obsidian as your **local source of truth and reference**. AI work happens in Claude Projects.

---

## Total Plugins to Install

**Minimum useful setup:** 3 plugins (Dataview · Kanban · Calendar)
**Recommended setup:** 6 plugins (above + Templater · Excalidraw · Style Settings)
**Power user setup:** 10+ plugins (full Tier 1-3 list)

Start minimum. Add as needed.
