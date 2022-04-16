# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

# load OS and programs checks
source ~/dotfiles/zsh/checks.zsh

# load ZSH theme powerlevel9k config
source ~/dotfiles/environment/theme/powerlevel9k/powerlevel9k.sh

# load ZSH plugin manager (antigen)
source ~/dotfiles/environment/antigen/antigen.sh

# load alias
source ~/dotfiles/zsh/aliases.zsh
