[[ -f ~/.bashrc ]] && . ~/.bashrc

# export PATH=$PATH:$HOME/.scripts
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi
