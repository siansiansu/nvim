return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        's1n7ax/nvim-window-picker',
        version = '*',
        config = function()
          require 'window-picker'.setup({
            autoselect_one = true,
            include_current_win = false,
            filter_rules = {
              bo = {
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                buftype = { 'terminal', "quickfix" },
              },
            },
          })
        end,
      },
    },
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      })

      -- Gitsigns Keymaps
      vim.api.nvim_set_keymap('n', '<Leader>gs', ':Gitsigns stage_hunk<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>gd', ':Gitsigns diffthis<CR>', { noremap = true, silent = true })
    end,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        auto_open = false,
        auto_close = false,
        use_diagnostic_signs = true,
      })

      vim.api.nvim_set_keymap('n', '<Leader>tt', ':TroubleToggle<CR>', { noremap = true, silent = true })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },
}
