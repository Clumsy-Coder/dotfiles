# All the software installed on the OS

# Install software

## Debian based OS

Run the following command

`cat ~/dotfiles/apps/debian/applist | xargs sudo apt install -y`

# MacOS

Make sure Homebrew is installed

Homebrew have terminal based and GUI based software installation.

### Terminal based

Run the following command

`cat ~/dotfiles/apps/osx/applist | xargs brew install`

### GUI based

`cat ~/dotfiles/apps/osx/casklist | xargs brew cask install`
