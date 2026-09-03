-- Language servers and formatters are installed with Homebrew; see README.
local M = {}

function M.setup()
  require("conform").setup({
    formatters_by_ft = {
      -- python is absent on purpose: the ruff language server formats, and
      -- lsp_format = "fallback" below picks it up
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
    },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  })

  vim.keymap.set(
    "n",
    "<Leader>cf",
    function() require("conform").format({ async = true }) end,
    { desc = "Format buffer" }
  )
end

return M
