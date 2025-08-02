return {
    "oprearocks/allhallowseve.nvim",
    "logannday/gruber-darker-nvim",
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
                filter = "classic",
                transparent_background = true
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
