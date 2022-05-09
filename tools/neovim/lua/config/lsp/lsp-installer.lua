-- williamboman/nvim-lsp-installer

-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/config/lsp/lsp-installer.lua

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  error("Unable to load williamboman/nvim-lsp-installer")
  return
end

-- Include the servers you want to have installed by default below
-- https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration#automatically-install-lsp-servers
--
-- available language servers
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
--
-- how to install language servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "bashls",       -- bash
  "cssls",        -- css
  "dockerls",     -- docker
  "emmet_ls",     -- emmet
  "html",         -- html
  "jsonls",       -- json
  "prosemd_lsp",  -- markdown
  "sumneko_lua",  -- lua
  "tsserver",     -- typscript/javascript
  "vimls",        -- vim
  "yamlls"        -- yaml
}
-- auto install LSP server
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

-- Register a handler that will be called for all installed servers.
-- be default, language servers will be able to bootstrap to the LSP installer
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("config.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("config.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "tsserver" then
    local tsserver_opts = require("config.lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

