#!/usr/bin/env zsh

# config inspired by https://github.com/cchamberlain/zdotdir/blob/master/.zshenv
# what to put in zshenv https://unix.stackexchange.com/a/71258

# XDG env
# https://wiki.archlinux.org/title/XDG_Base_Directory
# https://github.com/b3nj5m1n/xdg-ninja
export XDG_DATA_HOME="$HOME/.local/share"    # Where user-specific data files should be written (analogous to /usr/share).
export XDG_STATE_HOME="$HOME/.local/state"   # Where user-specific state files should be written (analogous to /var/lib).
export XDG_CONFIG_HOME="$HOME/.config"       # Where user-specific configurations should be written (analogous to /etc).
export XDG_CACHE_HOME="$HOME/.cache"         # Where user-specific non-essential (cached) data should be written (analogous to /var/cache).
# export XDG_RUNTIME_DIR="/run/user/$UID"       # Used for non-essential, user-specific data files such as sockets, named pipes, etc.

# -------------------------------------------------------------------------------------------------#

# DIRECTORIES
export DOTDIR="$HOME/dotfiles"
export ZDOTDIR="${ZDOTDIR:-"$HOME/dotfiles/tools/zsh"}"
export ZSCRIPTDIR="$DOTDIR/tools/zsh"

# DOTFILES
export ZSHENV_PATH="$ZSCRIPTDIR/.zshenv"
export ZSHRC_PATH="$ZSCRIPTDIR/.zshrc"
# export ZPROFILE_PATH="$ZSCRIPTDIR/.zprofile"
# export ZLOGIN_PATH="$ZSCRIPTDIR/.zlogin"
# export ZLOGOUT_PATH="$ZSCRIPTDIR/.zlogout"
export NPMRC_PATH="$HOME/.npmrc"
export NVIMRC_PATH="$HOME/.config/nvim/init.lua"
export NVIM_PACKER_DIR_PATH="$HOME/.local/share/nvim/site/pack"
export TMUXRC_PATH="$HOME/.tmux.conf"
export GITCONFIGRC_PATH="$HOME/.gitconfig"

# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

