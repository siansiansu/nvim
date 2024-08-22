return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",  -- Automatically format files on save
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          javascript = { "prettier" },
        },
      })
      vim.api.nvim_set_keymap('n', '<Leader>cf', ':ConformFormat<CR>', { noremap = true, silent = true })
    end,
  }
}
