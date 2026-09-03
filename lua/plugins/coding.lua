local M = {}

local function setup_treesitter()
  require("nvim-treesitter").install({
    "bash", "css", "html", "javascript", "json", "lua",
    "markdown", "markdown_inline", "python", "typescript",
    "vim", "vimdoc", "yaml",
  })

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

  -- The main branch ships no default setup or keymaps
  require("nvim-treesitter-textobjects").setup({
    select = { lookahead = true },
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
end

function M.setup()
  setup_treesitter()

  require("mini.pairs").setup({})

  require("flash").setup({})
  vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
  vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
end

return M
