-- lsp config for jsonls
--
-- obtained from
-- https://github.com/thieung/dotfiles/blob/main/config/nvim/lsp/server-settings/jsonls.lua
-- https://github.com/hunger/AstroVim/blob/my_config/lua/configs/lsp/server-settings/jsonls.lua

return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
}
