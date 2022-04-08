-- jsonls config
-- used by williamboman/nvim-lsp-installer
-- check config.lsp.lsp-installer
-- will be using b0o/SchemaStore.nvim to provide schemes
-- check b0o/SchemaStore.nvim config
--    https://github.com/b0o/SchemaStore.nvim#usage

local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
  error("Unable to load williamboman/nvim-lsp-installer")
  return
end

return {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
}