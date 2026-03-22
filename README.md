NixOS dotfiles with settings migrated from my Arch Linux installation.

Supported only nvidia+intel GPU`s and intel CPU

Every type of hardware acceleration is working

IMPERATIVE THINGS to do:
1) sudo ln -s /home/<username>/.config/home-manager/home.nix /etc/nixos/home-manager/home.nix
2) sudo ln -s /home/<username>/.config/home-manager/flake.nix /etc/nixos/flake.nix
3) sudo ln -s /home/<username>/.config/home-manager/flake.lock /etc/nixos/flake.lock
4) run home-manager switch
5) Dolphin: rename entry points
