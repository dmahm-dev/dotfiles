{config, lib, ...}:

{
	programs.bash = {
		#undistracMe.enable = true;
		#undistractMe.playSound = true;
		shellInit = "shopt -s cdspell histappend histreedit checkjobs";
	};
}
