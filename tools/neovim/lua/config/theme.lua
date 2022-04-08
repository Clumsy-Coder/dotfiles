local status_ok, comment = pcall(require, "gruvbox")
if not status_ok then
  error("Unable to load gruvbox.nvim.")
  return
end

vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])