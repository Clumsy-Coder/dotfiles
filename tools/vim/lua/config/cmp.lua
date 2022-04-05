-- plugin: hrsh7th/nvim-cmp
-- config obtained from
--    https://github.com/gmr458/nvim/blob/main/lua/config/cmp.lua
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/cmp.lua
--    https://www.youtube.com/watch?v=GuIcGxYqaQQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  error("Unable to load hrsh7th/nvim-cmp")
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  error("Unable to load L3MON4D3/LuaSnip")
  return
end

require("luasnip.loaders.from_vscode").lazy_load()    -- load snippet plugins from VScode

-- used for Super-Tab
--    Tab through autocomplete when a snippet is selected or Tab like normal when not using 'cmp'.
-- https://www.youtube.com/watch?v=GuIcGxYqaQQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=371s
local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Icons from NERDfont
-- find more here: https://www.nerdfonts.com/cheat-sheet
--   פּ ﯟ   some other good icons
local lspkindicons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

-- most boilerplate config obtained from https://github.com/hrsh7th/nvim-cmp#recommended-configuration
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },

  -- keymappings when CMP is open
  -- check https://www.youtube.com/watch?v=GuIcGxYqaQQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=469s
  -- C = Ctrl key
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),   -- go to previous item in CMP
		["<C-j>"] = cmp.mapping.select_next_item(),   -- go to next item in CMP
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),   -- scroll up in CMP preview
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),    -- scroll down in CMP preview
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),    -- open CMP without typing code first
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {   -- exit CMP
      i = cmp.mapping.abort(),  -- exit in INSERT mode
      c = cmp.mapping.close(),  -- exit in COMMAND mode
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    -- using Tab as SuperTab. Adding functionality to <Tab> when CMP is open
    -- check https://www.youtube.com/watch?v=GuIcGxYqaQQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=592s
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()                    -- select next item when CMP is open
      elseif luasnip.expandable() then
        luasnip.expand()                          -- expand CMP preview if LuaSnippet is expandable
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()                  -- jump applied code snippet. Ex: jump to function name, then parameters, then function scope
      elseif check_backspace() then
        fallback()                                -- exit SuperTab and go back to regular Tab
      else
        fallback()                                -- exit SuperTab and go back to regular Tab
      end
    end, {
      "i",                                        -- apply in INSERT mode
      "s",                                        -- apply in SELECT mode
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)  -- similar effects with SuperTab
      if cmp.visible() then
        cmp.select_prev_item()                    -- select previous item when CMP is open
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()                                -- exit SuperTab and go back to regular Tab
      end
    end, {
      "i",                                        -- apply in INSERT mode
      "s",                                        -- apply in SELECT mode
    }),
  },

  -- the look of CMP completions
  formatting = {
    fields = { "kind", "abbr", "menu" },          -- icon, abbreviation, type(snippet, function)
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", lspkindicons[vim_item.kind])    -- load custom icons
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",       -- use nvim plugin hrsh7th/cmp-nvim-lsp
        nvim_lua = "[NVIM_LUA]",  -- use nvim plugin hrsh7th/cmp-nvim-lua
        luasnip = "[Snippet]",    -- saadparwaiz1/cmp_luasnip
        buffer = "[Buffer]",      -- hrsh7th/cmp-buffer
        path = "[Path]",          -- hrsh7th/cmp-path
        cmp_git = "[Git]"         -- petertriho/cmp-git
      })[entry.source.name]
      return vim_item
    end,
  },

  -- loading CMP completion from multiple sources.
  -- https://www.youtube.com/watch?v=GuIcGxYqaQQ&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=866s
  sources = {     -- NOTE: the order of the array will have precedence for the completions offered
    { name = "nvim_lsp" },        -- use nvim plugin hrsh7th/cmp-nvim-lsp
    { name = "nvim_lua" },        -- use nvim plugin hrsh7th/cmp-nvim-lua
    { name = "luasnip" },         -- saadparwaiz1/cmp_luasnip
    { name = "buffer" },          -- hrsh7th/cmp-buffer
    { name = "path" },            -- hrsh7th/cmp-path
  },

  -- confirm options
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  -- CMP preview code
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    -- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
  },

  experimental = {
    ghost_text = false,
    native_menu = false,
  },
})

-- Set configuration for specific filetype.
-- https://github.com/hrsh7th/nvim-cmp#recommended-configuration
-- https://github.com/petertriho/cmp-git#setup
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources(
    {{ name = 'cmp_git' }},     -- hrsh7th/cmp-path
    {{ name = 'buffer' }}       -- hrsh7th/cmp-buffer
  )
})


