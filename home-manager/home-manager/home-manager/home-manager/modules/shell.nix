{ config, pkgs, ... }:

{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			set fish_greeting 
			fish_vi_key_bindings

			alias v="nvim"
			alias y="yazi"
			alias l="lazygit"

			set -g fish_cursor_default block
			set -g fish_cursor_insert line
			set -g fish_cursor_replace_one underscore
			set -g fish_cursor_visual block
			'';
	};

	programs.zoxide = {
		enable = true;
		enableFishIntegration = true;
	};
}
