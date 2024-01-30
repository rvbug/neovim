return {

	"psf/black",
	ft = "python",

	config = function()
		vim.api.nvim.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = "*.py",
			callback = function()
				vim.cmd("Black")
			end,
		})
	end,
}
