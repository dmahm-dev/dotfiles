{pkgs, ...}:

{
	programs.bash = {
		#undistracMe.enable = true;
		#undistractMe.playSound = true;
		# copied to home-manager/programs/console.nix
		shellInit = "shopt -s cdspell histappend histreedit checkjobs";
		interactiveShellInit = ''
			export SUDO_PROMPT=$'\033[1;37m[sudo]\033[0m \033[1;31mPassword: \033[0m'
		'';
	};

	# vconsole	
# 	console = {
# 		packages = with pkgs; [ kbd terminus_font ];
# 		font = "ter-c22b";
# 		keyMap = "us";
# 		#useXkbConfig = true; # setup as xkb
# 	};
}
