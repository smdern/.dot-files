# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="re5et"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

plugins=(git ssh-agent autojump bundler brew rvm vi-mode virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export EDITOR=vim
export PATH=/Users/shaun/.virtualenvs/hcd-connect/bin:/Users/shaun/.rvm/gems/ruby-1.9.2-p318@hcd-connect/bin:/Users/shaun/.rvm/gems/ruby-1.9.2-p318@global/bin:/Users/shaun/.rvm/rubies/ruby-1.9.2-p318/bin:/Users/shaun/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

#Aliases

alias ls='ls -G'
alias ll='ls -Al'
alias mkdir='mkdir -p'
alias which='type -a'
alias ..='cd ..'

alias du='du -kh'
alias df='df -kTh'

alias r='bundle exec rails'
alias gs='bundle exec guard start'
alias rk='b rake'
alias mig='b rake db:migrate db:test:prepare'

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

alias gru="git remote show | sed '/heroku/d' | xargs -I {} git remote update {} --prune; git submodule update"
alias gs="git status"
alias gdc="git diff --cached"
alias glx="git log --graph --decorate --all --oneline"

alias glxx='git log --graph --all --decorate'
alias glx='git log --graph --all --decorate --pretty=format:"%C(magenta)%h %C(blue)%ai %C(green)%an %C(cyan)%s %C(yellow bold)%d"'

alias hglog='hg sglog | less -R'

