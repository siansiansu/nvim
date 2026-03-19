return {
  -- Fuzzy finder + file explorer
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    ---@type snacks.Config
    opts = {
      explorer = {},
      picker = {},
    },
    keys = {
      { "<Leader>e", function() Snacks.explorer() end, desc = "Toggle file explorer" },
      { "<Leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { "<Leader>fg", function() Snacks.picker.grep() end, desc = "Live grep" },
      { "<Leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<Leader>fh", function() Snacks.picker.help() end, desc = "Help tags" },
    },
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
    },
    keys = {
      { "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "Next hunk" },
      { "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "Prev hunk" },
      { "<Leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage hunk" },
      { "<Leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset hunk" },
      { "<Leader>gb", "<cmd>Gitsigns blame_line<CR>", desc = "Blame line" },
      { "<Leader>gd", "<cmd>Gitsigns diffthis<CR>", desc = "Diff this" },
    },
  },

  -- Diagnostics list
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<Leader>tt", "<cmd>Trouble diagnostics toggle<CR>", desc = "Toggle diagnostics" },
    },
  },

  -- Which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Keymaps" },
    },
  },
}
