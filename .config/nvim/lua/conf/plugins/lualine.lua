return {

  "nvim-lualine/lualine.nvim",
  priority = 1000,
  config = function()
    local custom_theme = require("lualine.themes.codedark")
    custom_theme.normal.c.fg = "#0087ff"
    require("lualine").setup({
      options = {
        theme = custom_theme,
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_b = { {
          "branch"
        } },
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
