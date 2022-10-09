-- Config: treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

-- config obtained from
--    https://github.com/gmr458/nvim/blob/main/lua/config/treesitter.lua
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/treesitter.lua
--    https://github.com/AstroNvim/AstroNvim/blob/65c6e6c431/lua/configs/treesitter.lua
--    https://code.mehalter.com/projects/68/files/master/plugins/treesitter.lua

return {
  ensure_installed = require("user.plugins.treesitter.languages"),
  sync_install = false,
  ignore_install = {},
  highlight = {               -- https://github.com/nvim-treesitter/nvim-treesitter#highlight
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {   -- https://github.com/nvim-treesitter/nvim-treesitter#incremental-selection
    enable = true
  },
  indent = {                  -- https://github.com/nvim-treesitter/nvim-treesitter#indentation
    enable = true,
    disable = { "yaml" }
  },
  autopairs = {               -- needs plugin https://github.com/windwp/nvim-autopairs
    enable = true,
  },
  autotag = {                 -- needs plugin https://github.com/windwp/nvim-ts-autotag
    enable = true
  },
  context_commentstring = {   -- needs plugin https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {                 -- needs plugin https://github.com/p00f/nvim-ts-rainbow
    enable = true,
    extended_mode = true,     -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  },
}
