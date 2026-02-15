{pkgs, lib, ...}:

{
	services.flatpak.enable = true;
	environment.systemPackages = with pkgs; [
		flatpak
		flatpak-xdg-utils
		kdePackages.flatpak-kcm
		kdePackages.kpipewire
		libportal
	];

	services.flatpak.packages = [
		"md.obsidian.Obsidian"
		"ru.linux_gaming.PortProton"
	];

	environment.shellAliases = {
		portproton = "flatpak run ru.linux_gaming.PortProton";
		obsidian = "flatpak run md.obsidian.Obsidian";
	};
}
