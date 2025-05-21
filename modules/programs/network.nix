{ config, lib, ... }:

{
	programs.captive-browser = {
		enable = true;
		browser = "vivaldi";
		interface = "enp1s0";
	};
}
