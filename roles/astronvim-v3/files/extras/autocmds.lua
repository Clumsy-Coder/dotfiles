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
-- obtained from
--   https://stackoverflow.com/a/73365602/3053548
--   https://github.com/AstroNvim/AstroNvim/blob/c680ab35b88d4be41366a377a853eb2d36ca0eee/lua/astronvim/autocmds.lua#L94-L99
create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = create_augroup("highlightyank", { clear = false }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})

-- ////////////////////////////////////////////////////////////////////////////////////////////// --
