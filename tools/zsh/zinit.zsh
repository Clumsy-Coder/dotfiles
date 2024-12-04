#!/usr/bin/env zsh

# zinit plugin manager
# config obtained from
# - https://www.youtube.com/watch?v=ud7YxC33Z3w

ZINIT_REPO="https://github.com/zdharma-continuum/zinit.git"

# install zinit IF not installed
if [ ! -d "$ZINIT_HOME" ]; then
  echo "Downloading zinit repo $ZINIT_REPO"
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone --depth 1 "$ZINIT_REPO" "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# -------------------------------------------------------------------------------------------------#
# load plugins

zinit ice depth=1; zinit light romkatv/powerlevel10k  # theme

zinit light djui/alias-tips                           # display aliases based on the previous command executed
zinit light webyneter/docker-aliases                  # aliases for Docker
zinit light wfxr/forgit                               # cmd utility for Git using fzf
zinit light zsh-users/zsh-autosuggestions             # suggests commands as you type
zinit light zsh-users/zsh-completions                 # additional completions for ZSH
zinit light zsh-users/zsh-syntax-highlighting         # highlights commands as you type

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
