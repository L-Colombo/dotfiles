return {
  "xiyaowong/transparent.nvim",

  {
    "JasonBoyett/Goethe.nvim",
    opts = { default_theme = "habamax", auto_persist = true, }
  },
  {
    "blazkowolf/gruber-darker.nvim",
    opts = {
      italic = {
        strings = false
      }
    }
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        strings = false
      },
      contrast = "hard"
    }
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
