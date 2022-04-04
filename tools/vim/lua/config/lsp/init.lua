-- neovim/nvim-lspconfig

-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/init.lua

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  error("Unable to load neovim/nvim-lspconfig")
  return
end

require("config.lsp.lsp-installer")
require("config.lsp.handlers").setup()
