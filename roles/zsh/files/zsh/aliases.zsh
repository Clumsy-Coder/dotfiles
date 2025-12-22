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
  # Linux version of OSX pbcopy and pbpaste.
  # obtained from
  # - https://medium.com/@codenameyau/how-to-copy-and-paste-in-terminal-c88098b5840d
  alias c='xsel --clipboard --input'
  alias v='xsel --clipboard --output'
fi # END if [[ $IS_LINUX -eq 1 ]]; then

# -------------------------------------------------------------------------------------------------#
# Admin commands
# -------------------------------------------------------------------------------------------------#
alias _="sudo "

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

# -------------------------------------------------------------------------------------------------#
# directory information
# -------------------------------------------------------------------------------------------------#
alias cntFiles='ls -F | grep -v / | wc -l'                  # count number of folders in directory

# alias if exa is installed
if [ -x "$(command -v exa)" ]; then
  # alias ls-all-dir='ls -la | grep "^d"'                       # list all folders, even the hidden ones
  # alias ls-dir='ls -l | grep "^d"'                            # list all folders
  # alias ls='lse'
  # alias l='ls'
  # alias lse='exa -lahFHmguU --group-directories-first'  # use 'exa' to view directory contents

  alias ls="exa --group-directories-first"
  alias l="ls -lhFHmguU"
  alias ll="ls -lahFHmguU"
else
  alias ls="ls --color --group-directories-first"
fi

# -------------------------------------------------------------------------------------------------#
# grep
# -------------------------------------------------------------------------------------------------#
alias grep='grep --color'

# -------------------------------------------------------------------------------------------------#
# NPM
# -------------------------------------------------------------------------------------------------#
# alias npmls='npm list -g --depth=0'                             # list install npm global package
# alias npmin='function _npmin(){ npm install -g $1;};_npmin'     # install node package as a global package
# alias npmun='function _npmun(){ npm uninstall -g $1;};_npmun'   # uninstall node package from global packages
# alias ncu='ncu -g'                                              # checks updates for npm. Checks global packages
#
# -------------------------------------------------------------------------------------------------#

# All custom functions and completions
for file in $DOTDIR/roles/zsh/files/zsh/aliases/*.zsh; do
  source "$file"
done
