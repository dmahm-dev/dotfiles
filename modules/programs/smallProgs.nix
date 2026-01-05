{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        unrar
        pciutils
    ];
}
