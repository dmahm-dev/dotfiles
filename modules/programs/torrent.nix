{pkgs,...}:

{
    environment.systemPackages = [
        pkgs.fragments
    ];
}
