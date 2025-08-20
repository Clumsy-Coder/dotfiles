#!/usr/bin/env zsh

# zinit plugin manager
# config obtained from
# - https://www.youtube.com/watch?v=ud7YxC33Z3w
# - https://github.com/dreamsofautonomy/dotfiles/blob/main/.zshrc

ZINIT_REPO="https://github.com/zdharma-continuum/zinit.git"

# install zinit IF not installed
if [ ! -d "$ZINIT_HOME" ]; then
  echo "Downloading zinit repo $ZINIT_REPO to $ZINIT_HOME"
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone --depth 1 "$ZINIT_REPO" "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# -------------------------------------------------------------------------------------------------#
# load plugins

# zinit light ohmyzsh/ohmyzsh
zinit ice depth=1; zinit light romkatv/powerlevel10k  # theme

# oh-my-zsh plugins
# found in https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
#
# zinit snippet OMZP::alias-finder       # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/alias-finder
# zinit snippet OMZP::heroku             # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/heroku
# zinit snippet OMZP::node               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/node
# zinit snippet OMZP::tmuxinator         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmuxinator
# zinit snippet OMZP::yarn               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn
zinit snippet OMZP::command-not-found  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found
zinit snippet OMZP::common-aliases     # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases
zinit snippet OMZP::copybuffer         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copybuffer
zinit snippet OMZP::copyfile           # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile
zinit snippet OMZP::extract            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract
zinit snippet OMZP::git                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
zinit snippet OMZP::history            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history
zinit snippet OMZP::nmap               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nmap
zinit snippet OMZP::npm                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm
zinit snippet OMZP::nvm                # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
zinit snippet OMZP::sudo               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
zinit snippet OMZP::systemadmin        # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemadmin
zinit snippet OMZP::tmux               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux
zinit snippet OMZP::web-search         # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search

# -------------------------------------------------------------------------------------------------#

zinit light djui/alias-tips                           # display aliases based on the previous command executed
zinit light webyneter/docker-aliases                  # aliases for Docker
zinit light wfxr/forgit                               # cmd utility for Git using fzf
zinit light zsh-users/zsh-autosuggestions             # suggests commands as you type
zinit light zsh-users/zsh-completions                 # additional completions for ZSH
zinit light zsh-users/zsh-syntax-highlighting         # highlights commands as you type
zinit light Aloxaf/fzf-tab                            # replace zsh default completion with fzf

# load zsh-completions
autoload -Uz compinit && compinit

# -------------------------------------------------------------------------------------------------#
# MacOS only ZSH plugins. $IS_MAC is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_MAC -eq 1 ]]; then
  zinit snippet OMZP::brew               # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew
  zinit snippet OMZP::macos              # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos

fi # END if [[ $IS_MAC -eq 1 ]]; then
# -------------------------------------------------------------------------------------------------#
# Linux only ZSH plugins. $IS_LINUX is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_LINUX -eq 1 ]]; then
  zinit snippet OMZP::systemd            # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd

fi # END if [[ $IS_LINUX -eq 1 ]]; then

# -------------------------------------------------------------------------------------------------#
# Completion styline
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # add colour when tab Completing
zstyle ':completion:*' menu no                          # disable the default completion menu. use fzf-tab

# shell integration
eval "$(fzf --zsh)"
