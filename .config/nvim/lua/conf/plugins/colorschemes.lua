return {
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                contrast = "hard"
            })
        end
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                theme = "dragon"
            })
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        opts = {
            italic = {
                strings = false,
                comments = false,
            }
        }
    },
    "miikanissi/modus-themes.nvim",
    -- my colorschemes
    "L-Colombo/atlantic-dark.nvim",
    "L-Colombo/devel2.nvim",
    {
        "L-Colombo/fuzz.nvim",
        priority = 1000,
        opts = {}
    },
    {
        "L-Colombo/oldschool.nvim",
        priority = 1000,
        opts = {}
    },
    -- { dir = "~/Programming/0_projects/oldschool.nvim", opts = {} }
    -- { dir = "~/Programming/0_projects/fuzz.nvim", opts = {} }
}
