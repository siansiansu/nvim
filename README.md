# nvim

This setup is for [neovim >= v0.10.1](https://github.com/neovim/neovim/releases/tag/v0.10.1)

## Plugins

- Coding
  - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  - [echasnovski/mini.pairs](https://github.com/echasnovski/mini.pairs)
  - [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak)
- Editor
  - [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
  - [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
  - [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- Formatting
  - [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
- Linting
  - [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- LSP
  - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- Search
  - [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
  - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Treesitter
  - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- UI
  - [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim)
  - [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
  - [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
  - [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)
  - [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- Utils
  - [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

## Directory tree of Lua files

```shell
.
├── LICENSE
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   └── lazy.lua
    ├── plugins
    │   ├── coding.lua
    │   ├── editor.lua
    │   ├── formatting.lua
    │   ├── linting.lua
    │   ├── lsp.lua
    │   ├── search.lua
    │   ├── treesitter.lua
    │   ├── ui.lua
    │   └── utils.lua
    └── settings.lua
```
