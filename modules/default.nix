{config, lib, ...}:

{
	imports = [
		./environmentVars.nix
		./hardware/optimisations.nix
		./hardware/modprobe.nix
		./hardware/bluetooth.nix
		./hardware/network.nix
		./hardware/udisks.nix
		./hardware/thermal-control.nix
		./hardware/printing.nix
		./hardware/mouseNtouchpad.nix
		./hardware/sound.nix
		./services/journald.nix
		./services/sysctl.nix
		./services/upower.nix
		./services/bootloader.nix
		./services/nix.nix
		./programs/console.nix
		./programs/editors.nix
		./programs/git.nix
		./programs/x11.nix
	];
}
