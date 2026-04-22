{ config, pkgs, ... }:

let
  expBrightness = pkgs.writeShellScriptBin "exp-brightness" ''
    #!/usr/bin/env bash
    ACTION=$1
    MULTIPLIER=1.8

    SERVICE="org.kde.Solid.PowerManagement"
    OBJ_PATH="/org/kde/Solid/PowerManagement/Actions/BrightnessControl"

    CURRENT=$(qdbus $SERVICE $OBJ_PATH brightness)
    MAX=$(qdbus $SERVICE $OBJ_PATH brightnessMax)

    # Вычисляем 1% от максимальной яркости как нижний порог
    MIN_ALLOWED=$(( MAX / 100 ))
    if [ "$MIN_ALLOWED" -lt 1 ]; then MIN_ALLOWED=1; fi

    if [ "$ACTION" = "up" ]; then
        NEW=$(${pkgs.gawk}/bin/awk "BEGIN { print int($CURRENT * $MULTIPLIER + 2) }")
        if [ "$NEW" -gt "$MAX" ]; then NEW=$MAX; fi
    elif [ "$ACTION" = "down" ]; then
        NEW=$(${pkgs.gawk}/bin/awk "BEGIN { print int($CURRENT / $MULTIPLIER) }")

        # Теперь яркость не упадет ниже 1% от максимума вашего экрана
        if [ "$NEW" -lt "$MIN_ALLOWED" ]; then
            NEW="$MIN_ALLOWED"
        fi
    fi

    qdbus $SERVICE $OBJ_PATH setBrightness "$NEW"
  '';

in {
  home.packages = [ expBrightness ];

  xdg.desktopEntries."exp-brightness-up" = {
    name = "Exponential Brightness Up";
    exec = "${expBrightness}/bin/exp-brightness up";
    terminal = false;
    # Эти параметры убирают иконку из меню и панели задач
    noDisplay = true;
    settings.StartupNotify = "false";
  };

  xdg.desktopEntries."exp-brightness-down" = {
    name = "Exponential Brightness Down";
    exec = "${expBrightness}/bin/exp-brightness down";
    terminal = false;
    noDisplay = true;
    settings.StartupNotify = "false";
  };

  programs.plasma.shortcuts = {
    "org_kde_powerdevil" = {
      "Decrease Screen Brightness" = [ ];
      "Increase Screen Brightness" = [ ];
    };

    "services/exp-brightness-up.desktop"."_launch" = "Monitor Brightness Up";
    "services/exp-brightness-down.desktop"."_launch" = "Monitor Brightness Down";
  };
}
