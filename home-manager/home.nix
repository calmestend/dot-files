{ config, pkgs, ... }:

{
	imports = [
		./modules/shell.nix
		./modules/starship.nix
		./modules/neovim.nix
		./modules/tmux.nix
	];

  home.username = "calmestend";
  home.homeDirectory = "/home/calmestend/";

  home.stateVersion = "25.11";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Firefox
  programs.firefox.enable = true;  

	home.packages = with pkgs; [
    nerd-fonts.iosevka
    ghostty
    wofi
    yazi
    pavucontrol
    tidal-hifi
    git
    ripgrep
    rustc
    cargo
    libgcc
    clang-tools
    llvm
    glibc
    zig
    jq
    typst
    lazygit
    rose-pine-icon-theme
    rose-pine-gtk-theme
    rose-pine-hyprcursor
    hyprpaper
    grim 
    slurp 
    wl-clipboard
    quickshell
    fastfetch
    obs-studio
    ffmpeg
    pass
    pinentry-curses
		fzf
	];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
