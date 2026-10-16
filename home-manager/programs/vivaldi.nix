{pkgs, unstable, config, lib, ...}:

{
	programs.vivaldi = {
		enable = true;
		# commandLineArgs = [];
		nativeMessagingHosts = [
			unstable.kdePackages.plasma-browser-integration
			pkgs.keepassxc
		];
		extensions = [ 
			{ id = "cimiefiiaegbelhefglklhhakcgmhkai"; }
			{ id = "bgnkhhnnamicmpeenaelnjfhikgbkllg"; }
			{ id = "oboonakemofpalcgghocfoadofidjkkk"; }
			{ id = "gebbhagfogifgggkldgodflihgfeippi"; }
		];
		package = unstable.vivaldi.override { proprietaryCodecs = true; enableWidevine = true; };
	};
}
