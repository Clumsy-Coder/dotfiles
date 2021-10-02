#!/bin/bash

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
while read line; do sudo apt install $line -y; done < ../../apps/debian/applist

if [[ $installTerminalSoft =~ ^[Yy]$ ]]
then
    echo "installing terminal based software";
    for f in ./programs/terminal-based/*.sh; do bash "$f" -H; done
fi

if [[ $installGuiSoft =~ ^[Yy]$ ]]
then
    echo "installing GUI based software";
    for f in ./programs/gui-based/*.sh; do bash "$f" -H; done
fi

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# download default .zshrc from Oh-my-zsh
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/templates/zshrc.zsh-template -o ~/.zshrc

# reference dotfile zsh
echo "" >> ~/.zshrc
echo "# Run ~/dotfiles/index.sh for oh-my-zsh" >> ~/.zshrc
echo "source ~/dotfiles/index.sh" >> ~/.zshrc

# install zsh and oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
