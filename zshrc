source "${HOME}/.dot-files/zgen/zgen.zsh"

#After making a change here, do a zgen update and restart zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  # plugins

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure

  # completions
  zgen load zsh-users/zsh-completions src

  zgen save
fi

ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=5

HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history
HISTFILE=~/.zshistory # history file

unsetopt correct_all

command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

export EDITOR='vim'

# Customize to your needs...
export GIT_PAGER='less -FRSX'

path=(
  ./bin
  ./node_modules/.bin
  /usr/local/bin
  /.yarn/bin
  $path
  ~/.rvm/bin
  /usr/local/sbin
  /usr/bin:/bin
  /usr/sbin
  /sbin
  /usr/X11/bin
  /usr/local/share/npm/bin
  ~/.bin
)

#Aliases
alias tmux2="tmux -2 attach"
alias mkdir='mkdir -p'
alias ..='cd ..'

alias du='du -kh'
alias df='df -kTh'

alias r='bundle exec rails'
alias gs='bundle exec guard start'
alias mig='rk db:migrate db:test:prepare'

alias gf='git fetch'
alias gm='git merge'
alias gmom='git merge origin/master'
alias grom='git rebase origin/master'
alias grc='git rebase --continue'
alias grpo='git remote prune origin'
alias gru="git remote show | sed '/heroku/d' | xargs -I {} git remote update {} --prune; git submodule update"
alias gs="git status"
alias gdc="git diff --cached"

alias glxx='git log --graph --all --decorate'
alias glx='git log --graph --all --decorate --pretty=format:"%C(magenta)%h %C(blue)%ai %C(green)%an %C(cyan)%s %C(yellow bold)%d"'
alias gco='git checkout $(git branch -a | cut -c 3- | sed '"'"'s/^remotes\/[^/]*\///'"'"' | sort | uniq | grep -v HEAD | fzf-tmux -d 20)'

alias ls='ls -G'
alias ll='ls -al'

alias hglog='hg sglog | less -R'

function rk {
  if [ -e bin/rake ]; then
    bin/rake "$@"
  else
    zb rake "$@"
  fi
}

# function open-last-error() { "$( git rev-parse --show-toplevel )/bin/open_last_error" "$@" }
alias open-last-error-page='open "`ls -t error_pages/*.html | head -n1`"'

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

function __current_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function __current_branch_action {
  echo  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
  eval  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
}

function gmox {
  __current_branch_action "merge origin/"
}

function grox {
  __current_branch_action "rebase origin/"
}
function gpox {
  __current_branch_action "push origin "
}

function awklog {
  echo "awk ' /^$/ {flag=0} /Started.+$2/ {flag=1} flag { print }' $1"
  eval "awk ' /^$/ {flag=0} /Started.+$2/ {flag=1} flag { print }' $1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'

[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh
[ -f ~/.asdf/completions/asdf.bash ] && source ~/.asdf/completions/asdf.bash
