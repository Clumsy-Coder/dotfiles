# Installed software list

This is assuming osx is installed and using homebrew

# Files

- taps: homebrew version of Debian PPA
- applist: non GUI based apps
- casklist: Apps that have a GUI

# Commands

- cd to the project folder
- `cat apps/osx/taplist | xargs brew tap`
- `cat apps/osx/applist | xargs brew install`
- `cat apps/osx/casklist | xargs brew cask install`
