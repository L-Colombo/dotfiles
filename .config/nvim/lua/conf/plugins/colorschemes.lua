return {
  "xiyaowong/transparent.nvim",
  {
    "JasonBoyett/Goethe.nvim",
    opts = { default_theme = "habamax", auto_persist = true, }
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
  {
    "loctvl842/monokai-pro.nvim",
    config = function ()
      require("monokai-pro").setup({
        devicons = true,
        filter = "spectrum",
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    config = function ()
      require("tokyonight").setup({
        style = "night"
      })
    end
  },
  "L-Colombo/atlantic-dark.nvim",
  "tpope/vim-vividchalk",
  "rebelot/kanagawa.nvim",
}
