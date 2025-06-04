{...}:

{
	programs.captive-browser = {
		enable = true;
		browser = "vivaldi";
		interface = "wlo1";
	};

	services.avahi = {
		enable = true;
		nssmdns4 = true;
	};

	networking.networkmanager = {
		enable = true;
		dns = "systemd-resolved";
		wifi.macAddress = "stable-ssid";
	};
	services.resolved = {
		enable = true;
		dnssec = "allow-downgrade";
		dnsovertls = "opportunistic";
		extraConfig = "MulticastDNS=no";
	};

	boot.kernel.sysctl = {
		"net.ipv4.tcp_fastopen" = 3;
		"net.ipv4.tcp_slow_start_after_idle" = 0;
	};

	# firewall settings
	networking.nftables.enable = true;
	networking.firewall = {
		# allowedUDPPorts = [  ];
		# allowedUDPPortRanges = [ {from = ; to = ;} ];
		# allowedTCPPorts = [  ];
		# allowedTCPPortRanges = [ {from = ; to = ;} ];
	};

	services.fail2ban = {
		enable = true;
		maxretry = 5;
		ignoreIP = ["127.0.0.1/8" "::1"];
	};
}
