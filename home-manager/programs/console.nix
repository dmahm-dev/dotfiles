{...}:

{
	programs = {
		bash.enable = true;
		bash.bashrcExtra =
			"shopt -s cdspell histappend histreedit checkjobs\nfastfetch";
		kitty = {
			enable = true;
			enableGitIntegration = true;
			shellIntegration.enableBashIntegration = true;
			font.name = "FiraCode Nerd Font";
			font.size = 10;
			settings = {
				disable_ligatures = "cursor";
				cursor_trail = 3;
				cursor_trail_decay = "0.1 0.6";
				scrollback_lines = 20000;
				show_hyperlink_targets = "yes";
				paste_actions = "quote-urls-at-prompt,confirm,confirm-if-large";
				#focus_follow_mouse = "yes";
				confirm_os_window_close = "-1 count-background";
				tab_activity_symbol = " ";
				notify_on_cmd_finish = "invisible 15.0 notify-bell";
			};
		};
		fastfetch = {
			enable = true;
			settings = {
				display = {
					showErrors = true;
					separator = " -> ";
					size.ndigits = 1;
					size.maxPrefix = "GB";
					bar = {
						border.left = "";
						border.right = "";
						char.elapsed = "";
						char.total = "";
					};
				};
				modules = [
					{type = "title";}
					{type = "separator";}
					{type = "break";}
					{type = "os"; format = "{2} {9}"; key = "ОС";}
					{type = "host"; key = "ПК";}
					{type = "kernel"; format = "{1} {2} {4}"; key = "Ядро";}
					{type = "packages"; combined = true; key = "Дериваций";}
					{type = "de"; format = "{2} {3}"; key = "Рабочий стол";}
					{type = "terminal"; key = "Консоль";}
					{type = "terminalfont"; key = "Шрифт";}
					{type = "display"; format = "{1}x{2} {13}dpi @ {21}x {3}Hz"; key = "Экран";}
					{type = "cpu"; temp = false; showPeCoreCount = false; format = "{1}"; key = "ЦП";}
					{
						type = "cpu";
						temp = true;
						showPeCoreCount = true;
						keyIcon = "";
						key = "| ";
						keyWidth = 7;
						format = "({3}Ядр/{4}Пот) @ {7}";
					}
					{type = "gpu"; driverSpecific = true; temp = true; key = "ГПУ";}
					{type = "memory"; key = "ОЗУ";}
					{type = "swap"; key="ОЗУ+";}
					{type = "disk"; key="Диск";}
					{type = "battery"; key="Аккумулятор";}
					{type = "uptime"; key = "В сети";}
					{type = "break";}
				];
				# padding top 2
			};
		};
	};
}
