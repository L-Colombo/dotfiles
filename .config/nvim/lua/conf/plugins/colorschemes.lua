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
  "iruzo/matrix-nvim",
  "tpope/vim-vividchalk",
  "rebelot/kanagawa.nvim",
  "ibash/nour2",
  "aktersnurra/no-clown-fiesta.nvim",
}
