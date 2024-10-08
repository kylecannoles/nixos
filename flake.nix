{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/laptop/configuration.nix
          ./modules/core.nix
          ./modules/fonts.nix
          ./modules/user.nix
          ./modules/packages.nix
          ./modules/programs.nix
          ./modules/hyprland.nix
          ./modules/sway.nix
          #./modules/unstable.nix
          # inputs.home-manager.nixosModules.default
        ];
      };
      gaming = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./machines/desktop/configuration.nix
          ./modules/core.nix
          ./modules/fonts.nix
          ./modules/user.nix
          ./modules/packags.nix
          ./modules/programs.nix
          ./modules/hyprland.nix
          ./modules/nvidia.nix
        ];
      };
    };
  };
}
