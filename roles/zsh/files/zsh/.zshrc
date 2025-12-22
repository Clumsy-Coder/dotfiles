#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load oh-my-zsh
if [ -d $OH_MY_ZSH_DIR_PATH ]; then
  export ZSH=$OH_MY_ZSH_DIR_PATH
  source $ZSH/oh-my-zsh.sh
fi

#-------------------------------------------------------------------------------
# load ZSH files
# config inspired by https://github.com/cchamberlain/zdotdir/blob/master/.zshrc

source "$ZSCRIPTDIR/checks.zsh"
# source "$ZSCRIPTDIR/colors.zsh"
source "$ZSCRIPTDIR/setopt.zsh"
source "$ZSCRIPTDIR/exports.zsh"
# source "$ZSCRIPTDIR/bindkeys.zsh"
# source "$ZSCRIPTDIR/prompt.zsh"
# source "$ZSCRIPTDIR/completion.zsh"
# source "$ZSCRIPTDIR/hashes.zsh"
source "$ZSCRIPTDIR/aliases.zsh"
source "$ZSCRIPTDIR/functions.zsh"
# source "$ZSCRIPTDIR/history.zsh"
source ~/.p10k.zsh    # To customize prompt, run `p10k configure`
source "$ZSCRIPTDIR/zinit.zsh"

# shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
