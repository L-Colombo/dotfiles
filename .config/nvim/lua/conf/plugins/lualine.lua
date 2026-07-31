return {
    "nvim-lualine/lualine.nvim",
    config = function()
        -- local custom_theme = require("lualine.themes.codedark")
        -- custom_theme.normal.c.fg = "#cc0d0e"
        require("lualine").setup({
            options = {
                theme = "fuzz",
                -- theme = custom_theme,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
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
