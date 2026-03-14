return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Removed rust_analyzer from here; rustaceanvim handles it
        ensure_installed = { "lua_ls", "bashls", "pyright", "html", "cssls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Neovim 0.11+ Native Way
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("bashls")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")

      -- This MUST stay inside the config function to work
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
