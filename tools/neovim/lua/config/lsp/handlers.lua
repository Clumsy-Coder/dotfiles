-- lspconfig handler
-- used by williamboman/nvim-lsp-installer
-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/handlers.lua
-- check https://www.youtube.com/watch?v=6F3ONwrCxMg&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=739

local M = {}

-- Load diagnostic signs
-- Load nvim hrsh7th/nvim-cmp config for hrsh7th/cmp-nvim-lsp and neovim/nvim-lspconfig
-- Load vim diagnostic config
-- set LSP 'hover' and 'signatureHelp' config nvim hrsh7th/nvim-cmp
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  -- let nvim know about the different signs
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  -- display config for hrsh7th/nvim-cmp
  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  vim.diagnostic.config(config)

  -- display symbol info on cursor
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

-- highlight code symbol or keyword
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

-- load keymaps for nvim hrsh7th/nvim-cmp
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

  local setKeymap = vim.api.nvim_buf_set_keymap
  setKeymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)                            -- gD - Go to declaration
  setKeymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)                             -- gd - Go to definition
  setKeymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)                                   -- K  - view details on cursor hover
  setKeymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)                         -- gi - view implementation
  setKeymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)                      -- Ctrl + k - view signature
  -- setKeymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)                         -- <Leader>rn - rename symbol
  setKeymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)                             -- gr - view references
  -- setKeymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)                    -- <Leader>ca -
  -- setKeymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)                   -- <Leader>f -
  setKeymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)     -- [d -
  setKeymap(
    bufnr,
    "n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', opts)    -- gl - show line diagnostics
  setKeymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)     -- ]d -
  setKeymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)                   -- <Leader>q -
  -- format file on when running command Format
  -- https://www.youtube.com/watch?v=b7OguLuaYvE&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=858
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- load LSP keymaps
-- load highlighting keywords
-- add custom config per LSP server. Ex: custom config for tsserver
M.on_attach = function(client, bufnr)
  -- use NullLS to handle formatting
  -- using the command lua vim.lsp.buf.formatting_sync()
  -- https://www.youtube.com/watch?v=b7OguLuaYvE&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&t=1129
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

-- required to load LSP servers in config.lsp.lsp-installer
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  error("Unable to load hrsh7th/cmp-nvim-lsp")
  return
end

-- needed to work with hrsh7th/nvim-cmp and hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-nvim-lsp#setup
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- return members
--    setup()
--    on_attach
--    capabilities
return M
