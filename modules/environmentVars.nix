{config, lib, ...}:

{
  environment.variables = {
    # custom sudo prompt
    SUDO_PROMPT = "$(tput setaf 7 bold)[sudo] $(tput setaf 1 bold)Password: $(tput sgr0)";
    EDITOR = "nano";
    #exclude repeated and started with space commands from history
    HISTCONTROL = "ignoreboth";
  };
}
