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
    programs.throne.enable = true;
    programs.throne.tunMode.enable = true;
    programs.throne.tunMode.setuid = true;
   programs.adb.enable = true;
    programs.adb.enable = true;
}
