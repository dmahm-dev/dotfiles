{pkgs, ...}:

let
    workDir = "/etc/nixos/modules/services/zapret";
in
{
    systemd.services.zapret_discord_youtube = {
        description = "Zapret service";
        wants = [ "network-online.target" ];
        after = [ "network-online.target" ];

        serviceConfig = {
            Type = "simple";
            WorkingDirectory = "${workDir}";
            User = "root";

            Environment = "PATH=${pkgs.bash}/bin:${pkgs.sudo}/bin:${pkgs.git}/bin:${pkgs.coreutils}/bin:${pkgs.nftables}/bin:${pkgs.gnugrep}/bin:${pkgs.gnused}/bin:${pkgs.inetutils}/bin";

            ExecStart = [
                "${pkgs.bash}/bin/bash ${workDir}/main_script.sh -nointeractive"
            ];
            ExecStop = [
                "${pkgs.bash}/bin/bash ${workDir}/stop_and_clean_nft.sh"
            ];
            ExecStopPost = [
                "${pkgs.coreutils}/bin/echo \"Сервис завершён\""
            ];
            PIDFile = "/run/zapret_discord_youtube";
        };

        wantedBy = [ "multi-user.target" ];
    };
}
