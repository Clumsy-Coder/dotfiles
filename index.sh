# import aliases
source ~/zsh-terminal-config/alias/alias.sh

# import environment variables
source ~/zsh-terminal/environment/environment.sh

# import tools config
source ~/zsh-terminal-config/tools/tools.sh

# run command after loading config and settings
echo hello $(whoami)