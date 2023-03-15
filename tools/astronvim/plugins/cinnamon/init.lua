return {
  "declancm/cinnamon.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("cinnamon").setup()
  end,
}
