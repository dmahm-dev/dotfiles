{pkgs,...}:

{
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
		];
		package = pkgs.vivaldi;
	};
}
