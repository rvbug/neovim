-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   opts = {
--     options = {
--       theme = "darkvoid",
--       component_separators = "|",
--       section_separators = { left = "", right = "" },
--       disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
--     },
--     sections = {
--       lualine_a = { "mode" },
--       lualine_b = { "branch", "diff", "diagnostics" }, -- Includes Git Status
--       lualine_c = {
--         {
--           function()
--             return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- Project Folder Name
--           end,
--           icon = "󱉭",
--           color = { fg = "#ffffff", gui = "bold" },
--         },
--       },
--       lualine_x = { "encoding", "fileformat", "filetype" },
--       lualine_y = { "progress" },
--       lualine_z = { "location" },
--     },
--   },
-- }

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Required for Nerd Font icons
  opts = {
    options = {
      theme = "darkvoid",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" }, -- Use these Nerd Font glyphs
      icons_enabled = true, -- Ensure icons are globally enabled
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" }, -- Displays Git branch and status
      lualine_c = {
        {
          function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- Pulls the current Folder/Project name
          end,
          icon = "󱉭", -- Nerd Font folder icon
          color = { fg = "#ffffff", gui = "bold" },
        },
        { "filename" },
      },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
