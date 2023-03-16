-- Config: indent-blankline
-- lukas-reineke/indent-blankline.nvim

return {
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = false,
  indent_level = 50,
  filetype_exclude = {
    'dashboard',
    'toggleterm',
    'packer',
    'help',
    'NvimTree',
    'alpha'
  }
}

-- for more options, search for 'options.' in
-- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/lua/indent_blankline/init.lua
