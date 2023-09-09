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
alias lse='exa -lahFHmguU --git --group-directories-first'  # use 'exa' to view directory contents
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
