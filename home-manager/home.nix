{pkgs, ...}:

{
	home = {
		username = "userok";
		homeDirectory = "/home/userok";
		stateVersion = "25.05";
		packages = with pkgs; [

		];
	};
	
	imports = [
		./system/userDirs.nix
	];
}
