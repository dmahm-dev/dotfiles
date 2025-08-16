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
		"org.freedesktop.Platform.VulkanLayer.gamescope"
	];

	environment.shellAliases = {
		portproton = "flatpak run ru.linux_gaming.PortProton";
		obsidian = "flatpak run md.obsidian.Obsidian";
		gamescope = "flatpak run org.freedesktop.Platform.VulkanLayer.gamescope";
	};
}
