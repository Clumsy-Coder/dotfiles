return {
  "akinsho/git-conflict.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.git-conflict.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end,
  enabled = false,
}
