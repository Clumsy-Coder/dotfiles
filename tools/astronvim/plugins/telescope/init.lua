return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.telescope.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end
}
