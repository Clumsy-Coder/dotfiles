#!/bin/bash

# install homebrew
echo "██ ███    ██ ███████ ████████  █████  ██      ██      ██ ███    ██  ██████ "
echo "██ ████   ██ ██         ██    ██   ██ ██      ██      ██ ████   ██ ██      "
echo "██ ██ ██  ██ ███████    ██    ███████ ██      ██      ██ ██ ██  ██ ██   ███ "
echo "██ ██  ██ ██      ██    ██    ██   ██ ██      ██      ██ ██  ██ ██ ██    ██ "
echo "██ ██   ████ ███████    ██    ██   ██ ███████ ███████ ██ ██   ████  ██████  "
echo ""
echo""
echo "██   ██  ██████  ███    ███ ███████ ██████  ██████  ███████ ██     ██ "
echo "██   ██ ██    ██ ████  ████ ██      ██   ██ ██   ██ ██      ██     ██ "
echo "███████ ██    ██ ██ ████ ██ █████   ██████  ██████  █████   ██  █  ██ "
echo "██   ██ ██    ██ ██  ██  ██ ██      ██   ██ ██   ██ ██      ██ ███ ██ "
echo "██   ██  ██████  ██      ██ ███████ ██████  ██   ██ ███████  ███ ███  " 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew applications
brew bundle --file ~/dotfiles/setup/macos/programs/Brewfile

# download 'ANSI Shadow' and 'ANSI Regular' figlet font
curl https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf -o '/usr/local/share/figlet/ANSI Shadow.flf'
curl https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Regular.flf -o '/usr/local/share/figlet/ANSI Regular.flf'

# installing vim plugins
figlet -w 150 -f 'ANSI Regular' "installing Vim plugins";
source ~/dotfiles/tools/tools.sh;
vim +PlugInstall +qall;

# install zsh and oh-my-zsh
figlet -w 150 -f 'ANSI Regular' "installing ZSH and oh-my-zsh";
# download default .zshrc from Oh-my-zsh
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/templates/zshrc.zsh-template -o ~/.zshrc

# reference dotfile zsh
echo "" >> ~/.zshrc
echo "# Run ~/dotfiles/index.sh for oh-my-zsh" >> ~/.zshrc
echo "source ~/dotfiles/index.sh" >> ~/.zshrc

# install zsh and oh-my-zsh
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"