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
			lsp.enable = true;

			theme = {
				enable = true;
				name = "gruvbox";
				style = "dark";
			};

			languages = {
				enableTreesitter = true;
				nix.enable = true;
			};
		};
	};
}
