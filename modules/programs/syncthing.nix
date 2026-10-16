{pkgs,...}:

{
	environment.systemPackages = [pkgs.syncthing];

	services.syncthing = {
		enable = true;
		user = "userok";
		dataDir = "/home/userok";
		configDir = "/home/userok/.config/syncthing";
		openDefaultPorts = true;
	};

}
