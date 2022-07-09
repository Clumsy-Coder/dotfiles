-- Config: nvim-lsp-installer
-- https://github.com/williamboman/nvim-lsp-installer#configuration

return {
  -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  -- https://github.com/AstroNvim/AstroNvim/issues/412
  automatic_installation = true,
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded"
  },
}
