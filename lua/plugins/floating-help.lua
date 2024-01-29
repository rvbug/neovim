return {

  "Tyler-Barham/floating-help.nvim",

  config = function()
    require("floating-help").setup({})
    vim.keymap.set("n", "<leader>f", ":FloatingHelpToggle<cr>")
    vim.keymap.set("n", "<leader>h", ":FloatingHelp")
  end,
}
