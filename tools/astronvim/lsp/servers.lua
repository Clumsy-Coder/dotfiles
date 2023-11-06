-- Config: nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig
-- available servers: https://github.com/williamboman/nvim-lsp-installer#available-lsps

-- Include the servers you want to have installed by default below
-- https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration#automatically-install-lsp-servers
--
-- available language servers
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
--
-- how to install language servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
  "ansiblels",    -- ansible
  "bashls",       -- bash
  "cssls",        -- css
  "dockerls",     -- docker
  "emmet_ls",     -- emmet
  "html",         -- html
  "jsonls",       -- json
  "lua_ls",       -- lua
  "prosemd_lsp",  -- markdown
  "solargraph",   -- Ruby
  "tailwindcss",  -- tailwind css
  "tsserver",     -- typscript/javascript
  "vimls",        -- vim
  "yamlls",       -- yaml
}
