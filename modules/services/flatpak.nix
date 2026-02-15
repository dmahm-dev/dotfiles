{pkgs, lib, ...}:

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
			"md.obsidian.Obsidian"
			"ru.linux_gaming.PortProton"
		];
		overrides = {
			global.Context = {
				filesystems = [
					"/nix/store:ro"
					"xdg-data/fonts:ro"
				];
			};
		};
	};

	environment.shellAliases = {
		portproton = "flatpak run ru.linux_gaming.PortProton";
		obsidian = "flatpak run md.obsidian.Obsidian";
	};
}
