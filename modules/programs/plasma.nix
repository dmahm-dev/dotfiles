{...}:

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
}
