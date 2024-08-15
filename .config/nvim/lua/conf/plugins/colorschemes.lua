return {
  "xiyaowong/transparent.nvim",

  {
    "JasonBoyett/Goethe.nvim",
    opts = { default_theme = "habamax", auto_persist = true, }
  },
  {
    "MyyPo/borrowed.nvim",
    config = function()
      require("borrowed").setup({
        cursor = {
          enable = true,
        }
      })
    end
  },
  "volskaya/irrelevant.nvim",
  "L-Colombo/atlantic-dark.nvim",
  "oprearocks/allhallowseve.nvim",
  "bluz71/vim-nightfly-colors",
}
