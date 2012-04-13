
if [ -f /usr/local/etc/autojump ]; then
  . /usr/local/etc/autojump
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix git-flow`/etc/bash_completion.d/git-flow-completion.bash  ]; then
  . `brew --prefix git-flow`/etc/bash_completion.d/git-flow-completion.bash
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  . /usr/local/bin/virtualenvwrapper.sh
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# colors
COLOR_NONE='\[\033[0m\]'
COLOR_BOLD='\[\033[1m\]'
COLOR_UNDER='\[\033[4m\]'

COLOR_BLACK='\[\033[30m\]'
COLOR_RED='\[\033[31m\]'
COLOR_GREEN='\[\033[32m\]'
COLOR_YELLOW='\[\033[33m\]'
COLOR_BLUE='\[\033[34m\]'
COLOR_MAGENTA='\[\033[35m\]'
COLOR_CYAN='\[\033[36m\]'
COLOR_WHITE='\[\033[37m\]'

COLOR_BLACK_BG='\[\033[40m\]'
COLOR_RED_BG='\[\033[41m\]'
COLOR_GREEN_BG='\[\033[42m\]'
COLOR_YELLOW_BG='\[\033[43m\]'
COLOR_BLUE_BG='\[\033[44m\]'
COLOR_MAGENTA_BG='\[\033[45m\]'
COLOR_CYAN_BG='\[\033[46m\]'
COLOR_WHITE_BG='\[\033[47m\]'

# git prompt goodnes
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
PS1="${COLOR_RED}[${COLOR_WHITE}\t ${COLOR_NONE}\W${COLOR_GREEN}\$(__git_ps1 ' (%s)')${COLOR_RED}]${COLOR_NONE}\$ "

# some more ls aliases
alias ls='ls -G'
alias ll='ls -Al'
alias mkdir='mkdir -p'
alias which='type -a'
alias ..='cd ..'

alias du='du -kh'
alias df='df -kTh'

alias vim='mvim -v'

alias r='bundle exec rails'
alias b='bundle exec'
alias c='bundle exec cap'
alias gs='bundle exec guard start'
alias f='git flow feature'
alias release='git flow release'
alias rk='b rake'
alias mig='b rake db:migrate db:test:prepare'

alias start_pow="launchctl load $HOME/Library/LaunchAgents/cx.pow.powd.plist"
alias stop_pow="launchctl unload $HOME/Library/LaunchAgents/cx.pow.powd.plist"

# use Vim commands
set -o vi

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

alias ll='ls -al'

alias gf='git fetch'
alias gm='git merge'
alias gmom='git merge origin/master'
alias grom='git rebase origin/master'
alias grc='git rebase --continue'
alias grpo='git remote prune origin'
alias gru="git remote show | sed '/heroku/d' | xargs -I {} git remote update {} --prune; git submodule update"
alias gs="git status"
alias gdc="git diff --cached"
alias glx="git log --graph --decorate --all --oneline"

alias glxx='git log --graph --all --decorate'
alias glx='git log --graph --all --decorate --pretty=format:"%C(magenta)%h %C(blue)%ai %C(green)%an %C(cyan)%s %C(yellow bold)%d"'
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

alias ll='ls -al'
alias be='bundle exec'

alias gf='git fetch'
alias gm='git merge'
alias gmom='git merge origin/master'
alias grom='git rebase origin/master'
alias grc='git rebase --continue'
alias grpo='git remote prune origin'
alias gru="git remote show | sed '/heroku/d' | xargs -I {} git remote update {} --prune; git submodule update"
alias gs="git status"
alias gdc="git diff --cached"
alias glx="git log --graph --decorate --all --oneline"

alias glxx='git log --graph --all --decorate'
alias glx='git log --graph --all --decorate --pretty=format:"%C(magenta)%h %C(blue)%ai %C(green)%an %C(cyan)%s %C(yellow bold)%d"'

export EDITOR=vim
