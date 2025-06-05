{pkgs,...}:

{
	services.syncthing = {
		enable = true;
		systemService = false;
		user = "userok";
		settings.options.urAccepted = 1;
		openDefaultPorts = true;
	};

	environment.systemPackages = [pkgs.syncthing];
}
