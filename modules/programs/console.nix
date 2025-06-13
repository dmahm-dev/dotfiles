{...}:

{
	programs.bash = {
		#undistracMe.enable = true;
		#undistractMe.playSound = true;
		# copied to home-manager/programs/console.nix
		shellInit = "shopt -s cdspell histappend histreedit checkjobs";
	};

	# vconsole	
	console = {
		font = "LatGrkCyr-12x22";
		useXkbConfig = true; # setup as xkb
	};

	services.getty.loginOptions = "--noissue --noclear";
}
