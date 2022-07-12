-- loading certain files with a filetype
-- Ex: load Brewfile as a ruby file
--
-- this file is loaded in polish.lua
--
-- obtained from
-- https://code.mehalter.com/projects/68/files/master/init.lua
-- https://github.com/datamonsterr/astronvim_config/blob/main/polish.lua
-- 
-- Read more about setting filetypes in Neovim
-- https://www.lua.org/manual/5.1/manual.html#5.4.1
-- https://neovim.io/news/2022/04#filetypelua
-- https://github.com/VinukaThejana/neovim/blob/master/filetype.lua

vim.filetype.add({
  filename = {
    ["Brewfile"] = "ruby",
    -- ["pi-hole.conf"] = "yaml",
    ["dockerfile"] = "dockerfile"
  },
  pattern = {
    [".*%.tmux.conf"] = "tmux",       -- files in dotfiles/tools/tmux/ folder
  },
  -- extension = {
  --   -- conf = "config",
  -- }
})
