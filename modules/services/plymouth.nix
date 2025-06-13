{pkgs, ...}:

{
	boot.plymouth = {
		enable = true;
		theme = "blahaj";
		themePackages = [ pkgs.plymouth-blahaj-theme ];
	};
}
