{pkgs, lib, ...}:

{
	boot.plymouth = {
		enable = true;
		theme = "blahaj";
		themePackages = [ pkgs.plymouth-blahaj-theme ];
	};

	#всё для plymouth
	boot.initrd.systemd.enable = true;
	boot.initrd.verbose = false;
	boot.consoleLogLevel = 0;
}
