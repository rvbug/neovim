return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			--local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})
			-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = { -- adding extension to telescope for ui-select
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				}, -- end of extension
			}) -- end of setup
			require("telescope").load_extension("ui-select")
		end,
	},
}
