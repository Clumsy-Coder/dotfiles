-- obtained starter code from
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/keymaps.lua
-- https://github.com/gmr458/nvim/blob/main/lua/config/keymaps.lua


local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--    normal_mode       = "n",
--    insert_mode       = "i",
--    visual_mode       = "v",
--    visual_block_mode = "x",
--    term_mode         = "t",
--    command_mode      = "c",
--
--    C = Ctrl
--    S = Shift
--    A = Alt

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)  -- Ctrl + h
keymap("n", "<C-j>", "<C-w>j", opts)  -- Ctrl + j
keymap("n", "<C-k>", "<C-w>k", opts)  -- Ctrl + k
keymap("n", "<C-l>", "<C-w>l", opts)  -- Ctrl + l

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)               -- Ctrl + ↑
keymap("n", "<C-Down>", ":resize -2<CR>", opts)             -- Ctrl + ↓
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)    -- Ctrl + ←
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)   -- Ctrl + →

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)                    -- Shift + l
keymap("n", "<S-h>", ":bprevious<CR>", opts)                -- Shift + h

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)     -- >
keymap("v", ">", ">gv", opts)     -- <

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)     -- Alt + j
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)     -- Alt + k

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)    -- Alt + j
keymap("v", "<A-k>", ":m .-2<CR>==", opts)    -- Alt + k
keymap("v", "p", '"_dP', opts) -- key original copied value when pasting over current value

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)     -- J
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)     -- K
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)     -- Alt + j
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)     -- Alt + k

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)   -- Ctrl + h
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)   -- Ctrl + j
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)   -- Ctrl + k
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)   -- Ctrl + l

-- nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua#setup
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
-- r - rename file
-- d - delete file/folder
-- Ctrl + v - open in vertical split
-- Ctrl + x - open in horizontal split
-- Ctrl + k - will toggle a popup with file infos about the file under the cursor
-- Backspace -  will close current opened directory or parent

-- telescope
-- Find files using Telescope command-line sugar.
-- https://github.com/nvim-telescope/telescope.nvim#usage
keymap("n", "<leader>ff", ":Telescope find_files hidden=true no_ignore=true<cr>", opts)        -- NORMAL mode: Leader + ff
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)         -- NORMAL mode: Leader + fg
keymap("n", "<leader>fb", ":Telescope file_browser<cr>", opts)      -- NORMAL mode: Leader + fb
keymap("n", "<leader>tb", ":Telescope buffers<cr>", opts)           -- NORMAL mode: Leader + tb
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)         -- NORMAL mode: Leader + fh
-- keymap("n", "<leader>mf", ":Telescope media_files<cr>", opts)       -- NORMAL mode: Leader + mf

-- https://github.com/nvim-telescope/telescope.nvim#default-mappings
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/telescope.lua
-- While telescope is open
-- Ctrl + n     -- Next item
-- Ctrl + p     -- Previous item
-- j/k          -- Next/Previous item in NORMAL mode
-- H/M/L        -- H - go to top of list
                -- M - go to the middle of the list
                -- L - go to bottom of the list
-- gg/G         -- Select first/last item in NORMAL mode
-- <CR>         -- Confirm selection
-- Ctrl + x     -- View selected file in horizontal mode
-- Ctrl + v     -- View selected file in vertical mode
-- Ctrl + t     -- Open selected file in a new tab
-- Ctrl + u     -- Scroll up in preview window
-- Ctrl + d     -- Scroll down in preview window
-- ?            -- Show mappings for telescope in NORMAL mode
-- Ctrl + c     -- Close telescope
-- ESC          -- Close telescope in NORMAL mode
-- Tab          -- Toggle selection and move to next selection
-- Shift + Tab  -- Toggle selection and move to prev selection
-- Ctrl + q     -- Send all items not filtered to quickfixlist (qflist)
-- Alt + q      -- Send all selected items to qflist
