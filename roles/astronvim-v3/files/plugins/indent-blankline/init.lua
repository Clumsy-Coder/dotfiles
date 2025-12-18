return {
  "lukas-reineke/indent-blankline.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.indent-blankline.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end,
}
