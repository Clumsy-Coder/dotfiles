#!/bin/zsh

# script for creating a new obsidian note
# obtained from
# - https://github.com/agalea91/dotfiles/blob/52b7271/bin/on#L1-L12
# - https://youtu.be/1Lmyh0YRH-w
#
# usage
# on the terminal type
# on "<note name>"
#
# example
# on "homelab"
#
# example
# on "web programming"

if [ -z "$1" ]; then
  echo "Error: A file name must be set, e.g. on \"the wonderful thing about tiggers\"."
  exit 1
fi

file_name=$(echo "$1" | tr ' ' '-')
formatted_file_name=$(date "+%Y-%m-%d")_${file_name}.md
INBOX_DIR="06-Daily"
cd "$OBSIDIAN_DIR_PATH/mimir" || exit
touch "$INBOX_DIR/${formatted_file_name}"
nvim "$INBOX_DIR/${formatted_file_name}"
