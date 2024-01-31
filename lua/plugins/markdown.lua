return {

  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

  config = function()
      vim.fn["mkdp#util#install"]()
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<cr>")
      vim.keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<cr>")
      vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<cr>")
  end,

	ft = { "markdown" },


}
