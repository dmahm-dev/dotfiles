{...}:

{
	programs.bash.enable = true;
	programs.bash.bashrcExtra = 
		"shopt -s cdspell histappend histreedit checkjobs\nfastfetch";
	programs.bash.profileExtra = 
		''export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"'';
}
