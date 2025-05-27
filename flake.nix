{
	description = "Entry point flake";

	inputs = {
		nixpkgsUnstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# nixos-hardware.url = "github:NixOS/nixos-hardware/master";
	};

	outputs = { self, nixpkgs, nixpkgsUnstable, 
							home-manager, ... }@inputs:
	let
		unstable = import nixpkgsUnstable {
			config.allowUnfree = true;
			config.cudaSupport = true;
			system = "x86_64-linux";
		};
	in {
		nixosConfigurations."SomePC" = inputs.nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs unstable;};
			modules = [
				./hosts/main.nix
				./modules/default.nix

				./modules/programs/plasma.nix
				/*nixos-hardware.nixosModules.common.cpu.intel.tiger-lake
				nixos-hardware.nixosModules.common.pc.ssd*/
			];
		};
		homeConfigurations."user" = home-manager.lib.homeManagerConfiguration {
			pkgs = import nixpkgs {
				system = "x86_64-linux";
				config.allowUnfree = true;
				config.cudaSupport = true;
			};
			#pkgs = nixpkgs.legacyPackages."x86_64-linux";
			modules = [ ./home-manager/home.nix ];
		};
	};
}
