{ config, pkgs, unstable, lib, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			./hardware-configuration.nix
		];

	networking.hostName = "SomePC"; # Define your hostname.
	hardware.enableAllFirmware = true; # Ignore license
	nixpkgs.config.allowUnfree = true; # Fix for enableAllFirmware

	# Set your time zone.
	time.timeZone = "Europe/Moscow";

	# Select internationalisation properties.
	i18n.defaultLocale = "ru_RU.UTF-8";

	i18n.extraLocaleSettings = {
		LC_ADDRESS = "ru_RU.UTF-8";
		LC_IDENTIFICATION = "ru_RU.UTF-8";
		LC_MEASUREMENT = "ru_RU.UTF-8";
		LC_MONETARY = "ru_RU.UTF-8";
		LC_NAME = "ru_RU.UTF-8";
		LC_NUMERIC = "ru_RU.UTF-8";
		LC_PAPER = "ru_RU.UTF-8";
		LC_TELEPHONE = "ru_RU.UTF-8";
		LC_TIME = "ru_RU.UTF-8";
	};

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.userok = {
		isNormalUser = true;
		description = "userok";
		extraGroups = [ "networkmanager" "wheel" "network" "video" "input" "storage"];
	};

	# Enable automatic login for the user.
	services.getty.autologinUser = "userok";
  
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# List packages installed in system profile
	environment.systemPackages = with pkgs; [
		cachix
		home-manager
	];

	#boot.kernelPackages = pkgs.linuxPackages_latest;

	nix.settings = {
		substituters = [
			"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
			"https://cache.nixos.org"
		];
		trusted-public-keys = [
			"cache.nixos.org-1:6NCHdD59x431o0GWypbMrAURkbJ16ZPMQFGspcDShjY="
		];
	};

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.11"; # Did you read the comment?

}
