# setting environment variables for react native to work with android platform
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$HOME/.fastlane/bin:$PATH"
export GEM_HOME=~/.gems
export PATH="$GEM_HOME/bin:$PATH"

export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# setting up homebrew autoupdate
# using https://github.com/DomT4/homebrew-autoupdate
# auto update in 24 hours (represented in seconds)
#export HOMEBREW_AUTO_UPDATE_SECS="3600"

# to run homebrew autoupdate
# brew autoupdate --start --upgrade --enable-notification
# note: it will run every 24 hours by default
#	it will upgrade the software when available
#	it will send a MacOS notification when the updates and upgrades are finished
#		uses https://github.com/julienXX/terminal-notifier