vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'


vim.cmd("set number") -- can also use vim.opt.number = true
vim.cmd("set relativenumber")
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- ignore case
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.virtualedit = "block"

-- split the window below & right
vim.opt.splitbelow = true
vim.opt.splitright = true

local keymap = vim.keymap

-- split the window vertically, horizontally, eq width and close
keymap.set("n", "<leader>sv" , "<C-w>v")
keymap.set("n", "<leader>sh" , "<C-w>s")
keymap.set("n", "<leader>sx" , ":close<CR>")

-- tabs
keymap.set("n", "<leader>to" , ":tabnew<CR>")
keymap.set("n", "<leader>tx" , ":tabclose<CR>")
keymap.set("n", "<leader>tn" , ":tabn<CR>")
keymap.set("n", "<leader>tp" , ":tabp<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

vim.keymap.set('n', '<leader>qa', ':QuartoActivate<cr>')
vim.keymap.set('n', '<leader>qp', ':QuartoPreview<cr>')
vim.keymap.set('n', '<leader>qc', ':QuartoClosePreview<cr>')

-- toggleterm shortcut
-- keymap.set("n", "<leader>tt", ":ToggleTerm<cr>")
-- keymap.set("n", "<leader>ut", ":UndotreeToggle<cr>")


-- these are removed 
--general
--keymap.set("n","<leader>nh", ":nohl<CR>")
-- keymap.set("i", "jk", "<ESC>")
-- to use x in normal mode but dont copy it to register
-- keymap.set("n", "x", '"_x')


-- increment and decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>")
-- keymap.set("n", "<leader>-", "<C-x>")
-- keymap.set("n", "<leader>se" , "<C-w>=")

--vim maximize
-- keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- manual lsp config
-- will move this to proper config later
-- keymap.set("n", "<leader>su" , ":lua vim.lsp.buf.hover()<cr>")

-- works for python scripts only
-- moved to coderunner.lua file
-- keymap.set("n", "<leader>rc", ":RunCode<cr>")
-- keymap.set("n", "<leader>rv", ":RunCodeVert<cr>")
-- keymap.set("n", "<leader>rt", ":RunToCursor<cr>")
-- keymap.set("n", "<leader>rs", ":RunSelectedCode<cr>")
--




