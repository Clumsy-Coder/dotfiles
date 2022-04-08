-- tsserver config
-- used by williamboman/nvim-lsp-installer
-- check config.lsp.lsp-installer
-- check tsserver config
--    https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver

local util = require("lspconfig.util")

local opts = {
  root_dir = util.root_pattern(""),
}

return opts