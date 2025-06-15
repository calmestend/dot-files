# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/barac/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt autocd

# History
export HISTTIMEFORMAT="[%F %T] "
HISTSIZE=10000000
SAVEHIST=10000000

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Colors
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l -hN --color=auto --group-directories-first'
alias la='ls -la -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'

# Alias
alias cd='z'
alias y='yazi'
alias v='nvim'

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
