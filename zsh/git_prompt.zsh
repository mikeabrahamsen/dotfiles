# get the name of the branch we are on
function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
  echo "$ZSH_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_git_dirty() {
  local STATUS=''
  local FLAGS=('--porcelain')
  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "$ZSH_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_GIT_PROMPT_CLEAN"
  fi
}

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local host="%{$fg[magenta]%}%n@%{$fg[magenta]%}%m% "
PROMPT='${ret_status}%{$fg_bold[green]%}%p ${host} %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
