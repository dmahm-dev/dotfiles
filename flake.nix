{
	description = "Entry point flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
		nvf.url = "github:notashelf/nvf";
	};

	outputs = { self, nixpkgs, nvf, home-manager, nix-flatpak, ... }@inputs:
	let
		system = "x86_64-linux";
	in {
		nixosConfigurations."SomePC" = inputs.nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hosts/main.nix
				./modules/default.nix

				./modules/programs/plasma.nix

				nix-flatpak.nixosModules.nix-flatpak
				nvf.nixosModules.default
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
