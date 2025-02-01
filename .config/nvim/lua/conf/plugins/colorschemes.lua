return {
    {
        "JasonBoyett/Goethe.nvim",
        opts = { default_theme = "habamax", auto_persist = true, }
    },
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
                devicons = true,
                filter = "classic",
            })
        end
    },
    "L-Colombo/atlantic-dark.nvim",
    "tpope/vim-vividchalk",
    "cwshugg/dwarrowdelf",
    "ficcdaf/ashen.nvim",
    "oprearocks/allhallowseve.nvim",
    "vimoxide/vim-cinnabar",
}
