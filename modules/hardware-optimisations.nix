{config, lib, pkgs, ...}:

{
  boot.kernelParams = [
    "pcie_aspm=force"
  ];
  hardware.cpu.intel.updateMicrocode = true;
  
}
