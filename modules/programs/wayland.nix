{pkgs, ...}:

{
	services.xserver.xkb = {
		layout = "us,ru";
		model = "pc105";
		variant = "";
		options = "grp:alt_shift_toggle";
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
