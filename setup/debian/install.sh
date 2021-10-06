#!/bin/bash

# what the script does
# 
# 1. Asks if you wish to install Terminal and GUI based software (outside of APT)
# 2. Update and upgrade APT packages
# 3. Install APT packages from dotfiles/setup/debian/programs/applist
# 4. Install software outside of APT repos
#    1. Install terminal based software. dotfiles/setup/debian/programs/terminal-based/*
#    2. Install GUI based software. dotfiles/setup/debian/programs/gui-based/*
# 5. Install Vim plugins
# 6. Install ZSH and Oh-my-zsh
# 7. Download default .zshrc from oh-my-zsh (will overwrite existing ~/.zshrc)
# 8. Source dotfiles ZSH config to ~/.zshrc
#    1. `source ~/dotfiles/index.sh`
# 9. Install oh-my-zsh plugins (done with antigen plugin manager)
# 
# ##################################################################################################

# ask if user wishes to install terminal based software
read -p "Do want to install terminal based software (y/n)? " -n 1 -r installTerminalSoft
echo    # (optional) move to a new line

# ask if user wishes to install GUI based software
read -p "Do want to install GUI based software (y/n)? " -n 1 -r installGuiSoft
echo    # (optional) move to a new line
echo    # (optional) move to a new line

# update and upgrade
sudo apt update && sudo apt full-upgrade -y

# install programs. Use ../../apps/debian/applist
# while read line; do sudo apt install $line -y; done < ~/dotfiles/setup/debian/programs/applist
sudo apt install -y $(cat ~/dotfiles/setup/debian/programs/applist);

# download 'ANSI Shadow' figlet font
sudo curl https://raw.githubusercontent.com/xero/figlet-fonts/master/ANSI%20Shadow.flf -o '/usr/share/figlet/ANSI Shadow.flf'

if [[ $installTerminalSoft =~ ^[Yy]$ ]]
then
    figlet -w 150 -f 'ANSI Shadow' "installing terminal software" ;
    for f in ~/dotfiles/setup/debian/programs/terminal-based/*.sh; do bash "$f" -H; done
fi

if [[ $installGuiSoft =~ ^[Yy]$ ]]
then
    figlet -w 150 -f 'ANSI Shadow' "installing GUI based software";
    for f in ~/dotfiles/setup/debian/programs/gui-based/*.sh; do bash "$f" -H; done
fi

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# installing vim plugins
figlet -w 150 -f 'ANSI Shadow' "installing Vim plugins";
source ~/dotfiles/tools/tools.sh;
vim +PlugInstall +qall;

# setup ZSH and oh-my-zsh
figlet -w 150 -f 'ANSI Shadow' "installing ZSH and oh-my-zsh";
# download default .zshrc from Oh-my-zsh
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/templates/zshrc.zsh-template -o ~/.zshrc

# reference dotfile zsh
echo "" >> ~/.zshrc
echo "# Run ~/dotfiles/index.sh for oh-my-zsh" >> ~/.zshrc
echo "source ~/dotfiles/index.sh" >> ~/.zshrc

# install zsh and oh-my-zsh
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
