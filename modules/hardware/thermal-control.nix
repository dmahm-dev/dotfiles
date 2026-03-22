{...}:

{
	services = {
		thermald = {
			enable = true;
			#debug = true;
		};
		cpupower-gui.enable = true;
		power-profiles-daemon.enable = false;
		tlp = {
			enable = true;
			settings = {
				CPU_SCALING_GOVERNOR_ON_AC = "powersave";
				CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

				CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
				CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

				CPU_MIN_PERF_ON_AC = 10;
				CPU_MAX_PERF_ON_AC = 88;

				CPU_BOOST_ON_BAT = 0;
				CPU_BOOST_ON_AC = 1;

				START_CHARGE_THRESH_BAT1=75;
				STOP_CHARGE_THRESH_BAT1=80;
			};
		};
	};
}
