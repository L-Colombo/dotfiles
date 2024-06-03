return {
  "xiyaowong/transparent.nvim",

  {
    "JasonBoyett/Goethe.nvim",
    opts = { default_theme = "habamax", auto_persist = true, }
  },
  {
    "rebelot/kanagawa.nvim"
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
  "L-Colombo/atlantic-dark.nvim",
}
