{pkgs,...}:

{
    xdg.desktopEntries = {
        pot-ocr = {
            name = "Pot OCR Translate";
            exec = "${pkgs.curl}/bin/curl \"http://127.0.0.1:60828/ocr_translate\"";
            terminal = false;
            noDisplay = true;
        };
    };

    programs.ghostwriter.spelling = {
        checkerEnabledByDefault = true;
        ignoreUppercase = true;
        liveSpellCheck = true;
        autoDetectLanguage = true;
    };
    programs.plasma = {
        enable = true;
        overrideConfig = true;
        session.general.askForConfirmationOnLogout = false;
        session.sessionRestore.restoreOpenApplicationsOnLogin = "whenSessionWasManuallySaved";
        shortcuts = {
            "services/kitty.desktop"._launch = "Ctrl+Alt+T";
            "services/org.kde.konsole.desktop"._launch = [ ];
            ksmserver."Log Out" = [];
            "services/org.kde.plasma-systemmonitor.desktop"._launch = ["Ctrl+Alt+Del" "Meta+Esc"];
            kwin."Walk Through Windows" = "Alt+Tab";
            kwin.Overview = ["Meta+W" "Meta+Tab"];
            "pot-ocr.desktop"._launch = "Meta+Shift+T";
        };
        kwin = {
            nightLight = {
                enable = true;
                mode = "times";
                temperature.day = 6500;
                temperature.night = 4500;
                time.morning = "07:30";
                time.evening = "20:00";
                transitionTime = 1;
            };
            effects = {
                wobblyWindows.enable = true;
                translucency.enable = true;
                dimInactive.enable = true;
                hideCursor = {
                    enable = true;
                    hideOnInactivity = 10;
                    hideOnTyping = false;
                };
            };
        };
        window-rules = [
            {
                description = "Remove borders for Pot";
                match.window-class = {
                    value = "pot";
                    type = "substring";
                };
                apply.noborder = {
                    value = true;
                    apply = "force";
                };
            }
        ];
        input.mice = [{
            vendorId = "258a";
            productId = "0027";
            name = "SINOWEALTH Wired Gaming Mouse";
            accelerationProfile = "none";
        }];
        input.keyboard = {
            model = "pc105";
            numlockOnStartup = "on";
            options = ["grp:alt_shift_toggle"];
            layouts = [{layout = "ru";} {layout = "us";}];
        };
        panels = [{
            height = 42;
            floating = true;
            widgets = [
                "org.kde.plasma.kickoff"
                "org.kde.plasma.pager"
                {
                    iconTasks.launchers = [
                        "applications:kitty.desktop"
                        "applications:org.kde.dolphin.desktop"
                        "applications:vivaldi-stable.desktop"
                    ];
                }
                "org.kde.plasma.marginsseparator"
                "org.kde.plasma.systemtray"
                {
                    digitalClock.time.showSeconds = "always";
                }
                "org.kde.plasma.showdesktop"
            ];
        }];
        workspace.splashScreen = {
            engine = "none";
            theme = "None";
        };
        powerdevil = {
            AC = {
                autoSuspend.action = "nothing";
                whenLaptopLidClosed = "turnOffScreen";
                dimDisplay.idleTimeout = 900;
                turnOffDisplay.idleTimeout = 1200;
            };
            battery = {
                dimDisplay.idleTimeout = 480;
                turnOffDisplay.idleTimeout = 600;
            };
        };
        configFile = {
            kwinrc = {
                Xwayland.Scale = 1.2;
                Effect-overview.BorderActivate = 9;
                Effect-dimInactive.Strength = 10;
                Plugins.screenedgeEnabled = false;
                Plugins.mousemarkEnabled = true;
            };
            kded_device_automounterrc.General = {
                AutomountEnabled = true;
                AutomountOnLogin = true;
                AutomountOnPlugin = true;
            };
            kdeglobals = {
                KDE = {
                    AutomaticLookAndFeel = true;
                    AutomaticLookAndFeelIdleInterval = 3;
                };
                General = {
                    TerminalApplication = "kitty";
                    TerminalService = "kitty.desktop";
                };
            };
            plasmanotifyrc = {
                DoNotDisturb.WhenFullscreen = false;
                Notifications = {
                    LowPriorityHistory = true;
                    PopupPosition = "BottomRight";
                    PopupTimeout = 3000;
                };
            };
            kscreenlockerrc.Daemon = {
                Autolock = false;
                Timeout = 0;
            };
            PlasmaUserFeedback.Global.FeedbackLevel = 64;
            plasma-localerc.Translations.LANGUAGE = "ru:en_US";
            plasma-localerc.Formats.LANG = "ru_RU.UTF-8";
            plasma-localerc.Formats.LC_NUMERIC = "en_US.UTF-8";
            plasmaparc.General.VolumeStep = 2;
            spectaclerc.ImageSave.imageSaveLocation = "file:///home/userok/Internet/";
        };
    };
}
