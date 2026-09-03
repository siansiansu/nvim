local M = {}

function M.setup()
  -- snacks and which-key resolve icons through mini.icons directly, so no
  -- nvim-web-devicons shim is needed. Statusline is Neovim's native default.
  require("mini.icons").setup({})

  vim.cmd.colorscheme("onedark")
end

return M
