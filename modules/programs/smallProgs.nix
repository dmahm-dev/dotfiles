{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        unrar
        pciutils
        gdb
    ];
    programs.nix-ld.enable = true;
    programs.throne.enable = true;
    programs.throne.tunMode.enable = true;
}
