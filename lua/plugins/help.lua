return {

  "Tyler-Barham/floating-help.nvim",

  config = function()
    require("floating-help").setup({})
    vim.keymap.set("n", "<leader>h", ":FloatingHelpToggle<cr>")
  end,
}
