{...}:

{
	boot.extraModprobeConfig = ''
		# disable watchdog
		blacklist iTCO_wdt
		# disable webcam.
		blacklist uvcvideo
	'';
}
