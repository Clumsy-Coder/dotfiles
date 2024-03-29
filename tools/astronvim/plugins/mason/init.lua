return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local config = require("user.plugins.mason.config.mason")
      return require("astronvim.utils").extend_tbl(opts, config)
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      local config = require("user.plugins.mason.config.mason-lspconfig")
      return require("astronvim.utils").extend_tbl(opts, config)
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      local config = require("user.plugins.mason.config.mason-null-ls")
      return require("astronvim.utils").extend_tbl(opts, config)
    end
  }
}
