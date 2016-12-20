# aaronjensen.zsh-theme

git_remote_status_count() {
    remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [ $ahead -gt 0 ] || [ $behind -gt 0 ]
        then
            echo -n "$ZSH_THEME_GIT_COMMITS_PREFIX"
        fi

        if [ $ahead -gt 0 ]
        then
            echo -n "$ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX${ahead// /}$ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX"
        fi

        if [ $behind -gt 0 ]
        then
            echo -n "$ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX${behind// /}$ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX"
        fi
    fi
}


PROMPT='%{$fg[blue]%}[%{$reset_color%}'
PROMPT+='%~'
# PROMPT+='$(git_prompt_info)$(git_remote_status_count)'
PROMPT+="\$(git-radar --zsh) "
PROMPT+='%{$fg[blue]%}]%{$reset_color%}
\$ '

# display exitcode on the right when >0
return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local _lineup=$'\e[1A'
local _linedown=$'\e[1B'
RPROMPT='%{${_lineup}%}${return_code}%{$reset_color%} %*%{${_linedown}%}'

# a | b
# a │ b
# a ⌥ b
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}⌥ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}✱"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_COMMITS_PREFIX=" "
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$fg[yellow]%}+"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$fg[red]%}-"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$reset_color%}"
