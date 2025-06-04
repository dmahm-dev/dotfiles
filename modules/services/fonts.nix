{pkgs,...}:

{
	fonts.packages = with pkgs; [
		nerd-fonts.fira-code
		roboto
		vista-fonts
		corefonts
	];

	fonts.fontDir.enable = true;
	fonts.fontconfig.defaultFonts = {
		monospace = [ "FiraCode Nerd Font Mono" ];
		#sansSerif = [];
		#serif = [];
		#emoji = [];
	};
}
