" ------------------------------------------------------------------------------
" # Vimrc
" ------------------------------------------------------------------------------
" # This is my parent vimrc config, where I setup my defaults and source
" # all of my plugins and config files using a plugin called Sourcery
" # For more info, see https://github.com/jesseleite/vim-sourcery

" other settings obtained from
" https://www.youtube.com/watch?v=gnupOrSEikQ&t=40s
" https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" https://github.com/jesseleite/vim-sourcery

" ------------------------------------------------------------------------------
" # Sourcing
" ------------------------------------------------------------------------------

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

" Source plugins
call plug#begin('~/.vim/plugged')
  source ~/dotfiles/tools/vim/plugins.vim     " load Vim plugins
call plug#end()

" Initialize vim-sourcery
call sourcery#init()