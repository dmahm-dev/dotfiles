{pkgs, ...}:

{
	programs.bash = {
		#undistracMe.enable = true;
		#undistractMe.playSound = true;
		# copied to home-manager/programs/console.nix
		shellInit = "shopt -s cdspell histappend histreedit checkjobs";
	};

	# vconsole	
	console = {
		packages = with pkgs; [ kbd terminus_font ];
		font = "ter-c22b";
		keyMap = "us";
		#useXkbConfig = true; # setup as xkb
	};
}
