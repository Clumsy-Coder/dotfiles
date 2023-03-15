return {
  "echasnovski/mini.nvim",
  branch = "stable",
  event = "VimEnter",
  config = function()
    require("user.plugins.mini.config")
  end,
}
