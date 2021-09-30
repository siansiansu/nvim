vim.opt.list = true
vim.opt.listchars = {
    eol = "↵",
}
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"},
    show_end_of_line = true,
    show_current_context = true,
    space_char_blankline = " ",
}
