{...}:

{
	services.journald.extraConfig = ''
			[Journal]
			SystemMaxUse=50M
		'';
}
