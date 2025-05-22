{config, lib, ...}:

{
	imports = [
		./environmentVars.nix
		./hardware/optimisations.nix
		./hardware/modprobe.nix
		./hardware/bluetooth.nix
		./hardware/network.nix
		./hardware/udisks.nix
		./services/journald.nix
		./programs/bash.nix
		./programs/editors.nix
		./programs/git.nix
	];
}
