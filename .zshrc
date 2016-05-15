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

set -o vi

export PROMPT='%m:%c %n${vcs_info_msg_0_}%# '
export EDITOR="vim"
export PAGER="less"
export CLICOLOR="yes"
export PATH=$HOME/bin:/usr/local/opt/gettext/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

alias ls="ls -G"
alias l="ls"
alias la="ls -alF"
alias tmuxre="tmux att || tmux new"
alias sshirc="ssh -NL 4325:localhost:4325 nullo.me"

source /usr/local/bin/virtualenvwrapper.sh

fortune -a
