-- Highlighting, folding and indentation; the parsers the plugin installs
local M = {}

-- CI reads this too, to wait until every parser has installed
M.parsers = {
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
}

function M.setup()
  require("nvim-treesitter").install(M.parsers)

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

return M
