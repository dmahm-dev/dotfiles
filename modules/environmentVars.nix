{config, lib, ...}:

{
	environment = {

		variables = {
			EDITOR = "nano";
			#exclude repeated and started with space commands from history
			HISTCONTROL = "ignoreboth";
		};

		shellAliases = {
			rebuild = "sudo nixos-rebuild switch -v && home-manager switch && flatpak update";
		};
	};


}
