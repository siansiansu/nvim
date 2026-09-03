local M = {}

local ensure_installed = {
  "lua-language-server",
  "pyright",
  "typescript-language-server",
  "stylua",
  "prettier",
  "ruff",                                             -- nvim-lint and conform's ruff_format
  "eslint_d",
}

local function setup_mason()
  require("mason").setup()
  vim.keymap.set("n", "<Leader>m", "<cmd>Mason<CR>", { desc = "Open Mason" })

  -- Startup path: only hit the network when something is actually missing
  local registry = require("mason-registry")
  local installed = {}
  for _, name in ipairs(registry.get_installed_package_names()) do
    installed[name] = true
  end

  local missing = vim.tbl_filter(function(name) return not installed[name] end, ensure_installed)
  if #missing == 0 then
    return
  end

  registry.refresh(function()
    for _, name in ipairs(missing) do
      local ok, pkg = pcall(registry.get_package, name)
      if ok and not pkg:is_installed() then
        pkg:install()
      end
    end
  end)
end

local function setup_conform()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
    },
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  })

  vim.keymap.set("n", "<Leader>cf", function()
    require("conform").format({ async = true })
  end, { desc = "Format buffer" })
end

local function setup_lint()
  local lint = require("lint")
  lint.linters_by_ft = {
    python = { "ruff" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
  }

  vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("UserLinting", { clear = true }),
    callback = function() lint.try_lint() end,
  })
end

function M.setup()
  setup_mason()
  setup_conform()
  setup_lint()
end

return M
