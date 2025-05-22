{ config, lib, ... }:

{
	boot.kernel.sysctl = {
		"kernel.sysrq" = 1;
	};
}
