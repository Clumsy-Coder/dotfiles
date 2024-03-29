" vim editor config
" 
" Scavanged vim config from
" https://github.com/Clumsy-Coder/dotfiles/blob/1.8.6/tools/vim/editor.vim
" https://github.com/Clumsy-Coder/dotfiles/blob/1.8.7/tools/vim/config/sanity.vim

"let g:rainbow_active = 1

" vim editor config
set number            " show line number
set colorcolumn=100   " View a vertical guide at 100 characters for each line
set cursorline        " Highlight the text line of the cursor
set hlsearch          " Highlight matching searching. To turn off, type in command mode :nohlsearch
set tabstop=2         " set tab size to 2 spaces
set shiftwidth=2      " number of spaces to shift in normal mode using >> or <<
                      " Ex: >> in normal mode to shift right
                      " Ex: << in normal mode to shift left
set expandtab         " Use space when pressing the <Tab> key in Insert mode
set smarttab          " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'tabstop' or 'softtabstop' 
set softtabstop=2     " Number of spaces that a <Tab> key is pressed
set mouse=a           " Enable use of mouse in Normal, Visual, Insert and Command mode
set encoding=UTF-8
set incsearch         " While searching though a file incrementally highlight matching characters as you type.
set ignorecase        " Ignore capital letters during search.
set showcmd           " Show partial command you type in the last line of the screen.
set showmatch         " Show matching words during a search.
set history=100       " Set the commands to save in history default number is 20.
set nocompatible      " Disable compatibility with vi which can cause unexpected issues.
set autoread          " Auto update vim if file has changed outside of vim
set clipboard=unnamed " connect vim clipboard with system's clipboard
set noshowmode        " don't show the mode you are on the last line, if in INSERT, REPLACE or VISUAL mode
set splitbelow        " :split splitting a window will put the new window below the current one
set splitright        " :vsplit splitting a window will put the new window right of the current one
" set smartcase         " Override the 'ignorecase' option if the search pattern contains upper case characters.
set completeopt=menu,menuone,preview,noselect " Insert mode completions. 
set nowrap
set shiftround        " Round indent to multiple of 'shiftwidth'
set smartindent       " Do smart autoindenting when starting a new line
set termguicolors     " Enables 24-bit RGB color in the |TUI|
set scrolloff=10      " Minimal number of screen lines to keep above and below the cursor

" Command mode autocomplete
" autocomplete when typing in command + <Tab>
" Ex: :help tab<Tab>
" check :help wildmode
" check https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set wildmode=longest:full,list:full

" auto highlight matching search terms
" check in help section. :help hlsearch
" augroup vimrc-incsearch-highlight
"   autocmd!
"   autocmd CmdlineEnter /,\? :set hlsearch
"   autocmd CmdlineLeave /,\? :set nohlsearch
" augroup END
