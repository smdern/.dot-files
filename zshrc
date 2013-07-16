source $HOME/.dot-files/antigen/antigen.zsh

antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).

antigen bundle autojump
antigen bundle git
antigen bundle pow
antigen bundle brew
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle rvm
antigen bundle heroku

# ZSH Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme smdern/zsh-themes re5et.zsh-theme

# Tell antigen that you're done
antigen apply

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history
HISTFILE=~/.zshistory # history file

unsetopt correct_all

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

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
  source ~/.zshrc-osx
fi

# Customize to your needs...
export EDITOR=vim

export PATH=$PATH:$HOME/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/python:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/share/npm/bin

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
alias rk='bundle exec rake'
alias mig='bundle exec rake db:migrate db:test:prepare'

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


