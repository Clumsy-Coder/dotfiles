set encoding=utf-8

"---------------------------------------------
" import settings from files

source ~/dotfiles/tools/vim/plugins.vim     " load Vim plugins
source ~/dotfiles/tools/vim/hotkeys.vim     " load custom Vim hotkeys

"---------------------------------------------
" NERDTree config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" autocmd vimenter * NERDTree	" open NERDTree when starting vim
let NERDTreeShowHidden=1

"---------------------------------------------
" vim editor config
set number
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=100
colorscheme gruvbox
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = 'hard'	" 'hard' , 'medium' or 'soft'
let g:airline_powerline_fonts = 1
"let g:rainbow_active = 1
