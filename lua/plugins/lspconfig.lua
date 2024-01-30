return {
	{
		-- installs all lsp
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- bridge the gap between mason and nvim-lsp
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- ensure certain lsps are installed
				ensure_installed = { "lua_ls", "tsserver", "rust_analyzer", "bashls", "pyright", "yamlls" },
			})
		end,
	},
	{
		-- mason-tool-installer
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"black",
					"debugpy",
					"flake8",
					"isort",
					"mypy",
					"pylint",
				},
			})
		end,
	},
	{
		-- helps in communication
		"neovim/nvim-lspconfig",
		lazy = false,

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

      handlers = {
            -- Add borders to LSP popups
            ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'rounded'}),
            ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'rounded' }),
          }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}


