#!/usr/bin/env zsh

# Obsidian
# obtained from
# - https://github.com/agalea91/dotfiles/blob/52b72715536b1938a97e81466a558d3bc9d7618d/.zshrc#L60-L63
# - https://youtu.be/1Lmyh0YRH-w
alias oo='cd $OBSIDIAN_DIR_PATH/mimir/' # navigate to my obsidian vault
# open all obsidian notes in `inbox` folder using neovim. use command whether to keep the notes or delete them
# check
# - https://youtu.be/1Lmyh0YRH-w?t=795
# alias or='nvim $OBSIDIAN_DIR_PATH/mimir/inbox/*.md' # obsidian review

# fuzzy search obsidian vault files and open on pressing <enter>
# uses
# - find : list all the files in obsidian vault
# - fzf : to fuzzy find the files (by filename) and show a preview
#
# obtained from
# - ignore directories
#   - https://stackoverflow.com/a/10589822/3053548
#   - https://stackoverflow.com/a/63523300/3053548
#   - https://chatgpt.com/c/66ec4e75-e294-8011-94af-28a39183e93d
# - trim part of the filepath in fzf
#   - https://github.com/junegunn/fzf/issues/1534#issuecomment-476757278
alias os="
find $OBSIDIAN_DIR_PATH/mimir \
\( \
  -name '.git*' -o \
  -name '.obsidian' \
\) \
-prune -o \
-type f -print \
| \
fzf --delimiter obsidian/mimir/ \
    --with-nth -1 \
    --preview 'bat --style=numbers --color=always --line-range=:500 {}' \
    --bind 'enter:execute(nvim {})+abort'"
