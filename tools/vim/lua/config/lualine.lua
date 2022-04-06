-- nvim-lualine/lualine.nvim
-- config obtained from
--    https://github.com/gmr458/nvim/blob/main/lua/config/lualine.lua

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  error("Unable to load nvim-lualine/lualine.nvim")
  return
end

-- used for defining colours used for displaying diagnostics
local themeColours = {
  fg1         = '#282828',  -- gruvbox-material colours
  color2      = '#504945',  -- obtained from https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/gruvbox-material.lua
  fg2         = '#ddc7a1',
  color3      = '#32302f',
  color4      = '#a89984',
  color5      = '#7daea3',
  color6      = '#a9b665',
  color7      = '#d8a657',
  color8      = '#d3869b',
  color9      = '#ea6962',

  red         = '#ca1243',  -- colours obtained from https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/slanted-gaps.lua
  grey        = '#a0a1a7',
  black       = '#383a42',
  white       = '#f3f3f3',
  light_green = '#83a598',
  orange      = '#fe8019',
  green       = '#8ec07c',
}

--////////////////////////////////////////////////////////////////////////////////////////////////--

-- metadata used to generate tables for drawing lualine.
-- icons obtained from: https://www.nerdfonts.com/cheat-sheet
local diagnosticMetadata = {
  error = {
    fg = themeColours.fg2,
    bg = themeColours.red,
    symbol = " ",
  },
  warn = {
    fg = themeColours.fg1,
    bg = themeColours.orange,
    symbol = " ",
  },
  info = {
    fg = themeColours.fg1,
    bg = themeColours.color5,
    symbol = " ",
  },
  hint = {
    fg = themeColours.fg1,
    bg = themeColours.color6,
    symbol = " "
  },
}

-- generate a table of lualine components to display diagnostics types of error, warn, info and hint.
-- why? : repeating code being used. prone for error.
--
-- sample generated
-- {
--   'diagnostics',
--   source = { 'nvim_lsp' },
--   sections = { 'error' },
--   symbols = symbols,
--   diagnostics_color = { error = { bg = '#ca1243', fg = '#ddc7a1' } },
--   always_visible = true,    -- Show diagnostics even if there are none.
-- },
local diagnosticTable = {}
for i, type in pairs({'error', 'warn', 'info', 'hint'}) do  -- NOTE: the order of the list is important
  table.insert(diagnosticTable, {
    'diagnostics',
    source = { 'nvim_lsp' },
    sections = { type },
    symbols = { [type] = diagnosticMetadata[type].symbol },
    diagnostics_color = { [type] = diagnosticMetadata[type]},
    always_visible = true,    -- Show diagnostics even if there are none.
    update_in_insert = true, -- Update diagnostics in insert mode.
  })
end

--////////////////////////////////////////////////////////////////////////////////////////////////--

-- code for generating slanted icons obtained from
--    https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/slanted-gaps.lua
-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { color = { fg = themeColours.white, bg = themeColours.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

-- display search term, current match and total matches
local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

-- check if file has changed or if the file is readonly
local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

--////////////////////////////////////////////////////////////////////////////////////////////////--

require('lualine').setup {
  options = {
    icons_enabled = true,           -- Enables the display of icons alongside the component.
    theme = 'gruvbox-material',
    component_separators = '',
    section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {          -- Filetypes to disable lualine for.
      -- "NvimTree",
      "packer",
      -- "toggleterm",
      "lsp-installer",
    },
  },

  always_divide_middle = true,    -- When set to true, left sections i.e. 'a','b' and 'c'
                                  -- can't take over the entire statusline even
                                  -- if neither of 'x', 'y' or 'z' are present.
  globalstatus = false,           -- enable global statusline (have a single statusline
                                  -- at bottom of neovim instead of one for  every window).
                                  -- This feature is only available in neovim 0.7 and higher.

  -- https://github.com/nvim-lualine/lualine.nvim#usage-and-customization
  -- +-------------------------------------------------+
  -- | A | B | C                             X | Y | Z |
  -- +-------------------------------------------------+
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',                          -- display current branch
      {                                  -- Git diff https://github.com/nvim-lualine/lualine.nvim#diff-component-options
        'diff',
        diff_color = {
          added    = { fg = themeColours.green },     -- Changes the diff's added color
          modified = { fg = themeColours.color5 },    -- Changes the diff's modified color
          removed  = { fg = themeColours.red },       -- Changes the diff's removed color you
        },
        symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
      },

      -- add content of diagnostic table. the config to display diagnostics of error, warn, info and hint.
      -- NOTE: wish there was a better way to add table content. I checked 'unpack', but it only returns the first element in the table
      diagnosticTable[1],
      diagnosticTable[2],
      diagnosticTable[3],
      diagnosticTable[4],

      { 'filename', file_status = false, path = 0 },        -- view filename, path https://github.com/nvim-lualine/lualine.nvim#filename-component-options
      { modified, color = { bg = themeColours.red } },      -- display indicator if the file modified
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {   -- display if it's READONLY
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = { search_result },        -- use function defined earlier to display search results
    lualine_y = {
      "encoding",
      "fileformat",                       -- Using Linux, MacOS or Windows https://github.com/nvim-lualine/lualine.nvim#fileformat-component-options
      "filetype"                          -- view file type https://github.com/nvim-lualine/lualine.nvim#filetype-component-options
    },
    lualine_z = { '%l:%c', '%p%%/%L' },   -- rendered as: line number : column ' progress % : total line numbers
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
  extensions = {
    'toggleterm',
    'nvim-tree',
    'symbols-outline',
    'quickfix'
  }
}
