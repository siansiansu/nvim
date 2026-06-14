return {
  -- Treesitter (main branch — Neovim 0.12+ native API, no lazy-loading)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    config = function()
      require("nvim-treesitter").install({
        "bash", "css", "html", "javascript", "json", "lua",
        "markdown", "markdown_inline", "python", "typescript",
        "vim", "vimdoc", "yaml",
      })

      -- Enable highlighting + indentation per buffer when a parser is available
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if not (lang and vim.treesitter.language.add(lang)) then
            return
          end
          vim.treesitter.start(args.buf, lang)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- Textobjects (main branch requires explicit setup + keymaps)
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")

      for key, obj in pairs({
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      }) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(obj, "textobjects")
        end, { desc = "Select " .. obj })
      end

      for key, obj in pairs({ ["]f"] = "@function.outer", ["]c"] = "@class.outer" }) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_next_start(obj, "textobjects")
        end, { desc = "Next " .. obj })
      end

      for key, obj in pairs({ ["[f"] = "@function.outer", ["[c"] = "@class.outer" }) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          move.goto_previous_start(obj, "textobjects")
        end, { desc = "Prev " .. obj })
      end
    end,
  },

  -- Completion
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },

  -- Auto pairs
  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },

  -- Motion
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
}
