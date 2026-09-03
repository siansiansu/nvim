local M = {}

function M.setup()
  require("snacks").setup({
    explorer = {},
    picker = {},
  })
  vim.keymap.set("n", "<Leader>e", function() Snacks.explorer() end, { desc = "Toggle file explorer" })
  vim.keymap.set("n", "<Leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
  vim.keymap.set("n", "<Leader>fg", function() Snacks.picker.grep() end, { desc = "Live grep" })
  vim.keymap.set("n", "<Leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
  vim.keymap.set("n", "<Leader>fh", function() Snacks.picker.help() end, { desc = "Help tags" })

  -- No keymaps: the signs and inline blame are passive, and the actions are
  -- reachable through :Gitsigns, which completes its subcommands
  require("gitsigns").setup({
    current_line_blame = true,
  })
end

return M
