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

	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			kdePackages.xdg-desktop-portal-kde
		];
	};

	environment.plasma6.excludePackages = [
		pkgs.kdePackages.discover
	];
}
