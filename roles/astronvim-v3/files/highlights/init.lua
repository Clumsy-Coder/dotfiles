-- colorscheme for telescope
-- obtained from
--   https://code.mehalter.com/AstroNvim_user/~files/2d782a1d4ca9b8832bb26665e78ab451950152b8/highlights/init.lua?position=source-1.1-24.4-1
return function()
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  local normal      = get_hlgroup("Normal")
  local fg, bg      = normal.fg, normal.bg
  local bg_alt      = get_hlgroup("Visual").bg
  local green       = get_hlgroup("String").fg
  local red         = get_hlgroup("Error").fg
  return {
    CursorLineFold          = { link      = "CursorLineNr"        },
    HighlightURL            = { underline = true                  },
    TelescopeBorder         = { fg        = bg_alt, bg = bg       },
    TelescopeNormal         = { bg        = bg                    },
    TelescopePreviewBorder  = { fg        = bg,     bg = bg       },
    TelescopePreviewNormal  = { bg        = bg                    },
    TelescopePreviewTitle   = { fg        = bg,     bg = green    },
    TelescopePromptBorder   = { fg        = bg_alt, bg = bg_alt   },
    TelescopePromptNormal   = { fg        = fg,     bg = bg_alt   },
    TelescopePromptPrefix   = { fg        = red,    bg = bg_alt   },
    TelescopePromptTitle    = { fg        = bg,     bg = red      },
    TelescopeResultsBorder  = { fg        = bg,     bg = bg       },
    TelescopeResultsNormal  = { bg        = bg                    },
    TelescopeResultsTitle   = { fg        = bg,     bg = bg       },
  }
end
