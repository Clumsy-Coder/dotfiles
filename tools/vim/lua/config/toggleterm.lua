-- config obtained from
--  https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/toggleterm.lua
--  https://github.com/gmr458/nvim/blob/main/lua/config/toggleterm.lua

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  error("Unable to load akinsho/toggleterm.nvim")
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],   -- NORMAL mode: Ctrl + \
  hide_numbers = true,        -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = false,    -- shades terminal filetypes to be darker than other window 
  shading_factor = 2,         -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true,     -- whether or not the open mapping applies in insert mode
  persist_size = true,        -- will persist the size of horizontal and vertical terminals. 
                              -- Split terminals in the same direction always have the same size
  direction = "float",        -- 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = true,       -- close the terminal window when the process exits
  shell = vim.o.shell,
  float_opts = {              -- This field is only relevant if direction is set to 'float'
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

-- Terminal window mappings.
-- https://github.com/akinsho/toggleterm.nvim#terminal-window-mappings
-- Used for navigation when using Horizontal and Vertical ToggleTerm
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)          -- ESC - to exit terminal mode
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)             -- jk - to exit terminal mode
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)    -- Ctrl + h - go to left pane
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)    -- Ctrl + j - go to below pane
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)    -- Ctrl + k - go to above pane
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)    -- Ctrl + l - go to right pane
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- custom terminals
-- https://github.com/akinsho/toggleterm.nvim#custom-terminals
local Terminal = require("toggleterm.terminal").Terminal

-- Run lazygit
-- COMMAND mode: lua _LAZYGIT_TOGGLE()
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Run NodeJS
-- COMMAND mode: lua _NODE_TOGGLE()
local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
  node:toggle()
end

-- Run NCurses Disk Usage
-- COMMAND mode: lua _NCDU_TOGGLE()
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
function _NCDU_TOGGLE()
  ncdu:toggle()
end

-- Run Htop
-- COMMAND mode: lua _HTOP_TOGGLE()
local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()
  htop:toggle()
end

-- Run python
-- COMMAND mode: lua _PYTHON_TOGGLE()
local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()
  python:toggle()
end

-- map custom terminals to keybindings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>lgit", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)    -- <Leader> lgit
vim.api.nvim_set_keymap("n", "<leader>node", "<cmd>lua _NODE_TOGGLE()<CR>", opts)       -- <Leader> node
vim.api.nvim_set_keymap("n", "<leader>ncdu", "<cmd>lua _NCDU_TOGGLE()<CR>", opts)       -- <Leader> ncdu
vim.api.nvim_set_keymap("n", "<leader>htop", "<cmd>lua _HTOP_TOGGLE()<CR>", opts)       -- <Leader> htop
vim.api.nvim_set_keymap("n", "<leader>py"  , "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)     -- <Leader> py
