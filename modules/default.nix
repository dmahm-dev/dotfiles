{config, lib, ...}:

{
	imports = [
		./environmentVars.nix

		./hardware/optimisations.nix
		./hardware/modprobe.nix
		./hardware/bluetooth.nix
		./hardware/network.nix
		./hardware/disks.nix
		./hardware/thermal-control.nix
		./hardware/printing.nix
		./hardware/periphery.nix
		./hardware/sound.nix

		./services/journald.nix
		./services/sysctl.nix
		./services/upower.nix
		./services/bootloader.nix
		./services/nix.nix
		./services/systemd.nix
		./services/fonts.nix
		./services/flatpak.nix
		./services/plymouth.nix
		./services/agetty.nix
		./services/zapret.nix

		./programs/console.nix
		./programs/editors.nix
		./programs/git.nix
		./programs/wayland.nix
		./programs/plasma.nix
		./programs/codecs.nix
		./programs/cli-fun.nix
		./programs/steam.nix
		./programs/syncthing.nix
		./programs/kdeconnect.nix
		./programs/torrent.nix
		./programs/discord.nix
		./programs/python.nix
		./programs/smallProgs.nix
	];
}
