#shellcheck shell=bash
#eval `hub alias -s bash`

#set -o vi
source ~/.shellrc

export BASH_ENV='~/.bash/env'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# git prompt goodnes
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
PS1="${COLOR_RED}[${COLOR_WHITE}\t ${COLOR_NONE}\W${COLOR_GREEN}\$(__git_ps1 ' (%s)')${COLOR_RED}]${COLOR_NONE}\$ "
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

[[ -f "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh

# Free up ^S for i-search
stty stop undef

[[ -s "$HOME/.bash_private" ]] && source "$HOME/.bash_private"

command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.asdf/asdf.sh ] && source ~/.asdf/asdf.sh

export PATH="/usr/local/opt/llvm/bin:$PATH"
