{ config, pkgs, ... }:

{
	programs.starship = {
		enable = true;
		settings = {
			scan_timeout = 10;
			command_timeout = 500;
			add_newline = false;
			format = "$character$username$hostname$localip$shlvl$singularity$kubernetes$directory$vcsh$fossil_branch$fossil_metrics$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$hg_state$pijul_channel$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$fortran$gleam$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$quarto$raku$rlang$red$ruby$rust$scala$solidity$swift$terraform$typst$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$memory_usage$aws$gcloud$openstack$azure$nats$direnv$env_var$mise$crystal$custom$sudo$line_break$jobs$status$os$container$netns$shell";
			right_format = "$cmd_duration$time$battery";

			character = {
				format = "$symbol ";
				vicmd_symbol = "[N](bold green)";
				disabled = false;
				success_symbol = "[I](bold green)";
				error_symbol = "[I](bold red)";
				vimcmd_replace_one_symbol = "[R](bold purple)";
				vimcmd_replace_symbol = "[R](bold purple)";
				vimcmd_visual_symbol =  "[V](bold yellow)";
			};

			directory = {
				truncation_length = 3;
				truncate_to_repo = true;
				format = "[$path]($bold cyan)[$read_only]($read_only_style) ";
			};

			username = {
				format = "[$user]($bold yellow) ";
				show_always = false; 
			};
		};
	};
}

