{pkgs, ...}:

{
    systemd.user.timers."dim-screen-night" = {
        Unit.Description = "timer to dim screen smoothly at 22:30";
        Timer = {
            OnCalendar = "*-*-* 22:30:00";
            Persistent = true;
        };
        Install.WantedBy = [ "timers.target" ];
    };

    systemd.user.services."dim-screen-night" = {
        Unit.Description = "Smoothly dim screen to 1%";
        Service = {
            Type = "oneshot";
            ExecStart = "${pkgs.writeShellScript "dim-screen" ''
                target=1
                current=$(${pkgs.brightnessctl}/bin/brightnessctl -m | cut -d, -f4 | tr -d '%')

                while [ "$current" -gt "$target" ]; do
                    ${pkgs.brightnessctl}/bin/brightnessctl set 1%-
                    sleep 0.5
                    current=$(${pkgs.brightnessctl}/bin/brightnessctl -m | cut -d, -f4 | tr -d '%')
                done
            ''}";
        };
    };
}
