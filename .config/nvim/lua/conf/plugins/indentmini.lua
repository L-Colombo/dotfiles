return {
  "nvimdev/indentmini.nvim",
  config = function ()
    require("indentmini").setup({
      vim.cmd.highlight('IndentLine guifg=#666666'),
      vim.cmd.highlight('IndentLineCurrent guifg=#666666'),
      exclude = {"markdown", "tex"}
    })
  end
}
