-- neovim config
--
-- other settings obtained from
-- https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ
-- https://www.youtube.com/watch?v=gnupOrSEikQ&t=40s
-- https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
-- https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

-- lewis6991/impatient.nvim plugin is required to be loaded first to improve startup time, as per instructions
-- https://github.com/lewis6991/impatient.nvim#setup
local impatient_status_ok, impatient = pcall(require, "impatient")
if impatient_status_ok then                     -- using pcall to prevent errors when setting up neovim for the first time
  require('impatient').enable_profile()
end

require('config.general-config')
require('config.keymaps')
require('config.autocmd')

local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then      -- this is for first time neovim plugin setup
  require('config.plugins')
  -- print("restart neovim for plugins to take affect")
else
  require('config.plugins')
  require "config.load-plugin-config"
end