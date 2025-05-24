{ config, ... }:

let
	docsPath = "${config.home.homeDirectory}/Documents";
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
}
