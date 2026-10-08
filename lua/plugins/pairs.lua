-- Closing brackets and quotes as you type
local M = {}

function M.setup()
  -- check_ts: skip pairing inside strings and comments. The <CR> map leaves the
  -- popup menu alone (plain <CR> while it shows), so 'autocomplete' still works.
  require("nvim-autopairs").setup({ check_ts = true })
end

return M
