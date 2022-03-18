alias vim=nvim    # Use vim as alias to neovim.
                  # NOTE: using vim
                  # type in terminal \vim

case `uname` in
  'Linux')
    #OS='Linux'
    alias ls='ls --color=auto'
    source ~/dotfiles/alias/debian/alias.sh
    ;;
  'FreeBSD')
    #OS='FreeBSD'
    alias ls='ls -G'
    ;;
  'WindowsNT')
    #OS='Windows'
    ;;
  'Darwin') 
    #OS='Mac'
    source ~/dotfiles/alias/osx/alias.sh
    ;;
  'SunOS')
    #OS='Solaris'
    ;;
  'AIX') ;;
  *) ;;
esac
