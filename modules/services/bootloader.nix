{pkgs,...}:

{
	boot.loader.systemd-boot = {
		enable = true;
		configurationLimit = 20;
		editor = false;
	};
	boot.loader.efi.canTouchEfiVariables = true;

	boot.kernelParams = [ "nowatchdog" ];

	environment.systemPackages = with pkgs; [
		efibootmgr
		qrencode
	];
}
