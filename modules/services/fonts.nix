{pkgs,...}:

{
	fonts.packages = with pkgs; [
		nerd-fonts.fira-code
		roboto
		vista-fonts
		corefonts
		noto-fonts
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
	];

	fonts.fontDir.enable = true;
	fonts.fontconfig.defaultFonts = {
		monospace = [ "FiraCode Nerd Font Mono" ];
		#sansSerif = [];
		#serif = [];
		#emoji = [];
	};
}
