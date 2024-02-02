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
  end,
}
