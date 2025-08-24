# Lines configured by zsh-newuser-install
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

# History Settings
setopt hist_ignore_all_dups     
setopt share_history            
setopt hist_reduce_blanks       
setopt extended_history         

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-search-forward


# Colors
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l -hN --color=auto --group-directories-first'
alias la='ls -la -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'

# Alias
# alias cd='z'
alias y='yazi'
alias v='nvim'

eval "$(starship init zsh)"

source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export GPG_TTY=$(tty)
