return {
  "nvim-lualine/lualine.nvim",
  priority = 1000,
  opts = {
    options = {
      theme = 'codedark',
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_b = { {
        'branch'
      } },
      lualine_c = {
        {
          'buffers',
          hide_filename_extension = true,
          mode = 4,
          symbols = {
            modified = ' ',
            alternate_file = '',
          }
        }
      },
      lualine_x = {
        {
          'diagnostics'
        }
      }
    }
  }
}
