" ================================================================================================ "
" Vimrc
" ================================================================================================ "
" The main file used for loading custom SpaceVim configs.
" NOTE: ~/dotfiles/tools/spacevim/autoload/ linked to $SPACEVIMDIR/autoload/
"   check dotfiles/meta/configs/spacevim.yaml
"
" Running custom spacevim configs
" https://spacevim.org/documentation/#bootstrap-functions
" https://gitlab.com/GitMaster210/my-config-files/-/blob/master/SpaceVim%20-%20NO%20LONGER%20UPDATED!%20-/myconfig.vim
"
" other settings obtained from
" https://www.youtube.com/watch?v=gnupOrSEikQ&t=40s
" https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f
" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
" https://github.com/jesseleite/vim-sourcery
"
"
" Scavenged vim config from
" https://github.com/Clumsy-Coder/dotfiles/blob/1.8.6/tools/vim/.vimrc
" https://github.com/Clumsy-Coder/dotfiles/blob/1.8.7/tools/vim/.vimrc

" ================================================================================================ "
" run this function BEFORE loading SpaceVim
function! myspacevim#before() abort
  source $SPACEVIMDIR/autoload/plugins.vim     " load Vim plugins configs

endfunction " END function myspacevim#before() abort

" ================================================================================================ "
" run this function AFTER loading SpaceVim
function! myspacevim#after() abort

  source $SPACEVIMDIR/autoload/editor.vim      " load Vim editor settings
  " source $SPACEVIMDIR/autoload/plugins.vim     " load Vim plugins configs
  source $SPACEVIMDIR/autoload/keymaps.vim     " load custom Vim keymaps

endfunction " END function myspacevim#after() abort

" ================================================================================================ "
