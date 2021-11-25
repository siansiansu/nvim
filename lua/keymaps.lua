local map = vim.api.nvim_set_keymap
local default = {noremap = true, silent = true}

map('n', '<Leader>e', ':NvimTreeToggle<CR>', default)
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

-- barbarline
map("n", '<Leader>bp', ':BufferPick<CR>', default)
map("n", 'g<S>t', ':BufferPrevious<CR>', default)
map("n", 'gt', ':BufferNext<CR>', default)

