-- Config: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
--
-- obtained from:
-- https://astronvim.github.io/recipes/cmp
-- https://astronvim.github.io/configuration/plugin_defaults#cmp
-- https://github.com/AstroNvim/AstroNvim/blob/main/lua/configs/cmp.lua
-- https://github.com/datamonsterr/astronvim_config/blob/main/plugins/cmp.lua

-- load cmp to access it's internal functions
local cmp = require("cmp")
local sources = require("user.plugins.cmp.source_priority")
local lspkind = require("lspkind")

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

return {
  -- load which cmp sources to use
  sources = cmp.config.sources(sources),
  -- window styling
  -- obtained from
  --   https://code.mehalter.com/AstroNvim_user/~files/cd190d29c38cf935d8964f9d9fe1abe373d52e1f/plugins/cmp.lua?position=source-22.1-29.9-1
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:Visual,Search:None",
      -- border = "none",
      -- col_offset = -1,
      side_padding = 1,
    },
  },
  -- formatting cmp results
  formatting = {
    fields = { "kind", "abbr", "menu" },          -- icon, abbreviation, type(snippet, function)
    -- rendering using `lspkind.nvim`
    -- check https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 80,
      ellipsis_char = "...",
      menu = {
        nvim_lsp = "[LSP]",       -- use nvim plugin hrsh7th/cmp-nvim-lsp
        nvim_lua = "[NVIM_LUA]",  -- use nvim plugin hrsh7th/cmp-nvim-lua
        luasnip  = "[Snippet]",   -- saadparwaiz1/cmp_luasnip
        buffer   = "[Buffer]",    -- hrsh7th/cmp-buffer
        path     = "[Path]",      -- hrsh7th/cmp-path
        git      = "[Git]"        -- petertriho/cmp-git
      },
    }),
  },
  -- configure cmp.setup.filetype(filetype, options)
  filetype = {
    -- git
    gitcommit = { { name = "git" } }, -- petertriho/cmp-git
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
        -- {{ name = "path", option = { trailing_slash = true }}},
        {{ name = "cmdline" }}        -- hrsh7th/cmp-cmdline
      ),
    },
  },
}
