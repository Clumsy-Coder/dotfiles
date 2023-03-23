return {
  {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      table.insert(astronvim.lsp.skip_setup, "tsserver")
    end,
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
    },
    opts = function()
      return require("user.plugins.lsp.config.tsserver")
    end,
  },
}
