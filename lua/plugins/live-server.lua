return {


  -- for html css javascript

  "barrett-ruth/live-server.nvim",
	config = function()
      require("live-server").setup({
          build = 'pnpm add -g live-server',
          cmd = { 'LiveServerStart', 'LiveServerStop' },
          config = true
       })
		vim.keymap.set("n", "<leader>ss", "<cmd>LiveServerStart<cr>")
		vim.keymap.set("n", "<leader>st", "<cmd>LiveServerStop<cr>")
	end,
}
