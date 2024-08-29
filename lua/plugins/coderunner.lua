-- return {
--   "smzm/hydrovim",
--
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--   },
--
--   config = function()
--     --   require("hydrovim").setup()
--   end
--
-- }
--
return {
	"superDross/run-with-me.vim",

	config = function()
		--   require("hydrovim").setup()
    vim.keymap.set("n", "<leader>rc", ":RunCode<cr>")
    vim.keymap.set("n", "<leader>rv", ":RunCodeVert<cr>")
    vim.keymap.set("n", "<leader>rt", ":RunToCursor<cr>")
    vim.keymap.set("n", "<leader>rs", ":RunSelectedCode<cr>")

	end,
}
