-- :help options
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.number = true                           -- set numbered lines
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.colorcolumn = { 100 }                       -- View a vertical guide at 100 characters for each line
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.wrap = false                            -- display lines as one long line
-- vim.opt.nocompatible = true                     -- Disable compatibility with vi which can cause unexpected issues.
vim.opt.autoread = true                         -- Auto update vim if file has changed outside of vim
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 10                          -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 10                      -- The minimal number of screen columns to keep to the left and to the right of the cursor
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.smartindent = true                      -- autoindent when starting a new line
vim.opt.smarttab = true                         -- When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop' or 'softtabstop'
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.softtabstop = 2                         -- Number of spaces that a <Tab> key is pressed
vim.opt.shiftround = true                       -- Round indent to multiple of 'shiftwidth'
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
                                                -- Ex: >> in normal mode to shift right
                                                -- Ex: << in normal mode to shift left
vim.opt.backup = false                          -- creates a backup file
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.completeopt=menu,menuone,preview,noselect -- Insert mode completions.
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- Override the 'ignorecase' option if the search pattern contains upper case characters.
vim.opt.incsearch = true                        -- While searching though a file incrementally highlight matching characters as you type.
vim.opt.showmatch = true                        -- Show matching words during a search.
-- vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT, REPLACE or VISUAL mode -- anymore
vim.opt.showcmd = true                          -- Show partial command you type in the last line of the screen.
vim.opt.history = 100                           -- Set the commands to save in history default number is 20.
vim.opt.splitbelow = true                       -- :split force all horizontal splits to go below current window
vim.opt.splitright = true                       -- :vsplit force all vertical splits to go to the right of current window
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
-- vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.shortmess:append "c"

-- vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work



-- Command mode autocomplete
-- autocomplete when typing in command + <Tab>
-- Ex: :help tab<Tab>
-- check :help wildmode
-- check https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = { 'longest:full', 'list:full' }

-- auto highlight matching search terms
-- check in help section. :help hlsearch
-- augroup vimrc-incsearch-highlight
--   autocmd!
--   autocmd CmdlineEnter /,\? :set hlsearch
--   autocmd CmdlineLeave /,\? :set nohlsearch
-- augroup END