local M = {}

local function setup_treesitter()
  require("nvim-treesitter").install({
    "bash",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
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
end

function M.setup()
  setup_treesitter()

  require("mini.pairs").setup({})

  require("flash").setup({})
  -- Only jump: node selection is native in 0.12 (an/in, ]N/[N)
  vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
end

return M
