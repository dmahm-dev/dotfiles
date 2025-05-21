{
	description = "Entry point flake";

	inputs = {
		nixpkgsUnstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";
	};

	outputs = { self, nixpkgs, nixpkgsUnstable, 
							home-manager, nixos-hardware, ... }@inputs:
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

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.extraSpecialArgs = unstable;
				}
			];
		};
	};
}
