local custom_gruvbox = require'lualine.themes.iceberg'
-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#112233' -- rgb colors are supported
require'lualine'.setup{
  options = { theme  = custom_gruvbox },
  ...
}
