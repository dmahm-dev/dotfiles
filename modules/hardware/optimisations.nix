{config, lib, pkgs, ...}:

{
	boot.kernelParams = [
		"pcie_aspm=force"
		"i915.enable_guc=3"
	];
	boot.initrd = {
		availableKernelModules = ["i915"];
		compressor = "cat";
	};
	hardware.cpu.intel.updateMicrocode = true;

	# for games
	boot.kernel.sysctl."vm.max_map_count" = 2147483642;
	boot.kernel.sysctl."dev.i915.perf_stream_paranoid" = 0;	

	# INTEL
	hardware.graphics = {
		enable = true;
		extraPackages = with pkgs; [
			vpl-gpu-rt
			intel-vaapi-driver
			intel-media-driver
			libvdpau-va-gl
		];
	};
	
	hardware.intel-gpu-tools.enable = true;
	environment.systemPackages = with pkgs; [
		intel-gpu-tools
		vdpauinfo
		libva-utils
		vulkan-tools
	];

	# NVIDIA
	
}
