-- Jumping to a spot on screen
local M = {}

function M.setup()
  -- char mode maps f/F/t/T/;/, globally, which leaves the leader waiting out
  -- 'timeoutlen' on every use, and only adds clever-f repeat over the built-ins
  require("flash").setup({ modes = { char = { enabled = false } } })
  -- Only jump: node selection is native in 0.12 (an/in, ]N/[N)
  vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
end

return M
