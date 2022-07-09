-- lsp config for yamlls
--
-- obtained from
-- https://code.mehalter.com/projects/68/files/master/lsp/server-settings/yamlls.lua

return {
  settings = {
    yaml = {
      schemas = {
        ["http://json.schemastore.org/github-workflow"]     = ".github/workflows/*.{yml,yaml}",
        ["http://json.schemastore.org/github-action"]       = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"]  = "roles/tasks/*.{yml,yaml}",
      },
    },
  },
}
