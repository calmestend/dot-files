if status is-interactive
	set fish_greeting
	fish_vi_key_bindings

	set -g fish_cursor_default block
	set -g fish_cursor_insert line
	set -g fish_cursor_replace_one unders
	set -g fish_cursor_replace unders
	set -g fish_cursor_visual block

	set -Ux EDITOR nvim
	set -Ux STARSHIP_CONFIG ~/.config/starship/starship.toml

	alias v="nvim"
	alias l="lazygit"
	alias y="yazi"

	starship init fish | source
	zoxide init fish | source

	direnv hook fish | source

end
