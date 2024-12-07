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
export XDG_DATA_SRC="$HOME/.local/src"       # Where user-specific source files are placed. check https://unix.stackexchange.com/a/36874/644926
export XDG_DATA_BIN="$HOME/.local/bin"       # Where user-specific binary files are placed. check https://unix.stackexchange.com/a/36874/644926

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"

# -------------------------------------------------------------------------------------------------#

# DIRECTORIES
export DOTDIR="$HOME/dotfiles"                                      # used by zshenv and ansible (to link files, etc)
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSCRIPTDIR="$DOTDIR/tools/zsh"
export HISTFILE_DIR_PATH="$XDG_STATE_HOME/zsh"                      # history dir path
export HISTFILE="$HISTFILE_DIR_PATH/history"                        # history
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

# zsh theme
# env used by dotbot config 'zsh.yaml' and '.zshrc'
# setting the theme in one place and reflecting the changes automatically
#   - updating .zshrc to use the newly set zsh theme
#   - applying the zsh theme by linking the zsh theme file in $ZDOTDIR/.p10k.zsh
#
# usage:
# - set ENV to zsh theme
# - run dotbot config 'zsh.yaml'
# - reload zsh with command 'omz reload'
export ZSH_THEME_DIR_PATH="$ZSCRIPTDIR/theme"
# export ZSH_THEME_DEFAULT="$ZSH_THEME_DIR_PATH/powerlevel10k/rainbow.zsh"
export ZSH_THEME_DEFAULT="$ZSH_THEME_DIR_PATH/powerlevel10k/classic.zsh"
# export ZSH_THEME_DEFAULT="$ZSH_THEME_DIR_PATH/powerlevel9k/powerlevel9k.zsh"

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
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME/solargraph"                # Ruby solargraph. Language Server Protocol. Used in Neovim

# Golang package manager
export GOPATH="$XDG_DATA_HOME/go"                                   # Golang package manager

# npm
export NVM_DIR="$XDG_DATA_HOME/nvm"                                 # Node Version Manager
export NPM_DIR="$XDG_CONFIG_HOME/npm"
export NPM_CONFIG_USERCONFIG="$NPM_DIR/npmrc"                       # npm config
export NPMRC_PATH="$NPM_CONFIG_USERCONFIG"
export NPM_BIN_PATH="$XDG_DATA_HOME/npm"                            # global npm packages directory

# ncurses
export TERMINFO="$XDG_DATA_HOME/terminfo"                           # ncurses
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"  # ncurses

# neovim
export NVIM_CONFIG_DIR_PATH="$XDG_CONFIG_HOME/nvim"                 # neovim config folder
export NVIM_PACKER_DIR_PATH="$XDG_DATA_HOME/nvim/site/pack/packer/" # neovim plugin installation folder
export NVIM_PACKER_COMPILED_PATH="$XDG_DATA_HOME/nvim/packer_compiled.lua" # packer compiled file
export ASTRO_NVIM_CONFIG_DIR_PATH="$NVIM_CONFIG_DIR_PATH/lua/user"    # astronvim custom configs folder

# tmux
export TMUX_CONFIG_DIR_PATH="$XDG_CONFIG_HOME/tmux"                 # tmux config dir path
export TMUX_CONFIG_PATH="$TMUX_CONFIG_DIR_PATH/tmux.conf"           # tmux config path
export TMUX_PLUGIN_CACHE_PATH="$XDG_DATA_HOME/tmux/plugins"         # tmux plugin cache directory
export TMUX_CONFIG_LOCAL_PATH="$TMUX_CONFIG_DIR_PATH/tmux.conf.local" # tmux local config. used with oh-my-tmux
export OH_MY_TMUX_DIR_PATH="$XDG_CONFIG_HOME/oh-my-tmux"            # oh-my-tmux dir path
export OH_MY_TMUX_CONFIG_PATH="$OH_MY_TMUX_DIR_PATH/.tmux.conf"    # oh-my-tmux config path
export ZSH_TMUX_CONFIG="$TMUX_CONFIG_PATH"                          # tmux config file (loading ZSH antigen plugin)
                                                                    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux#configuration-variables

# git
export GIT_CONFIG_DIR_PATH="$XDG_CONFIG_HOME/git"
export GIT_CONFIG_PATH="$GIT_CONFIG_DIR_PATH/config"
export GIT_IGNORE_GLOBAL_PATH="$GIT_CONFIG_DIR_PATH/.gitignore_global"
export GIT_ATTRIBUTES_PATH="$GIT_CONFIG_DIR_PATH/.gitattributes"
export LAZYGIT_CONFIG_DIR_PATH="$XDG_CONFIG_HOME/lazygit"
export LAZYGIT_CONFIG_PATH="$LAZYGIT_CONFIG_DIR_PATH/config.yml"
# https://calebhearth.com/sign-git-with-ssh
export GIT_ALLOWED_SIGNERS="$HOME/.ssh/allowed_signers"

# vagrant
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"                        # Vagrant

# zsh antigen
# export ZSH_ANTIGEN_CACHE_DIR_PATH="$XDG_DATA_HOME/antigen"          # antigen cache directory.
export ADOTDIR="$XDG_DATA_HOME/antigen"                               # use new path for zsh antigen cache. https://github.com/zsh-users/antigen/issues/722#issuecomment-728113623
export ANTIGEN_CACHE="$ADOTDIR/init.zsh"
export ANTIGEN_COMPDUMP="$ADOTDIR/.zcompdump"

# zsh zinit
export ZINIT_HOME="$XDG_DATA_HOME/zinit"

# alacritty
export ALACRITTY_CONFIG_DIR_PATH="$XDG_CONFIG_HOME/alacritty"
export ALACRITTY_CONFIG_PATH="$ALACRITTY_CONFIG_DIR_PATH/alacritty.toml"

# brewfile
export BREWFILE_PATH="$HOME/dotfiles/meta/install-list/Brewfile"

# neofetch
export NEOFETCH_CONFIG_DIR_PATH="$XDG_CONFIG_HOME/neofetch"
export NEOFETCH_CONFIG_PATH="$NEOFETCH_CONFIG_DIR_PATH/config.conf"

# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# kitty terminal
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"

# ansible
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"

# pyenv
export PYENV_DIR_PATH="$XDG_DATA_HOME/pyenv"
export PYENV_ROOT="$PYENV_DIR_PATH"

# fail2ban
export FAIL2BAN_JAIL_FILE_PATH="/etc/fail2ban/jail.local"

# spacevim
export SPACEVIMDIR="$XDG_CONFIG_HOME/SpaceVim.d"

# node repl
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node-repl/node_repl_history"

# nuget
export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"

# obsidian. where to place obsidian vault
export OBSIDIAN_DIR_PATH="$HOME/Documents/obsidian"

# microsoft c# dotnet framework
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"

# w3m (text based web browser)
export W3M_DIR="$XDG_DATA_HOME/w3m"

# wakatime. make sure the directory exists
export WAKATIME_HOME="$XDG_CONFIG_HOME/wakatime"
# mkdir $WAKATIME_HOME > /dev/null 2>&1             # obtained from https://www.cyberciti.biz/faq/how-to-redirect-output-and-errors-to-devnull/

# use neovim to view man pages
# obtained from
# - https://www.youtube.com/watch?v=Dg2Lek-xN70&t=159s
export MANPAGER='nvim +Man!'

# -------------------------------------------------------------------------------------------------#

# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

