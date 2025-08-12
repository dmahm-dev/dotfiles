{config, lib, ...}:

{
	environment = {

		variables = {
			# custom sudo prompt
			SUDO_PROMPT = "$(tput setaf 7 bold)[sudo] $(tput setaf 1 bold)Password: $(tput sgr0)";
			EDITOR = "nano";
			#exclude repeated and started with space commands from history
			HISTCONTROL = "ignoreboth";
		};

		interactiveShellInit = ''
			prime-run() {
				__NV_PRIME_RENDER_OFFLOAD=1
				__VK_LAYER_NV_optimus=NVIDIA_only
				__GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
			}
		'';

		shellAliases = {
			rebuild = "sudo nixos-rebuild switch -v";
		};
	};

}
