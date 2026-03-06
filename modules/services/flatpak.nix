{pkgs, ...}:

{
	environment.systemPackages = with pkgs; [
		flatpak
		flatpak-xdg-utils
		kdePackages.flatpak-kcm
		kdePackages.kpipewire
		libportal
	];

	services.flatpak = {
		enable = true;
		packages = [
			"ru.linux_gaming.PortProton"
			"https://elyprismlauncher.github.io/flatpak/elyprismlauncher.flatpakref"
		];
		overrides = {
			global.Context = {
				filesystems = [
					"/nix/store:ro"
					"xdg-data/fonts:ro"
					"/run/current-system/sw/share/X11/fonts:ro"
				];
			};
		};
	};

	environment.shellAliases = {
		portproton = "flatpak run ru.linux_gaming.PortProton";
	};
}
