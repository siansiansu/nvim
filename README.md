# nvim

This setup is for [neovim >= v0.5.0](https://github.com/neovim/neovim/releases/tag/v0.5.0)

## Plugins

* [wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim) - Plugin Manager

* [Th3Whit3Wolf/one-nvim](https://github.com/Th3Whit3Wolf/one-nvim) - Colorscheme

* [hoob3rt/lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - Statusline

* [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Icon

* [kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - File explorer

* [liuchengxu/vista.vim](https://github.com/liuchengxu/vista.vim) - LSP symbols and tags

* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Nvim LSP client

* [ray-x/lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) - LSP signature hint as you type

* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git signs

* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - Git wrapper

* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlight

* [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent

* [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Autopairs

* [andymass/vim-matchup](https://github.com/andymass/vim-matchup) - Highlight matching words

* [Pocco81/TrueZen.nvim](https://github.com/Pocco81/TrueZen.nvim) - Editor support

* [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy Finder

* [nvim-telescope/telescope-media-files.nvim](https://github.com/nvim-telescope/telescope-media-files.nvim) - Preview media files for telescope

* [nvim-telescope/telescope-fzy-native.nvim](https://github.com/nvim-telescope/telescope-fzy-native.nvim) - FZY style sorter for telescope

* [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim) - Popup

* [phaazon/hop.nvim](https://github.com/phaazon/hop.nvim) - Motions

* [sbdchd/neoformat](https://github.com/sbdchd/neoformat) - formatting

* [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion

* [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim builtin LSP client

* [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion source for nvim-cmp

## Directory tree of Lua files

```
.
├── LICENSE
├── README.md
├── init.lua
├── lua
│   ├── keymaps.lua
│   ├── modules
│   │   ├── autopairs.lua
│   │   ├── barbar.lua
│   │   ├── colors.lua
│   │   ├── completion.lua
│   │   ├── dashboard.lua
│   │   ├── feline.lua
│   │   ├── file_name.lua
│   │   ├── format.lua
│   │   ├── gitsigns.lua
│   │   ├── hop.lua
│   │   ├── indent.lua
│   │   ├── lspconfig.lua
│   │   ├── lspkind.lua
│   │   ├── nvimtree.lua
│   │   ├── statusline.lua
│   │   ├── telescope.lua
│   │   ├── terminal.lua
│   │   ├── treesitter.lua
│   │   └── truezen.lua
│   ├── plugins.lua
│   └── settings.lua
└── plugin
    └── packer_compiled.lua
```

## Files and settings

* [init.lua](init.lua): Main configuration file.

* [lua](lua): Folder of `lua` modules.

* [keymaps.lua](lua/keymaps.lua): Keymaps configuration file.

* [settings.lua](lua/settings.lua): General Neovim settings.

* [modules/](lua/modules): Plugin configuration files.
