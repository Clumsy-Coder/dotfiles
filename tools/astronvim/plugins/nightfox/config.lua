-- Config: nightfox
-- repo: github.com/
-- description: Neovim theme
--
-- obtained from
--   https://code.mehalter.com/projects/68/files/master/plugins/nightfox/config.lua

return {
  options = {
    dim_inactive = true,
    styles = { comments = "italic" },
    modules = {
      barbar = false,
      dashboard = false,
      fern = false,
      fidget = false,
      gitgutter = false,
      glyph_palette = false,
      illuminate = false,
      lightspeed = false,
      lsp_saga = false,
      lsp_trouble = false,
      modes = false,
      neogit = false,
      nvimtree = false,
      pounce = false,
      sneak = false,
      symbols_outline = false,
    },
  },
  specs = {
    all = {
      telescope = {
        bg_alt = "bg2",
        bg = "bg1",
        fg = "fg1",
        green = "green",
        red = "red",
      },
    },
  },
  groups = {
    all = {
      HighlightURL = { style = "underline" },
      MiniIndentscopeSymbol = { link = "PreProc" },
      NormalFloat = { link = "Normal" },
      TelescopeBorder = { fg = "telescope.bg_alt", bg = "telescope.bg" },
      TelescopeNormal = { bg = "telescope.bg" },
      TelescopePreviewBorder = { fg = "telescope.bg", bg = "telescope.bg" },
      TelescopePreviewTitle = { fg = "telescope.bg", bg = "telescope.green" },
      TelescopePromptBorder = { fg = "telescope.bg_alt", bg = "telescope.bg_alt" },
      TelescopePromptNormal = { fg = "telescope.fg", bg = "telescope.bg_alt" },
      TelescopePromptPrefix = { fg = "telescope.red", bg = "telescope.bg_alt" },
      TelescopePromptTitle = { fg = "telescope.bg", bg = "telescope.red" },
      TelescopeResultsBorder = { fg = "telescope.bg", bg = "telescope.bg" },
      TelescopeResultsTitle = { fg = "telescope.bg", bg = "telescope.bg" },
    },
  },
}
