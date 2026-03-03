{ config, pkgs, lib, ... }:

{
	imports = [ ./hardware-configuration.nix ];

	networking.hostName = "SomePC";
	hardware.enableAllFirmware = true;
	nixpkgs.config = {
		allowUnfree = true;
		cudaSupport = true;
	};

	time.timeZone = "Europe/Moscow";

	# also change home.nix
	i18n.defaultLocale = "ru_RU.UTF-8";
	i18n.extraLocaleSettings = {
		LC_MESSAGES = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
	};

	users.users.userok = {
		isNormalUser = true;
		description = "userok";
		extraGroups = [ "networkmanager" "wheel" "network" "video" "input" "storage"];
	};

	services.getty.autologinUser = "userok";

	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		substituters = [
			"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
			"https://cache.nixos.org"
		];
		trusted-public-keys = [
			"cache.nixos.org-1:6NCHdD59x431o0GWypbMrAURkbJ16ZPMQFGspcDShjY="
		];
	};
	environment.systemPackages = with pkgs; [
		cachix
		home-manager
	];

	boot.kernelPackages = pkgs.linuxPackages_6_18;
	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.11"; # Did you read the comment?

}
