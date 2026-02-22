{pkgs, ...}:

let
    gameFilterFirewall = "27015:27030";
    gameFilterNfqws = "27015-27030";
    listGeneral = ./zapret/lists/list-general.txt;
    listGoogle = ./zapret/lists/list-google.txt;
    listExclude = ./zapret/lists/list-exclude.txt;
    ipsetAll = ./zapret/lists/ipset-all.txt;
    ipsetExclude = ./zapret/lists/ipset-exclude.txt;

    fakeQuic = ./zapret/quic_initial_www_google_com.bin;
in
{
    services.zapret = {
        enable = true;
        configureFirewall = false;
        udpSupport = true;
        udpPorts = [
            "443" "19294:19344" "50000:50100" gameFilterFirewall
        ];
        params = [
            # UDP 443 (QUIC) general
            "--filter-udp=443" "--hostlist=${listGeneral}" "--hostlist-exclude=${listExclude}" "--ipset-exclude=${ipsetExclude}" "--dpi-desync=fake" "--dpi-desync-repeats=6" "--dpi-desync-fake-quic=${fakeQuic}" "--new"
            # UDP Discord (Voice/STUN)
            "--filter-udp=19294-19344,50000-50100" "--filter-l7=discord,stun" "--dpi-desync=fake" "--dpi-desync-repeats=6" "--new"
            # TCP Discord
            "--filter-tcp=2053,2083,2087,2096,8443" "--hostlist-domains=discord.media" "--dpi-desync=fake,hostfakesplit" "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com" "--dpi-desync-hostfakesplit-mod=host=www.google.com,altorder=1" "--dpi-desync-fooling=ts" "--new"
            # TCP 443 Google
            "--filter-tcp=443" "--hostlist=${listGoogle}" "--ip-id=zero" "--dpi-desync=fake,hostfakesplit" "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com" "--dpi-desync-hostfakesplit-mod=host=www.google.com,altorder=1" "--dpi-desync-fooling=ts" "--new"
            # TCP 80, 443 General
            "--filter-tcp=80,443" "--hostlist=${listGeneral}" "--hostlist-exclude=${listExclude}" "--ipset-exclude=${ipsetExclude}" "--dpi-desync=fake,hostfakesplit" "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=ya.ru" "--dpi-desync-hostfakesplit-mod=host=ya.ru,altorder=1" "--dpi-desync-fooling=ts" "--new"
            # UDP 443 General IP
            "--filter-udp=443" "--ipset=${ipsetAll}" "--hostlist-exclude=${listExclude}" "--ipset-exclude=${ipsetExclude}" "--dpi-desync=fake" "--dpi-desync-repeats=6" "--dpi-desync-fake-quic=${fakeQuic}" "--new"
            # TCP 80, 443, GameFIlter General IP
            "--filter-tcp=80,443,${gameFilterNfqws}" "--ipset=${ipsetAll}" "--hostlist-exclude=${listExclude}" "--ipset-exclude=${ipsetExclude}" "--dpi-desync=fake,hostfakesplit" "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=ya.ru" "--dpi-desync-hostfakesplit-mod=host=ya.ru,altorder=1" "--dpi-desync-fooling=ts" "--new"
            # UDP GameFilter General IP
            "--filter-udp=${gameFilterNfqws}" "--ipset=${ipsetAll}" "--ipset-exclude=${ipsetExclude}" "--dpi-desync=fake" "--dpi-desync-autottl=2" "--dpi-desync-repeats=10" "--dpi-desync-any-protocol=1" "--dpi-desync-fake-unknown-udp=${fakeQuic}" "--dpi-desync-cutoff=n2"
        ];
    };
}
