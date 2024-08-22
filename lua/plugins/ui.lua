return {
  {
    {
      "navarasu/onedark.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme onedark]])
      end,
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    lazy = false,
    priority = 1000,
    opts = {
      theme = 'onedark',
    }
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure that devicons are installed
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- Show buffers instead of tabs
          numbers = "none", -- Display buffer numbers (none, ordinal, or both)
          close_command = "bdelete! %d", -- Command to close buffer
          right_mouse_command = "bdelete! %d", -- Command for right-click to close buffer
          left_mouse_command = "buffer %d", -- Command for left-click to switch buffer
          middle_mouse_command = nil, -- Command for middle-click (if any)
          indicator = {
            style = "underline", -- Style of the indicator for the current buffer
          },
          modified_icon = "●", -- Icon for modified buffer
          show_buffer_icons = true, -- Show icons for buffers
          show_buffer_close_icons = true, -- Show close icons for buffers
          show_close_icon = false, -- Show close icon on the bufferline itself
          show_tab_indicators = true, -- Show tab indicators
          show_duplicate_prefix = "", -- Prefix for duplicate buffers
          separator_style = "slant", -- Style of separators
          enforce_regular_tabs = false, -- Enforce regular tabs or use buffer settings
          always_show_bufferline = true, -- Always show the bufferline
        },
      })
    end,
  },
  {
    "echasnovski/mini.icons",
    config = function()
      require("mini.icons").setup({
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#1e1e1e", -- Background color of notifications
        stages = "fade_in_slide_out",  -- Animation stages
        timeout = 3000,                -- Timeout for notifications
        top_down = true,               -- Position notifications from top to bottom
      })
      vim.notify = require("notify")
    end,
  },
}
