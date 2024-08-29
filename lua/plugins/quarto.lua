return {

  "quarto-dev/quarto-nvim",
  "jmbuhr/otter.nvim",
  dependecies = {
    "Vigemus/iron.nvim",
  },
  --"jpalardy/vim-slime",

  lazy = "false",

  config = function()
    --vim.g.slime_target = "tmux"
    --vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
      -- vim.keymap.set('n', '<leader>pq', ':QuartoPreview<cr>')
      -- vim.keymap.set('n', '<leader>cq', ':QuartoClosePreview<cr>')
      -- vim.keymap.set('n', '<leader>aq', ':QuartoActivate<cr>')
    -- local quarto = require('quarto')
    -- quarto.setup()
    -- vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, { silent = true, noremap = true })
  end,
      -- vim.keymap.set('n', '<leader>pq', ':QuartoPreview<cr>')

}
