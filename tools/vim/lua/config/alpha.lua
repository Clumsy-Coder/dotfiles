-- goolord/alpha-nvim
-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/alpha.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  error("Unable to load goolord/alpha-nvim")
  return
end

local dashboard = require("alpha.themes.dashboard")

-- icons obtained from https://www.nerdfonts.com/cheat-sheet
dashboard.section.buttons.val = {
  -- dashboard.button("SPC f b" , "  Jump to bookmarks",      ":Telescope marks <CR>"),
  dashboard.button("SPC f",   "  Find file",              ":Telescope find_files hidden=true no_ignore=true<CR>"),
  dashboard.button("SPC P",   "  Find project",           ":Telescope projects <CR>"),
  dashboard.button("SPC s r", "  Recently opened files",  ":Telescope oldfiles <CR>"),
  dashboard.button("SPC F",   "  Search text",            ":Telescope live_grep <CR>"),
  dashboard.button("SPC s h", "  Search help file",       ":Telescope help_tags <CR>"),
  dashboard.button("SPC c n", "  NeoVim Configuration",   ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("SPC c d", "  Dotfiles Configuration", ":e ~/dotfiles <CR>"),
  -- dashboard.button("SPC s l", "  Open last session",      ""),
  dashboard.button("SPC e",   "  New file",               ":ene <BAR> startinsert <CR>"),
  dashboard.button("SPC q",   "  Quit Neovim",            ":qa<CR>"),
}

-- dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "Include"
-- dashboard.section.buttons.opts.hl = "Keyword"


dashboard.opts.opts.noautocmd = true      -- https://github.com/goolord/alpha-nvim/blob/534a86b348b741ada5bb0d4b83c2c3da6763352a/doc/alpha.txt#L50-L56

alpha.setup(dashboard.config)