{pkgs, ...}:

{
	services.xserver = {
		xkb = {
			layout = "us,ru";
			variant = "";
			options = "grp:alt_shift_toggle";
		};

		#extraConfig = "";
	};
	
	programs.xwayland.enable = true;
	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	environment.systemPackages = with pkgs; [
		wayland-utils
		wl-clipboard
	];

	#qt = {
	#	enable = true;
	#	platformTheme = "gnome";
	#	style = "adwaita";
	#};
}
