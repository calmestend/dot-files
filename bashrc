# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Comfy settings
shopt -s autocd
bind 'set show-all-if-ambiguous on'

# Colors
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l -hN --color=auto --group-directories-first'
alias la='ls -la -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'

# Short names
alias vim='nvim'

# Exec starship
eval "$(starship init bash)"

PS1='[\u@\h \W]\$ '
