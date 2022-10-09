-- disable format on save
-- NOTE: format on save is enabled by default in AstroNvim v2.0.0
-- check
--   https://astronvim.github.io/Recipes/advanced_lsp#disable-auto-format-on-save

return function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_del_augroup_by_name("auto_format")
  end
end
