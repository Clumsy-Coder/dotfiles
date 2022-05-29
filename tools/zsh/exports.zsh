#!/usr/bin/env zsh

# config inspired by https://github.com/cchamberlain/zdotdir/blob/master/zsh/exports.zsh
# bullet-proof setting PATH https://unix.stackexchange.com/a/415028

export SHELL="/bin/zsh"       # default shell
# export TERM="xterm-256color"
export LANG='en_CA.UTF-8';    # Prefer CA English and use UTF-8.
export LC_ALL='en_CA.UTF-8';  # Prefer CA English and use UTF-8.

export EDITOR='nvim'          # default terminal editor
export EDITOR_VSCODE='code'

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# node version manager (nvm)
# check commit 2e545453b280d1a58e2b45282785b37819a4f623
# export NVM_DIR="$HOME/.nvm"   # set in .zshenv
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  # export Rust to PATH
  # Rust installed using dotbot script dotfiles/meta/configs/rust.yaml file
  export PATH="$CARGO_HOME/bin:$PATH"

  # export golang (set in .zshenv) to PATH
  # https://stackoverflow.com/a/13223578/3053548
  # export GOPATH=~/go            # set in .zshenv
  export PATH=$PATH:$GOPATH/bin

# -------------------------------------------------------------------------------------------------#
# MacOS only exports. $IS_MAC is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_MAC -eq 1 ]]; then
  # setting environment variables for react native to work with android platform
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/tools
  export PATH=$PATH:$ANDROID_HOME/tools/bin
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export PATH="$HOME/.fastlane/bin:$PATH"
  export GEM_HOME=~/.gems
  export PATH="$GEM_HOME/bin:$PATH"

  export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
  export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

  # export python (installed from homebrew)path
  export PYTHON3_PATH=$(which python3)
  export PYTHON2_PATH=$(which python)
  export PATH=$PATH:$PYTHON3_PATH
  export PATH=$PATH:$PYTHON2_PATH

  # setting up homebrew autoupdate
  # using https://github.com/DomT4/homebrew-autoupdate
  # auto update in 24 hours (represented in seconds)
  #export HOMEBREW_AUTO_UPDATE_SECS="3600"

  # to run homebrew autoupdate
  # brew autoupdate --start --upgrade --enable-notification
  # note: it will run every 24 hours by default
  #	it will upgrade the software when available
  #	it will send a MacOS notification when the updates and upgrades are finished
  #   uses https://github.com/julienXX/terminal-notifier

  export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/opt/node@10/bin:$PATH"
  export PATH="/usr/local/opt/node@10/bin:$PATH"

fi # END if [[ $IS_MAC -eq 1 ]]; then
# -------------------------------------------------------------------------------------------------#
# Linux only exports. $IS_LINUX is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_LINUX -eq 1 ]]; then
  # set 'most' as the pager when viewing man pages
  # check https://www.howtogeek.com/683134/how-to-display-man-pages-in-color-on-linux/
  export PAGER='most'
  # needed because bat uses less as the default PAGER.
  # Pager 'most' doesn't support that.
  # check https://github.com/sharkdp/bat#using-a-different-pager
  export BAT_PAGER="less -RF"

fi # END if [[ $IS_LINUX -eq 1 ]]; then
