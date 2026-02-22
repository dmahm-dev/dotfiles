{pkgs, ...}:

{
	home = {
		username = "userok";
		homeDirectory = "/home/userok";
		stateVersion = "25.11";
		packages = with pkgs; [
			libreoffice-fresh
			gamemode
			telegram-desktop
			libwebp
			kdePackages.kalgebra
			protonup-qt
		];
	};
	programs.mpv.enable = true;
	

	imports = [
		./system/userDirs.nix
		./system/hushlogin.nix

		./programs/console.nix
		./programs/vivaldi.nix
		./programs/mangohud.nix
		./programs/vscode.nix
	];
}
