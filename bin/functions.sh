#!/usr/bin/env bash

# functions used in the dotfiles.sh file
# obtained from
# - https://github.com/TechDufus/dotfiles/blob/fb6b488/bin/dotfiles#L50-L210

# _header colorize the given argument with spacing
function __task {
  # if _task is called while a task was set, complete the previous
  if [[ $TASK != "" ]]; then
    printf "%b%b [✓]  %b%b%b\n" "${OVERWRITE}" "${LGREEN}" "${LGREEN}" "${TASK}" "${NC}"
  fi
  # set new task title and print
  TASK=$1
  printf "%b [ ]  %b \n%b%b" "${LBLACK}" "${TASK}" "${LRED}" "${NC}"
}

# ----------------------------------------------------------------------------------------------- #

# _cmd performs commands with error checking
function _cmd {
  #create log if it doesn't exist
  if ! [[ -f $DOTFILES_LOG ]]; then
    touch "$DOTFILES_LOG"
  fi
  # empty conduro.log
  echo > "$DOTFILES_LOG"
  # hide stdout, on error we print and exit
  if eval "$1" 1> /dev/null 2> "$DOTFILES_LOG"; then
    return 0 # success
  fi
  # read error from log and add spacing
  printf "%b%b [X]  %b%b%b\n" "${OVERWRITE}" "${LRED}" "${TASK}" "${LRED}" "${NC}"
  while read -r line; do
    printf "      ${line}%b\n" "${NC}"
  done < "$DOTFILES_LOG"
  printf "%b\n" "${NC}"
  # remove log file
  rm "$DOTFILES_LOG"
  # exit installation
  exit 1
}

# ----------------------------------------------------------------------------------------------- #

function _clear_task {
  TASK=""
}

# ----------------------------------------------------------------------------------------------- #

function _task_done {
  printf "%b%b [✓]  %b%b%b\n" "${OVERWRITE}" "${LGREEN}" "${LGREEN}" "${TASK}" "${NC}"
  _clear_task
}

function _task_failed {
  printf "%b%b [X]  %b%b%b\n" "${OVERWRITE}" "${LRED}" "${TASK}" "${LRED}" "${NC}"
  _clear_task
}

# ----------------------------------------------------------------------------------------------- #

function ubuntu_setup() {
  if ! dpkg -s ansible >/dev/null 2>&1; then
    __task "Installing Ansible"
    _cmd "sudo apt-get update"
    _cmd "sudo apt-get install -y software-properties-common"
    _cmd "sudo apt-add-repository -y ppa:ansible/ansible"
    _cmd "sudo apt-get update"
    _cmd "sudo apt-get install -y ansible"
    _cmd "sudo apt-get install python3-argcomplete"
    _cmd "sudo activate-global-python-argcomplete3"
  fi
  if ! dpkg -s python3 >/dev/null 2>&1; then
    __task "Installing Python3"
    _cmd "sudo apt-get install -y python3"
  fi

  local UBUNTU_MAJOR_VERSION=$(echo "$VERSION_ID" | cut -d. -f1)
  if [ "$UBUNTU_MAJOR_VERSION" -le 22 ]; then
    if ! dpkg -s python3-pip >/dev/null 2>&1; then
      __task "Installing Python3 Pip"
      _cmd "sudo apt-get install -y python3-pip"
    fi
    if ! pip3 list | grep watchdog >/dev/null 2>&1; then
      __task "Installing Python3 Watchdog"
      _cmd "sudo apt-get install -y python3-watchdog"
    fi
  fi
}

# ----------------------------------------------------------------------------------------------- #

function popos_setup() {
  if ! dpkg -s ansible >/dev/null 2>&1; then
    __task "Installing Ansible"
    _cmd "sudo apt-get update"
    _cmd "sudo apt-get install -y software-properties-common"
    _cmd "sudo apt-add-repository -y ppa:ansible/ansible"
    _cmd "sudo apt-get update"
    _cmd "sudo apt-get install -y ansible"
    _cmd "sudo apt-get install python3-argcomplete"
    _cmd "sudo activate-global-python-argcomplete3"
  fi
  if ! dpkg -s python3 >/dev/null 2>&1; then
    __task "Installing Python3"
    _cmd "sudo apt-get install -y python3"
  fi
}

