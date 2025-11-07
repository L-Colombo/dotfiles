return {
    "tpope/vim-vividchalk",
    "kamil-koziol/imperial.nvim",
    "logannday/gruber-darker-nvim",
    "Prince-Ramani/crush.nvim",
    "iibe/gruvbox-high-contrast",
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
                filter = "classic",
            })
        end
    },
    -- my colorschemes
    "L-Colombo/atlantic-dark.nvim",
    {
        "L-Colombo/oldschool.nvim",
        priority = 1000,
        opts = {}
    },
    -- { dir = "~/Programming/0_projects/oldschool.nvim", opts = {} }
}
