local status_ok, colorizer = pcall(require, "colorizer")

if not status_ok then
  error("Unable to load norcalli/nvim-colorizer.lua")
  return
end

-- https://github.com/norcalli/nvim-colorizer.lua#customization
colorizer.setup({
  "*", -- Highlight all files,
  "css",
  "html",
  "javascript",
  "json",
  "jsonc",
  "lua",
  "yaml",
})