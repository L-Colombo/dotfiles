return {
  "rktjmp/lush.nvim",
  "xiyaowong/transparent.nvim",

  {
    "JasonBoyett/Goethe.nvim",
    opts = { default_theme = "habamax", auto_persist = true, }
  },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "hard"
      })
    end
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
  "EdenEast/nightfox.nvim",
  -- "sfi0zy/atlantic-dark.vim",
  "L-Colombo/atlantic-dark.nvim",
  "e-q/okcolors.nvim",
}
