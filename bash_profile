[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add scripts path
export PATH="$HOME/.config/scripts/:$PATH"

# Variables
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="chromium"
export IMAGE_VIEWER=sxiv
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export BUN_INSTALL="$HOME/.bun"

# History
export HISTTIMEFORMAT="[%F %T] "

# Autostart xorg-xinit
if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx 
fi
