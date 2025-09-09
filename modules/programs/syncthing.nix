{pkgs,...}:

{
	environment.systemPackages = [pkgs.syncthing];

	systemd.services.syncthing-custom = {
		description = "Syncthing (custom system service)";
		wantedBy = [ "multi-user.target" ];
		serviceConfig = {
			# полный путь к бинарнику из nixpkgs + аргументы
			ExecStart = "${pkgs.syncthing}/bin/syncthing --no-browser";
			Restart = "on-failure";
			# запустить от имени конкретного пользователя (чтобы config лежал в его $HOME)
			User = "userok";
			# если нужно — явно указать HOME или XDG_CONFIG_HOME:
			Environment = "HOME=/home/userok";
			# опционально: писать в журнал systemd
			StandardOutput = "journal";
			StandardError = "journal";
			# Рабочая директория (по желанию)
			WorkingDirectory = "/home/userok";
		};
	};

}
