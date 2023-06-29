require('lualine').setup {
  options = {
      theme = 'auto',
      winbar = {
          lualine_a = {'filetype'},
          lualine_b = {'filetype'},
          lualine_c = {'filename'},
          lualine_x = {'filetype'},
          lualine_y = {'filename'},
          lualine_z = {'filename'}
      },
      inactive_winbar = {
          lualine_a = {'filetype'},
          lualine_b = {'filetype'},
          lualine_c = {'filename'},
          lualine_x = {'filetype'},
          lualine_y = {'filename'},
          lualine_z = {'filename'}
      },
  },
}
