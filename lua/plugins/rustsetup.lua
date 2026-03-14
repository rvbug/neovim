return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  config = function()
    local mason_registry = require("mason-registry")
    
    local codelldb_root = vim.fn.stdpath("data") .. "/mason/packages/codelldb"
    local codelldb_path = codelldb_root .. "/extension/adapter/codelldb"
    local liblldb_path = codelldb_root .. "/extension/lldb/lib/liblldb.so" 

    local cfg = require('rustaceanvim.config')

    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
      },
      server = {
        on_attach = function(_, bufnr)
          local opts = { buffer = bufnr, silent = true }
          
          -- Rust-specific
          vim.keymap.set("n", "<leader>re", "<cmd>RustLsp expandMacro<CR>", opts)
          vim.keymap.set("n", "<leader>rd", "<cmd>RustLsp debuggables<CR>", opts)
          vim.keymap.set("n", "<leader>rt", "<cmd>RustLsp testables<CR>", opts)
          vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", opts)
          vim.keymap.set("n", "<leader>ca", "<cmd>RustLsp codeAction<CR>", opts)

          -- Manual Signature Help in Insert Mode
          vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
          
          -- Standard navigation
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = { command = "clippy" },
            procMacro = { enable = true },
          },
        },
      },
    }
  end
}
