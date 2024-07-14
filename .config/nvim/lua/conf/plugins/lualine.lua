return {

  "nvim-lualine/lualine.nvim",
  priority = 1000,
  opts = {
    options = {
      theme = "auto",
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_b = { {
        "branch"
      } },
      lualine_c = {
        {
          "filename",
          symbols = {
            modified = "",
          },
          fmt = function(name, _)
            local icon = require("nvim-web-devicons").get_icon(name, nil, { default = false })
            if icon ~= nil then
              return icon .. " " .. name
            else
              return name
            end
          end
        },
      },
      lualine_x = {
        {
          "diagnostics"
        }
      }
    }
  }
}
