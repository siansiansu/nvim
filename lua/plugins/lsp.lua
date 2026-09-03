-- Language servers, formatters and linters are installed with Homebrew; see README.
local M = {}

local function setup_conform()
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

local function setup_lint()
  local lint = require("lint")
  -- python is absent on purpose: ruff is a language server, so its diagnostics
  -- arrive natively and live, instead of on write through this bridge
  lint.linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
  }

  vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("UserLinting", { clear = true }),
    callback = function() lint.try_lint() end,
  })
end

function M.setup()
  setup_conform()
  setup_lint()
end

return M
