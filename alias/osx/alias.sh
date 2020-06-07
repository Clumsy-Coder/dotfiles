#Alias
#directory alias
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

#command alias
alias cls='clear'
alias ls='gls --color'    # need 'coreutils' package. install with brew install coreutils
alias l='ls -lah --group-directories-first'
alias ls-all-dir='ls -la | grep "^d"'   #list all folders, even the hidden ones
alias ls-dir='ls -l | grep "^d"'        #list all folders
alias mkcd='function _mkcd(){ mkdir $1; cd $1;};_mkcd'			#make a directory and go into it
alias cntFiles='ls -F |grep -v / | wc -l'
alias ..='cd ..'

#git alias
# alias gits='git status'
# alias gitl='git log'
# alias gitc='git commit'
# alias gitgr='git gr'
# alias gitexcl='git ls-files --others -i --exclude-standard'

#homebrew alias
# alias brewski='brew update && brew upgrade && brew cleanup; brew doctor'

#npm alias
# alias npmls='npm list -g --depth=0' 					#list install npm global package
# alias npmin='function _npmin(){ npm install -g $1;};_npmin' 		#install node package as a global package
# alias npmun='function _npmun(){ npm uninstall -g $1;};_npmun' 		#uninstall node package from global packages
# alias ncu='ncu -g' 							#checks updates for npm. Checks global packages

#miscellaneous alias
# alias nms="nms -a -f green"
# alias startMamp='/Applications/MAMP/bin/start.sh'
# alias stopMamp='/Applications/MAMP/bin/stop.sh'
alias openPort='sudo lsof -PiTCP -sTCP:LISTEN'
# alias openMd='function _openMd(){open -a "Google Chrome" $1;};_openMd'

# pbcopy and pbpaste. A MacOS tool for copying and pasting from/to OS clipboard
# copying output and piping it to a clipboard
# pasting from clipboard
alias c='pbcopy'
alias v='pbpaste'
