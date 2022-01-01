-- require'lualine'.setup {
--   options = {
--     icons_enabled = true,
--     theme = 'nord',  -- onedark
--     component_separators = {'', ''},
--     section_separators = {'', ''},
--     disabled_filetypes = {}
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }

require('lualine').setup {
  options = {
    theme = 'nord',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2},
    },
    lualine_b = { { 'filename', file_status = true, path = 1 }, 'branch'},
    lualine_c = {{ -- fileformat
      'diagnostics',
      -- Table of diagnostic sources, available sources are:
      --   'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
      -- or a function that returns a table like:
      --   {error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt}
      sources = {'nvim_diagnostic'},
      sections = {'error', 'warn', 'info', 'hint'},
      diagnostics_color = {
        error = 'DiagnosticError',
        warn  = 'DiagnosticWarn',
        info  = 'DiagnosticInfo',
        hint  = 'DiagnosticHint',
      },
      symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
      colored = true,
      update_in_insert = false,
      always_visible = true,
    }},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
