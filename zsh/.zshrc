# serguey's zshrc

### PLUGINS ###

if [[ ! -d ~/.zplug ]]; then
git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update
fi
source ~/.zplug/init.zsh

zplug plugins/git, from:oh-my-zsh
zplug plugins/brew, from:oh-my-zsh
zplug plugins/osx, from:oh-my-zsh
zplug plugins/z, from:oh-my-zsh
zplug plugins/tmux, from:oh-my-zsh
zplug plugins/tmuxinator, from:oh-my-zsh
zplug mafredri/zsh-async, defer:0
zplug robbyrussell/oh-my-zsh, use:"lib/history.zsh"
zplug zsh-users/zsh-syntax-highlighting, defer:2
zplug zsh-users/zsh-history-substring-search, defer:2

zplug sindresorhus/pure, as:theme, use:pure.zsh
#zplug themes/mh, as:theme, from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

### KEY BINDINGS ###

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### ENVIRONMENT ###

export EDITOR=vim
export PAGER=less
export CLICOLOR=1

### FUNCTIONS ###

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

### ALIASES ###

alias mux=tmuxinator

### RUN AFTER LOAD ###

fortune -a
