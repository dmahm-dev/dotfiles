{pkgs, lib, ...}:

let
  scriptPath = "/etc/plymouth-wait-sddm.sh";
in
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

	#systemd.services.plymouth-quit.after = [ "display-manager.service" ];
	#systemd.services.display-manager.after = [ "plymouth-quit.service" ];

}
