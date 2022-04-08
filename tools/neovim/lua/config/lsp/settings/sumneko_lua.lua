-- sumneko_lua config
-- used by williamboman/nvim-lsp-installer
-- check config.lsp.lsp-installer
-- check sumneko_lua config
--    https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua

return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
