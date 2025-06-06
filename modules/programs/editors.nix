{...}:

{
	programs.nano = {
		nanorc = "set tabsize 2";
	};
	programs.nvf = {
		enable = true;
		settings.vim = {
			statusline.lualine.enable = true;
			telescope.enable = true;
			autocomplete.nvim-cmp.enable = true;
			theme = {
				enable = true;
				name = "gruvbox";
				style = "dark";
			};
			languages = {
				enableLSP = true;
				enableTreesitter = true;
				nix.enable = true;
			};
		};
	};
}
