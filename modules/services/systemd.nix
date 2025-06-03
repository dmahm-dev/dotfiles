{lib,...}:

{
	systemd.user.extraConfig = 
		lib.strings.replaceStrings ["\t"] [""] ''
			DefaultTimeoutStopSec=10s
		'';
}
