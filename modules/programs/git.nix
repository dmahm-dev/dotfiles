{...}:

{
	programs.git = {
		enable = true;
		config = [{
			init.defaultBranch = "main";

			user = {
				name = "dmahm";
				email = "dmahm@yandex.ru";
			};

			alias = {
				lg = "log --all --graph --oneline";
			};

			safe.directory = "/etc/nixos";
		}];
	};
}
