{pkgs, ...}:

{
	# not in home-manager due to limited parameters in it
	programs.steam = {
		enable = true;
		dedicatedServer.openFirewall = true;
		extest.enable = true; # gamepad thing
		protontricks.enable = true;
# 		gamescopeSession.enable = true;
# 		package = pkgs.steam.override {
# 			extraEnv = {
# 				MANGOHUD = true;
# 				OBS_VKCAPTURE = true;
# 			};
# 		};
	};
}
