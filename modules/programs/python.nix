{pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        pyright
        (python3.withPackages (python-pkgs: with python-pkgs; [
            pyyaml
        ]))
    ];
}
