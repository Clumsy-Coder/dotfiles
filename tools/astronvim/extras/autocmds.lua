-- autocommands to run
-- to be loaded in polish.lua
--
-- inspired by
-- https://code.mehalter.com/projects/68/files/master/autocmds.lua
-- https://github.com/hunger/AstroVim/blob/my_config/lua/core/autocmds.lua

local is_available = astronvim.is_available
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local create_command = vim.api.nvim_create_user_command

-- ////////////////////////////////////////////////////////////////////////////////////////////// --
-- auto install TreeSitter languages when opening a file
-- obtained from https://github.com/nvim-treesitter/nvim-treesitter/issues/2108#issuecomment-993642212
augroup("NvimTreeSitter-autoinstall", { clear = true })
cmd("FileType", {
  desc = "Auto-install TreeSitter language",
  group = "NvimTreeSitter-autoinstall",
  pattern = "*",
  callback = function()
    local parsers = require('nvim-treesitter.parsers')
    local lang = parsers.get_buf_lang()
    if parsers.get_parser_configs()[lang] and not parsers.has_parser(lang) then
      vim.schedule_wrap(function()
        vim.cmd("TSInstallSync! " .. lang)   -- using TSInstallSync! instead of TSInstallSync because it will prompt you to overwrite existing language
        vim.cmd[[e!]]
      end)()
    end
  end,
})

-- highlight yanked text
-- obtained from https://stackoverflow.com/a/73365602/3053548
augroup('highlight_yank', { clear = false })
cmd('TextYankPost', {
  group = 'highlight_yank',
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 })
  end,
})
