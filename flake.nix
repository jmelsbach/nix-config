{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # 1. Add Home Manager as an input
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # 2. Add home-manager to the function arguments
  outputs = { self, darwin, nixpkgs, home-manager }: {
    darwinConfigurations."m1-max" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      modules = [
        # 3. Add the Home Manager module for nix-darwin
        home-manager.darwinModules.home-manager
	{
	 home-manager.useGlobalPkgs = true;
	 home-manager.useUserPackages = true;
	 home-manager.users.johannes = ./home.nix;
	}

        # Your main configuration file
        ./darwin-configuration.nix
      ];
    };
  };
}
