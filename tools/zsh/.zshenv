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
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSCRIPTDIR="$DOTDIR/tools/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"                       # history
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"    # generate zsh completions. also oh-my-zsh uses it. https://github.com/ohmyzsh/ohmyzsh/blob/a26d72baa27a46cfd2f35afa789529dccf7fc212/oh-my-zsh.sh#L105-L108
export ZSH_COMPCACHE="$XDG_CACHE_HOME/zsh/zcompcache"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/oh-my-zsh"                    # oh-my-zsh cache dir. https://github.com/ohmyzsh/ohmyzsh/blob/a26d72baa27a46cfd2f35afa789529dccf7fc212/oh-my-zsh.sh#L44-L48
export OH_MY_ZSH_DIR_PATH="$XDG_DATA_HOME/oh-my-zsh"                # ohmyzsh dir path

# dotfiles directories
export DOTBOT_META_PATH="$DOTDIR/meta"
export DOTBOT_CONFIGS_PATH="$DOTBOT_META_PATH/configs"
export DOTBOT_PROFILES_PATH="$DOTBOT_META_PATH/profiles"
export DOTBOT_INSTALL_LIST_PATH="$DOTBOT_META_PATH/install-list"
export DOTBOT_INSTALL_SCRIPT_PATH="$DOTBOT_META_PATH/install-script"

export DOTFILES_TOOLS_PATH="$HOME/dotfiles/tools"

# -------------------------------------------------------------------------------------------------#

# DOTFILES
export ZSHRC_PATH="$ZDOTDIR/.zshrc"
export ZSHENV_PATH="$ZDOTDIR/.zshenv"
# export ZPROFILE_PATH="$ZDOTDIR/.zprofile"
export ZLOGIN_PATH="$ZDOTDIR/.zlogin"
# export ZLOGOUT_PATH="$ZDOTDIR/.zlogout"

# -------------------------------------------------------------------------------------------------#
# XDG files and directories

# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"                      # Docker

# less
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"                  # less history

# Rust package manager
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"                          # Rust install dir
export CARGO_HOME="$XDG_DATA_HOME/cargo"                            # Rust package manager

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"                                # Ruby Gems
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"                         # Ruby Gems
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle"                 # Ruby Bundler config
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"                   # Ruby Bundler cache
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"                   # Ruby Bundler local/share

# Golang package manager
export GOPATH="$XDG_DATA_HOME/go"                                   # Golang package manager

# npm
export NVM_DIR="$XDG_DATA_HOME/nvm"                                 # Node Version Manager
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"           # npm config
export NPMRC_PATH="$NPM_CONFIG_USERCONFIG"

# ncurses
export TERMINFO="$XDG_DATA_HOME/terminfo"                           # ncurses
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"  # ncurses

# neovim
export NVIM_CONFIG_DIR_PATH="$XDG_CONFIG_HOME/nvim"                 # neovim config folder
export NVIM_PACKER_DIR_PATH="$XDG_DATA_HOME/nvim/site/pack"         # neovim plugin installation folder

# tmux
export TMUX_CONFIG_PATH="$XDG_CONFIG_HOME/tmux/tmux.conf"           # tmux config path
export TMUX_PLUGIN_CACHE_PATH="$XDG_DATA_HOME/tmux/plugins"         # tmux plugin cache directory
export ZSH_TMUX_CONFIG="$TMUX_CONFIG_PATH"                          # tmux config file (loading ZSH antigen plugin)
                                                                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux#configuration-variables

# git
export GIT_CONFIG_PATH="$XDG_CONFIG_HOME/git/config"
export GIT_IGNORE_GLOBAL_PATH="$XDG_CONFIG_HOME/git/.gitignore_global"
export GIT_ATTRIBUTES_PATH="$XDG_CONFIG_HOME/git/.gitattributes"

# vagrant
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"                        # Vagrant

# zsh antigen
# export ZSH_ANTIGEN_CACHE_DIR_PATH="$XDG_DATA_HOME/antigen"          # antigen cache directory.
export ADOTDIR="$XDG_DATA_HOME/antigen"                               # use new path for zsh antigen cache. https://github.com/zsh-users/antigen/issues/722#issuecomment-728113623
export ANTIGEN_CACHE="$ADOTDIR/init.zsh"
export ANTIGEN_COMPDUMP="$ADOTDIR/.zcompdump"

# alacritty
export ALACRITTY_CONFIG_PATH="$XDG_CONFIG_HOME/alacritty/alacritty.yml"

# brewfile
export BREWFILE_PATH="$HOME/dotfiles/meta/install-list/Brewfile"

# -------------------------------------------------------------------------------------------------#

# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

