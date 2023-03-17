return {
  "EdenEast/nightfox.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.nightfox.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end,
  enabled = false
}
