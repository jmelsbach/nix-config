# /etc/nix-darwin/flake.nix
{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations."m1-max" = darwin.lib.darwinSystem {
      system = "aarch64-darwin"; # or "x86_64-darwin"
      pkgs = nixpkgs.legacyPackages.aarch64-darwin; # or "x86_64-darwin"
      modules = [
        ./darwin-configuration.nix
      ];
    };
  };
}
