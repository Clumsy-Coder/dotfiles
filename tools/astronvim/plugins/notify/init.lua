return {
  "rcarriga/nvim-notify",
  opts = function(_, opts)
    local config = require("user.plugins.notify.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end,
}
