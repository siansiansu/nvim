require'nvim-tree'.setup {
  -- disable_netrw       = true,
  -- hijack_netrw        = true,
  -- open_on_setup       = false,
  -- ignore_ft_on_setup  = {},
  -- open_on_tab         = false,
  -- hijack_cursor       = false,
  -- update_cwd          = false,
  -- update_focused_file = {
  --   enable      = false,
  --   update_cwd  = false,
  --   ignore_list = {}
  -- },
  -- system_open = {
  --   cmd  = nil,
  --   args = {}
  -- },
  -- diagnostics = {
  --   enable = false,
  --   icons = {
  --     hint = "",
  --     info = "",
  --     warning = "",
  --     error = "",
  --   }
  -- },
  -- view = {
  --   width = 30,
  --   side = 'left',
  --   auto_resize = false,
  --   mappings = {
  --     custom_only = false,
  --     list = {}
  --   }
  -- },
}

-- require("nvim-tree.events").on_nvim_tree_ready(
--   function()
--     vim.cmd("NvimTreeRefresh")
--   end
-- )
-- vim.g.nvim_tree_width = 50
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_auto_close = 1
-- vim.g.nvim_tree_disable_netrw = 0
-- vim.g.nvim_tree_hide_dotfiles = 1
-- vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
-- vim.g.nvim_tree_auto_ignore_ft = 'startify'
-- vim.g.nvim_tree_bindings = {
--   ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
--   ["s"] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
--   ["i"] = ":lua require'nvim-tree'.on_keypress('split')<CR>",
-- }
-- vim.g.nvim_tree_icons = {
--   default = '',
--   symlink = '',
--   git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
--   folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
-- }
