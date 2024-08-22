-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Leader keys
vim.g.mapleader = " "                                 -- Space as leader key
vim.g.maplocalleader = "\\"                           -- Backslash as local leader

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Import your plugins
    { import = "plugins" },
  },
  defaults = {
    version = "*",
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- General Settings
local opt = vim.opt

opt.mouse = 'a'                                       -- Enable mouse support
opt.swapfile = false                                  -- Don't use swapfile
opt.number = true                                     -- Show line number
opt.showmatch = true                                  -- Highlight matching parenthesis
opt.foldmethod = 'marker'                             -- Enable folding (marker method)
opt.colorcolumn = '80'                                -- Line length marker at 80 columns
opt.splitright = true                                 -- Vertical split to the right
opt.splitbelow = true                                 -- Horizontal split to the bottom
opt.ignorecase = true                                 -- Ignore case letters when searching
opt.smartcase = true                                  -- Override ignorecase if search has capitals
opt.completeopt = 'menu,menuone,noinsert'             -- Completion options
opt.hidden = true                                     -- Enable background buffers
opt.history = 100                                     -- Remember 100 lines in history
opt.lazyredraw = true                                 -- Faster scrolling
opt.synmaxcol = 240                                   -- Max column for syntax highlight
opt.termguicolors = true                              -- Enable 24-bit RGB colors
opt.expandtab = true                                  -- Use spaces instead of tabs
opt.shiftwidth = 4                                    -- Shift 4 spaces when tab
opt.tabstop = 4                                       -- 1 tab == 4 spaces
opt.smartindent = true                                -- Autoindent new lines
opt.errorbells = false                                -- Disable error bells
opt.visualbell = false                                -- Disable visual bell
opt.fileformats = 'unix,mac,dos'                      -- Support multiple file formats
opt.encoding = 'utf-8'                                -- Set encoding to UTF-8
opt.backup = false                                    -- Don't create backup files
opt.writebackup = false                               -- Don't write backup files
opt.updatetime = 100                                  -- Faster completion
opt.timeoutlen = 500                                  -- Time to wait for a mapped sequence
opt.ttimeoutlen = 10                                  -- Time to wait for key code sequences
opt.scrolloff = 2                                     -- Minimal number of screen lines above/below cursor
opt.sidescrolloff = 5                                 -- Minimal number of columns to keep left/right of cursor
opt.foldlevelstart = 99                               -- Start with all folds open
opt.ruler = true                                      -- Show the cursor position all the time
opt.list = true                                       -- Show invisible characters
opt.showtabline = 2                                   -- Always show tabline
opt.pumheight = 15                                    -- Popup menu height
opt.cursorline = true                                 -- Highlight the screen line of the cursor
opt.cursorcolumn = true                               -- Highlight the screen column of the cursor
opt.shortmess:append("c")                             -- Don't give ins-completion-menu messages

-- Wildmenu
opt.wildignorecase = true                             -- Ignore case when completing file names
opt.wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'

-- Status line and tabline
opt.laststatus = 2                                    -- Always show the status line
opt.cmdheight = 1                                     -- Command line height
opt.showmode = false                                  -- Don't show the mode in the statusline

-- Folding
opt.foldmethod = 'marker'                             -- Fold based on markers
opt.foldlevelstart = 99                               -- Open all folds by default
