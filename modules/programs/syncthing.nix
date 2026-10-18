{pkgs,...}:

{
	services.syncthing = {
		enable = true;
		user = "userok";
		group = "users";
		dataDir = "/home/userok";
		configDir = "/home/userok/.config/syncthing";
		openDefaultPorts = true;
	};
}
