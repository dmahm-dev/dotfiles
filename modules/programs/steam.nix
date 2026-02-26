{pkgs, ...}:

{
	# not in home-manager due to limited parameters in it
	programs.steam = {
		enable = true;
		dedicatedServer.openFirewall = true;
		extest.enable = true; # gamepad thing
		protontricks.enable = true;
 		package = pkgs.steam.override {
 			extraEnv = {
				PROTON_USE_NTSYNC = "1";
				#PROTON_ENABLE_WAYLAND = "1"; #bad behaviour in outer wilds
				PROTON_ENABLE_NVAPI = "1"; #fixes video in games
 				#MANGOHUD = true;
 				#OBS_VKCAPTURE = true;
 			};
 		};
	};
}
