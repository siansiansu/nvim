---
name: nvim-plugins
description: Review installed Neovim plugins for maintenance status, community standing, deprecation, and author origin. Use when the user wants to check if their plugins are still the best choice.
allowed-tools: Read, Glob, Grep, Bash(nvim *), Agent, Edit, Write
---

# Neovim Plugin Review

Review all installed plugins for freshness and suitability.

## Step 1: Gather plugin list

1. Read all plugin specs under `lua/plugins/`
2. Read `lazy-lock.json` for installed versions

## Step 2: Evaluate each plugin

For each plugin in the config, use web search to verify and evaluate:

- **Maintenance status**: Is it actively maintained (commits in last 6 months) or abandoned?
- **Community standing**: Is it still the mainstream/standard choice, or has a widely-adopted replacement emerged?
- **Deprecation**: Has the plugin been archived or deprecated?
- **Author origin**: Do not use plugins developed by Chinese developers. If a current plugin is by a Chinese developer, flag it for replacement and suggest a non-Chinese alternative.
- **Native replacement**: Check if the plugin's functionality is now available as a Neovim built-in feature in the installed version. Prefer native over plugin whenever possible. If a native alternative exists, flag the plugin for removal and describe the native approach.

## Step 3: Check for orphaned entries

- Compare plugins in `lazy-lock.json` against plugin specs in `lua/plugins/`
- Flag entries in lock file not referenced by any spec

## Output format

```
## Plugin Review Results

| Plugin | Author | Status | Action | Notes |
|--------|--------|--------|--------|-------|
```

- **Status**: Active / Stable / Stale / Archived / Flagged
- **Action**: None / Replace / Remove / Monitor

After presenting the report, ask the user which items they want to fix. Do NOT make changes until confirmed.
