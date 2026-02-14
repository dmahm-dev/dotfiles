{pkgs,...}:

{
	programs.vscode = {
		enable = true;
		package = pkgs.vscode.fhsWithPackages (ps: with ps; [ gcc]);
		profiles.default.extensions = with pkgs.vscode-extensions; [
			ms-vscode.cpptools
			ms-vscode.cpptools-extension-pack
			ms-vscode.cmake-tools
			mkhl.direnv
			naumovs.color-highlight
			johnpapa.vscode-peacock
			#mrmlnc.vscode-duplicate
			eamodio.gitlens
			#wayou.vscode-todo-highlight
			gruntfuggly.todo-tree
			usernamehw.errorlens
			hediet.vscode-drawio
			#pflannery.vscode-versionlens
			streetsidesoftware.code-spell-checker
			#cardinal90.multi-cursor-case-preserve
		];
	};
	programs.direnv = {
		enable = true;
		nix-direnv.enable = true;
	};

}
