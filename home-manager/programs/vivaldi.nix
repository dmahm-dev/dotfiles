{pkgs, config, lib, ...}:

let
	vivaldiPath = "${config.home.homeDirectory}/.config/vivaldi/Default";
in {
	home.packages = with pkgs; [
		vivaldi-ffmpeg-codecs
	];

	programs.chromium.nativeMessagingHosts = [
		pkgs.kdePackages.plasma-browser-integration
	];

	programs.chromium = {
		enable = true;
		# commandLineArgs = [];
		extensions = [ 
			{ id = "cimiefiiaegbelhefglklhhakcgmhkai"; }
			{ id = "bgnkhhnnamicmpeenaelnjfhikgbkllg"; }
			{ id = "oboonakemofpalcgghocfoadofidjkkk"; }
			{ id = "gebbhagfogifgggkldgodflihgfeippi"; }
		];
		package = pkgs.vivaldi;
	};

	# copy vivaldi settings from ./settings
	home.activation.copyVivaldiSettings =
		lib.hm.dag.entryAfter ["writeBoundary"] ''
		if [ ! -e "${vivaldiPath}/Preferences" ]; then
			cp ${./settings}/Preferences ${vivaldiPath}
		fi
	'';
}
