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
		plugins = [ pkgs.networkmanager-openvpn ];
	};
	services.resolved = {
		enable = true;
		dnssec = "allow-downgrade";
		dnsovertls = "opportunistic";
		fallbackDns = [ "1.1.1.1" "1.0.0.1" ];
		extraConfig = ''
			MulticastDNS=no
		'';
	};

	boot.kernel.sysctl = {
		"net.ipv4.tcp_fastopen" = 3;
		"net.ipv4.tcp_slow_start_after_idle" = 0;
	};

	networking.firewall.enable = true;
 	networking.nftables = {
 		enable = true;
		#zapret thing
		ruleset = ''
			table inet zapret {
				chain divert {
					type filter hook output priority mangle; policy accept;
					ip daddr { 127.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, 10.0.0.0/8 } accept
					tcp dport { 80, 443, 2053, 2083, 2087, 2096, 8443 } counter queue num 200 bypass
					udp dport { 443, 19294-19344, 50000-50100 } counter queue num 200 bypass
				}
			}
		'';
 	};
	services.firewalld = {
		enable = true;
		zones.home.services = [
			"syncthing" "syncthing-gui" "syncthing-relay"
			"kdeconnect" "mdns"
		];
		zones.nixos-fw-default.services = [
			"syncthing" "syncthing-gui" "syncthing-relay"
			"kdeconnect" "mdns"
		];
	};

	services.fail2ban = {
		enable = true;
		maxretry = 5;
		ignoreIP = ["127.0.0.0/8" "::1"];
		banaction = "firewalld-multiport";
	};

	# network utils
	environment.systemPackages = with pkgs; [
		ethtool
		wirelesstools
		firewalld-gui
		dnsutils
	];
}
