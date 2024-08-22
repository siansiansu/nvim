return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Import the LSP config module
      local lspconfig = require("lspconfig")

      -- Function to set up keymaps after LSP attaches to a buffer
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- LSP key mappings
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)           -- Go to definition
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)          -- Go to declaration
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)           -- List references
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)       -- Go to implementation
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                 -- Show hover information
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)    -- Show signature help
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)       -- Rename symbol
        vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)  -- Show code actions
        vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts) -- Show diagnostics
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)         -- Go to previous diagnostic
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)         -- Go to next diagnostic
      end

      -- Example setup for a language server (e.g., Pyright for Python)
      lspconfig.pyright.setup({
        on_attach = on_attach,
      })

      -- Setup additional language servers here
      -- lspconfig.tsserver.setup({
      --   on_attach = on_attach,
      -- })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded", -- Set the border style for the Mason UI
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
        },
        log_level = vim.log.levels.INFO,
        max_concurrent_installers = 4, -- Limit concurrent installations
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>m", ":Mason<CR>", { desc = "Open Mason", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>mi", ":MasonInstall<CR>", { desc = "Install Tool", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>mu", ":MasonUninstall<CR>", { desc = "Uninstall Tool", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ma", ":MasonUpdateAll<CR>",
        { desc = "Update All Tools", noremap = true, silent = true })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "tsserver" }, -- Automatically install these servers
        automatic_installation = true,
      })
      -- You can add more LSP-specific keymaps or configurations here
    end,
  },
}
