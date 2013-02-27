# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="re5et"


# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history
HISTFILE=~/.zshistory # history file

ANDROID_HOME=/usr/local/Cellar/android-sdk/r21.0.1
launchctl setenv ANDROID_HOME $ANDROID_HOME

plugins=(git ssh-agent autojump bundler brew rvm vi-mode pow hub)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Customize to your needs...
export EDITOR=vim
export PATH=$PATH:Users/shaun/.rvm/bin:/usr/local/sbin:/usr/local/bin
export PATH=$PATH:/usr/local/share/python:/usr/bin:/bin:/usr/sbin
export PATH=$PATH:/sbin:/usr/X11/bin:/usr/local/share/npm/bin

#Bindkey
bindkey '^r' history-incremental-search-backward

#Aliases
alias tmux2="tmux -2 attach"
alias ls='ls -G'
alias mkdir='mkdir -p'
alias which='type -a'
alias ..='cd ..'

alias du='du -kh'
alias df='df -kTh'

alias r='bundle exec rails'
alias gs='bundle exec guard start'
alias rk='bundle exec rake'
alias mig='bundle exec rake db:migrate db:test:prepare'

alias start_pow="launchctl load $HOME/Library/LaunchAgents/cx.pow.powd.plist"
alias stop_pow="launchctl unload $HOME/Library/LaunchAgents/cx.pow.powd.plist"

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

alias glxx='git log --graph --all --decorate'
alias glx='git log --graph --all --decorate --pretty=format:"%C(magenta)%h %C(blue)%ai %C(green)%an %C(cyan)%s %C(yellow bold)%d"'

alias ll='ls -al'

alias hglog='hg sglog | less -R'

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

