-- ~/.config/nvim/lua/plugins/ui.lua
return {
  {
    "aliqyan-21/darkvoid.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup({
        options = { theme = 'darkvoid', globalstatus = true }
      })
    end
  }
}
