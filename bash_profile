[[ -f ~/.bashrc ]] && . ~/.bashrc

# Add scripts path
export PATH="$HOME/.config/scripts/:$PATH"

# Variables
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
export IMAGE_VIEWER=sxiv
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi
