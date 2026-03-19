return {
  -- Icons (must load first)
  {
    "echasnovski/mini.icons",
    lazy = false,
    priority = 1001,
    config = function()
      require("mini.icons").setup({})
      MiniIcons.mock_nvim_web_devicons()
    end,
  },

  -- Colorscheme
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("onedark")
    end,
  },

  -- Statusline
  {
    "nvim-mini/mini.statusline",
    lazy = false,
    opts = {},
  },
}
