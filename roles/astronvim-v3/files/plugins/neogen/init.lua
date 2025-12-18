return {
  "danymat/neogen",
  opts = function(_, opts)
    local config = require("user.plugins.neogen.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end,
}
