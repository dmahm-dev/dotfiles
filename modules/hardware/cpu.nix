{...}:

{
    services.cpupower-gui.enable = true;
    systemd.tmpfiles.rules = [ # My CPU is getting hot too quickly
        "w /sys/devices/system/cpu/intel_pstate/max_perf_pct - - - - 59"
        "w /sys/devices/system/cpu/intel_pstate/no_turbo - - - - 1"
    ];
}
