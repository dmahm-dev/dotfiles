{config, lib, ...}:

{
  imports = [
    ./hardware-optimisations.nix
    ./programs/bash.nix
    ./environmentVars.nix
  ];
}
