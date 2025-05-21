{ config, lib, ... }:

{
	programs.captive-browser = {
		enable = true;
		browser = "vivaldi";
		interface = "enp1s0";
	};

	services.avahi = {
		enable = true;
		nssmdns4 = true;
	};

	networking.networkmanager = {
		enable = true;
		dns = "systemd-resolved";
	};
	services.resolved.enable = true;
}
