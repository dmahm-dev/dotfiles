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
