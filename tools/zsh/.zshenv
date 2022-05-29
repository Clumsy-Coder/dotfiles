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
export ZDOTDIR="${ZDOTDIR:-"$XDG_CONFIG_HOME/zsh"}"
export ZSCRIPTDIR="$DOTDIR/tools/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"                       # history
export OH_MY_ZSH_DIR_PATH="$XDG_DATA_HOME/oh-my-zsh"                # ohmyzsh dir path

# -------------------------------------------------------------------------------------------------#

# DOTFILES
export ZSHRC_PATH="$ZDOTDIR/.zshrc"
export ZSHENV_PATH="$ZDOTDIR/.zshenv"
# export ZPROFILE_PATH="$ZDOTDIR/.zprofile"
export ZLOGIN_PATH="$ZDOTDIR/.zlogin"
# export ZLOGOUT_PATH="$ZDOTDIR/.zlogout"

export NPMRC_PATH="$HOME/.npmrc"
export NVIMRC_PATH="$HOME/.config/nvim/init.lua"
export NVIM_PACKER_DIR_PATH="$HOME/.local/share/nvim/site/pack"
export TMUXRC_PATH="$HOME/.tmux.conf"



# git
export GIT_CONFIG_PATH="$XDG_CONFIG_HOME/git/config"
export GIT_IGNORE_GLOBAL_PATH="$XDG_CONFIG_HOME/git/.gitignore_global"
export GIT_ATTRIBUTES_PATH="$XDG_CONFIG_HOME/git/.gitattributes"

# zsh antigen
# export ZSH_ANTIGEN_CACHE_DIR_PATH="$XDG_DATA_HOME/antigen"          # antigen cache directory.
export ADOTDIR="$XDG_DATA_HOME/antigen"                               # use new path for zsh antigen cache. https://github.com/zsh-users/antigen/issues/722#issuecomment-728113623
export ANTIGEN_CACHE="$ADOTDIR/init.zsh"
export ANTIGEN_COMPDUMP="$ADOTDIR/.zcompdump"

# -------------------------------------------------------------------------------------------------#

# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

