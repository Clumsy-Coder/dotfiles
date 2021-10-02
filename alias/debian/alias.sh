# directory alias
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'

# command alias
alias cls='clear'
alias l='ls -lah --group-directories-first'
alias ls-all-dir='ls -la | grep "^d"'                       #list all folders, even the hidden ones
alias ls-dir='ls -l | grep "^d"'                            #list all folders
alias mkcd='function _mkcd(){ mkdir $1; cd $1;};_mkcd'      #make a directory and go into it
alias cntFiles='ls -F |grep -v / | wc -l'
alias lse='exa -lahFHmguU --git --group-directories-first'  # use 'exa' to view directory contents