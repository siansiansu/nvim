---
name: nvim-review
description: Review Neovim config for best practices, redundancy, health, keybindings, and documentation. Use when the user wants to audit their Neovim configuration (excluding plugin freshness — use /nvim-plugins for that).
allowed-tools: Read, Glob, Grep, Bash(nvim *), Bash(brew info *), Edit, Write, Agent
---

# Neovim Config Review

Perform a comprehensive review of this Neovim configuration. Run all checks below, then present a single consolidated report with actionable items grouped by category.

## Step 1: Gather context

1. Read all config files under `lua/config/` and `lua/plugins/`
2. Check the installed Neovim version: `nvim --version | head -1`
3. Check the latest available version: `brew info neovim 2>/dev/null | head -1`
4. Read `lazy-lock.json` for installed plugin versions

## Step 2: Check Neovim version

- Compare installed vs latest stable
- If outdated, note the version gap

## Step 3: Check Neovim best practices

Check against the **installed Neovim version's** capabilities:

- **Built-in features**: Are there plugins or manual configs that duplicate functionality now built into Neovim? (e.g., LSP keymaps, diagnostic navigation, comment toggling)
- **API usage**: Are deprecated APIs being used? (e.g., `require('lspconfig')` framework in 0.11+, `vim.diagnostic.goto_prev/next` in 0.11+)
- **Config ordering**: Are `vim.g.mapleader` and `vim.opt` settings placed before `lazy.setup()`?
- **Lazy loading**: Are plugins using appropriate lazy-loading strategies (event, cmd, keys, ft)?
- **Augroups**: Do autocmds use named groups with `{ clear = true }` to prevent duplicates on reload?

Reference Neovim's built-in help when needed:
```
nvim --headless -c 'help <topic>' -c 'w! /tmp/nvim-help.txt' -c 'qa!'
```

## Step 4: Check for redundancy

- **Redundant plugins**: Plugins whose functionality is now built into Neovim core or fully covered by another plugin already in the config
- **Redundant settings**: Options that match Neovim defaults or are unused by current plugins (check comments referencing old plugins)
- **Orphaned lock entries**: Plugins in `lazy-lock.json` not referenced by any spec
- **Duplicate keymaps**: Custom keymaps that duplicate Neovim built-in defaults
- **Overlapping plugins**: Multiple plugins providing the same functionality

## Step 5: Health & runtime checks

### Neovim health check
Run checkhealth for key modules and report errors/warnings:
```
nvim --headless +"checkhealth vim.lsp" +"w! /tmp/nvim-health-lsp.txt" +"qa!"
nvim --headless +"checkhealth vim.treesitter" +"w! /tmp/nvim-health-ts.txt" +"qa!"
```

### External dependencies
Verify that external tools required by plugins are installed and available in `$PATH`:
- **Pickers**: `rg` (ripgrep), `fd`
- **Formatters/Linters**: Check each tool listed in conform.nvim `formatters_by_ft` and nvim-lint `linters_by_ft` (e.g., `stylua`, `prettier`, `ruff`, `eslint_d`)
- **Other**: `git`, `node`/`npm` (for LSP servers)

For each tool, run `command -v <tool>` to check availability. Flag missing tools.

### Mason tool status
Check that all tools in Mason `ensure_installed` are actually installed:
```
ls ~/.local/share/nvim/mason/bin/
```

### Treesitter parser status
Check that all parsers in `ensure_installed` are present:
```
ls ~/.local/share/nvim/lazy/nvim-treesitter/parser/
```
Compare against languages listed in treesitter `ensure_installed`.

### Startup performance
Measure startup time and identify slow plugins:
```
nvim --headless --startuptime /tmp/nvim-startup.log +"qa!"
```
Parse the log to find plugins taking >5ms. Flag any that seem excessively slow.

## Step 6: Keybinding conflict check

- Collect all custom keymaps defined across all plugin specs and autocmds
- Check for duplicate or overlapping bindings (same key mapped to different actions)
- Check for keymaps that shadow important Neovim built-in defaults unintentionally
- Present conflicts as a table with key, source, and action

## Step 7: Check documentation

- Compare `README.md` against actual config: plugin list, keybindings, structure
- Flag any outdated or missing entries

## Output format

Present findings as a single table per category:

```
## Review Results

### Neovim Version
(current vs latest)

### Best Practices
| # | Issue | Location | Description |
|---|-------|----------|-------------|

### Redundancy
| # | Item | Location | Reason |
|---|------|----------|--------|

### Health & Runtime
| # | Check | Status | Detail |
|---|-------|--------|--------|

### Keybinding Conflicts
| Key | Source A | Source B | Conflict |
|-----|---------|---------|----------|

### Documentation
| # | Issue | Description |
|---|-------|-------------|
```

After presenting the report, ask the user which items they want to fix. Do NOT make changes until confirmed.
