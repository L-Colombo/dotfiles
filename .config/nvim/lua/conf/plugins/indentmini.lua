return {
  "nvimdev/indentmini.nvim",
  config = function ()
    require("indentmini").setup({
      exclude = {"markdown", "tex"}
    })
  end
}
