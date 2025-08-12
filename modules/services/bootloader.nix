{pkgs,...}:

{
	boot.loader.systemd-boot = {
		enable = true;
		configurationLimit = 10;
		editor = false;
	};
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.timeout = 1;

	boot.kernelParams = [ 
		"nowatchdog" 
		"quiet" "loglevel=3" "vt.global_cursor_default=0"
		"splash"
		"udev.log_level=3"
	];

	environment.systemPackages = with pkgs; [
		efibootmgr
		qrencode
	];
}
