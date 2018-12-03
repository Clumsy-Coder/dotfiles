source /usr/local/share/antigen/antigen.zsh

# load antigen plugins
antigen bundle git
antigen bundle command-not-found
antigen bundle npm
antigen bundle node
antigen bundle yarn
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle common-aliases
antigen bundle extract
antigen bundle history
antigen bundle jsontools
antigen bundle systemd


# Custom bundles
#antigen bundle gretzky/auto-color-ls
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle chrissicool/zsh-256color
antigen bundle hchbaw/auto-fu.zsh
antigen bundle djui/alias-tips
antigen bundle arzzen/calc.plugin.zsh
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle Tarrasch/zsh-colors
antigen bundle adrieankhisbe/diractions
antigen bundle joel-porquet/zsh-dircolors-solarized
antigen bundle webyneter/docker-aliases
antigen bundle zpm-zsh/ls
antigen bundle so-fancy/diff-so-fancy

# apply the plugins
antigen apply