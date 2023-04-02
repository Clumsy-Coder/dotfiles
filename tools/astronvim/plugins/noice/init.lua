return {
  "folke/noice.nvim",
  -- event = "User AstroFile",
  event = "VeryLazy",
  opts = function(_, opts)
    local config = require("user.plugins.noice.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end,
  config = function(_, opts)
    require("noice").setup(opts)
  end,
  -- enable lsp via noice.nvim
  -- check:
  --   https://github.com/AstroNvim/astrocommunity/blob/c968f919fa4e37e195ba29abe83b9ec272f54f2e/lua/astrocommunity/utility/noice-nvim/noice-nvim.lua#L34
  init = function()
    vim.g.lsp_handlers_enabled = false
  end,
}
