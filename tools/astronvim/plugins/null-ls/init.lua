return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.null-ls.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end
}
