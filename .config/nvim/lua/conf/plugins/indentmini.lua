return {
  "nvimdev/indentmini.nvim",
  config = function ()
    vim.cmd.highlight('IndentLine guifg=#666666')
    vim.cmd.highlight('IndentLineCurrent guifg=#666666')
    require("indentmini").setup({
      exclude = {"markdown", "tex"}
    })
  end
}
