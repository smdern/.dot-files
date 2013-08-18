#eval `hub alias -s bash`

#set -o vi

export BASH_ENV='~/.bash/env'
export EDITOR='mvim -v'
export VISUAL='mvim -v'
export TM_GIT=/usr/local/bin/git

export CUCUMBER_FORMAT=Cucumber::Formatter::Fuubar
export RSPEC_FORMAT=Fuubar
export PARALLEL_TEST_PROCESSORS=2

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:~/.bin:$PATH:$HOME/.rvm/bin
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

#complete -o default -o nospace -F __git_flow_feature f
#complete -o default -o nospace -F __git_flow_release release

source ~/.bash/colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export HOMEBREW_TEMP=/var/tmp
export BUNDLER_EDITOR='/usr/local/bin/mvim -v'

# git prompt goodnes
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=verbose
PS1="${COLOR_RED}[${COLOR_WHITE}\t ${COLOR_NONE}\W${COLOR_GREEN}\$(__git_ps1 ' (%s)')${COLOR_RED}]${COLOR_NONE}\$ "
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
function name_tab() {
  echo -ne "\033]0;$1\007"
}

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend

source ~/.bash/aliases
[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_FREE_MIN=$RUBY_HEAP_FREE_MIN
export TCH_BUNDLE_INSTALL=bundle

# Free up ^S for i-search
stty stop undef

[[ -s "$HOME/.bash_private" ]] && source "$HOME/.bash_private"
[[ -s "$HOME/nvm/nvm.sh" ]] && source "$HOME/nvm/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
