# NeoVim Config

Minimal NeoVim configuration for NeoVim >= 0.11

## Structure

```
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── config/lazy.lua    # Settings & lazy.nvim bootstrap
    └── plugins/
        ├── coding.lua     # Treesitter, completion, pairs, motion
        ├── editor.lua     # File explorer, search, git, diagnostics
        ├── lsp.lua        # LSP, formatting, linting
        └── ui.lua         # Theme, statusline, icons
```

## Key Mappings

| Key | Action |
|-----|--------|
| `<Space>` | Leader |
| `<Leader>e` | File explorer |
| `<Leader>ff` | Find files |
| `<Leader>fg` | Live grep |
| `<Leader>fb` | Buffers |
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover |
| `<Leader>ca` | Code action |
| `<Leader>cf` | Format |
| `s` | Flash jump |

## Plugins

- **Coding**: treesitter, nvim-cmp, mini.pairs, flash.nvim
- **Editor**: neo-tree, telescope, gitsigns, trouble, which-key
- **LSP**: lspconfig, mason, conform, nvim-lint
- **UI**: onedark, lualine, mini.icons
