return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown", "rmd" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
