# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Comfy settings
shopt -s autocd

# Colors
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -l -hN --color=auto --group-directories-first'
alias la='ls -la -hN --color=auto --group-directories-first'
alias grep='grep --color=auto'

# Short names
alias vim='nvim'

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# Add scripts path
export PATH="$HOME/.config/scripts/:$PATH"

# Exec starship
eval "$(starship init bash)"

# Default applications
export IMAGE_VIEWER=sxiv
export EDITOR=nvim

# mental sanity settings
bind 'set show-all-if-ambiguous on'

PS1='[\u@\h \W]\$ '
