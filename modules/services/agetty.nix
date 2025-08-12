{ pkgs, ... }:

{
  # Полностью переопределяем юнит только для tty1 — это безопасно и просто.
  systemd.services."getty@tty1" = {
    description = "Getty on tty1 (overridden)";
    wantedBy = [ "getty.target" ];
    serviceConfig = {
      # Явный путь к agetty из nixpkgs, без хитрых escape-последовательностей
      ExecStart = "${pkgs.util-linux}/sbin/agetty -s %I 38400 linux";
      Type = "idle";
      Restart = "always";
      RestartSec = "0";
      StandardInput = "tty";
      StandardOutput = "tty";
      TTYPath = "/dev/%I";
      TTYReset = "yes";
      TTYVHangup = "yes";
      TTYVTDisallocate = "yes";
    };
  };
}
