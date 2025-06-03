NixOS dotfiles with settings migrated from my Arch Linux installation.

Supported only nvidia+intel GPU`s and intel CPU

Every type of hardware acceleration is working

IMPERATIVE THINGS to do:
1) sudo ln -s /home/<username>/.config/home-manager/home.nix /etc/nixos/home-manager/home.nix
2) sudo ln -s /home/<username>/.config/home-manager/flake.nix /etc/nixos/flake.nix
3) sudo ln -s /home/<username>/.config/home-manager/flake.lock /etc/nixos/flake.lock
4) run home-manager switch
5) setup kde settings: display, mouse acceleration, disable screen corners
disable system signal in special features, turn on automatic mounting in
disks, setup wallpapers, setup place for notifications in "notification"
section, hide them after 2 seconds, disable screen lock in "screen lock",
choose also mouse buttons in "application rights", store history to 1 month
in "last files", setup feedback in "feedback", in "charging" disable 
pause session, turn off screen if lid closed, in "on battery" pause session
after 15 minutes, dim screen after 5 minutes, turn off screen after 10 
minutes, on "low battery" pause session after 5 minutes, dim screen
after 2 minutes, turn off screen after 5 minutes, energy consumption
profile to "eco", in "session" uncheck request confirmation, restore
applications manually.
