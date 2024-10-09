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
  {
    "blazkowolf/gruber-darker.nvim",
    opts = {
      bold = true,
      italic = {
        strings = false,
      },
    },
  },
  "L-Colombo/atlantic-dark.nvim",
  "glitchcandy/glitchcandy-nvim",
  "oprearocks/allhallowseve.nvim",
  "tpope/vim-vividchalk",
}
