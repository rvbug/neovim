return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup(
      {
        --auto_install = true,
        ensure_installed = {
          "lua",
          "javascript",
          "rust",
          "python",
          "bash",
          "html",
          "css",
          "vimdoc",
          "luadoc",
          "markdown",
          "regex",
          "bash",
          "markdown_inline",
          "sql",
          "vimdoc",
          "jsdoc",
        },
        highlight = { enable = true },
        indent = { enable = true },
      },

      require("nvim-treesitter.configs").setup({
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>gi",
            node_incremental = "<leader>ni",
            scope_incremental = "<leader>si",
            node_decremental = "<leader>nd",
          },
        },
      })
    )
  end,
}
