source "${HOME}/.dot-files/zgen/zgen.zsh"

#After making a change here, do a zgen update and restart zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search
  # Like autojump, but with manual marks.
  # Run `mark <name>` to mark, and C-g to jump to a mark.
  # `dmark` to remove a mark.
  zgen load uvaes/fzf-marks

  # completions
  zgen load zsh-users/zsh-completions src

  zgen save
fi

# This speeds up pasting w/ autosuggest
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# zsh-history-substring-search
# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down


# Use C-z to switch back to fg
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

compdef g='git'
source ~/.bash/aliases

source "${HOME}/.zsh/aaronjensen.zsh-theme"

ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'

DISABLE_AUTO_TITLE="true"

# Disable alternate screen in less
LESS="-XR"

command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

fpath=("$HOME/.zsh" $fpath)

if [ $ITERM_PROFILE ]; then
  test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
  echo -ne "\033]6;1;bg;red;brightness;28\a"
  echo -ne "\033]6;1;bg;blue;brightness;28\a"
  echo -ne "\033]6;1;bg;green;brightness;28\a"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Emacs shells are loaded as interactive, but not login, so asdf must be sourced here
[ -z $ASDF_SOURCED ] && [ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
