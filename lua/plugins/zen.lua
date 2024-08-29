return {

	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},

	config = function()
		-- require("zen-mode").toggle({
		--   window = {
		--     width = 0.85,
		--   }
		-- })
	end,
   vim.keymap.set("n", "<leader>zm", ":ZenMode<cr>")
}
