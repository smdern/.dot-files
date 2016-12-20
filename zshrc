source "${HOME}/.dot-files/zgen/zgen.zsh"

#After making a change here, do a zgen update and restart zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh
  # plugins
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search
  zgen load uvaes/fzf-marks

  # completions
  zgen load zsh-users/zsh-completions src

  zgen save
fi

source "${HOME}/.zsh/aaronjensen.zsh-theme"

# This speeds up pasting w/ autosuggest
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15

if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS


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

ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'

DISABLE_AUTO_TITLE="true"

# Disable alternate screen in less
LESS="-XR"

command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

fpath=("$HOME/.zsh" $fpath)
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

if [ $ITERM_PROFILE ]; then
  echo -ne "\033]6;1;bg;red;brightness;28\a"
  echo -ne "\033]6;1;bg;blue;brightness;28\a"
  echo -ne "\033]6;1;bg;green;brightness;28\a"
fi

source ~/.bashrc_ssh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
