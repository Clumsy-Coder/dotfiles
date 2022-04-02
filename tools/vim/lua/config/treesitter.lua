-- Config: treesitter
-- nvim-treesitter/nvim-treesitter

-- config obtained from
--    https://github.com/gmr458/nvim/blob/main/lua/config/treesitter.lua
--    https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/treesitter.lua

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  error("Unable to load nvim-treesitter/nvim-treesitter")
  return
end

treesitter.setup({
  ensure_installed = "maintained", -- download all maintained languages
  sync_install = false,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  autopairs = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- TS rainbow
  -- https://github.com/p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    extended_mode = true,   -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  },
})
