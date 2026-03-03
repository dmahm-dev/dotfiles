{config, lib, pkgs, ...}:

{
	boot.kernelParams = [
		"pcie_aspm=force"
		"i915.enable_guc=3"
	];
	boot.initrd.kernelModules = ["i915"];

	boot.kernelModules = [ "ntsync" ];

	hardware.cpu.intel.updateMicrocode = true;

	# for games
	boot.kernel.sysctl = {
		"vm.max_map_count" = 2147483642;
		"dev.i915.perf_stream_paranoid" = 0;
		"kernel.perf_event_paranoid" = 1;
	};

	# disable famous 20 years bug
	systemd.tmpfiles.rules = [
		"w /sys/kernel/mm/lru_gen/min_ttl_ms - - - - 200"
	];

	# INTEL
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
		extraPackages = with pkgs; [
			vpl-gpu-rt
			intel-media-driver
			intel-compute-runtime
			libvdpau-va-gl
			#intel-ocl #проблемы со скачиванием

			vulkan-loader
			vulkan-validation-layers

			ocl-icd
			libva
			libvdpau
			pciutils

			nvidia-vaapi-driver
		];
# 		extraPackages32 = with pkgs; [ # Error: its 64bit packages not 32bit
# 			libva
# 			libvdpau
# 			intel-media-driver
# 			vulkan-loader
# 			vulkan-validation-layers
# 			nvidia-vaapi-driver
# 		];
	};
	
	hardware.intel-gpu-tools.enable = true;
	environment.systemPackages = with pkgs; [
		intel-gpu-tools
		mesa-demos
		vdpauinfo
		libva-utils
		vulkan-tools
		nvtopPackages.full
		#nvidia
		cudaPackages.cudatoolkit
	];

	# NVIDIA
	hardware.nvidia = {
		modesetting.enable = true;
		nvidiaSettings = true;
		open = false; # d3cold is not working on openSource drivers
		package = config.boot.kernelPackages.nvidiaPackages.stable;
		prime.offload.enable = true;
		prime.offload.enableOffloadCmd = true;
		prime.offload.offloadCmdMainProgram = "prime-run";
		prime.nvidiaBusId = "PCI:1:0:0";
		prime.intelBusId = "PCI:0:2:0";
		powerManagement.enable = true; # turn on systemd services
		powerManagement.finegrained = true; #create udev rules for D3cold state
	};

	boot.extraModprobeConfig = ''
		# Enable nvidia for wayland
		options nvidia_drm modeset=1 fbdev=1
		# Improve nvidia performance
		options nvidia NVreg_UsePageAttributeTable=1
		# Save all video memory to swap on hibernate
		options nvidia NVreg_PreserveVideoMemoryAllocations=1
		# Disable NVIDIA GSP due to unworking D3 state
		options nvidia NVreg_EnableGpuFirmware=0
	'';

	services.xserver.videoDrivers = ["nvidia"];
}
