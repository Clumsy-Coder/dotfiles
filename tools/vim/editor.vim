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

silent! colorscheme gruvbox
silent! set background=dark    " Setting dark mode
silent! let g:gruvbox_contrast_dark = 'medium'	" 'hard' , 'medium' or 'soft'
" silent! let g:gruvbox_contrast_dark = 'hard'
" silent! let g:gruvbox_contrast_dark = 'medium'
" silent! let g:gruvbox_contrast_dark = 'soft'

let g:airline_powerline_fonts = 1
"let g:rainbow_active = 1

" Command mode autocomplete
" autocomplete when typing in command + <Tab>
" Ex: :help tab<Tab>
" check :help wildmode
" check https://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu
set wildmode=longest:full,list:full

