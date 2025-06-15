[[ -f ~/.zshrc ]] && . ~/.zshrc

# Paths
export PATH="$HOME/.config/scripts/:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Variables
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="chromium"
export IMAGE_VIEWER=sxiv
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

## GO
export GOPATH="$HOME/go"
## BUN
export BUN_INSTALL="$HOME/.bun"

# History
export HISTTIMEFORMAT="[%F %T] "

# Autostart xorg-xinit
if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx 
fi
