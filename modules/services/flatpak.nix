{pkgs, lib, ...}:

{
	services.flatpak.enable = true;
	environment.systemPackages = with pkgs; [
		flatpak
		flatpak-xdg-utils
		kdePackages.flatpak-kcm
		kdePackages.kpipewire
		libportal
		warehouse
	];

	services.flatpak.packages = [
		"md.obsidian.Obsidian"
		"ru.linux_gaming.PortProton"
	];
}
