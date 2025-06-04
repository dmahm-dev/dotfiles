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
		./system/hushlogin.nix

		./programs/libreoffice.nix
		./programs/vivaldi.nix
		./programs/mpv.nix
	];
}
