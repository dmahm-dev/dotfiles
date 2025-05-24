{lib, ...}:

{
	boot.extraModprobeConfig = 
	lib.strings.replaceStrings ["\t"] [""] ''
		# disable watchdog
		blacklist iTCO_wdt
		# disable webcam
		blacklist uvcvideo
	'';
}
