{...}:

{
	programs.bash.enable = true;
	programs.bash.bashrcExtra = 
		"shopt -s cdspell histappend histreedit checkjobs\nfastfetch";
	programs.bash.profileExtra = 
		''export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"'';
	programs.kitty = {
		enable = true;
		enableGitIntegration = true;
		shellIntegration.enableBashIntegration = true;
		font.name = "FiraCode Nerd Font";
		font.size = 10;
		settings = {
			disable_ligatures = "cursor";
			cursor_trail = 3;
			cursor_trail_decay = "0.1 0.6";
			scrollback_lines = 20000;
			show_hyperlink_targets = "yes";
			paste_actions = "quote-urls-at-prompt,confirm,confirm-if-large";
			#focus_follow_mouse = "yes";
			confirm_os_window_close = "-1 count-background";
			tab_activity_symbol = " ";
			notify_on_cmd_finish = "invisible 15.0 notify-bell";
		};
	};
}
