-- config obtained from
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/autopairs.lua
--    https://github.com/gmr458/nvim/blob/main/lua/config/autopairs.lua

local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  error("Unable to load windwp/nvim-autopairs")
  return
end

autopairs.setup({
  -- connecting to treesitter
  -- https://github.com/windwp/nvim-autopairs#treesitter
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },   -- it will not add a pair on that treesitter node
    javascript = { "string", "template_string" },
    java = false,   -- don't check treesitter on java
  },
  disable_filetype = { "TelescopePrompt" },
})

-- connecting to hrsh7th/nvim-cmp
-- https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")

if not cmp_status_ok then
  error("Unable to load windwp/nvim-autopairs.completion.cmp")
  return
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
)