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

  -- Keys and the diff-mode fallthrough follow the plugin's README; buffer-local
  -- via on_attach, so ]c keeps its built-in meaning outside a git repo
  require("gitsigns").setup({
    current_line_blame = true,
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc }) end

      map("]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, "Next hunk")

      map("[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, "Prev hunk")

      map("<Leader>hs", gitsigns.stage_hunk, "Stage hunk")
      map("<Leader>hr", gitsigns.reset_hunk, "Reset hunk")
      map("<Leader>hb", gitsigns.blame_line, "Blame line")
      map("<Leader>hd", gitsigns.diffthis, "Diff this")
    end,
  })
end

return M
