-- feline config
-- https://github.com/feline-nvim/feline.nvim
-- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md
--
-- config obtained from https://github.com/AstroNvim/AstroNvim/blob/main/lua/configs/feline.lua
local status_ok, feline = pcall(require, "feline")
if not status_ok then
  error("Unable to load feline-nvim/feline.nvim")
  return
end

local C = require "default_theme.colors"    -- https://github.com/AstroNvim/AstroNvim/blob/0fee587489/lua/default_theme/colors.lua
local coreStatus = require("core.status")   -- https://github.com/AstroNvim/AstroNvim/blob/0fee587489/lua/core/status.lua
local hl = coreStatus.hl
local provider = coreStatus.provider
local conditional = coreStatus.conditional
local modes = coreStatus.modes
local icons = require("user.icons")

-- stylua: ignore
feline.setup({
  disable = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
  theme = hl.group("StatusLine", { fg = C.fg, bg = C.bg_1 }),
  components = {
    active = {
      -- left
      {
        -- display Vim modes.
        -- https://github.com/EdenEast/nyx/blob/main/config/.config/nvim/lua/eden/modules/ui/feline/init.lua
        -- https://github.com/AstroNvim/AstroNvim/blob/0fee587489/lua/core/status.lua
        { provider = function()
            return string.format(" %s", modes[vim.fn.mode()][1])
          end , hl = hl.mode()
        },
        -- { provider = { name = "vi_mode", opts = { show_mode_name = true, padding = true } }, hl = hl.mode() },
        { provider = provider.spacer(), hl = hl.mode() },

        -- fileinfo
        -- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md#file-info
        -- https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/providers/file.lua
        { provider = provider.spacer(2) },
        { provider = "file_info"},

        -- git
        -- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md#git
        -- https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/providers/git.lua
        { provider = provider.spacer(2) },
        { provider = "git_branch",        hl = hl.fg("Conditional",    { fg = C.purple_1, style = "bold" }), icon = icons.git.Branch },
        { provider = provider.spacer(1),  enabled = conditional.git_available },
        { provider = "git_diff_added",    hl = hl.fg("GitSignsAdd",    { fg = C.green }),                    icon = " " .. icons.git.Add },
        { provider = "git_diff_changed",  hl = hl.fg("GitSignsChange", { fg = C.orange_1 }),                 icon = " " .. icons.git.Modify },
        { provider = "git_diff_removed",  hl = hl.fg("GitSignsDelete", { fg = C.red_1 }),                    icon = " " .. icons.git.Remove },
      },
      -- ///////////////////////////////////////////////////////////////////////////////////////  --
      -- right
      {
        -- lsp diagnostics
        -- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md#diagnostics
        -- https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/providers/lsp.lua
        -- { provider = provider.spacer(2), enabled = conditional.git_changed },
        { provider = "diagnostic_errors",   hl = hl.fg("DiagnosticError", { fg = C.red_1 }),    icon = " " .. icons.diagnostics.Error },
        { provider = "diagnostic_warnings", hl = hl.fg("DiagnosticWarn",  { fg = C.orange_1 }), icon = " " .. icons.diagnostics.Warning },
        { provider = "diagnostic_info",     hl = hl.fg("DiagnosticInfo",  { fg = C.white_2 }),  icon = " " .. icons.diagnostics.Information },
        { provider = "diagnostic_hints",    hl = hl.fg("DiagnosticHint",  { fg = C.yellow_1 }), icon = " " .. icons.diagnostics.Hint },

        -- lsp info
        { provider = provider.spacer() },
        { provider = provider.lsp_progress, enabled = conditional.bar_width() },
        { provider = provider.lsp_client_names(true), short_provider = provider.lsp_client_names(), enabled = conditional.bar_width(), icon = " " .. icons.ui.Gear },

        -- treesitter
        { provider = provider.spacer(2), enabled = conditional.bar_width() },
        { provider = provider.treesitter_status, enabled = conditional.bar_width(), hl = hl.fg("GitSignsAdd", { fg = C.green }) },

        -- filetype
        -- https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/providers/file.lua
        { provider = provider.spacer(2), enabled = conditional.has_filetype },
        { provider = { name = "file_type", opts = { filetype_icon = true, case = "lowercase" } }, enabled = conditional.has_filetype },

        -- cursor position
        -- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md#position
        -- https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/providers/cursor.lua
        { provider = provider.spacer(2) },
        { provider = provider.spacer(1), hl = hl.mode() },
        { provider = "position", hl = hl.mode() },
        { provider = provider.spacer(1), hl = hl.mode() },
        -- { provider = "position" },

        -- cursor position in percentage
        -- https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/providers/cursor.lua
        { provider = provider.spacer(2) },
        { provider = "line_percentage" },

        -- cursor position in scrollbar
        -- https://github.com/feline-nvim/feline.nvim/blob/master/USAGE.md#scroll-bar
        -- https://github.com/feline-nvim/feline.nvim/blob/master/lua/feline/providers/cursor.lua
        { provider = provider.spacer() },
        { provider = "scroll_bar", hl = hl.fg("TypeDef", { fg = C.yellow }) },

        -- Vim mode accent
        { provider = provider.spacer(2) },
        { provider = provider.spacer(), hl = hl.mode() },
      },
    },
  },
})
