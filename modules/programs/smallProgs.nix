{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        unrar
        pciutils
        gdb
        p7zip
        scrcpy
        android-tools
        docker

        # C C++
        clang
        clang-tools
        gnumake
        cmake

        # Python
        python3
        pyright

        # Strudel
        nodejs
    ];
    programs.nix-ld.enable = true;
    programs.throne = {
        enable = true;
        tunMode.enable = true;
        tunMode.setuid = true;
    };

}
