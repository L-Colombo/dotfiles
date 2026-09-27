return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
            },
            sections = {
                lualine_b = { { "branch" } },
                lualine_c = {
                    {
                        "buffers",
                        show_filename_only = true,
                        hide_filename_extension = true,
                        mode = 4,
                        symbols = {
                            modified = " ",
                        },
                    },
                },
                lualine_x = {
                    {
                        "diagnostics"
                    }
                }
            }
        })
    end
}
