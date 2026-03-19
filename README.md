# Neovim Config

Minimal config for Neovim >= 0.11. Leader key is `<Space>`.

## Plugins

| Category | Plugins |
|----------|---------|
| Coding | treesitter, blink.cmp, mini.pairs, flash.nvim |
| Editor | snacks.nvim (picker + explorer), gitsigns, trouble, which-key |
| LSP | lspconfig, mason, conform, nvim-lint |
| UI | onedarkpro, lualine, mini.icons |

## Custom Keymaps

LSP keymaps use Neovim 0.11 built-in defaults (`K`, `grn`, `gra`, `grr`, `gri`, `gO`, `[d`/`]d`). Only non-default bindings are listed below.

| Key | Action | Key | Action |
|-----|--------|-----|--------|
| `gd` / `gD` | Definition / Declaration | `<Leader>d` | Diagnostic float |
| `<Leader>e` | File explorer | `<Leader>cf` | Format buffer |
| `<Leader>ff` | Find files | `<Leader>fg` | Live grep |
| `<Leader>fb` | Buffers | `<Leader>fh` | Help tags |
| `]h` / `[h` | Next / Prev hunk | `<Leader>gs` | Stage hunk |
| `<Leader>gr` | Reset hunk | `<Leader>gb` / `<Leader>gd` | Blame / Diff |
| `s` / `S` | Flash jump / treesitter | `af`/`if`/`ac`/`ic` | Function / Class textobj |
