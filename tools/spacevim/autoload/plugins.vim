" Vim plugin configs
" 
" Scavanged vim config from
" https://github.com/Clumsy-Coder/dotfiles/blob/1.8.6/tools/vim/plugins.vim
" https://github.com/Clumsy-Coder/dotfiles/blob/1.8.7/tools/vim/plugins.vim

" ------------------------------------------------------------------------------------------------ "
" load all plugin configs from ~/dotfiles/tools/spacevim/autoload/configs/
" these contain config for their respective plugins
" any hotkeys for the plugins will be placed in ~/dotfiles/tools/spacevim/autoload/keymaps.vim
" 
" NOTE: ~/dotfiles/tools/spacevim/autoload/ symbolic linked to ~/.SpaceVim.d/autoload/
"   check dotfiles/meta/configs/spacevim.yaml
for pluginConfigFile in split(glob('~/.SpaceVim.d/autoload/configs/*.vim'), '\n')
  exe 'source' pluginConfigFile
endfor

" ------------------------------------------------------------------------------------------------ "
