{ config, pkgs, lib, ... }:

{
  home.packages = [ pkgs.keepassxc ];

  programs.plasma.configFile."keepassxc/keepassxc.ini" = {
    General = {
      ConfigVersion = 2;
      MinimizeOnClose = true;
      MinimizeOnStartup = true;
      MinimizeToTray = true;
      ShowTrayIcon = true;
      TrayIconAppearance = "colorful";
    };

    PasswordGenerator = {
      AdvancedMode = true;
      Braces = true;
      Dashes = true;
      Length = 32;
      Logograms = true;
      Math = true;
      Punctuation = true;
      Quotes = true;
    };

    Browser.Enabled = true;
  };
}
