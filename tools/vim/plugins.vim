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

Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/othree/yajs.vim'
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
Plug 'https://github.com/ekalinin/dockerfile.vim'
Plug 'https://github.com/elzr/vim-json'
Plug 'https://github.com/othree/html5.vim'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/chrisbra/colorizer'
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/itchyny/vim-cursorword'
Plug 'https://github.com/frazrepo/vim-rainbow'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/jparise/vim-graphql'
Plug 'https://github.com/vim-scripts/SyntaxComplete'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'https://github.com/rhysd/git-messenger.vim'
Plug 'https://github.com/chun-yang/auto-pairs'
Plug 'https://github.com/yuttie/comfortable-motion.vim'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/ianks/vim-tsx'
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/roxma/nvim-yarp'
Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
Plug 'https://github.com/prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'https://github.com/xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'https://github.com/herringtondarkholme/yats.vim'
Plug 'https://github.com/chrisbra/colorizer'
Plug 'https://github.com/ap/vim-css-color'

call plug#end()

" import all plugin configs
" plugin configs are located in ~/dotfiles/tools/vim/pluginConfig
" these contain config for their respective plugins
" any hotkeys for the plugins will be placed in ~/dotfiles/tools/vim/hotkeys.vim
for pluginConfigFile in split(glob('~/dotfiles/tools/vim/pluginConfig/*.config.vim'), '\n')
    exe 'source' pluginConfigFile
endfor

let g:rainbow_active = 1              " enable vim-rainbow plugin