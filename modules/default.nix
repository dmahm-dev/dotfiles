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
		./services/journald.nix
		./services/sysctl.nix
		./services/upower.nix
		./programs/bash.nix
		./programs/editors.nix
		./programs/git.nix
	];
}
