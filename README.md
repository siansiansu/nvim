# Neovim Config

Minimal config for Neovim >= 0.12. Leader key is `,`. Plugins are managed by the
built-in `vim.pack`, with no lazy loading — 12 plugins, ~32ms startup.

## Plugins

| Category | Plugins |
|----------|---------|
| Coding | treesitter (+textobjects), mini.pairs, flash.nvim |
| Editor | snacks.nvim (picker + explorer), gitsigns, which-key |
| LSP | mason, conform, nvim-lint |
| UI | onedarkpro, mini.icons |

Completion, statusline, diagnostics list, undo tree, and diff are all native.

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
| `<Leader>tt` | Toggle diagnostics | `<Leader>m` | Open Mason |
| `<Leader>?` | Buffer keymaps | | |

## Commands

`:Undotree` (undo history), `:DiffTool` (file/directory diff) — both bundled with Neovim.
