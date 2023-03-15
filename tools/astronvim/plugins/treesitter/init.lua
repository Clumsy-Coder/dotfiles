return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    local config = require("user.plugins.treesitter.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end
}
