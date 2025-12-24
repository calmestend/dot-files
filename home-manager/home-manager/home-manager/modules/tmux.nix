{ config, pkgs, ... }:
{
		programs.tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      terminal = "tmux-256color";
      historyLimit = 100000;
      prefix = "C-f";
      plugins = with pkgs; [
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.sensible
				tmuxPlugins.tmux-sessionx
				tmuxPlugins.rose-pine
      ];
      extraConfig = ''
        set -g @sessionx-bind "o"
        set -g @sessionx-zoxide-mode "on"
				set -g @sessionx-custom-paths '/home/barac/work,/home/barac/personal'

				set -g @rose_pine_variant 'moon' 

				set -g @rose_pine_host 'on' 
				set -g @rose_pine_user 'on' 
				set -g @rose_pine_directory 'on' 

				set -g @rose_pine_bar_bg_disabled_color_option 'default'

				# set -g @rose_pine_only_windows 'on' 
				set -g @rose_pine_window_status_separator " -> " 
				set -g @rose_pine_disable_active_window_menu 'on' 
				set -g @rose_pine_default_window_behavior 'on' 

				# set -g @rose_pine_show_current_program 'on' 
				set -g @rose_pine_show_pane_directory 'on' 
				# Previously set -g @rose_pine_window_tabs_enabled

				# Example values for these can be:
				set -g @rose_pine_left_separator ' :: ' 
				set -g @rose_pine_right_separator ' :: ' 
				set -g @rose_pine_field_separator ' :: ' 
				set -g @rose_pine_window_separator ' :: ' 

				# These are not padded
				set -g @rose_pine_session_icon ' ' # Changes the default icon to the left of the session name
				set -g @rose_pine_current_window_icon '  ' # Changes the default icon to the left of the active window name
				set -g @rose_pine_folder_icon ' ' # Changes the default icon to the left of the current directory folder
				set -g @rose_pine_username_icon ' ' # Changes the default icon to the right of the hostname
				set -g @rose_pine_hostname_icon '󰒋 ' # Changes the default icon to the right of the hostname
				set -g @rose_pine_date_time_icon '󰃰 ' # Changes the default icon to the right of the date module

				source-file ~/.config/tmux/tmux.conf
	  '';
	};
}
