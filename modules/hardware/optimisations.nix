{config, lib, pkgs, ...}:

{
	boot.kernelParams = [
		"pcie_aspm=force"
		"i915.enable_guc=3"
	];
	boot.initrd = {
		kernelModules = ["i915" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
		compressor = "cat";
	};

	boot.kernelModules = [ "ntsync" ];

	hardware.cpu.intel.updateMicrocode = true;

	# for games
	boot.kernel.sysctl."vm.max_map_count" = 2147483642;
	boot.kernel.sysctl."dev.i915.perf_stream_paranoid" = 0;	

	# disable famous 20 years bug
	boot.postBootCommands = 
		lib.strings.replaceStrings ["\t"] [""] ''
		echo 200 > /sys/kernel/mm/lru_gen/min_ttl_ms
	'';

	# INTEL
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
		extraPackages = with pkgs; [
			vpl-gpu-rt
			intel-media-driver
			intel-compute-runtime
			libvdpau-va-gl
			intel-ocl

			vulkan-loader
			vulkan-validation-layers

			ocl-icd
			libva
			libvdpau
			pciutils

			nvidia-vaapi-driver
		];
		extraPackages32 = with pkgs; [
			libva
			libvdpau
			intel-media-driver
			vulkan-loader
			vulkan-validation-layers
			nvidia-vaapi-driver
		];
	};
	
	hardware.intel-gpu-tools.enable = true;
	environment.systemPackages = with pkgs; [
		intel-gpu-tools
		mesa-demos
		vdpauinfo
		libva-utils
		vulkan-tools
		nvtopPackages.intel
		#nvidia
		nvtopPackages.nvidia
		cudaPackages.cudatoolkit
	];

	# NVIDIA
	hardware.nvidia = {
		modesetting.enable = true;
		nvidiaSettings = true;
		open = false; # d3cold is not working
		package = config.boot.kernelPackages.nvidiaPackages.stable;
		prime.sync.enable = true;
		prime.nvidiaBusId = "PCI:1@0:0:0";
		prime.intelBusId = "PCI:0@0:2:0";
		powerManagement.enable = true; # turn on systemd services
	};

	boot.extraModprobeConfig = 
		lib.strings.replaceStrings ["\t"] [""] ''
		# Enable nvidia for wayland
		options nvidia_drm modeset=1 fbdev=1
		# Improve nvidia performance
		options nvidia NVreg_UsePageAttributeTable=1
		# Save all video memory to swap on hibernate
		options nvidia NVreg_PreserveVideoMemoryAllocations=1
		# Disable external GPU when unneded
		options nvidia NVreg_DynamicPowerManagement=0x02
		# Disable NVIDIA GSP due to unworking D3 state
		options nvidia NVreg_EnableGpuFirmware=0
	'';

	services.udev.extraRules = 
		lib.strings.replaceStrings ["\t"] [""] ''
		# Enable runtime PM for NVIDIA VGA/3D 
		# controller devices on adding device
		ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
		ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"

		# Enable runtime PM for NVIDIA VGA/3D
		# controller devices on driver bind
		ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
		ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"

		# Disable runtime PM for NVIDIA VGA/3D
		# controller devices on driver unbind
		ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control",  ATTR{power/control}="on"
		ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="on"
	'';

	services.xserver.videoDrivers = ["nvidia"];
}
