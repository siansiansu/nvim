return {
  -- {
  --   "ibhagwan/fzf-lua",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("fzf-lua").setup({
  --     })
  --     vim.api.nvim_set_keymap('n', '<Leader>ff', ':FzfLua files<CR>', { noremap = true, silent = true })     -- Find files
  --     vim.api.nvim_set_keymap('n', '<Leader>fg', ':FzfLua live_grep<CR>', { noremap = true, silent = true }) -- Live grep
  --     vim.api.nvim_set_keymap('n', '<Leader>fb', ':FzfLua buffers<CR>', { noremap = true, silent = true })   -- List buffers
  --     vim.api.nvim_set_keymap('n', '<Leader>fh', ':FzfLua help_tags<CR>', { noremap = true, silent = true }) -- Find help tags
  --   end,
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false, -- Disable Ctrl-u clearing input
              ["<C-d>"] = false, -- Disable Ctrl-d deleting input
            },
          },
        },
      })
      vim.api.nvim_set_keymap('n', '<Leader>tf', ':Telescope find_files<CR>', { noremap = true, silent = true }) -- Find files
      vim.api.nvim_set_keymap('n', '<Leader>tg', ':Telescope live_grep<CR>', { noremap = true, silent = true })  -- Live grep
      vim.api.nvim_set_keymap('n', '<Leader>tb', ':Telescope buffers<CR>', { noremap = true, silent = true })    -- List buffers
      vim.api.nvim_set_keymap('n', '<Leader>th', ':Telescope help_tags<CR>', { noremap = true, silent = true })  -- Find help tags
    end,
  },
}
