" Contains all the plugins to be used by Vim.
" Uses VimPlug for plugin managment.

" For VimPlug commands, go to
" https://github.com/junegunn/vim-plug#commands

" autoinstall vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()