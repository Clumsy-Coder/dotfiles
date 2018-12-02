# unix-terminal-config
Your personal config for setting up Unix in terminal
Ex: config for bash, zsh, fish, etc

All your configurations on setting the terminal is done here.

Ex:

- Setting up all your custom aliases
- Environment variables
- Vim config
- Tmux config
- Scripts to run when a Unix shell is initializing
  - Ex: Run `neofetch` after the shell has finished initializing

This can also be extended to focus on one specific Unix shell. Just fork the repo and customize it to your liking

# Why create this repo
When a user is setting up their new unix machine, they end up manually add configs to their liking.

Instead of repeatidly manualy set the machine, Have a scripts do it for. Better yet, fork your own version.

This can be especially annoying when setting up a workstation, where all the machines must have the same config.
Ex: terminal config, enviornment variables set right, aliases to set that a company would use.

# What do I do with this
Clone or fork the repo.
Add your own config and settings
Commit and push it to remote (if you want to)
Share it with others (coworkers, friends, etc)

# Installation

1. Clone the repo at unix **home** directory
    1. `cd ~`
    2. `git clone https://github.com/Clumsy-Coder/unix-terminal-config.git`
2. Run the following command
    1. `echo 'source unix-terminal-config/index' >> ~/.bashrc`
3. Reinitialize bash (2 options)
    1. Close and open your terminal
    2. Reload bash configs
        1. Run the following `source ~/.bashrc`