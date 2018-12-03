# This file is used for setting custom settings for powerlevel9k theme used in 
# oh-my-zsh.
# This file is used in ~/zshPersonalConfig/index

# prompt config
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time root_indicator background_jobs battery ip time)

#------------------------------------------------------------------------------
# user config

# Dislay the name of the user
DEFAULT_USER=whoami
POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='blue'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='white' 

#------------------------------------------------------------------------------
# current directory config

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'

#------------------------------------------------------------------------------
# battery config

POWERLEVEL9K_BATTERY_ICON=''
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_VERBOSE=true
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='red'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='black'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='yellow'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='black'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='green'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='black'

#------------------------------------------------------------------------------
# vcs config

#POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'

#------------------------------------------------------------------------------
# command execution time

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=2

#------------------------------------------------------------------------------
# Add newline
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

#------------------------------------------------------------------------------
# Set time
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S %d/%m/%Y}'

#------------------------------------------------------------------------------
# 
