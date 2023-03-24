-- Config: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
--
-- obtained from:
-- https://astronvim.github.io/recipes/cmp
-- https://astronvim.github.io/configuration/plugin_defaults#cmp
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/configs/cmp.lua
-- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/cmp.lua

-- load cmp to access it's internal functions
local cmp = require "cmp"
local user_source = astronvim.get_user_cmp_source
local icons = require("user.extras.icons")
local sources = require("user.plugins.cmp.source_priority")

-- default astronvim cmp mappings
-- check https://github.com/AstroNvim/AstroNvim/blob/0fee587489/lua/configs/cmp.lua
-- <Up> : previous item
-- <Down> : next item
-- <C-p> : previous item
-- <C-n> : next item
-- <C-k> : previous item
-- <C-j> : next item
-- <C-d> : scroll up in selected item preview
-- <C-f> : scroll down in selected item preview
-- <C-e> : exit cmp
-- <Tab> : next item
-- <S-Tab> : previous item

-- store a local variable with a source list to share between filetypes
local prose_sources = {
  user_source("luasnip"),     -- saadparwaiz1/cmp_luasnip
  user_source("buffer"),      -- hrsh7th/cmp-buffer
}
return {
  -- load which cmp sources to use
  sources = cmp.config.sources(sources),
  formatting = {
    fields = { "kind", "abbr", "menu" },          -- icon, abbreviation, type(snippet, function)
    format = function(entry, vim_item)
      -- Kind icons
      --
      -- cmp render format
      -- icon   abbreviation    menu
      -- vim_item.kind = string.format("%s", icons.kind[vim_item.kind])    -- load custom icons
      --
      -- icon   kind    abbreviation    menu
      vim_item.kind = string.format('%s %s', icons.kind[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

      -- rendering menu items
      vim_item.menu = ({
        nvim_lsp = "[LSP]",       -- use nvim plugin hrsh7th/cmp-nvim-lsp
        nvim_lua = "[NVIM_LUA]",  -- use nvim plugin hrsh7th/cmp-nvim-lua
        luasnip  = "[Snippet]",   -- saadparwaiz1/cmp_luasnip
        buffer   = "[Buffer]",    -- hrsh7th/cmp-buffer
        path     = "[Path]",      -- hrsh7th/cmp-path
        git      = "[Git]"        -- petertriho/cmp-git
      })[entry.source.name]
      return vim_item
    end,
  },
  -- configure cmp.setup.filetype(filetype, options)
  filetype = {
    -- first key is the filetype that you are setting up
    lua = { -- for lua only load lsp sources and buffer sources as a fallback
      sources = cmp.config.sources(
        { user_source("nvim_lsp") },    -- hrsh7th/cmp-nvim-lsp
        { user_source("buffer")   },    -- hrsh7th/cmp-buffer
        { user_source("nvim_lua") }     -- hrsh7th/cmp-nvim-lua
      ),
    },
    -- markdown and latex share the same sources
    markdown = { sources = prose_sources },
    latex    = { sources = prose_sources },

    -- git
    gitcommit = {{ name = "git" }}     -- petertriho/cmp-git
  },

  -- configure cmp.setup.cmd(source, options)
  cmdline = {
    -- first key is the source that you are setting up
    ["/"] = {
      -- set up custom mappings
      mapping = cmp.mapping.preset.cmdline(),
      -- configure sources normally without getting priority from cmp.source_priority
      sources = { { name = "buffer" } },    -- hrsh7th/cmp-buffer
    },
    [":"] = {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { user_source("path") },
        -- {{ name = "path", option = { trailing_slash = true }}},
        {{ name = "cmdline" }}        -- hrsh7th/cmp-cmdline
      ),
    },
  },
}
