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

  require("gitsigns").setup({
    current_line_blame = true,
  })
  vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
  vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Prev hunk" })
  vim.keymap.set("n", "<Leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
  vim.keymap.set("n", "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
  vim.keymap.set("n", "<Leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame line" })
  vim.keymap.set("n", "<Leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff this" })
end

return M
