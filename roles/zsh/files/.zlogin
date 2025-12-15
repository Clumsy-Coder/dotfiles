# obtained from https://github.com/cchamberlain/zdotdir/blob/master/.zlogin

# Compile the completion dump to increase startup speed.
if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
  zcompile "$ZSH_COMPDUMP"
fi