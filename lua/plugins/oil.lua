-- return {
--   "stevearc/oil.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" }, -- For icons
--   config = function()
--     require("oil").setup({
--       default_file_explorer = true,
--       -- columns = { "icon" }, -- Remove this line if you don't use Nerd Fonts
--       float = {
--         padding = 2,
--         max_width = 90,
--         max_height = 0,
--         border = "rounded",
--       },
--     })
--     -- Open Oil in a floating window
--     vim.keymap.set("n", "-", "<CMD>lua require('oil').open_float()<CR>", { desc = "Open Oil in Float" })
--   end,
-- }
--
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      -- If icons still fail after font install, you can set this to {}
      columns = { "icon" },
       -- columns = { }, 

      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0, -- Set to 10-20 for a slight transparency effect
        },
      },
    })

    -- This fixes the color mismatch/background issue
    vim.api.nvim_set_hl(0, "OilDir", { link = "Directory" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })

    vim.keymap.set("n", "-", "<CMD>lua require('oil').open_float()<CR>", { desc = "Open Oil in Float" })
  end,
}
