{pkgs,...}:

{
	fonts = {
		packages = with pkgs; [
			nerd-fonts.fira-code
			roboto
			vista-fonts
			corefonts
			noto-fonts
			noto-fonts-color-emoji
			noto-fonts-cjk-sans
			lxgw-wenkai
		];

		fontDir.enable = true;
		fontconfig.defaultFonts = {
			monospace = [ "FiraCode Nerd Font Mono" "LXGW WenKai"];
			sansSerif = [ "Roboto" "LXGW WenKai" ];
			serif = ["Roboto Slab" "LXGW WenKai"];
			emoji = ["Noto Color Emoji"];
		};
	};
}
