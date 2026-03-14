return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",        -- Essential for Magit-style diffs
    "nvim-telescope/telescope.nvim", -- For picking branches/commits
  },
  config = function()
    require("neogit").setup({
      kind = "floating", -- Makes it pop up like a clean dashboard
      integrations = {
        diffview = true,
      },
    })
  end,
  keys = {
    { "<leader>gs", "<cmd>Neogit<cr>", desc = "Magit Status" }
  }
}
