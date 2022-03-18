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

silent! colorscheme gruvbox
silent! set background=dark    " Setting dark mode
silent! let g:gruvbox_contrast_dark = 'medium'	" 'hard' , 'medium' or 'soft'

let g:airline_powerline_fonts = 1
"let g:rainbow_active = 1