{
	description = "Entry point flake";

	inputs = {
		nixpkgsUnstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
		# nixos-hardware.url = "github:NixOS/nixos-hardware/master";
	};

	outputs = { self, nixpkgs, nixpkgsUnstable, ... }@inputs:
	let
		pkgs = import nixpkgs {
			config.allowUnfree = true;
		};
		unstable = import nixpkgsUnstable {
			config.allowUnfree = true;
		};
	in {
		nixosConfigurations.userok = inputs.nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs unstable;};
			modules = [
				./hosts/main.nix
				./modules/default.nix

				/*nixos-hardware.nixosModules.common.cpu.intel.tiger-lake
				nixos-hardware.nixosModules.common.pc.ssd*/
			];
		};
	};
}
