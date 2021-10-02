export EDITOR='vim';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Prefer CA English and use UTF-8.
export LANG='en_CA.UTF-8';
export LC_ALL='en_CA.UTF-8';

# Highlight section titles in manual pages.
# export LESS_TERMCAP_md="${yellow}";

case `uname` in
  'Linux')
    #OS='Linux'
    source ~/dotfile/environment/exports/debian-exports.sh
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
    source ~/dotfiles/environment/exports/osx-exports.sh
    ;;
  'SunOS')
    #OS='Solaris'
    ;;
  'AIX') ;;
  *) ;;
esac
