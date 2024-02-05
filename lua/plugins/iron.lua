return {

	"Vigemus/iron.nvim",

	config = function()
		local iron = require("iron.core")

		iron.setup({
		config = {
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					sh = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = { "zsh" },
					},
				},
				-- How the repl window will be displayed
				-- See below for more information
				repl_open_cmd = require("iron.view").bottom(40),
			},
			-- Iron doesn't set keymaps by default anymore.
			-- You can set them here or manually add keymaps to the functions in iron.core
			keymaps = {
				send_motion = "<leader>ic",
				-- visual_send = "<leader>sc",
				send_file = "<leader>if",
				send_line = "<leader>il",
				-- send_until_cursor = "<leader>su",
				-- send_mark = "<leader>sm",
				-- mark_motion = "<leader>mc",
				-- mark_visual = "<leader>mc",
				-- remove_mark = "<leader>md",
				-- cr = "<leader>s<cr>",
				-- interrupt = "<leader>s<leader>",
			  -- exit = "<leader>sq",
				clear = "<leader>ic",
			},
			-- If the highlight is on, you can change how it looks
			-- For the available options, check nvim_set_hl
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		})

		-- iron also has a list of commands, see :h iron-commands for all available commands
		vim.keymap.set("n", "<leader>ii", "<cmd>IronRepl<cr>")
		vim.keymap.set("n", "<leader>ir", "<cmd>IronRestart<cr>")
		vim.keymap.set("n", "<leader>if", "<cmd>IronFocus<cr>")
		vim.keymap.set("n", "<leader>ih", "<cmd>IronHide<cr>")
	end,
}
