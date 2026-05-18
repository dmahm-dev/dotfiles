{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        unrar
        pciutils
        gdb
        p7zip
        scrcpy
    ];
    programs.nix-ld.enable = true;
    programs.throne = {
        enable = true;
        tunMode.enable = true;
        tunMode.setuid = true;
    };
    programs.adb.enable = true;

}
