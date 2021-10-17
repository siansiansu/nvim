local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Th3Whit3Wolf/one-nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim', opt = true},
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'tpope/vim-fugitive'
--   use 'lukas-reineke/indent-blankline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim', opt = true},
      {'nvim-lua/plenary.nvim', opt = true},
      {'nvim-telescope/telescope-media-files.nvim', opt = true},
      {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
    }
  }
  use {
    'phaazon/hop.nvim',
    as = 'hop',
  }
  use 'windwp/nvim-autopairs'
  use 'Pocco81/TrueZen.nvim'
  use 'andymass/vim-matchup'
  use 'hashivim/vim-terraform'
  use 'sbdchd/neoformat'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'
  -- use 'glepnir/lspsaga.nvim'
end)
