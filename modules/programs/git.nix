{ config, lib, ...}:

{
	programs.git = {
		enable = true;
		config = [{
			init.defaultBranch = "main";

			user = {
				name = "Lazres31";
				email = "lazres31@yandex.ru";
			};

			alias = {
				lg = "log --all --graph --oneline";
			};
		}];
	};

	environment.shellAliases = {
		#ls = "ls --something";
	};
}
