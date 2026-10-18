{pkgs, inputs, ...}:

{
    programs.nvf = {
 		enable = true;
 		settings.vim = {
 			statusline.lualine.enable = true;
 			telescope.enable = true;
 			autocomplete.nvim-cmp.enable = true;
 			lsp.enable = true;

 			autopairs.nvim-autopairs.enable = true;
 			utility.surround.enable = true;

 			comments.comment-nvim.enable = true;
 			binds.whichKey.enable = true;


 			theme = {
 				enable = true;
 				name = "gruvbox";
 				style = "dark";
 			};

 			keymaps = [
				{
					key = "jj";
					mode = "i";
					action = "<Esc>";
					silent = true;
					desc = "Exit insert mode with jj";
				}
 			];

 			extraPlugins = {
                strudel-nvim.package = pkgs.vimUtils.buildVimPlugin {
                    pname = "strudel-nvim";
                    version = "latest";
                    src = inputs.strudel-nvim;
                };
                vim-be-good.package = pkgs.vimPlugins.vim-be-good;
 			};
 			extraPackages = [ pkgs.nodejs ];

 			languages = {
 				enableTreesitter = true;

 				nix.enable = true;
 				typescript.enable = true;
 				clang.enable = true;
 				python.enable = true;
 			};
 		};
 	};
}
