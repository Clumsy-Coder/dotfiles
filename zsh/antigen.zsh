#!/usr/bin/env zsh

# Assuming antigen is installed
# If antigen is not installed the run the following command
# curl -L git.io/antigen > ~/antigen.zsh
# 
# download antigen if it's NOT installed
if [ ! -d ~/.antigen ] || [ ! -e ~/antigen.zsh ]; then
  echo "\nDownloading antigen plugin\n"
  curl -L git.io/antigen > ~/antigen.zsh
fi

source ~/antigen.zsh

# -------------------------------------------------------------------------------------------------#
# MacOS only ZSH plugins. $IS_MAC is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_MAC -eq 1 ]]; then
  antigen bundle brew               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew
fi # END if [[ $IS_MAC -eq 1 ]]; then
# -------------------------------------------------------------------------------------------------#
# Linux only ZSH plugins. $IS_LINUX is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_LINUX -eq 1 ]]; then
  antigen bundle systemd            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd

fi # END if [[ $IS_LINUX -eq 1 ]]; then
# -------------------------------------------------------------------------------------------------#

# load antigen plugins
antigen bundle git                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
antigen bundle command-not-found  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found
antigen bundle npm                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm
antigen bundle node               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/node
antigen bundle yarn               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn
antigen bundle tmux               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
antigen bundle tmuxinator         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmuxinator
antigen bundle common-aliases     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases
antigen bundle extract            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract
antigen bundle history            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history
antigen bundle nmap               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nmap
antigen bundle web-search         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
antigen bundle nvm                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm

# Custom bundles
antigen bundle zsh-users/zsh-autosuggestions        # suggests commands as you type
antigen bundle zsh-users/zsh-syntax-highlighting    # highlights commands as you type
antigen bundle zsh-users/zsh-completions            
antigen bundle chrissicool/zsh-256color             # enable 256 colours for the terminal
antigen bundle djui/alias-tips                      # display aliases based on the previous command executed
antigen bundle ael-code/zsh-colored-man-pages       # adds a bit of colour to man pages
antigen bundle joel-porquet/zsh-dircolors-solarized # adding colour when listing current directory contents
antigen bundle webyneter/docker-aliases             # aliases for Docker
antigen bundle 'wfxr/forgit'                        # cmd utility for Git using fzf

# Load a theme
antigen theme bhilburn/powerlevel9k                 # load powerlevel9k zsh theme

# apply the plugins
antigen apply
