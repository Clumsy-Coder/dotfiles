# obtained from https://github.com/cchamberlain/zdotdir/blob/master/.zlogin

# Compile the completion dump to increase startup speed.
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
  zcompile "$zcompdump"
fi