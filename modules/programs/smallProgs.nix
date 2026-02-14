{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        unrar
        pciutils
        gdb
    ];
    programs.nix-ld.enable = true;
}
