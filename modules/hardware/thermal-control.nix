{ config, lib, ...}:

{
	services.thermald = {
		enable = true;
		#debug = true;
	};
}
