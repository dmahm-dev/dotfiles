{pkgs,...}:

{
	boot.loader.systemd-boot = {
		enable = true;
		configurationLimit = 20;
		editor = false;
	};
	boot.loader.efi.canTouchEfiVariables = true;

	boot.kernelParams = [ 
		"nowatchdog" 
		"quiet" "loglevel=3" "vt.global_cursor_default=0"
		"splash"
	];

	environment.systemPackages = with pkgs; [
		efibootmgr
		qrencode
	];
}
