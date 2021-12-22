local map = vim.api.nvim_set_keymap
local default = {noremap = true, silent = true}

map('n', '<C-n>', ':NvimTreeToggle<CR>', default)
map('n', '<Leader>r', ':NvimTreeRefresh<CR>', default)
map('n', '<Leader>n', ':NvimTreeFindFile<CR>', default)

map('n', '<Leader>ff', ":Telescope find_files<CR>", default)
map('n', '<Leader>fg', ":Telescope live_grep<CR>", default)
map('n', '<Leader>fb', ":Telescope buffers<CR>", default)
map('n', '<Leader>fh', ":Telescope help_tags<CR>", default)

map('n', '<Leader>pu', ":PackerUpdate<CR>", default)
map('n', '<Leader>pi', ":PackerInstall<CR>", default)
map('n', '<Leader>pc', ":PackerCompile<CR>", default)
map('n', '<Leader>ps', ":PackerSync<CR>", default)

map('n', '<space>w', ":HopWord<CR>", default)
map('n', '<space>ww', ":HopLine<CR>", default)

map('n', '<Leader>z', ":TZFocus<CR>", default)

map("t", '<ESC>', "<C-\\><C-n>", default)

map("t", '<Leader>+', ':lua NTGlobal["window"]:change_height(2)<CR>', default)
map("t", '<Leader>-', ':lua NTGlobal["window"]:change_height(-2)<CR>', default)

-- clipboard
map('v', '<Leader>y', '"+y', default)
map('n', '<Leader>Y', '"+yg_', default)
map('n', '<Leader>y', '"+y', default)
map('n', '<Leader>yy', '"+yy', default)

-- barbarline
-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', default)
map('n', '<A-.>', ':BufferNext<CR>', default)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', default)
map('n', '<A->>', ' :BufferMoveNext<CR>', default)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', default)
map('n', '<A-2>', ':BufferGoto 2<CR>', default)
map('n', '<A-3>', ':BufferGoto 3<CR>', default)
map('n', '<A-4>', ':BufferGoto 4<CR>', default)
map('n', '<A-5>', ':BufferGoto 5<CR>', default)
map('n', '<A-6>', ':BufferGoto 6<CR>', default)
map('n', '<A-7>', ':BufferGoto 7<CR>', default)
map('n', '<A-8>', ':BufferGoto 8<CR>', default)
map('n', '<A-9>', ':BufferGoto 9<CR>', default)
map('n', '<A-0>', ':BufferLast<CR>', default)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', default)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', default)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', default)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', default)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', default)


-- Formatting
map('n', '<Leader>ft', ':Neoformat<CR>', default)

map('n', '<Leader>k', ':WhichKey<CR>', default)

