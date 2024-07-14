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
            modified = " ",
          },
          fmt = function(name, _)
            local icon = require("nvim-web-devicons").get_icon(name, nil, { default = true })
            local _, i = string.find(name, ".", 1, true)
            if i ~= nil then
              local new_name = string.sub(name, 1, i - 1)
              return icon .. " " .. new_name
            else
              return icon .. " " .. name
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
