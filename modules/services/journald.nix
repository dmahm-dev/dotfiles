{lib, ...}:

{
	services.journald.extraConfig = 
		lib.strings.replaceStrings ["\t"] [""] ''
			[Journal]
			SystemMaxUse=50M
		'';
}
