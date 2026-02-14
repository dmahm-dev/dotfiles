{pkgs,...}:

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
		#dnssec = "allow-downgrade";
		dnsovertls = "opportunistic";
		extraConfig = "MulticastDNS=no";
	};

	boot.kernel.sysctl = {
		"net.ipv4.tcp_fastopen" = 3;
		"net.ipv4.tcp_slow_start_after_idle" = 0;
	};

	# firewall settings
#	networking.nftables.enable = true;
#	networking.firewall = {
		# 22000 и 21027 - syncthing
#		allowedUDPPorts = [ 22000 21027 ];
		# allowedUDPPortRanges = [ {from = ; to = ;} ];
#		 allowedTCPPorts = [ 22000 ];
		# allowedTCPPortRanges = [ {from = ; to = ;} ];
#	};
	networking.firewall.enable = true;
	networking.nftables.enable = true;
	services.firewalld = {
		enable = true;
		zones.home.services = [
			"syncthing" "syncthing-gui" "syncthing-relay"
			"kdeconnect"
		];
		zones.nixos-fw-default.services = [
			"syncthing" "syncthing-gui" "syncthing-relay"
			"kdeconnect"
		];
	};

	services.fail2ban = {
		enable = true;
		maxretry = 5;
		ignoreIP = ["127.0.0.1/8" "::1"];
		banaction = "firewalld-multiport";
	};

	# network utils
	environment.systemPackages = with pkgs; [
		ethtool
		wirelesstools
		firewalld-gui
	];
}
