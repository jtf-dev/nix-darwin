{
  description = "Home Manager configuration of jtf-dev";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."jtf-dev" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here
      modules = [
        ./home.nix
      ];

      # Optionally use extraSpecialArgs to pass through arguments to home.nix
    };

    # You may add additional configuration for NixOS or other outputs here, if needed
  };
}
