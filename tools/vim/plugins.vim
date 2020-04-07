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
Plug 'ianks/vim-tsx'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'herringtondarkholme/yats.vim'

call plug#end()

" import all plugin configs
" plugin configs are located in ~/dotfiles/tools/vim/pluginConfig
" these contain config for their respective plugins
" any hotkeys for the plugins will be placed in ~/dotfiles/tools/vim/hotkeys.vim
for pluginConfigFile in split(glob('~/dotfiles/tools/vim/pluginConfig/*.config.vim'), '\n')
    exe 'source' pluginConfigFile
endfor