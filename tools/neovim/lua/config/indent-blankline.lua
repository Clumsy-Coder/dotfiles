-- Config: indent-blankline
-- lukas-reineke/indent-blankline.nvim

local status_ok, indent_blankline = pcall(require, "indent_blankline")

if not status_ok then
  error("Unable to load lukas-reineke/indent-blankline.nvim")
  return
end

indent_blankline.setup {
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
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