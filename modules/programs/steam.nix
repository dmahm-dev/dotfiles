{pkgs, ...}:

{
	# not in home-manager due to limited parameters in it
	programs.steam = {
		enable = true;
		dedicatedServer.openFirewall = true;
		extest.enable = true; # gamepad thing
		protontricks.enable = true;
 		package = pkgs.steam.override {
			extraPkgs = pkgs: with pkgs; [
				gamemode
				mangohud
			];
 			extraEnv = {
				PROTON_USE_NTSYNC = "1";
				PROTON_ENABLE_WAYLAND = "1";
				PROTON_ENABLE_NVAPI = "1";
 				#MANGOHUD = true;
 				#OBS_VKCAPTURE = true;
 			};
 		};
 		extraCompatPackages = [ pkgs.proton-ge-bin ];
	};

	programs.gamemode.enable = true;
}