# ----------------------------------------------------------------------------------------------- #

function arch_setup() {
  if ! [ -x "$(command -v ansible)" ]; then
    __task "Installing Ansible"
    _cmd "sudo pacman -Sy --noconfirm"
    _cmd "sudo pacman -S --noconfirm ansible"
    _cmd "sudo pacman -S --noconfirm python-argcomplete"
    # _cmd "sudo activate-global-python-argcomplete3"
  fi
  if ! pacman -Q python3 >/dev/null 2>&1; then
    __task "Installing Python3"
    _cmd "sudo pacman -S --noconfirm python3"
  fi
  if ! pacman -Q python-pip >/dev/null 2>&1; then
    __task "Installing Python3 Pip"
    _cmd "sudo pacman -S --noconfirm python-pip"
  fi
  if ! pip3 list | grep watchdog >/dev/null 2>&1; then
    __task "Installing Python3 Watchdog"
    _cmd "sudo pacman -S --noconfirm python-watchdog"
  fi

  if ! pacman -Q openssh >/dev/null 2>&1; then
    __task "Installing OpenSSH"
    _cmd "sudo pacman -S --noconfirm openssh"
  fi

  __task "Setting Locale"
  _cmd "sudo localectl set-locale LANG=en_US.UTF-8"
}

# ----------------------------------------------------------------------------------------------- #

function macos_setup() {
  if ! [ -x "$(command -v brew)" ]; then
    __task "Installing Homebrew"
    _cmd "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  fi
  if ! [ -x "$(command -v git)" ]; then
    __task "Installing Git"
    _cmd "brew install git"
  fi
  if ! [ -x "$(command -v ansible)" ]; then
    __task "Installing Ansible"
    _cmd "brew install ansible"
  fi
  if ! [ -x "$(command -v op)" ]; then
    __task "Installing 1Password CLI"
    _cmd "brew install 1password@beta"
    _cmd "brew install 1password-cli@beta"
    __task "Setting up 1Password CLI"
    # press any key to continue
    read -n 1 -s -r -p "Press any key to continue"
    echo -e "${OVERWRITE}${OVERWRITE} [✓]  ${GREEN}1Password CLI setup complete${NC}" && _clear_task
  fi
}

# ----------------------------------------------------------------------------------------------- #

update_ansible_galaxy() {
  local os=$1
  local os_requirements=""
  __task "Updating Ansible Galaxy"
  if [ -f "$DOTFILES_DIR/requirements/$os.yml" ]; then
    __task "${OVERWRITE}Updating Ansible Galaxy with OS Config: $os"
    os_requirements="$DOTFILES_DIR/requirements/$os.yml"
  fi
  _cmd "ansible-galaxy install -r $DOTFILES_DIR/requirements/common.yml $os_requirements"
}

# ----------------------------------------------------------------------------------------------- #

function confirmVaultAccess() {
  __task "Checking for 1Password CLI"
  if ! command -v op >/dev/null 2>&1; then
    printf "%b %b[X]  Checking for 1Password CLI%b\n" "${OVERWRITE}" "${RED}" "${NC}"
    printf " %b%b   1Password CLI is not installed.%b\n" "${WARNING}" "${RED}" "${NC}"
    exit 1
  fi
  local op_version
  op_version=$(op --version)
  __task "1Password CLI found: [$op_version] -- Authenticating..."
  if ! _cmd "op --account my.1password.com vault list"; then exit 1; fi
  _task_done && printf "%b [✓] Successfully authenticated with 1Password CLI! ☕%b\n" "${GREEN}" "${NC}"
  return
}

# ----------------------------------------------------------------------------------------------- #

detect_os() {
  if [ -f /etc/os-release ]; then
    source /etc/os-release
    echo $ID
  else
    echo $(uname -s | tr '[:upper:]' '[:lower:]')
  fi
}

# ----------------------------------------------------------------------------------------------- #
