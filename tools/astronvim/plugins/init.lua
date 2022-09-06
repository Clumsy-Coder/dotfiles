-- install, enable, disable plugins
--
-- inspired by
--    https://github.com/AstroNvim/AstroNvim/blob/65c6e6c431/lua/core/plugins.lua
--    https://code.mehalter.com/projects/68/files/master/plugins/init.lua
--    https://github.com/datamonsterr/astronvim_config/blob/main/plugins/init.lua
--    https://github.com/hunger/AstroVim/blob/my_config/lua/core/plugins.lua

return {
  -- //////////////////////////////////////////////////////////////////////////////////////////// --
  -- disable plugins

  -- //////////////////////////////////////////////////////////////////////////////////////////// --
  -- install plugins

  -- FUNCTIONAL PLUGINS

  -- disable lazy loading for friendly snippets
  -- that triggers the loading of cmp
  -- ["rafamadriz/friendly-snippets"] = { event = { nil } },
  -- ["hrsh7th/nvim-cmp"] = { event = { nil } },

  -- cmp code completion

  -- cmdline completions
  ["hrsh7th/cmp-cmdline"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source("cmdline")
    end,
  },
  -- completion for nvim Lua API
  ["hrsh7th/cmp-nvim-lua"] = {
    after = "nvim-cmp",
    ft = "lua",
    config = function()
      astronvim.add_user_cmp_source("nvim_lua")
    end,
  },
  -- git commit, pull request completion
  ["petertriho/cmp-git"] = {
    after = "nvim-cmp",
    ft = "gitcommit",
    config = function()
      astronvim.add_user_cmp_source("git")
      require("user.plugins.cmp-git")
    end,
  },

  -- //////////////////////////////////////////////////////////////////////////////////////////// --
  -- VISUAL PLUGINS

  -- show context of currently visible buffer content
  ["nvim-treesitter/nvim-treesitter-context"] = { after = "nvim-treesitter" },
}
