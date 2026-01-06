{pkgs, ...}:

{
    services.zapret = {
        enable = true;
        whitelist = [
            "youtube.com"
            "youtu.be"
            "ytimg.com"
            "googlevideo.com"
            "rutracker.org"
        ];
        udpSupport = true;
        udpPorts = [
            "443" "19294:19344" "50000:50100"
        ];
        params = [
            "--dpi-desync=fake"
            "--dpi-desync-ttl=3"
            "--orig-ttl=1"
            "--orig-mod-start=s1"
            "--orig-mod-cutoff=d1"
        ];
    };
}
