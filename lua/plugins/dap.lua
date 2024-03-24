return {

	"jbyuki/one-small-step-for-vimkind",

	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		local dappython = require("dap-python")
		dappython.setup("~/.virtualenvs/debugpy/bin/python3")
		-- following lines were added because
		-- my python runs via python3
		dappython.resolve_python = function()
			return "/usr/bin/python3"
		end

		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance",
			},
		}

		dap.adapters.nlua = function(callback, config)
			callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
		end
		dap.configurations.lua = {
			{
				name = "Current file (local-lua-dbg, nlua)",
				type = "local-lua",
				request = "launch",
				cwd = "${workspaceFolder}",
				program = {
					lua = "nlua.lua",
					file = "${file}",
				},
				verbose = true,
				args = {},
			},
		}

		dap.adapters["local-lua"] = {
			type = "executable",
			command = "node",
			args = {
				"/Users/rakesh.venkat/local-lua-debugger-vscode/extension/debugAdapter.js",
			},
			enrich_config = function(config, on_config)
				if not config["extensionPath"] then
					local c = vim.deepcopy(config)
					-- 💀 If this is missing or wrong you'll see
					-- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
					c.extensionPath = "/Users/rakesh.venkat/local-lua-debugger-vscode"
					on_config(c)
				else
					on_config(config)
				end
			end,
		}

		-- dap.adapters.lldb = {
		-- 	type = "executable",
		-- 	command = "/usr/bin/lldb", -- adjust as needed, must be absolute path
		-- 	name = "lldb",
		-- }

		-- dap.adapters.codelldb = {
		--   type = 'server',
		--   port = "${port}",
		--   executable = {
		--     -- Change this to your path!
		--     command = '/Users/rakesh.venkat/.vscode/codelldb-nvim/extension/adapter/codelldb',
		--     args = {"--port", "${port}"},
		--   }
		-- }

		-- dap.configurations.rust = {
		-- 	{
		-- 		name = "Launch",
		-- 		type = "lldb",
		-- 		request = "launch",
		-- 		program = function()
		-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		-- 		end,
		-- 		cwd = "${workspaceFolder}",
		-- 		stopOnEntry = false,
		-- 		args = {},
		--
		-- 		initCommands = function()
		-- 			local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
		--
		-- 			local script_import = 'command script import "'
		-- 				.. rustc_sysroot
		-- 				.. '/lib/rustlib/etc/lldb_lookup.py"'
		-- 			local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"
		--
		-- 			local commands = {}
		-- 			local file = io.open(commands_file, "r")
		-- 			if file then
		-- 				for line in file:lines() do
		-- 					table.insert(commands, line)
		-- 				end
		-- 				file:close()
		-- 			end
		-- 			table.insert(commands, 1, script_import)
		--
		-- 			return commands
		-- 		end,
		-- 	},
		-- }

		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})
		-- vim.api.nvim_set_keymap("n", "<leader>", [[:lua require"dap".continue()<CR>]], { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>1", [[:lua require"dap".step_over()<CR>]], { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>2", [[:lua require"dap".step_into()<CR>]], { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>3", [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>4", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>dr", [[:lua require"osv".run_this()})<CR>]], { noremap = true })

		-- vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		-- vim.keymap.set("n", "<leader>dc", dap.continue, {})
		-- vim.api.nvim_set_keymap("n", "<F9>", [[:lua require"dap".continue()<CR>]], { noremap = true })
		-- vim.api.nvim_set_keymap("n", "<F10>", [[:lua require"dap".step_over()<CR>]], { noremap = true })
		-- vim.api.nvim_set_keymap("n", "<S-F10>", [[:lua require"dap".step_into()<CR>]], { noremap = true })
		-- vim.api.nvim_set_keymap("n", "<F12>", [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
		-- vim.api.nvim_set_keymap("n", "<F5>", [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
	end,
}
