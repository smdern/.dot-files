source "${HOME}/.dot-files/zgen/zgen.zsh"

# After making a change here, do a zgen update and restart zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/autojump
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/lein
  zgen oh-my-zsh plugins/mix-fast
  zgen oh-my-zsh plugins/ruby
  zgen oh-my-zsh plugins/rvm
  zgen oh-my-zsh plugins/nvm
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search
  zgen load rimraf/k

  # completions
  zgen load zsh-users/zsh-completions src
  zgen load felixr/docker-zsh-completion

  zgen save
fi

source "${HOME}/.zsh/smdern.zsh-theme"

ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'

HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history
HISTFILE=~/.zshistory # history file

unsetopt correct_all



platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
elif [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
fi

if [[ $platform == 'linux' ]]; then
  source ~/.zshrc-linux
elif [[ $platform == 'osx' ]]; then
  eval "$(direnv hook zsh)"
  source ~/.zshrc-osx
fi

# Customize to your needs...
export GIT_PAGER='less -FRSX'
export NOEXEC_EXCLUDE='zeus'

export NVIM_TUI_ENABLE_TRUE_COLOR=1

path=(
  ./bin
  ./node_modules/.bin
  /usr/local/bin
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

#Bindkey
bindkey '^r' history-incremental-search-backward


#Aliases
alias tmux2="tmux -2 attach"
alias mkdir='mkdir -p'
alias ..='cd ..'

alias du='du -kh'
alias df='df -kTh'

alias r='bundle exec rails'
alias gs='bundle exec guard start'
alias mig='rk db:migrate db:test:prepare'

alias zb='`[ -e .zeus.sock ] && echo zeus || echo bundle exec`'

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
. /Users/shaun/.asdf/asdf.sh
. /Users/shaun/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_TMUX=0
