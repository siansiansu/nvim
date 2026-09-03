# Neovim Config

Minimal config for Neovim >= 0.12. Leader key is `,`. Plugins are managed by the
built-in `vim.pack`, with no lazy loading — 9 plugins, ~25ms startup.

## Plugins

| Category | Plugins |
|----------|---------|
| Coding | treesitter (+textobjects), mini.pairs, flash.nvim |
| Editor | snacks.nvim (picker + explorer), gitsigns |
| LSP | conform, nvim-lint |
| UI | onedarkpro |

Completion, statusline, diagnostics list, undo tree, and diff are all native.
The colorscheme is not: built-in schemes only define legacy highlight groups,
which leaves most treesitter captures at the Normal foreground.

## Setup

Plugins install themselves on first launch. Language servers, formatters and
linters come from Homebrew rather than mason:

```sh
brew install lua-language-server pyright ruff stylua prettier \
  typescript-language-server eslint_d
```

## Custom Keymaps

LSP keymaps use Neovim built-in defaults (`K`, `grn`, `gra`, `grr`, `gri`, `gO`, `[d`/`]d`).
Completion is native: `<C-y>` accepts, `<C-e>` dismisses, `<C-x><C-f>` completes paths.
Only non-default bindings are listed below.

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `gd` / `gD` | Definition / Declaration | `<Leader>d` | Diagnostic float |
| `<Leader>e` | File explorer | `<Leader>cf` | Format buffer |
| `<Leader>ff` | Find files | `<Leader>fg` | Live grep |
| `<Leader>fb` | Buffers | `<Leader>fh` | Help tags |
| `]h` / `[h` | Next / Prev hunk | `<Leader>gs` | Stage hunk |
| `<Leader>gr` | Reset hunk | `<Leader>gb` / `<Leader>gd` | Blame / Diff |
| `s` / `S` | Flash jump / treesitter | `af`/`if`/`ac`/`ic` | Function / Class textobj |
| `]f`/`[f` | Next / Prev function | `]c`/`[c` | Next / Prev class |
| `<Leader>tt` | Toggle diagnostics | | |

## Commands

`:Undotree` (undo history), `:DiffTool` (file/directory diff) — both bundled with Neovim.
