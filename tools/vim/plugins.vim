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

" functional plugins
Plug 'scrooloose/nerdtree'                              " File browser. Ctrl + n
Plug 'airblade/vim-gitgutter'                           " shows a git diff in the sign column
Plug 'majutsushi/tagbar'                                " View code tags. Ex: class (members, functions)
                                                        " Usage: Press F8
Plug 'jiangmiao/auto-pairs'                             " auto add/remove brackets, parens, quotes in pair
Plug 'rhysd/git-messenger.vim'                          " View commit message under cursor
                                                        " Use :GitMessenger
                                                        " Use <Leader>gm
                                                        " NOTE: default <Leader> is \
                                                        " NOTE: view help with <Leader>gm? while it's open
" Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Auto Completion
Plug 'ctrlpvim/ctrlp.vim'                               " Fuzzy finder for file, buffer, tag
                                                        " NOTE: :CtrlP or Ctrl + p
Plug 'tpope/vim-commentary'                             " For Commenting gcc & gc
                                                        " NORMAL mode: gcc
                                                        " VISUAL mode: gc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy finder. Required for vim-dashboard
Plug 'junegunn/fzf.vim'
Plug 'glepnir/dashboard-nvim'                           " Vim dashboard. Displayed when starting neovim with no file provided
" Plug 'terryma/vim-multiple-cursors'                    " CTRL + N for multiple cursors
" Plug 'http://github.com/tpope/vim-surround'            " Surrounding ysw)
" Plug 'mattn/emmet-vim'                                 " Emmet for vim
Plug 'voldikss/vim-floaterm'                            " Floating terminal
                                                        " Commands:
                                                        " :FloatermNew
                                                        " :FloatermPrev
                                                        " :FloatermNext
                                                        " :FloatermToggle
Plug 'nvim-treesitter/nvim-treesitter' ,                " language parser, queries, modules, syntax highlighting
      \ {'do': ':TSUpdate'}

" -------------------------------------------------------------------------------------------------"
" visual plugins
Plug 'morhetz/gruvbox'                                  " Vim colourscheme
Plug 'rafi/awesome-vim-colorschemes'                    " Collection Vim colour schemes
Plug 'vim-airline/vim-airline'                          " Vim status bar
Plug 'xuyuanp/nerdtree-git-plugin'                      " show git status in NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          " Syntax for nerdtree on most common file extensions. Used with ryanoasis/vim-devicons
Plug 'ryanoasis/vim-devicons'                           " Developer Icons
Plug 'ap/vim-css-color'                                 " CSS Color Preview
Plug 'itchyny/vim-cursorword'                           " underline the word under cursor
Plug 'machakann/vim-highlightedyank'                    " highlight yanked(copied) region
Plug 'frazrepo/vim-rainbow'                             " Colourize brackets, parenthis and curly brackets
                                                        " NOTE: requires better alternative
Plug 'yuttie/comfortable-motion.vim'                    " Smooth scrolling
                                                        " keybinding in NORMAL mode
                                                        " Ctrl + d 
                                                        " Ctrl + u
Plug 'TaDaa/vimade'                                     " Dim inactive pane
Plug 'lukas-reineke/indent-blankline.nvim'              " View indentlines. Based of yggdroot/indentline
" Plug 'yggdroot/indentline'                              " View indentlines
Plug 'michaelb/vim-tips'                                " Show a Vim tip in the command prompt

" -------------------------------------------------------------------------------------------------"
" syntax plugins
Plug 'sheerun/vim-polyglot'                             " A collection of language packs for Vim.

" -------------------------------------------------------------------------------------------------"

call plug#end()

" import all plugin configs
" plugin configs are located in ~/dotfiles/tools/vim/pluginConfig
" these contain config for their respective plugins.
" plugin file will have the following format: <Repo author>.<Repo name>.config.vim
" any hotkeys for the plugins will be placed in ~/dotfiles/tools/vim/hotkeys.vim
for pluginConfigFile in split(glob('~/dotfiles/tools/vim/pluginConfig/*.config.vim'), '\n')
  exe 'source' pluginConfigFile
endfor

let g:rainbow_active = 1              " enable vim-rainbow plugin
