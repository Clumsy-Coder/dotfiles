# import alias
alias ls='gls --color'    # need 'coreutils' package. install with brew install coreutils
alias l='ls -lah --group-directories-first'
alias cls='clear'
alias mkcd='function _mkcd(){ mkdir $1; cd $1;}; _mkcd'   # make a dir and cd to it. mkcd newDir
alias c='xclip'
alias v='xclip -o'