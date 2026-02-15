{ config, lib, ... }:

let
	# change /etc/nixos/modules/hardware/printing.nix if
	# you change docsPath
	docsPath = "${config.home.homeDirectory}/Documents";
	templatesPath = "${config.home.homeDirectory}/Templates/";
in {
	xdg.userDirs = {
		enable = true;
		createDirectories = true;

		download = "${config.home.homeDirectory}/Internet";
		documents = docsPath;
		music = "${docsPath}/Music";
		pictures = "${docsPath}/Pictures";
		videos = "${docsPath}/Videos";
	};

	home.file.".config/user-dirs.locale".text = "en_US";
	home.file.".local/share/fonts".source =
		config.lib.file.mkOutOfStoreSymlink "/run/current-system/sw/share/X11/fonts";

	# copy from ./templates to ~/Templates
	home.activation.copyToTemplates =
		lib.hm.dag.entryAfter [ "writeBoundary" ] ''
		for file in ${./templates}/*; do
			filename=$(basename "$file")
			if [ ! -e "${templatesPath}/$filename" ]; then
				cp ${./templates}/* ${templatesPath}
			fi
		done
		'';
}
