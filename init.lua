-- Must precede any require.
vim.loader.enable()

-- Must precede vim.pack.add()
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Yank to the system clipboard, but leave d/D/x/c/p on the unnamed register so
-- deleting doesn't clobber the clipboard and p after dd still pastes the delete.
-- Only prefix when no register was given, or "ay expands to "a"+y, where the
-- later register wins and the yank lands in + instead of a.
for _, lhs in ipairs({ "y", "Y" }) do
  vim.keymap.set(
    { "n", "v" },
    lhs,
    function() return vim.v.register == '"' and '"+' .. lhs or lhs end,
    { expr = true, noremap = true }
  )
end

local opt = vim.opt

opt.number = true
opt.signcolumn = "yes"
opt.undofile = true
opt.swapfile = false
opt.writebackup = false
opt.timeoutlen = 500

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.termguicolors = true -- default colorscheme only defines gui colors
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.pumheight = 15
opt.list = true
opt.listchars = "tab:» ,trail:·,nbsp:+"

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 99

opt.autocomplete = true
opt.complete = "o^10,.^5,w^5,b^5" -- omnifunc (LSP), buffer, windows, buffers
opt.completeopt = "menuone,noselect,popup"

opt.wildignorecase = true
opt.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**"

-- Must precede vim.pack.add(). Parsers are compiled against the plugin, so they
-- are rebuilt on update; on install setup() installs them instead, because the
-- "install" kind fires before the plugin is loadable.
vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("UserPackBuild", { clear = true }),
  callback = function(ev)
    if ev.data.spec.name ~= "nvim-treesitter" or ev.data.kind ~= "update" then
      return
    end
    if not ev.data.active then
      vim.cmd.packadd("nvim-treesitter")
    end
    require("nvim-treesitter").update()
  end,
})

local gh = function(repo) return "https://github.com/" .. repo end

vim.pack.add({
  -- main branch: Neovim 0.12+ native API
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  gh("folke/flash.nvim"),
  gh("folke/snacks.nvim"),
  gh("stevearc/conform.nvim"),
}, { confirm = false })

vim.cmd.packadd("nvim.undotree") -- :Undotree
vim.cmd.packadd("nvim.difftool") -- :DiffTool

require("plugins.treesitter").setup()
require("plugins.motion").setup()
require("plugins.picker").setup()
require("plugins.format").setup()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
  callback = function(args)
    -- No keymaps here: on attach Nvim sets 'tagfunc', so <C-]> jumps to the
    -- definition, and gr* / gO / <C-w>d cover the rest by default.
    -- No autotrigger: 'autocomplete' already polls the o source above, which
    -- is 'omnifunc', which the LSP client sets on attach. enable() is still
    -- needed for the CompleteDone side effects (snippets, import edits).
    vim.lsp.completion.enable(true, args.data.client_id, args.buf)
  end,
})

vim.lsp.enable({ "lua_ls", "pyright", "ruff", "ts_ls" })
