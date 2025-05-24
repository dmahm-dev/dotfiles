{...}:

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
	services.resolved = {
		enable = true;
		dnssec = "true";
		dnsovertls = "opportunistic";
		extraConfig = "MulticastDNS=no";
	};

	boot.kernel.sysctl = {
		"net.ipv4.tcp_fastopen" = 3;
		"net.ipv4.tcp_slow_start_after_idle" = 0;
	};
}
