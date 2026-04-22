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
		remotes = [
			{
				name = "flathub";
				location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
			}
			{
				name = "elyprismlauncher-origin";
				location = "https://elyprismlauncher.github.io/flatpak/elyprismlauncher.flatpakrepo";
			}
		];
		packages = [
			{
				appId = "io.github.elyprismlauncher.ElyPrismLauncher";
				origin = "elyprismlauncher-origin";
			}
			{appId = "ru.linux_gaming.PortProton";origin="flathub";}
			{appId = "md.obsidian.Obsidian";origin="flathub";}
			{appId = "com.pot_app.pot";origin="flathub";}
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
	};
}
