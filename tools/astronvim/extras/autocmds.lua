-- autocommands to run
-- to be loaded in polish.lua
--
-- inspired by
-- https://code.mehalter.com/projects/68/files/master/autocmds.lua
-- https://github.com/hunger/AstroVim/blob/my_config/lua/core/autocmds.lua

local is_available = astronvim.is_available
local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup
local create_command = vim.api.nvim_create_user_command

-- ////////////////////////////////////////////////////////////////////////////////////////////// --
-- highlight yanked text
-- obtained from https://stackoverflow.com/a/73365602/3053548
create_augroup("highlight_yank", { clear = false })
create_autocmd("TextYankPost", {
  group = "highlight_yank",
  desc = "Highlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})
