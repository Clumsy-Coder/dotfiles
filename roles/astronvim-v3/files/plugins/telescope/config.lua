-- Config: telescope
-- https://github.com/nvim-telescope/telescope.nvim
--
-- obtained from
--    https://github.com/nvim-treesitter/nvim-treesitter

return {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "meta/dotbot",
      ".git/",
      "!.github/"
    },
  },
  pickers = {
    find_files = {
      hidden = true, -- show hidden files
    },
  },
}
