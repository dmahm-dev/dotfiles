{config, lib, ...}:

{
	environment = {

		variables = {
			EDITOR = "nano";
			#exclude repeated and started with space commands from history
			HISTCONTROL = "ignoreboth";
		};

		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#SomePC -v && home-manager switch --flake /etc/nixos#userok && flatpak update -y";
		};
	};


}
