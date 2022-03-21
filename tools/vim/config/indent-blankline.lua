-- Config: indent-blankline
-- lukas-reineke/indent-blankline.nvim

require("indent_blankline").setup {
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    indent_level = 50,
    filetype_exclude = { 'dashboard' }
}

-- for more options, search for 'options.' in
-- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/lua/indent_blankline/init.lua