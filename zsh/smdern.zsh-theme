git_remote_commit_status() {
   remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

   if [[ -n ${remote} ]] ; then
       ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | sed -e 's/^[ \t]*//' )
       behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | sed -e 's/^[ \t]*//' )

       prompt=""
       if [ $behind -gt 0 ]
       then
         prompt="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE$behind"
       fi

       if [ $ahead -gt 0 ]
       then
         prompt="$prompt $ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE$ahead"
       fi

       echo $prompt
   fi
}

if [ "$USER" = "root" ]; then CARETCOLOR="red"; else CARETCOLOR="magenta"; fi

local return_code="%(?..%{$fg_bold[red]%}:( %?%{$reset_color%})"

PROMPT='%{$fg_bold[cyan]%}%n%{$reset_color%}'
PROMPT+='%{$fg[yellow]%}@%{$reset_color%}'
PROMPT+='%{$fg_bold[blue]%}%m%{$reset_color%}'
PROMPT+=':%{${fg_bold[green]}%}%~%{$reset_color%}'
PROMPT+='$(git_prompt_info)$(git_remote_commit_status)'
PROMPT+='%{${fg[$CARETCOLOR]}%} %{${reset_color}%}'

RPS1='${return_code} %D - %*'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}^%{$reset_color%}%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ±"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%} ♥"

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}↕%{$reset_color%}"
