{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        unrar
        pciutils
        gdb
        p7zip
        scrcpy
        android-tools

        # C C++
        clang
        clang-tools
        gnumake
        cmake

        # Strudel
        nodejs
    ];
    programs.nix-ld.enable = true;
    programs.throne = {
        enable = true;
        tunMode.enable = true;
        tunMode.setuid = true;
    };

    virtualisation.docker.enable = true;

}
