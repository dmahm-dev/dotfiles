{pkgs, ...}:

{
    home.packages = [pkgs.libnotify];

    systemd.user.services.check-system-time = {
        Unit = {
            Description = "is system time valid";
            PartOf = ["plasma-workspace.target"];
            After = ["plasma-workspace.target"];
        };
        Install = {
            WantedBy = ["plasma-workspace.target"];
        };
        Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.writeShellScript "check-system-time-script" ''
                THRESHOLD_DATE="2026-01-01"

                THRESHOLD=$(${pkgs.coreutils}/bin/date -d "$THRESHOLD_DATE" +%s)
                CURRENT=$(${pkgs.coreutils}/bin/date +%s)

                if [ "$CURRENT" -lt  "$THRESHOLD" ]; then
                    ${pkgs.libnotify}/bin/notify-send -u critical -t 0 -i dialog-warning "Сбой системного времени" "Системная дата ниже $THRESHOLD_DATE. Возможно проблемы с интернетом и сертификатами."
                fi
                ''
            }";
        };


    };
}
