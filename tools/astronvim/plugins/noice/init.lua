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
}
