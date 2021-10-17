local cmd = vim.cmd                                -- execute Vim commands
local exec = vim.api.nvim_exec                     -- execute Vimscript
local fn = vim.fn                                  -- call Vim functions
local g = vim.g                                    -- global variables
local opt = vim.opt                                -- global/buffer/windows-scoped options

g.mapleader = ','                                  -- change leader to a comma
g.indentLine_char = '|'                            -- set indentLine character

opt.mouse = 'a'                                    -- enable mouse support
opt.swapfile = false                               -- don't use swapfile
opt.number = true                                  -- show line number
opt.showmatch = true                               -- highlight matching parenthesis
opt.foldmethod = 'marker'                          -- enable folding (default 'foldmarker')
opt.colorcolumn = '80'                             -- line lenght marker at 80 columns
opt.splitright = true                              -- vertical split to the right
opt.splitbelow = true                              -- orizontal split to the bottom
opt.ignorecase = true                              -- ignore case letters when search
opt.smartcase = true                               -- ignore lowercase for the whole pattern
opt.completeopt = 'menu,menuone,noinsert'      -- completion options
opt.hidden = true                                  -- enable background buffers
opt.history = 100                                  -- remember n lines in history
opt.lazyredraw = true                              -- faster scrolling
opt.synmaxcol = 240                                -- max column for syntax highlight
opt.termguicolors = true                               -- enable 24-bit RGB colors
opt.expandtab = true                               -- use spaces instead of tabs
opt.shiftwidth = 4                                 -- shift 4 spaces when tab
opt.tabstop = 4                                    -- 1 tab == 4 spaces
opt.smartindent = true                             -- autoindent new lines
opt.errorbells = false                             -- No annoying sound on errors
opt.visualbell = false                             -- No visual bell
opt.fileformats = 'unix,mac,dos'
opt.magic = true
opt.virtualedit = 'block'
opt.encoding = 'utf-8'
opt.viewoptions = 'folds,cursor,curdir,slash,unix'
opt.sessionoptions = 'curdir,help,tabpages,winsize'
opt.wildignorecase = true
opt.wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**';
opt.backup         = false;
opt.writebackup    = false;
opt.shada          = "!,'300,<50,@100,s10,h"
opt.backupskip     = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
opt.smarttab       = true
opt.shiftround     = true
opt.timeout        = true
opt.ttimeout       = true
opt.timeoutlen     = 500
opt.ttimeoutlen    = 10
opt.updatetime     = 100
opt.redrawtime     = 1500
opt.infercase      = true
opt.incsearch      = true
opt.wrapscan       = false
opt.wrap           = false
opt.inccommand     = "nosplit"
opt.grepformat     = "%f:%l:%c:%m"
opt.breakat        = [[\ \	;:,!?]]
opt.startofline    = false
opt.whichwrap      = "h,l,<,>,[,],~"
opt.switchbuf      = "useopen"
opt.backspace      = "indent,eol,start"
opt.diffopt        = "filler,iwhite,internal,algorithm:patience"
opt.jumpoptions    = "stack"
opt.showmode       = false
opt.shortmess      = "aoOTIcF"
opt.scrolloff      = 2
opt.sidescrolloff  = 5
opt.foldlevelstart = 99
opt.ruler = true
opt.list = true
opt.showtabline = 2
opt.winwidth       = 30
opt.winminwidth    = 10
opt.pumheight      = 15
opt.helpheight     = 12
opt.previewheight  = 12
opt.cmdheight      = 2
opt.cmdwinheight   = 5
opt.equalalways    = false
opt.laststatus     = 2
opt.display        = "lastline"
opt.showbreak      = "↳  "
opt.listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
opt.pumblend       = 10
opt.winblend       = 10
opt.textwidth      = 80
opt.expandtab      = true
opt.autoindent     = true
opt.signcolumn     = "yes"
opt.conceallevel   = 2
opt.concealcursor  = "niv"
opt.cursorline     =true
opt.cursorcolumn     =true

cmd('colorscheme one-nvim')
cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]
cmd[[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]]
cmd[[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,yml setlocal shiftwidth=2 tabstop=2
]]
cmd[[autocmd FileType markdown let g:indentLine_enabled=0]]
cmd[[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)
