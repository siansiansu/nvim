return {
  -- Mason (package manager for LSP/formatters/linters)
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
      local ensure_installed = {
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "stylua",
        "prettier",
        "eslint_d",
      }
      local registry = require("mason-registry")
      registry.refresh(function()
        for _, name in ipairs(ensure_installed) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
      vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Open Mason" })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    },
    keys = {
      { "<Leader>cf", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
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
    end,
  },
}
