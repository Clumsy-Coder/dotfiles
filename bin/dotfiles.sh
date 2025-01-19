#!/usr/bin/env bash

# obtained from
# - https://github.com/frdmn/dotfiles/blob/3ecd59a400b1ce29aae67eb81899c844ac8abda9/dotfiles
# - https://github.com/TechDufus/dotfiles/blob/c476d74/bin/dotfiles
# - https://youtu.be/hPPIScBt4Gw
#
# Usage:
# to run ansible playbook using macos var file
#   dotfiles macos
#
# to run ansible playbook with certain roles. Ex: run with role `homebrew` and `astronvim-v4`
#   dotfiles macos --tags 'homebrew, astronvim-v4'
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

# add symlink to this script.
# usage: dotfiles
mkdir -p ~/.local/bin > /dev/null
ln -sf "$DOTFILES_DIR/bin/dotfiles.sh" ~/.local/bin/dotfiles

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
  fedora)
    fedora_setup
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

# check if the var file is provided
__task "Checking if var file is provided"
if [ -z "$1" ]; then
  _task_failed
  echo -e "Var file not provided.\n"
  usage
  echo -e '\nExiting'
  exit 1
fi

# check if the var file exists
__task "Checking if var file $1 exists"
if [[ ! -e "$DOTFILES_DIR/vars/$1.yaml" ]]; then
  _task_failed
  echo -e "var file ${RED}${BOLD}$1${NC} doesn't exist"
  # print var filenames without file extension
  print_available_var_files
  echo -e "\nExiting"
  exit 1
fi

__task "Running Ansible playbook $1"
VAR_FILE=$1
# use `shift` to 'eat' the argument $1.
# this is used because after providing the playbook, the rest of arguments are passed to ansible
# obtained from
# - https://stackoverflow.com/a/1537687/3053548
#
# pass the name of the var file to ansible vars.
# This will allow ansible to import the var file and run default_roles.
# Ansible playbook will import the var file using var `playbook_name`.
# This will load the default_roles and other vars when running the playbook
# obtained from
# - https://www.reddit.com/r/ansible/comments/1af8xat/passing_vars_file_argument_with_ansibleplaybook/
shift
ANSIBLE_CONFIG=${DOTFILES_DIR}/ansible.cfg ansible-playbook "${DOTFILES_DIR}/main.yaml" --extra-vars "playbook_name='$VAR_FILE'" "$@"

# ################################################################################################ #
