return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,    --lua
        null_ls.builtins.formatting.prettier,  --js
        null_ls.builtins.diagnostics.eslint_d,   --js
        null_ls.builtins.formatting.black,      --py
        --null_ls.builtins.diagnostics.flake8,   --py
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
