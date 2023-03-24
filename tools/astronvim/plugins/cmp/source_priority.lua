-- CMP Source Priorities
-- modify here the priorities of default cmp sources
-- higher value == higher priority
-- The value can also be set to a boolean for disabling default sources:
-- false == disabled
-- true == 1000
return {
  { name = "nvim_lsp"  , priority = 1000 },
  { name = "nvim_lua"  , priority = 750  },
  { name = "luasnip"   , priority = 750  },
  { name = "buffer"    , priority = 500  },
  { name = "path"      , priority = 250  },
  { name = "cmdline"   , priority = 200  },
  { name = "git"       , priority = 100  },
}
