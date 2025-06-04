{
	description = "Entry point flake";

	inputs = {
		nixpkgsUnstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
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
			];
		};
		homeConfigurations."userok" = home-manager.lib.homeManagerConfiguration {
			pkgs = import nixpkgs {
				system = "x86_64-linux";
				config.allowUnfree = true;
				config.cudaSupport = true;
			};
			modules = [ ./home-manager/home.nix ];
		};
	};
}
