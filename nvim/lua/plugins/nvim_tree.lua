return {
          "nvim-tree/nvim-tree.lua",
          version = "*",
          lazy = false,
          dependencies = {
          "nvim-tree/nvim-web-devicons"
     },
     config = function()
     vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
     require("nvim-tree").setup({
     renderer = {
     icons = {
        glyphs = {
           folder = {
              arrow_closed = " ",
              arrow_open = " "
              },
            },
          },
        },
     })
     end,
}
