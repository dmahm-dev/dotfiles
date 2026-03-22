{pkgs, ...}:

{
	# disable mouse acceleration
	services.libinput.mouse.accelProfile = "flat";
	services.ratbagd.enable = true;
	hardware.xpadneo.enable = true;

	environment.systemPackages = with pkgs; [
		piper
		libinput
		evtest
	];
}
