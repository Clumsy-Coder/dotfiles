-- lsp config for sumneko_lua
--
-- obtained from
-- https://github.com/hunger/AstroVim/blob/my_config/lua/configs/lsp/server-settings/sumneko_lua.lua
--
-- check sumneko_lua config
--    https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua

return {
  on_attach = astronvim.lsp.disable_formatting,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
        enable = true
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"]   = true,
          [astronvim.install.home .. "/lua"]  = true,     -- AstroNvim repo and custom configs
                                                          -- NOTE: when loading files in $NVIM_CONFIG_DIR_PATH/lua/user/ folder,
                                                          --       load with the prefix 'astronvim'
                                                          --       Ex: require("astronvim.icons")
                                                          --           This loads file $NVIM_CONFIG_DIR_PATH/lua/user/icons.lua
        },
      },
    },
  },
}
