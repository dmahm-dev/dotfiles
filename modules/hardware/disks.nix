{pkgs, ...}:

{
	services.udisks2 = {
		enable = true;
		mountOnMedia = true;
	};

	services.fstrim.enable = true;
	fileSystems."/".options = [ "noatime" ];

	environment.systemPackages = with pkgs; [
		smartmontools
		nvme-cli
	];
}
