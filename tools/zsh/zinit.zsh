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

