#!/usr/bin/env zsh

# config inspired by https://github.com/cchamberlain/zdotdir/blob/master/zsh/aliases.zsh

# -------------------------------------------------------------------------------------------------#
# MacOS only aliases. $IS_MAC is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_MAC -eq 1 ]]; then

  alias openPort='sudo lsof -PiTCP -sTCP:LISTEN'    # check which ports are open
  # alias openMd='function _openMd(){open -a "Google Chrome" $1;};_openMd'

  # pbcopy and pbpaste. A MacOS tool for copying and pasting from/to OS clipboard
  # copying output and piping it to a clipboard
  # pasting from clipboard
  alias c='pbcopy'
  alias v='pbpaste'

  #homebrew alias
  # alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

  alias oo='open .' # open current directory in OS X Finder

  alias ls='gls --color'    # need 'coreutils' package. install with brew install coreutils
  alias l='ls -lah --group-directories-first'
  alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion" # recommendation from xdg-ninja

fi # END if [[ $IS_MAC -eq 1 ]]; then
# -------------------------------------------------------------------------------------------------#
# Linux only aliases. $IS_LINUX is set in zsh/checks.sh
# -------------------------------------------------------------------------------------------------#
if [[ $IS_LINUX -eq 1 ]]; then
  alias man='man --pager=most'                     # using 'most' as pager. Check debian-exports.sh

  # Linux version of OSX pbcopy and pbpaste.
  # obtained from
  # - https://medium.com/@codenameyau/how-to-copy-and-paste-in-terminal-c88098b5840d
  alias c='xsel --clipboard --input'
  alias v='xsel --clipboard --output'
fi # END if [[ $IS_LINUX -eq 1 ]]; then

# -------------------------------------------------------------------------------------------------#
# command aliases
# -------------------------------------------------------------------------------------------------#
alias cls='clear'                                         # clear screen
alias mkcd='function _mkcd(){ mkdir $1; cd $1;};_mkcd'    # make a directory and go into it

# -------------------------------------------------------------------------------------------------#
# miscellaneous aliases
# -------------------------------------------------------------------------------------------------#
# alias nms="nms -a -f green"
# alias startMamp='/Applications/MAMP/bin/start.sh'
# alias stopMamp='/Applications/MAMP/bin/stop.sh'
alias history='omz_history -i'
alias echoPath='echo -e ${PATH//:/\\n}'  # print PATH entries line by line

# -------------------------------------------------------------------------------------------------#
# directory movement
# -------------------------------------------------------------------------------------------------#
alias ..='cd ..'

alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'
alias googleDr='cd ~/Google\ Drive'
alias development='cd ~/Documents/Development'
alias android-dev='cd ~/Documents/Development/android'
alias ios-dev='cd ~/Documents/Development/iOS'
alias eclipse='cd ~/Documents/Development/eclipse'
alias intellij='cd ~/Documents/Development/intellij'
alias libraries='cd ~/Documents/Development/libraries'
alias competition="cd ~/Documents/Development/programmingContest/gitRepo/programming-competition"
alias kattis='cd ~/Documents/Development/programmingContest/gitRepo/programming-competition/kattis'
alias uva='cd ~/Documents/Development/programmingContest/gitRepo/programming-competition/uva'
alias web='cd ~/Documents/Development/web'
alias phnGap='cd ~/Documents/Development/phoneGap'
alias chengSrc='cd ~/Documents/Development/programmingContest/howardChengFiles/contest/algorithms/src'
alias mampHtdocs='cd /Applications/MAMP/htdocs'
alias pythonDev='cd ~/Documents/Development/python'

# -------------------------------------------------------------------------------------------------#
# directory information
# -------------------------------------------------------------------------------------------------#
alias ls-all-dir='ls -la | grep "^d"'                       # list all folders, even the hidden ones
alias ls-dir='ls -l | grep "^d"'                            # list all folders
alias ls='lse'
alias l='ls'
alias lse='exa -lahFHmguU --group-directories-first'  # use 'exa' to view directory contents
alias cntFiles='ls -F | grep -v / | wc -l'                  # count number of folders in directory
alias nnn='nnn -diHUD'

# -------------------------------------------------------------------------------------------------#
# grep
# -------------------------------------------------------------------------------------------------#
alias grep='grep --color'

# -------------------------------------------------------------------------------------------------#
# Git
# -------------------------------------------------------------------------------------------------#
# alias gits='git status'
# alias gitl='git log'
# alias gitc='git commit'
# alias gitgr='git gr'
# alias gitexcl='git ls-files --others -i --exclude-standard'

# -------------------------------------------------------------------------------------------------#
# NPM
# -------------------------------------------------------------------------------------------------#
# alias npmls='npm list -g --depth=0'                             # list install npm global package
# alias npmin='function _npmin(){ npm install -g $1;};_npmin'     # install node package as a global package
# alias npmun='function _npmun(){ npm uninstall -g $1;};_npmun'   # uninstall node package from global packages
# alias ncu='ncu -g'                                              # checks updates for npm. Checks global packages
#
# -------------------------------------------------------------------------------------------------#
# Obsidian
# obtained from
# - https://github.com/agalea91/dotfiles/blob/52b72715536b1938a97e81466a558d3bc9d7618d/.zshrc#L60-L63
# - https://youtu.be/1Lmyh0YRH-w
alias oo='cd $OBSIDIAN_DIR_PATH/mimir/' # navigate to my obsidian vault
# open all obsidian notes in `inbox` folder using neovim. use command whether to keep the notes or delete them
# check
# - https://youtu.be/1Lmyh0YRH-w?t=795
# alias or='nvim $OBSIDIAN_DIR_PATH/mimir/inbox/*.md' # obsidian review

# fuzzy search obsidian vault files and open on pressing <enter>
# uses
# - find : list all the files in obsidian vault
# - fzf : to fuzzy find the files (by filename) and show a preview
#
# obtained from
# - https://stackoverflow.com/a/10589822/3053548
# - https://chatgpt.com/c/66ec4e75-e294-8011-94af-28a39183e93d
alias os="find $OBSIDIAN_DIR_PATH/mimir -name '.git*' -prune -o -type f -print | fzf --preview 'bat --style=numbers --color=always --line-range=:500 {}' --bind 'enter:execute(nvim {})+abort'"
# -------------------------------------------------------------------------------------------------#
