return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.neo-tree.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end
}
