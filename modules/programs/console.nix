{...}:

{
	programs.bash = {
		#undistracMe.enable = true;
		#undistractMe.playSound = true;
		shellInit = "shopt -s cdspell histappend histreedit checkjobs";
	};

	# vconsole	
	console = {
		font = "LatGrkCyr-12x22";
		useXkbConfig = true; # setup as xkb
	};
}
