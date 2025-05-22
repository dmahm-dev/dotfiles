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
}
