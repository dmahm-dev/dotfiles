{ config, pkgs, ...}:

{
	home = {
		username = "userok";
		homeDirectory = "/home/userok";
		stateVersion = "24.11";
		packages = with pkgs; [

		];
	};
}
