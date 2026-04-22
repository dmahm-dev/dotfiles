{config, pkgs, ...}:

{
	home = {
		username = "userok";
		homeDirectory = "/home/userok";
		stateVersion = "25.11";
		language = {
			base = "ru_RU.UTF-8";
			numeric = "en_US.UTF-8";
		};
		packages = with pkgs; [
			libreoffice-fresh
			gamemode
			telegram-desktop
			libwebp
			kdePackages.kalgebra
			protonup-qt
			aegisub
			audacity
			heroic
		];
		# fix flatpak fonts
		file.".local/share/fonts".source = config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/X11/fonts";
	};
	programs = {
		mpv.enable = true;
		home-manager.enable = true;
	};

	imports = [
		./system/userDirs.nix
		./system/hushlogin.nix
		./system/backlight.nix
		./system/plasma.nix
		./system/exponentialBrightness.nix

		./programs/console.nix
		./programs/vivaldi.nix
		./programs/mangohud.nix
		./programs/vscode.nix
	];
}
