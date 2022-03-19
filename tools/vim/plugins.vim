" ------------------------------------------------------------------------------
" # Plugin Definitions
" ------------------------------------------------------------------------------

" setting code folding to markers only
" use commands in NORMAL mode
" zo      open fold under current cursor
" zc      close fold under current cursor
" zR      open all folds
" zM      close all folds
setlocal foldmethod=marker

" FUNCTIONAL PLUGINS ---------------------------------------------------------------- {{{

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
" Plug 'tpope/vim-surround'                               " Surrounding ysw)
" Plug 'mattn/emmet-vim'                                 " Emmet for vim
Plug 'voldikss/vim-floaterm'                            " Floating terminal
                                                        " Commands:
                                                        " :FloatermNew
                                                        " :FloatermPrev
                                                        " :FloatermNext
                                                        " :FloatermToggle
Plug 'nvim-treesitter/nvim-treesitter' ,                " language parser, queries, modules, syntax highlighting
      \ {'do': ':TSUpdate'}
Plug 'jesseleite/vim-sourcery'                          " help organize plugins, mappings, configs

" }}}

" VISUAL PLUGINS -------------------------------------------------------------------- {{{

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

" }}}

" SYNTAX PLUGINS -------------------------------------------------------------------- {{{

Plug 'sheerun/vim-polyglot'                             " A collection of language packs for Vim.

" }}}
