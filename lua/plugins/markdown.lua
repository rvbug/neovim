return {

  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

  config = function()
      vim.fn["mkdp#util#install"]()
  end,

	ft = { "markdown" },


}
