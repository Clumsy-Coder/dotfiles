return {
  "folke/todo-comments.nvim",
  opts = function(_, opts)
    local config = require("user.plugins.todo-comments.config")
    return require("astronvim.utils").extend_tbl(opts, config)
  end,
}
