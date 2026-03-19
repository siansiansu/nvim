# Project Guidelines

## Structure

Plugins are split into 4 files by role. Add new plugins to the matching file:

- `lua/plugins/coding.lua` — treesitter, completion, pairs, motion
- `lua/plugins/editor.lua` — file explorer, picker, git, diagnostics, which-key
- `lua/plugins/lsp.lua` — LSP servers, formatting, linting
- `lua/plugins/ui.lua` — colorscheme, statusline, icons

## Rules

- **Use Neovim 0.11+ native API**: `vim.lsp.config()` + `vim.lsp.enable()`, not `require('lspconfig')` framework
- **Keybindings**: Use Neovim built-in defaults first, only add custom keymaps for missing functionality
- **Plugin selection**: Prefer Neovim built-in > actively maintained mainstream plugin. Do not introduce low-maintenance or archived plugins
- **Lazy loading**: Every plugin should use appropriate lazy strategy (event, cmd, keys, ft) unless it must load at startup
- **Autocmds**: Always use named augroups with `{ clear = true }`
- **Settings order**: `mapleader` and `vim.opt` must be set before `lazy.setup()`

## Validation

After modifying config, verify no startup errors:

```bash
nvim --headless -c 'qa!' 2>&1
```

## Commits

Follow existing style: lowercase, short description of what changed (e.g., `update configurations`).
