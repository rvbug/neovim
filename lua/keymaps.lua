-- ~/.config/nvim/lua/config/keymaps.lua
local keymap = vim.keymap

-- Window splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Vertical" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontal" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Split" })

-- Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- Telescope 
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- Quarto 
keymap.set('n', '<leader>qa', ':QuartoActivate<cr>')
keymap.set('n', '<leader>qp', ':QuartoPreview<cr>')
keymap.set('n', '<leader>qc', ':QuartoClosePreview<cr>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostic error" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- vim.filetype.add({
--   extension = {
--     rsl = "rust",
--   },
-- })
