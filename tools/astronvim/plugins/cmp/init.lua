return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local config = require("user.plugins.cmp.config.cmp")
      return require("astronvim.utils").extend_tbl(opts, config)
    end,
  },
}
