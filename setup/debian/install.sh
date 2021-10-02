#!/bin/bash

# update and upgrade
sudo apt update && sudo apt full-upgrade -y

# install programs. Use ../../apps/debian/applist
while read line; do sudo apt install $line -y; done < ../../apps/debian/applist

read -p "Do want to install terminal based software (y/n)? " -n 1 -r installTerminalSoft
echo    # (optional) move to a new line
read -p "Do want to install GUI based software (y/n)? " -n 1 -r installGuiSoft
echo    # (optional) move to a new line
echo    # (optional) move to a new line

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