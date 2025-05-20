{config, lib, ...}:

{
	imports = [
		./hardware/optimisations.nix
		./hardware/modprobe.nix
		./environmentVars.nix
		./programs/bash.nix
		./programs/editors.nix
		./programs/git.nix
	];
}
