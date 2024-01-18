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
					"html",
					"css",
					"vimdoc",
					"luadoc",
					"markdown",
				},
				highlight = { enable = true },
				indent = { enable = true },
			},

			require("nvim-treesitter.configs").setup({
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
			})
		)
	end,
}
