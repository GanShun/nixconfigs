{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

#  imports = [ <home-manager/nix-darwin> ];
  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Gans-MacBook-Air
    darwinConfigurations."Gans-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
