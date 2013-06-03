HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY SHARE_HISTORY # share history

zstyle ':completion:*' menu select

autoload -Uz compinit
compinit

export PS1="%m:%~ %n%# "
export EDITOR="vim"
export PAGER="less"
export CLICOLOR="yes"

alias ls="ls --color=auto"
alias l="ls"
alias la="ls -alF"
alias tmuxre="tmux att || tmux new"

fortune
