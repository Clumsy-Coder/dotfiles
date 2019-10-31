set encoding=utf-8

"---------------------------------------------
" vim-plug plugin install
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'yggdroot/indentline'
Plug 'ekalinin/dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'chrisbra/colorizer'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/vim-cursorword'
Plug 'vim-scripts/Rainbow-Parenthesis'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jparise/vim-graphql'
Plug 'vim-scripts/SyntaxComplete'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'rhysd/git-messenger.vim'
Plug 'chun-yang/auto-pairs'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mxw/vim-jsx'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"---------------------------------------------
" keyboard shortcut
" Toggle NERDTree with Ctrl+n 
map <C-n> :NERDTreeToggle<CR>

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
let g:gruvbox_contrast_dark = 'soft'	" 'hard' , 'medium' or 'soft'
let g:airline_powerline_fonts = 1
"let g:rainbow_active = 1
