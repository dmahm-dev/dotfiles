{...}:

{
	programs.bash.enable = true;
	programs.bash.bashrcExtra = 
		"shopt -s cdspell histappend histreedit checkjobs\nfastfetch";
}
