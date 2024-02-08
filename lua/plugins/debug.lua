return {

	"mfussenegger/nvim-dap",
	dependencies = {
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


    -- dapui setup

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
		vim.keymap.set("n", "leader>dc", dap.continue, {})
	end,
}
