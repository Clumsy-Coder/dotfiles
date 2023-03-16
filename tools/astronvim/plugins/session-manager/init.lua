return {
  "Shatur/neovim-session-manager",
  opts = function(_, opts)
    local config = require("user.plugins.session-manager.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end
}
