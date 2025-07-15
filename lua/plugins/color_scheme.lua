return {
  "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        undercurl = true,
        commentStyle = { italic = false },
        functionStyle = { bold = true },
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        variablebuiltinStyle = { italic = true },
        specialReturn = true,
        specialException = true,
        transparent = false,
        dimInactive = false,
        globalStatus = true,
        terminalColors = true,
        -- theme = "dragon",
    })
    vim.cmd("colorscheme kanagawa")

    end
}
