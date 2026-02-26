{
	description = "NVIDIA GTX 1650 + Intel Tiger Lake hidpi notebook";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-flatpak.url = "github:gmodena/nix-flatpak/latest";
		nvf.url = "github:notashelf/nvf";
	};

	outputs = { self, nixpkgs, home-manager, nix-flatpak, nvf, ... }@inputs:
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs {
			inherit system;
			config = {
				allowUnfree = true;
				cudaSupport = true;
			};
		};
	in {
		nixosConfigurations."SomePC" = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs; };
			modules = [
				./hosts/main.nix
				./modules/default.nix

				./modules/programs/plasma.nix

				nix-flatpak.nixosModules.nix-flatpak
				nvf.nixosModules.default
			];
		};
		homeConfigurations."userok" = home-manager.lib.homeManagerConfiguration {
			inherit pkgs;
			extraSpecialArgs = { inherit inputs; };
			modules = [ ./home-manager/home.nix ];
		};
	};
}
