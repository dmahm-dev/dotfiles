{config, lib, pkgs, ...}:

{
	boot.kernelParams = [
		"pcie_aspm=force"
	];
	boot.initrd = {
		availableKernelModules = ["i915"];
		compressor = "cat";
	};
	hardware.cpu.intel.updateMicrocode = true;

	boot.kernel.sysctl."vm.max_map_count" = 2147483642;
}
