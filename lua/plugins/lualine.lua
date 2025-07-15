return {
	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({
			opts = {
				theme = "gruvbox-material",
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' }
			}
      -- section = {lualine_c = {'tabs'}, {'progress'}, {'buffers'}},
		})
	end,
}
