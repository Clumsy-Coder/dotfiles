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

  -- handle git conflicts
  -- check which-key keybindings for usage
  ["akinsho/git-conflict.nvim"] = {
    config = function()
      require("git-conflict").setup(require("user.plugins.git-conflict"))
    end,
  },

  ["williamboman/mason.nvim"] = {
    config = function()
      local config = require("user.plugins.mason")
      require("mason").setup(config)
    end,
  },

  -- typescript LSP server
  ["jose-elias-alvarez/typescript.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function()
      local config = require("user.plugins.typescript")
      require("typescript").setup(config)
    end,
  },

  -- better annotation(documentation) generator
  ["danymat/neogen"] = {
    module = "neogen",
    cmd = "Neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      local config = require("user.plugins.neogen")
      require("neogen").setup(config)
    end,
  },

  -- //////////////////////////////////////////////////////////////////////////////////////////// --
  -- VISUAL PLUGINS

  -- show context of currently visible buffer content
  ["nvim-treesitter/nvim-treesitter-context"] = { after = "nvim-treesitter" },

  -- Highlight, list and search todo comments in your projects.
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup(require("user.plugins.todo-comments"))
    end,
  },
}
