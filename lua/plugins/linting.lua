return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      -- Enable linting when opening a file and saving
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
      require("lint").linters_by_ft = {
        python = { "black" },
      }
    end
  }
}
