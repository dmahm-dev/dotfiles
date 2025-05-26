{...}:

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
}
