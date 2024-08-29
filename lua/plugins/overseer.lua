return {
  "stevearc/overseer.nvim",
  opts = {},

  config = function()
    require("overseer").setup({})
    vim.keymap.set("n", "<leader>or", ":OverseerRun<cr>")
    vim.keymap.set("n", "<leader>ot", ":OverseerToggle<cr>")
  end,

}
