return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",  -- Update treesitter parsers after installation
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "json",
        },
        highlight = {
          enable = true,          -- Enable treesitter-based syntax highlighting
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,          -- Enable treesitter-based indentation
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,     -- Automatically jump forward to textobj
            keymaps = {
              ["aa"] = "@annotation.outer", -- Select outer annotation
              ["ia"] = "@annotation.inner", -- Select inner annotation
              ["af"] = "@function.outer",   -- Select outer function
              ["if"] = "@function.inner",   -- Select inner function
              ["ac"] = "@class.outer",      -- Select outer class
              ["ic"] = "@class.inner",      -- Select inner class
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next = {
              ["]f"] = "@function.outer", -- Go to next function
              ["]c"] = "@class.outer",    -- Go to next class
            },
            goto_previous = {
              ["[f"] = "@function.outer", -- Go to previous function
              ["[c"] = "@class.outer",    -- Go to previous class
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    config = function()
    end,
  },
}
