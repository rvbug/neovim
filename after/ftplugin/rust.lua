local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, silent = true }

vim.keymap.set("n", "<leader>re", "<cmd>RustLsp expandMacro<CR>", opts)
vim.keymap.set("n", "<leader>rd", "<cmd>RustLsp debuggables<CR>", opts)
vim.keymap.set("n", "<leader>rt", "<cmd>RustLsp testables<CR>", opts)

vim.api.nvim_create_autocmd("BufWritePre", {
  buffer = bufnr,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
