source /usr/local/share/antigen/antigen.zsh

# load antigen plugins
antigen bundle git                # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#git
antigen bundle command-not-found  # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#command-not-found
antigen bundle npm                # npm autocomplete
antigen bundle node               # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#node
antigen bundle yarn               # Yarn autocomplete
antigen bundle tmux               # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmux
antigen bundle tmuxinator         # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#tmuxinator
antigen bundle common-aliases     # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#common-aliases
antigen bundle extract            # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#extract
antigen bundle history            # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#history
# antigen bundle jsontools          # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#jsontools
antigen bundle systemd            # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#systemd


# Custom bundles
antigen bundle zsh-users/zsh-autosuggestions        # suggests commands as you type
antigen bundle zsh-users/zsh-syntax-highlighting    # highlights commands as you type
antigen bundle zsh-users/zsh-completions            
antigen bundle chrissicool/zsh-256color             # enable 256 colours for the terminal
antigen bundle djui/alias-tips                      # display aliases based on the previous command executed
antigen bundle ael-code/zsh-colored-man-pages       # adds a bit of colour to man pages
antigen bundle joel-porquet/zsh-dircolors-solarized # adding colour when listing current directory contents
antigen bundle webyneter/docker-aliases             # aliases for Docker
antigen bundle so-fancy/diff-so-fancy               # adding human readability for Git diff's
# antigen bundle gretzky/auto-color-ls
# antigen bundle hchbaw/auto-fu.zsh
# antigen bundle arzzen/calc.plugin.zsh
# antigen bundle Tarrasch/zsh-colors
# antigen bundle adrieankhisbe/diractions
# antigen bundle zpm-zsh/ls

# Load a theme
antigen theme bhilburn/powerlevel9k                 # load powerlevel9k zsh theme

# apply the plugins
antigen apply