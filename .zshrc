HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY SHARE_HISTORY # share history

zstyle ':completion:*' menu select

autoload -Uz compinit
compinit

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats ' (%b|%a)'
zstyle ':vcs_info:*' formats ' (%b)'
zstyle ':vcs_info:*' enable git
precmd() {
  vcs_info
}

export PROMPT='%m:%~ %n${vcs_info_msg_0_}%# '
export EDITOR="vim"
export PAGER="less"
export CLICOLOR="yes"

alias ls="ls --color=auto"
alias l="ls"
alias la="ls -alF"
alias tmuxre="tmux att || tmux new"

fortune -a
