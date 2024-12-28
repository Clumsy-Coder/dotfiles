#!/usr/bin/env bash

# obtained from
#   https://github.com/frdmn/dotfiles/blob/3ecd59a400b1ce29aae67eb81899c844ac8abda9/dotfiles
#
# Usage:
# to run a playbook
#   dotfiles macos
#
# to run a playbook with all tags
#   dotfiles macos
#
# to run a playbook with certain tags. Ex: run with tags `brew` and `gui`
#   dotfiles macos --tags 'brew,gui'
#
# to list available tags for a playbook
#   ansible-playbook ./playbooks/macos.yaml --list-tags
#
# ################################################################################################ #

set -e  # exit if a command exits with a non-zero status
# set -x  # show every command run in this file

# ################################################################################################ #
# variables
DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_LOG="$HOME/.dotfiles.log"

# ################################################################################################ #
# clone github repo if it doesn't exist already

if ! [[ -d "$DOTFILES_DIR" ]]; then
  echo "Cloning repository"
  git clone --quiet https://github.com/Clumsy-Coder/dotfiles.git "$DOTFILES_DIR"
fi

# ################################################################################################ #
# load shell files

source "$DOTFILES_DIR/bin/colours.sh"
source "$DOTFILES_DIR/bin/functions.sh"
#
# load ENVs so ansible can use ENVs
source "$DOTFILES_DIR/tools/zsh/.zshenv"
# load zsh exports
# mainly for loading pyenv
source "$DOTFILES_DIR/tools/zsh/exports.zsh"

# ################################################################################################ #
# install ansible

dotfiles_os=$(detect_os)
__task "Loading Setup for detected OS: $dotfiles_os"
case $dotfiles_os in
  ubuntu)
    ubuntu_setup
    ;;
  pop)
    popos_setup
    ;;
  # arch)
  #   arch_setup
  #   ;;
  # darwin)
  #   macos_setup
  #   ;;
  *)
    __task "Unsupported OS"
    _cmd "echo 'Unsupported OS'"
    ;;
esac

__task "Update git submodules"
_cmd "cd $DOTFILES_DIR && git submodule update --init --recursive"
# _task_done

# ################################################################################################ #
# install requirements using ansible-galaxy

__task "Install/Update Ansible requirements"
_cmd "ANSIBLE_CONFIG=${DOTFILES_DIR}/ansible.cfg ansible-galaxy install -r \"${DOTFILES_DIR}/requirements.yaml\" "
_task_done

# ################################################################################################ #
# run ansible playbook

# display help message
usage() {
  # echo "Usage: $0 <var file> | --tags 'tag'"

  message="
  run default roles from a var file
  dotfiles vars/<filename>.yaml

  run a single role
  dotfiles --tags <role name>

  run multiple roles
  dotfiles --tags <role name, role name>

  NOTE: each of the commands can also include ansible playbook arguments at the end
  Ex:
  dotfiles vars/<filename>.yaml --ask-vault-password
  "

  echo "$message"
}

# check if the var file is provided
__task "Checking if var file is provided"
if [ -z "$1" ]; then
  _task_failed
  echo -e "Var file not provided.\n"
  usage
  echo 'Exiting'
  exit 1
fi

# check if the var file exists
__task "Checking if var file $1 exists"
if [[ ! -e "$DOTFILES_DIR/vars/$1.yaml" ]]; then
  _task_failed
  echo -e "var file ${RED}${BOLD}$1${NC} doesn't exist"
  echo -e "You can use the following var files \n"
  # print var filenames without file extension
  find "$DOTFILES_DIR/vars/" -type f -exec basename {} \; | sed 's/\.[^.]*$//'
  echo -e "\nExiting"
  exit 1
fi

__task "Running Ansible playbook $1"
VAR_FILE=$1
# use `shift` to 'eat' the argument $1.
# this is used because after providing the playbook, the rest of arguments are passed to ansible
# obtained from
# - https://stackoverflow.com/a/1537687/3053548
shift
ANSIBLE_CONFIG=${DOTFILES_DIR}/ansible.cfg ansible-playbook "${DOTFILES_DIR}/main.yaml" --extra-vars "playbook_name='$VAR_FILE'" "$@"

# ################################################################################################ #

# load ENVs so ansible can use ENVs
source ./tools/zsh/.zshenv

# load zsh exports
# mainly for loading pyenv
source ./tools/zsh/exports.zsh

# ################################################################################################ #
# variables
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ################################################################################################ #
# pull all git submodules
cd "${BASE_DIR}"
git submodule update --init --recursive

# ################################################################################################ #
# Check if "ansible" binary is available in $PATH
if ! [ -x "$(command -v ansible)" ]; then
  # echo "Ansible missing - please install manually:"
  # echo
  # echo "sudo pip3 install --upgrade pip"
  # echo "pip3 install ansible"
  # exit 1

  echo -e "\e[31m> ansible \e[1mnot\e[22m found. Installation required \e[0m"
  echo -e "\e[34m> installing ansible via \e[1mpyenv\e[22m \e[0m"

  # install pyenv if it's not installed
  if [ ! -d "$PYENV_DIR_PATH" ]; then
    # install prerequisite packages before installing pyenv
    # obtained from
    #   https://github.com/pyenv/pyenv/wiki
    # sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl git libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    echo -e "\e[31m> \e[1mpyenv\e[22m not found \e[0m"
    echo -e "\e[34m> Installing pyenv \e[0m"
    curl https://pyenv.run | bash

    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" ;
    eval "$(pyenv init -)" ;

    # get the latest python version
    pythonVersion=$(pyenv install --list | grep --extended-regexp "^\s*[0-9][0-9.]*[0-9]\s*$" | tail -1)
    echo -e "\e[34m> installing python version \e[1m$pythonVersion \e[0m"
    pyenv install --skip-existing $pythonVersion

    # install latest python version
    echo -e "\e[34m> setting python version \e[1m$pythonVersion\e[22m as default \e[0m"
    pyenv global $pythonVersion
  fi

  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" ;
  eval "$(pyenv init -)" ;

  # install ansible
  echo -e "\e[34m> installing ansible \e[0m"
  pip3 install ansible

fi

# check if the playbook is provided
if [ -z "$1" ]; then
  echo "Playbook not provided."
  echo
  echo "Please provide a playbook to use"
  echo "Ex: dotfiles macos"
  exit 1
fi

# check if the playbook file exists
if [[ ! -e "./playbooks/$1.yaml" ]]; then
  echo "playbook $1 doesn't exist in folder ./playbooks"
  echo "Exiting"
  exit 1
fi

tags="all"
# check if --tags switch is supplied and the tags are provided as well, if so use the tags provided. otherwise use `all`
if [ "${2}" == "--tags" ] && [ "$3" ]; then
  tags="${3:all}"
fi

# ################################################################################################ #

# Get full directory path of this wrapper
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# Install Ansible requirements like roles and collections
ANSIBLE_CONFIG=${SCRIPTPATH}/ansible.cfg ansible-galaxy install -r "${SCRIPTPATH}/requirements.yaml" &>/dev/null
# Execute the Ansible playbook
ANSIBLE_CONFIG=${SCRIPTPATH}/ansible.cfg ansible-playbook "${SCRIPTPATH}/playbooks/${1}.yaml" --ask-become-pass --tags "${tags}"

# Send notification in case "terminal-notifier" is installed
if command -v terminal-notifier 1>/dev/null 2>&1; then
  terminal-notifier -title "dotfiles: Bootstrap complete" -message "Successfully set up environment."
fi

# ################################################################################################ #
