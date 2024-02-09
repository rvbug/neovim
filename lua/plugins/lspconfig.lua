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
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"rust_analyzer",
					"bashls",
					"pyright",
					"yamlls",
					"ocamllsp",
					"html",
					"cssls",
				},
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

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.ocamllsp.setup({})

			lspconfig.pyright.setup({})


			handlers = {
				-- Add borders to LSP popups
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
			}

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>")
			vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>")
			vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
			vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>")
			vim.keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
			vim.keymap.set("n", "<leader>lb", "<cmd>lua vim.lsp.buf.references()<CR>")
			vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
			vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>")
			-- vim.keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
			-- vim.keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
			vim.keymap.set("n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>")
			vim.keymap.set("n", "<leader>lo", "<cmd>lua vim.diagnostic.open_float()<CR>")
			vim.keymap.set("n", "<leader>lp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
			vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next()<CR>")
			vim.keymap.set("n", "<leader>ll", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
			vim.keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")
		end,
	},
}
