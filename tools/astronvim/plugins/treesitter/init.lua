return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    opts = function(_, opts)
      local config = require("user.plugins.treesitter.config")
      return require("astronvim.utils").extend_tbl(opts, config)
    end,
  },
}
