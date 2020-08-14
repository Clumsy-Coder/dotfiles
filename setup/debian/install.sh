#!/bin/bash

# update and upgrade
sudo apt update && sudo apt full-upgrade -y

# install programs
while read line; do sudo apt install $line; done < ../../apps/debian/applist

# run all scripts from ./programs/ folder
for f in programs/*.sh; do bash "$f" -H; done

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y