return {
    "oprearocks/allhallowseve.nvim",
    "logannday/gruber-darker-nvim",
    "Prince-Ramani/crush.nvim",
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
                filter = "classic",
            })
        end
    },
    {
        "kamwitsta/vinyl.nvim",
        config = function()
            require("vinyl").setup({
                variant = "darker"
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
