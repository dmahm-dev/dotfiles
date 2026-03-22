{pkgs,...}:

{
	services = {
		desktopManager.plasma6.enable = true;
		displayManager.sddm = {
			enable = true;
			wayland.enable = true;
		};
		displayManager.autoLogin = {
			enable = true;
			user = "userok";
		};
	};

	xdg.portal.enable = true;

	environment.systemPackages = with pkgs; [
		kdePackages.ocean-sound-theme
		kdePackages.oxygen-sounds
		hunspell
		hunspellDicts.ru_RU
		hunspellDicts.en_US
	];

	environment.plasma6.excludePackages = [
		pkgs.kdePackages.discover
	];

	programs.dconf.enable = true; #for GTK apps
}
