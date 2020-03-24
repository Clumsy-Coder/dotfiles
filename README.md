# dotfiles

Your personal config for setting up a zsh terminal

All your configurations on setting the terminal is done here.

Ex:

- Setting up all your custom aliases
- Environment variables
- Vim config
- Tmux config
- Scripts to run when a Unix shell is initializing
  - Ex: Run `neofetch` after the shell has finished initializing

This can also be extended to focus on one specific Unix shell. Just fork the repo and customize it to your liking

# Prerequisite

1. You have **zsh** installed in your system
   1. Go to **[link](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#zsh)** to install zsh
      1. Tip: debian based OS have zsh in a package manager in **apt** or **apt-get**
2. zsh is the **default shell** in your terminal
   1. Go to **[link](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default)** to set zsh as default
3. You have **git** installed on your machine
4. You have **oh-my-zsh** installed on your machine
   1. Go to **[link](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH#how-to-install-zsh-in-many-platforms)**
5. You have **antigen** installed. At **~**
   1. Go to **[link](https://github.com/zsh-users/antigen)**
6. You have VimPlug installed
   1. Go to **[link](https://github.com/junegunn/vim-plug#installation)**
   2. Install plugins
      1. `vim +PlugInstall +qall`

# Installation

1. Clone the repo at unix **home** directory
2. Run the following command
   1. `echo 'source ~/dotfiles/index.sh' >> ~/.zshrc`
3. Reinitialize zsh (2 options)
   1. Close and open your terminal
   2. Reload zsh configs
      1. Run the following `source ~/.zshrc`
