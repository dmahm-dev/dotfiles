{pkgs, config, lib, ...}:

{
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
		package = pkgs.vivaldi.override { proprietaryCodecs = true; };
	};
}
