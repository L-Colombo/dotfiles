return {
    "oprearocks/allhallowseve.nvim",
    {
        "myypo/borrowed.nvim",
        config = function()
            require("borrowed").setup({
                transparent = true
            })
        end
    },
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
