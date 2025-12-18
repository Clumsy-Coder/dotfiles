-- Config: gitsigns
-- lewis6991/gitsigns.nvim

return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.gitsigns.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end
}
