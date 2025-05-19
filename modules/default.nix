{config, lib, ...}:

{
	imports = [
		./hardware-optimisations.nix
		./environmentVars.nix
		./programs/bash.nix
		./programs/editors.nix
	];
}
